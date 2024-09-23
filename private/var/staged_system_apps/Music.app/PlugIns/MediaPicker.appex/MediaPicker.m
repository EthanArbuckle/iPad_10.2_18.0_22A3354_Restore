uint64_t sub_1000043A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for MediaPickerServiceCoordinator();
  v1 = swift_allocObject(v0, 24, 7);
  result = swift_unknownObjectWeakInit(v1 + 16, 0);
  qword_10000CD20 = v1;
  return result;
}

void sub_1000043E8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *Strong;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v3 = v1 + 16;
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v3);
  swift_unknownObjectWeakAssign(v3, a1);
  if (!Strong)
  {
    v8 = a1;
LABEL_12:

    return;
  }
  v5 = swift_unknownObjectWeakLoadStrong(v3);
  if (v5)
  {
    v6 = (void *)v5;
    sub_100004558();
    v12 = Strong;
    v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) != 0)
      goto LABEL_11;
  }
  else
  {
    v9 = Strong;
  }
  objc_msgSend(Strong, "willMoveToParentViewController:", 0);
  if (!objc_msgSend(Strong, "isViewLoaded"))
  {
LABEL_10:
    objc_msgSend(Strong, "removeFromParentViewController");
    v12 = Strong;
LABEL_11:

    v8 = v12;
    goto LABEL_12;
  }
  v10 = objc_msgSend(Strong, "view");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "removeFromSuperview");

    goto LABEL_10;
  }
  __break(1u);
}

uint64_t sub_100004514()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for MediaPickerServiceCoordinator()
{
  return objc_opt_self(_TtC11MediaPicker29MediaPickerServiceCoordinator);
}

unint64_t sub_100004558()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CBD0;
  if (!qword_10000CBD0)
  {
    v1 = objc_opt_self(UIViewController);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000CBD0);
  }
  return result;
}

void type metadata accessor for MPMediaPickerSelectionMode()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10000CBD8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100008540);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000CBD8);
  }
}

void sub_1000045E8()
{
  id v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;

  v0 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
  objc_msgSend(v0, "bounds");
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;

  v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Window(0)), "initWithFrame:", v2, v4, v6, v8);
  v10 = *(id *)JSBridge.shared.unsafeMutableAddressor();
  v11 = v9;
  JSBridge.start(mainWindow:applicationActivationMethod:)(v9, 0);

}

id sub_1000046BC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  id v7;
  void *MediaPickerView;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t ObjectType;
  id v14;
  id v15;
  void *v16;
  id result;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  Class isa;
  uint64_t v49;
  void (*v50)(char *, _UNKNOWN **, uint64_t, uint64_t);
  id v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  char v66[24];
  id v67[3];
  objc_super v68;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for MusicMediaPickerServiceViewController();
  v68.receiver = v0;
  v68.super_class = v6;
  v7 = objc_msgSendSuper2(&v68, "viewDidLoad");
  MediaPickerView = (void *)CreateMediaPickerViewController()(v7);
  v10 = v9;
  v11 = qword_10000CAA0;
  v12 = MediaPickerView;
  if (v11 != -1)
    swift_once(&qword_10000CAA0, sub_1000043A8);
  ObjectType = swift_getObjectType(v12);
  v14 = v12;
  sub_1000043E8(v12);
  objc_msgSend((id)objc_opt_self(MPServerObjectDatabase), "setPrefersInMemoryDatabase:", 1);
  v15 = objc_msgSend(v14, "view");
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v1, "addChildViewController:", v14);
    result = objc_msgSend(v1, "view");
    if (result)
    {
      v18 = result;
      objc_msgSend(result, "bounds");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      objc_msgSend(v16, "setFrame:", v20, v22, v24, v26);
      objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      result = objc_msgSend(v1, "view");
      if (result)
      {
        v27 = result;
        v65 = ObjectType;
        objc_msgSend(result, "addSubview:", v16);

        v28 = sub_100006958(&qword_10000CCD8);
        v29 = swift_allocObject(v28, 64, 7);
        *(_OWORD *)(v29 + 16) = xmmword_1000070A0;
        v30 = objc_msgSend(v16, "topAnchor");
        result = objc_msgSend(v1, "view");
        if (result)
        {
          v31 = result;
          v32 = objc_msgSend(result, "topAnchor");

          v33 = objc_msgSend(v30, "constraintEqualToAnchor:", v32);
          *(_QWORD *)(v29 + 32) = v33;
          v34 = objc_msgSend(v16, "bottomAnchor");
          result = objc_msgSend(v1, "view");
          if (result)
          {
            v35 = result;
            v64 = v10;
            v36 = objc_msgSend(result, "bottomAnchor");

            v37 = objc_msgSend(v34, "constraintEqualToAnchor:", v36);
            *(_QWORD *)(v29 + 40) = v37;
            v38 = objc_msgSend(v16, "leadingAnchor");
            result = objc_msgSend(v1, "view");
            if (result)
            {
              v39 = result;
              v40 = objc_msgSend(result, "leadingAnchor");

              v41 = objc_msgSend(v38, "constraintEqualToAnchor:", v40);
              *(_QWORD *)(v29 + 48) = v41;
              v42 = objc_msgSend(v16, "trailingAnchor");
              result = objc_msgSend(v1, "view");
              if (result)
              {
                v43 = result;
                v44 = (void *)objc_opt_self(NSLayoutConstraint);
                v45 = objc_msgSend(v43, "trailingAnchor");

                v46 = objc_msgSend(v42, "constraintEqualToAnchor:", v45);
                *(_QWORD *)(v29 + 56) = v46;
                v67[0] = (id)v29;
                specialized Array._endMutation()();
                v47 = v67[0];
                sub_100006AFC(0, (unint64_t *)&unk_10000CD10, NSLayoutConstraint_ptr);
                isa = Array._bridgeToObjectiveC()().super.isa;
                swift_bridgeObjectRelease(v47);
                objc_msgSend(v44, "activateConstraints:", isa);

                objc_msgSend(v14, "didMoveToParentViewController:", v1);
                v67[0] = v14;
                v49 = v64;
                v50 = *(void (**)(char *, _UNKNOWN **, uint64_t, uint64_t))(v64 + 16);
                swift_unknownObjectRetain(v1);
                v50(v1, &off_100008550, v65, v49);
                v51 = v67[0];
                v52 = swift_unknownObjectWeakAssign(&v1[OBJC_IVAR___MusicMediaPickerServiceViewController_mediaPickerViewController], v67[0]);
                v53 = (char *)*(id *)JSSegueCoordinator.shared.unsafeMutableAddressor(v52);
                v54 = *(_QWORD *)MusicSeguePerformer.shared.unsafeMutableAddressor();
                v55 = &v53[direct field offset for JSSegueCoordinator.seguePerformingDelegate];
                swift_beginAccess(&v53[direct field offset for JSSegueCoordinator.seguePerformingDelegate], v67, 1, 0);
                *((_QWORD *)v55 + 1) = &protocol witness table for MusicSeguePerformer;
                swift_unknownObjectWeakAssign(v55, v54);

                v56 = *(_QWORD *)JSHTTPRequestCoordinator.shared.unsafeMutableAddressor();
                v57 = swift_retain(v56);
                v58 = *(_QWORD *)MusicHTTPRequestAuthenticator.shared.unsafeMutableAddressor(v57);
                swift_retain(v58);

                swift_beginAccess(v56 + 16, v66, 1, 0);
                *(_QWORD *)(v56 + 24) = &protocol witness table for MusicHTTPRequestAuthenticator;
                swift_unknownObjectWeakAssign(v56 + 16, v58);
                swift_release(v56);
                return (id)swift_release(v58);
              }
              goto LABEL_19;
            }
LABEL_18:
            __break(1u);
LABEL_19:
            __break(1u);
            return result;
          }
LABEL_17:
          __break(1u);
          goto LABEL_18;
        }
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }

  v59 = Logger.mediaPicker.unsafeMutableAddressor();
  v60 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v59, v2);
  v61 = Logger.logObject.getter(v60);
  v62 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v61, v62))
  {
    v63 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v63 = 0;
    _os_log_impl((void *)&_mh_execute_header, v61, v62, "Could not get a view from CreateMediaPickerNavigationController().", v63, 2u);
    swift_slowDealloc(v63, -1, -1);
  }

  return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100004DC0()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  v1 = objc_msgSend(v0, "_remoteViewControllerProxy");
  if (v1)
  {
    v2 = v1;
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100006A74((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    v3 = sub_100006958(&qword_10000CD08);
    if (swift_dynamicCast(&v5, v7, (char *)&type metadata for Any + 8, v3, 6))
      return v5;
    else
      return 0;
  }
  else
  {
    sub_100006ABC((uint64_t)v7);
    return 0;
  }
}

void sub_100004E78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id *v9;
  uint64_t (*v10)(void);
  id v11;
  void *Strong;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  id v19;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((MPMediaPickerConfiguration.supportsCatalogContent.getter(v6) & 1) != 0)
  {
    v9 = (id *)JSBridge.shared.unsafeMutableAddressor();
    v10 = *(uint64_t (**)(void))((swift_isaMask & *(_QWORD *)*v9) + 0xC0);
    v11 = *v9;
    LOBYTE(v10) = v10();

    if ((v10 & 1) == 0 && qword_10000CAA8 != -1)
      swift_once(&qword_10000CAA8, sub_1000045E8);
  }
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR___MusicMediaPickerServiceViewController_mediaPickerViewController);
  if (Strong)
  {
    v19 = Strong;
    UpdateMediaPickerViewController(_:with:)(Strong, a1);

  }
  else
  {
    v13 = Logger.mediaPicker.unsafeMutableAddressor();
    v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v13, v4);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "update(with:) was called when self.mediaPickerViewController was nil", v17, 2u);
      swift_slowDealloc(v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

id sub_1000050A0(uint64_t a1, uint64_t a2, SEL *a3)
{
  return objc_msgSend((id)objc_opt_self(MPMusicMediaPickerXPCInterfaces), *a3);
}

id sub_1000051F4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MusicMediaPickerServiceViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MusicMediaPickerServiceViewController()
{
  return objc_opt_self(MusicMediaPickerServiceViewController);
}

void sub_100005254(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  sub_100005C64(a2, a3 & 1, a4);
}

void *sub_100005264()
{
  void *result;
  void *v1;

  result = (void *)sub_100004DC0();
  if (result)
  {
    v1 = result;
    objc_msgSend(result, "remoteMediaPickerDidCancel");
    return (void *)swift_unknownObjectRelease(v1);
  }
  return result;
}

uint64_t sub_1000052A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  return a3(a2);
}

uint64_t sub_1000052C8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100005398(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100006A34((uint64_t)v12, *a3);
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
      sub_100006A34((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100006A14(v12);
  return v7;
}

uint64_t sub_100005398(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100005550(a5, a6);
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

uint64_t sub_100005550(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000055E4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000057BC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000057BC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000055E4(uint64_t a1, unint64_t a2)
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
      v5 = sub_100005758(v4, 0);
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

_QWORD *sub_100005758(uint64_t a1, uint64_t a2)
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
  v4 = sub_100006958(&qword_10000CCF8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000057BC(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006958(&qword_10000CCF8);
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

void sub_100005908(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Swift::Int v27;
  id v28;
  Swift::Int v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  id v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v1 = a1;
  v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v6 = a1;
    else
      v6 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_100006958(&qword_10000CCF0);
      v4 = (_QWORD *)static _SetStorage.allocate(capacity:)(v3);
      if (!v2)
        goto LABEL_4;
LABEL_11:
      if (v1 < 0)
        v7 = v1;
      else
        v7 = v1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v1);
      v5 = _CocoaArrayWrapper.endIndex.getter(v7);
      swift_bridgeObjectRelease(v1);
      if (!v5)
        return;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
  }
  v4 = &_swiftEmptySetSingleton;
  if (v2)
    goto LABEL_11;
LABEL_4:
  v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
    return;
LABEL_15:
  v8 = (char *)(v4 + 7);
  v45 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v9 = 0;
    v43 = v1;
    while (1)
    {
      while (1)
      {
        v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v1);
        v11 = __OFADD__(v9++, 1);
        if (v11)
        {
          __break(1u);
          goto LABEL_42;
        }
        v12 = v10;
        v13 = NSObject._rawHashValue(seed:)(v4[5]);
        v14 = -1 << *((_BYTE *)v4 + 32);
        v15 = v13 & ~v14;
        v16 = v15 >> 6;
        v17 = *(_QWORD *)&v8[8 * (v15 >> 6)];
        v18 = 1 << v15;
        if (((1 << v15) & v17) != 0)
          break;
LABEL_26:
        *(_QWORD *)&v8[8 * v16] = v18 | v17;
        *(_QWORD *)(v4[6] + 8 * v15) = v12;
        v24 = v4[2];
        v11 = __OFADD__(v24, 1);
        v25 = v24 + 1;
        if (v11)
          goto LABEL_43;
        v4[2] = v25;
        if (v9 == v5)
          return;
      }
      sub_100006AFC(0, &qword_10000CCE0, MPMediaPredicate_ptr);
      v19 = *(id *)(v4[6] + 8 * v15);
      v20 = static NSObject.== infix(_:_:)();

      if ((v20 & 1) == 0)
      {
        v21 = ~v14;
        while (1)
        {
          v15 = (v15 + 1) & v21;
          v16 = v15 >> 6;
          v17 = *(_QWORD *)&v8[8 * (v15 >> 6)];
          v18 = 1 << v15;
          if ((v17 & (1 << v15)) == 0)
            break;
          v22 = *(id *)(v4[6] + 8 * v15);
          v23 = static NSObject.== infix(_:_:)();

          if ((v23 & 1) != 0)
            goto LABEL_17;
        }
        v1 = v43;
        v5 = v45;
        goto LABEL_26;
      }
LABEL_17:
      swift_unknownObjectRelease(v12);
      v1 = v43;
      v5 = v45;
      if (v9 == v45)
        return;
    }
  }
  v26 = 0;
  v42 = v1 + 32;
  v44 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v26 != v44)
  {
    v27 = v4[5];
    v28 = *(id *)(v42 + 8 * v26);
    v29 = NSObject._rawHashValue(seed:)(v27);
    v30 = -1 << *((_BYTE *)v4 + 32);
    v31 = v29 & ~v30;
    v32 = v31 >> 6;
    v33 = *(_QWORD *)&v8[8 * (v31 >> 6)];
    v34 = 1 << v31;
    if (((1 << v31) & v33) != 0)
    {
      sub_100006AFC(0, &qword_10000CCE0, MPMediaPredicate_ptr);
      v35 = *(id *)(v4[6] + 8 * v31);
      v36 = static NSObject.== infix(_:_:)();

      if ((v36 & 1) != 0)
      {
LABEL_30:

        goto LABEL_31;
      }
      v37 = ~v30;
      while (1)
      {
        v31 = (v31 + 1) & v37;
        v32 = v31 >> 6;
        v33 = *(_QWORD *)&v8[8 * (v31 >> 6)];
        v34 = 1 << v31;
        if ((v33 & (1 << v31)) == 0)
          break;
        v38 = *(id *)(v4[6] + 8 * v31);
        v39 = static NSObject.== infix(_:_:)();

        if ((v39 & 1) != 0)
          goto LABEL_30;
      }
    }
    *(_QWORD *)&v8[8 * v32] = v34 | v33;
    *(_QWORD *)(v4[6] + 8 * v31) = v28;
    v40 = v4[2];
    v11 = __OFADD__(v40, 1);
    v41 = v40 + 1;
    if (v11)
      goto LABEL_44;
    v4[2] = v41;
LABEL_31:
    if (++v26 == v45)
      return;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
}

void sub_100005C64(uint64_t a1, char a2, void *a3)
{
  uint64_t v3;
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
  char *v19;
  void *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void (*v48)(char *, id);
  char *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  NSString v87;
  uint64_t v88;
  uint64_t inited;
  uint64_t v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  Class isa;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  os_log_type_t v102;
  uint8_t *v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  id v107;
  Class v108;
  id v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  char v115[40];
  __int128 v116;
  __int128 v117;
  id v118;
  uint64_t v119;

  v7 = *(_QWORD *)(type metadata accessor for Logger(0) - 8);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v10 = &v115[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = __chkstk_darwin(v8);
  v13 = &v115[-v12 - 8];
  v14 = __chkstk_darwin(v11);
  v16 = &v115[-v15 - 8];
  v17 = __chkstk_darwin(v14);
  v19 = &v115[-v18 - 8];
  v20 = (void *)__chkstk_darwin(v17);
  v22 = &v115[-v21 - 8];
  if ((a2 & 1) != 0)
  {
    v33 = (id *)(id)a1;
    v34 = (void *)sub_100004DC0();
    if (v34)
    {
      v35 = v34;
      objc_msgSend(v34, "remoteMediaPickerDidPickPlaybackArchive:", v33);
      swift_unknownObjectRelease(v35);
    }
    sub_10000694C((id)a1, 1);
  }
  else
  {
    v114 = v20;
    swift_bridgeObjectRetain(a1);
    switch((unint64_t)objc_msgSend(a3, "selectionMode"))
    {
      case 0uLL:
      case 1uLL:
        *(_QWORD *)&v116 = &_swiftEmptyArrayStorage;
        if ((unint64_t)a1 >> 62)
        {
          if (a1 >= 0)
            v22 = (char *)(a1 & 0xFFFFFFFFFFFFFF8);
          else
            v22 = (char *)a1;
          swift_bridgeObjectRetain(a1);
          v7 = _CocoaArrayWrapper.endIndex.getter(v22);
          if (v7)
            goto LABEL_5;
        }
        else
        {
          v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain(a1);
          if (v7)
          {
LABEL_5:
            v114 = (id)v3;
            if (v7 < 1)
            {
              __break(1u);
              goto LABEL_63;
            }
            v23 = 0;
            while (1)
            {
              v28 = (a1 & 0xC000000000000001) != 0
                  ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v23, a1)
                  : *(id *)(a1 + 8 * v23 + 32);
              v29 = v28;
              v30 = objc_opt_self(MPModelSong);
              v31 = swift_dynamicCastObjCClass(v29, v30);
              if (!v31)
                break;
              v32 = objc_msgSend((id)objc_opt_self(MPModelGenericObject), "genericObjectWithModelObject:", v31);
              v24 = objc_msgSend((id)objc_opt_self(MPMediaItem), "itemFromModelObject:", v32);

              if (v24)
                goto LABEL_8;
LABEL_11:
              if (v7 == ++v23)
              {
                sub_10000694C((id)a1, 0);
                v36 = (void *)v116;
                goto LABEL_59;
              }
            }
            v24 = objc_msgSend(objc_allocWithZone((Class)MPModelObjectMediaItem), "initWithModelObject:", v29);

LABEL_8:
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
            v26 = *(_QWORD *)((v116 & 0xFFFFFFFFFFFFFF8) + 0x10);
            v25 = *(_QWORD *)((v116 & 0xFFFFFFFFFFFFFF8) + 0x18);
            if (v26 >= v25 >> 1)
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
            v27 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v26, v24);
            specialized Array._endMutation()(v27);
            goto LABEL_11;
          }
        }
        sub_10000694C((id)a1, 0);
        v36 = &_swiftEmptyArrayStorage;
LABEL_59:
        sub_10000694C((id)a1, 0);
        v94 = objc_allocWithZone((Class)MPMediaItemCollection);
        sub_100006AFC(0, &qword_10000CCD0, MPMediaItem_ptr);
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v36);
        v114 = objc_msgSend(v94, "initWithItems:", isa);

        v96 = (void *)sub_100004DC0();
        if (v96)
        {
          v97 = v96;
          objc_msgSend(v96, "remoteMediaPickerDidPickMediaItems:", v114);

          swift_unknownObjectRelease(v97);
        }
        else
        {

        }
        return;
      case 2uLL:
        if (objc_msgSend(a3, "picksSingleCollectionEntity"))
        {
          v3 = a1 & 0xFFFFFFFFFFFFFF8;
          if ((unint64_t)a1 >> 62)
          {
LABEL_63:
            if (a1 >= 0)
              v98 = v3;
            else
              v98 = a1;
            swift_bridgeObjectRetain(a1);
            v50 = (void *)_CocoaArrayWrapper.endIndex.getter(v98);
            sub_10000694C((id)a1, 0);
            if (v50)
              goto LABEL_27;
          }
          else
          {
            v50 = *(void **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v50)
            {
LABEL_27:
              if ((a1 & 0xC000000000000001) != 0)
              {
                v51 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
              }
              else
              {
                if (!*(_QWORD *)(v3 + 16))
                {
                  __break(1u);
                  goto LABEL_74;
                }
                v51 = *(id *)(a1 + 32);
              }
              v50 = v51;
              sub_10000694C((id)a1, 0);
              v52 = objc_msgSend(v50, "identifiers");
              v53 = objc_msgSend(v52, "library");

              if (v53)
              {
                v54 = objc_msgSend(v53, "persistentID");
                swift_unknownObjectRelease(v53);
              }
              else
              {
                v54 = 0;
              }
              v70 = objc_opt_self(MPModelAlbum);
              if (swift_dynamicCastObjCClass(v50, v70))
              {
                if (v53)
                {
                  *((_QWORD *)&v117 + 1) = &type metadata for Int64;
                  *(_QWORD *)&v116 = v54;
                  static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaItemPropertyAlbumPersistentID, v71);
                  v73 = v72;
                  v74 = sub_1000069F0(&v116, (uint64_t)&type metadata for Int64);
                  v75 = *(&type metadata for Int64 - 1);
                  __chkstk_darwin(v74);
                  v77 = &v115[-((v76 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
                  (*(void (**)(char *))(v75 + 16))(v77);
                  v53 = (id)_bridgeAnythingToObjectiveC<A>(_:)(v77, &type metadata for Int64);
                  (*(void (**)(char *, _QWORD *))(v75 + 8))(v77, &type metadata for Int64);
                  sub_100006A14(&v116);
                }
                else
                {
                  v116 = 0u;
                  v117 = 0u;
                  static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaItemPropertyAlbumPersistentID, v71);
                  v73 = v85;
                }
                goto LABEL_51;
              }
              v78 = objc_opt_self(MPModelPlaylist);
              if (swift_dynamicCastObjCClass(v50, v78))
              {
                if (v53)
                {
                  *((_QWORD *)&v117 + 1) = &type metadata for Int64;
                  *(_QWORD *)&v116 = v54;
                  static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaPlaylistPropertyPersistentID, v79);
                  v73 = v80;
                  v81 = sub_1000069F0(&v116, (uint64_t)&type metadata for Int64);
                  v82 = *(&type metadata for Int64 - 1);
                  __chkstk_darwin(v81);
                  v84 = &v115[-((v83 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
                  (*(void (**)(char *))(v82 + 16))(v84);
                  v53 = (id)_bridgeAnythingToObjectiveC<A>(_:)(v84, &type metadata for Int64);
                  (*(void (**)(char *, _QWORD *))(v82 + 8))(v84, &type metadata for Int64);
                  sub_100006A14(&v116);
                }
                else
                {
                  v116 = 0u;
                  v117 = 0u;
                  static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaPlaylistPropertyPersistentID, v79);
                  v73 = v86;
                }
LABEL_51:
                v87 = String._bridgeToObjectiveC()();
                swift_bridgeObjectRelease(v73);
                v7 = (uint64_t)objc_msgSend((id)objc_opt_self(MPMediaPropertyPredicate), "predicateWithValue:forProperty:", v53, v87);
                swift_unknownObjectRelease(v53);

                v88 = sub_100006958(&qword_10000CCD8);
                inited = swift_initStackObject(v88, v115);
                *(_OWORD *)(inited + 16) = xmmword_1000070B0;
                *(_QWORD *)(inited + 32) = v7;
                *(_QWORD *)&v116 = inited;
                ((void (*)(void))specialized Array._endMutation())();
                v3 = v116;
                if (!((unint64_t)v116 >> 62))
                {
                  v90 = *(_QWORD *)((v116 & 0xFFFFFFFFFFFFF8) + 0x10);
                  v91 = (id)v7;
                  if (v90)
                  {
LABEL_53:
                    sub_100005908(v3);
                    v93 = v92;
LABEL_79:
                    swift_bridgeObjectRelease(v3);
                    v107 = objc_allocWithZone((Class)MPMediaQuery);
                    sub_100006AFC(0, &qword_10000CCE0, MPMediaPredicate_ptr);
                    sub_100006998();
                    v108 = Set._bridgeToObjectiveC()().super.isa;
                    swift_bridgeObjectRelease(v93);
                    v109 = objc_msgSend(v107, "initWithFilterPredicates:", v108);

                    v110 = objc_msgSend(objc_allocWithZone((Class)MPMediaItemCollection), "initWithItemsQuery:", v109);
                    if (v110)
                    {
                      v111 = v110;
                      v112 = (void *)sub_100004DC0();
                      if (v112)
                      {
                        v113 = v112;
                        objc_msgSend(v112, "remoteMediaPickerDidPickMediaItems:", v111);

                        swift_unknownObjectRelease(v113);
                      }
                      else
                      {

                      }
                    }
                    else
                    {

                    }
                    return;
                  }
LABEL_78:
                  v93 = &_swiftEmptySetSingleton;
                  goto LABEL_79;
                }
LABEL_74:
                if (v3 < 0)
                  v104 = v3;
                else
                  v104 = v3 & 0xFFFFFFFFFFFFFF8;
                v105 = (id)v7;
                swift_bridgeObjectRetain(v3);
                v106 = _CocoaArrayWrapper.endIndex.getter(v104);
                swift_bridgeObjectRelease(v3);
                if (v106)
                  goto LABEL_53;
                goto LABEL_78;
              }
LABEL_68:
              v99 = Logger.mediaPicker.unsafeMutableAddressor();
              v100 = (*(uint64_t (**)(char *, uint64_t, id))(v7 + 16))(v22, v99, v114);
              v101 = Logger.logObject.getter(v100);
              v102 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v101, v102))
              {
                v103 = (uint8_t *)swift_slowAlloc(2, -1);
                *(_WORD *)v103 = 0;
                _os_log_impl((void *)&_mh_execute_header, v101, v102, "A non-playlist/album was picked while picksSingleCollectionEntity was true.", v103, 2u);
                swift_slowDealloc(v103, -1, -1);
              }

              v48 = *(void (**)(char *, id))(v7 + 8);
              v49 = v22;
              goto LABEL_71;
            }
          }
          sub_10000694C((id)a1, 0);
          goto LABEL_68;
        }
        sub_10000694C((id)a1, 0);
        v65 = Logger.mediaPicker.unsafeMutableAddressor();
        v66 = (*(uint64_t (**)(char *, uint64_t, id))(v7 + 16))(v19, v65, v114);
        v67 = Logger.logObject.getter(v66);
        v68 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v67, v68))
        {
          v69 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v69 = 0;
          _os_log_impl((void *)&_mh_execute_header, v67, v68, "A SelectionMode of .singleCollection for non-legacy clients is not yet supported", v69, 2u);
          swift_slowDealloc(v69, -1, -1);
        }

        v48 = *(void (**)(char *, id))(v7 + 8);
        v49 = v19;
LABEL_71:
        v48(v49, v114);
        break;
      case 3uLL:
        sub_10000694C((id)a1, 0);
        v55 = Logger.mediaPicker.unsafeMutableAddressor();
        v56 = (*(uint64_t (**)(char *, uint64_t, id))(v7 + 16))(v16, v55, v114);
        v57 = Logger.logObject.getter(v56);
        v58 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v57, v58))
        {
          v59 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v59 = 0;
          _os_log_impl((void *)&_mh_execute_header, v57, v58, "A SelectionMode of .collections is not yet supported", v59, 2u);
          swift_slowDealloc(v59, -1, -1);
        }

        v48 = *(void (**)(char *, id))(v7 + 8);
        v49 = v16;
        goto LABEL_71;
      case 4uLL:
        sub_10000694C((id)a1, 0);
        v60 = Logger.mediaPicker.unsafeMutableAddressor();
        v61 = (*(uint64_t (**)(char *, uint64_t, id))(v7 + 16))(v13, v60, v114);
        v62 = Logger.logObject.getter(v61);
        v63 = static os_log_type_t.fault.getter();
        if (os_log_type_enabled(v62, v63))
        {
          v64 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v64 = 0;
          _os_log_impl((void *)&_mh_execute_header, v62, v63, "Received result of type .modelObject(_) when selectionMode was .playbackArchive", v64, 2u);
          swift_slowDealloc(v64, -1, -1);
        }

        v48 = *(void (**)(char *, id))(v7 + 8);
        v49 = v13;
        goto LABEL_71;
      default:
        sub_10000694C((id)a1, 0);
        v37 = Logger.mediaPicker.unsafeMutableAddressor();
        v38 = v114;
        (*(void (**)(char *, uint64_t, id))(v7 + 16))(v10, v37, v114);
        v39 = a3;
        v40 = Logger.logObject.getter(v39);
        v41 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v40, v41))
        {
          v42 = (uint8_t *)swift_slowAlloc(12, -1);
          v43 = swift_slowAlloc(32, -1);
          *(_QWORD *)&v116 = v43;
          *(_DWORD *)v42 = 136446210;
          v118 = objc_msgSend(v39, "selectionMode");
          type metadata accessor for MPMediaPickerSelectionMode();
          v45 = String.init<A>(describing:)(&v118, v44);
          v47 = v46;
          v118 = (id)sub_1000052C8(v45, v46, (uint64_t *)&v116);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v118, &v119, v42 + 4, v42 + 12);

          swift_bridgeObjectRelease(v47);
          _os_log_impl((void *)&_mh_execute_header, v40, v41, "Unknown selectionMode = %{public}s", v42, 0xCu);
          swift_arrayDestroy(v43, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v43, -1, -1);
          swift_slowDealloc(v42, -1, -1);

          v48 = *(void (**)(char *, id))(v7 + 8);
          v49 = v10;
          goto LABEL_71;
        }

        (*(void (**)(char *, id))(v7 + 8))(v10, v38);
        return;
    }
  }
}

void sub_10000694C(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease(a1);
}

uint64_t sub_100006958(uint64_t *a1)
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

unint64_t sub_100006998()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CCE8;
  if (!qword_10000CCE8)
  {
    v1 = sub_100006AFC(255, &qword_10000CCE0, MPMediaPredicate_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10000CCE8);
  }
  return result;
}

_QWORD *sub_1000069F0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006A14(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100006A34(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006A74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006958(&qword_10000CD00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006ABC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006958(&qword_10000CD00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006AFC(uint64_t a1, unint64_t *a2, _QWORD *a3)
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
