id sub_100005B04()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  v0 = (void *)objc_opt_self(NSTextAttachment);
  v1 = sub_10000D3A4(0, &qword_100015138, ICInlineDrawingTextAttachment_ptr);
  objc_msgSend(v0, "registerTextAttachmentClass:forFileType:", swift_getObjCClassFromMetadata(v1), PKAppleDrawingTypeIdentifier);
  v2 = sub_10000D3A4(0, &qword_100015140, ICSystemPaperTextAttachment_ptr);
  return objc_msgSend(v0, "registerTextAttachmentClass:forFileType:", swift_getObjCClassFromMetadata(v2), PKApplePaperTypeIdentifier);
}

uint64_t sub_100005B9C()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10000CF24(v0, qword_100014E20);
  sub_10000CEAC(v0, (uint64_t)qword_100014E20);
  return Logger.init(subsystem:category:)(0xD000000000000025, 0x800000010000EDD0, 0x7845726F74696445, 0xEF6E6F69736E6574);
}

void sub_100005C20()
{
  uint64_t v0;
  objc_class *ObjCClassFromMetadata;
  const char *v2;
  Method InstanceMethod;
  objc_method *v4;
  objc_method *v5;
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  NSObject *oslog;

  v0 = sub_10000D3A4(0, &qword_100015148, UIApplication_ptr);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v0);
  v2 = (const char *)Selector.init(_:)(0xD000000000000033, 0x800000010000F080);
  InstanceMethod = class_getInstanceMethod(ObjCClassFromMetadata, v2);
  if (InstanceMethod
    && (v4 = InstanceMethod,
        (v5 = class_getInstanceMethod(ObjCClassFromMetadata, "my_openURL:originatingView:options:completionHandler:")) != 0))
  {
    method_exchangeImplementations(v4, v5);
  }
  else
  {
    if (qword_100014E18 != -1)
      swift_once(&qword_100014E18, sub_100005B9C);
    v6 = type metadata accessor for Logger(0);
    sub_10000CEAC(v6, (uint64_t)qword_100014E20);
    oslog = Logger.logObject.getter();
    v7 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(oslog, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v7, "Failed to get method: -[UIApplication _openURL:originatingView:options:completionHandler:]", v8, 2u);
      swift_slowDealloc(v8, -1, -1);
    }

  }
}

uint64_t sub_100005D68(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

char *sub_100005EB0(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  void *v7;
  char *v8;
  char *v9;
  NSString v10;
  char *v11;
  void *v12;
  char *v13;
  id v14;
  objc_super v16;

  v6 = OBJC_IVAR___ICEditorExtensionViewController_analyticsController;
  v7 = (void *)objc_opt_self(ICNAController);
  v8 = v3;
  *(_QWORD *)&v3[v6] = objc_msgSend(v7, "sharedController");
  *(_QWORD *)&v8[OBJC_IVAR___ICEditorExtensionViewController_noteEditor] = 0;
  v8[OBJC_IVAR___ICEditorExtensionViewController_showOpenNotesAlertOnAppear] = 0;
  v8[OBJC_IVAR___ICEditorExtensionViewController_didSetWindowTintColor] = 0;
  *(_QWORD *)&v8[OBJC_IVAR___ICEditorExtensionViewController_linkContentItem] = 0;
  *(_QWORD *)&v8[OBJC_IVAR___ICEditorExtensionViewController_imageData] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v8[OBJC_IVAR___ICEditorExtensionViewController_webURLs] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v8[OBJC_IVAR___ICEditorExtensionViewController_hostConnection] = 0;
  v8[OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar] = 0;
  v9 = &v8[OBJC_IVAR___ICEditorExtensionViewController_hostBundleIdentifier];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  *(_QWORD *)&v8[OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator] = 0;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v16.receiver = v8;
  v16.super_class = (Class)type metadata accessor for EditorExtensionViewController();
  v11 = (char *)objc_msgSendSuper2(&v16, "initWithNibName:bundle:", v10, a3);

  v12 = *(void **)&v11[OBJC_IVAR___ICEditorExtensionViewController_analyticsController];
  v13 = v11;
  v14 = v12;
  objc_msgSend(v14, "startAppSession");

  return v13;
}

char *sub_100006094(void *a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  void *v9;
  char *v10;
  id v11;
  objc_super v13;

  v3 = OBJC_IVAR___ICEditorExtensionViewController_analyticsController;
  v4 = (void *)objc_opt_self(ICNAController);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, "sharedController");
  *(_QWORD *)&v5[OBJC_IVAR___ICEditorExtensionViewController_noteEditor] = 0;
  v5[OBJC_IVAR___ICEditorExtensionViewController_showOpenNotesAlertOnAppear] = 0;
  v5[OBJC_IVAR___ICEditorExtensionViewController_didSetWindowTintColor] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___ICEditorExtensionViewController_linkContentItem] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___ICEditorExtensionViewController_imageData] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v5[OBJC_IVAR___ICEditorExtensionViewController_webURLs] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v5[OBJC_IVAR___ICEditorExtensionViewController_hostConnection] = 0;
  v5[OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar] = 0;
  v6 = &v5[OBJC_IVAR___ICEditorExtensionViewController_hostBundleIdentifier];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&v5[OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator] = 0;

  v13.receiver = v5;
  v13.super_class = (Class)type metadata accessor for EditorExtensionViewController();
  v7 = (char *)objc_msgSendSuper2(&v13, "initWithCoder:", a1);
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)&v7[OBJC_IVAR___ICEditorExtensionViewController_analyticsController];
    v10 = v7;
    v11 = v9;
    objc_msgSend(v11, "startAppSession");

  }
  return v8;
}

id sub_100006208()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR___ICEditorExtensionViewController_analyticsController], "appSessionDidTerminate");
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EditorExtensionViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100006348()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  objc_class *v4;
  void *v5;
  NSString v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSURL *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int IsTextKit2Enabled;
  Class *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  NSString v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  uint8_t *v85;
  NSObject *v86;
  _QWORD aBlock[5];
  uint64_t v88;
  objc_super v89;

  v1 = v0;
  sub_10000CD04(&qword_1000150E8);
  __chkstk_darwin();
  v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (objc_class *)type metadata accessor for EditorExtensionViewController();
  v89.receiver = v1;
  v89.super_class = v4;
  objc_msgSendSuper2(&v89, "viewDidLoad");
  v5 = (void *)objc_opt_self(STDynamicActivityAttributionPublisher);
  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(v5, "setCurrentAttributionKey:andApp:", 0, v6);

  if (qword_100014E38 != -1)
    swift_once(&qword_100014E38, sub_100005C1C);
  v8 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_analyticsController];
  if (v8)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(kICNAEditorExtensionReferralURL, v7);
    v11 = v10;
    URL.init(string:)(v9);
    swift_bridgeObjectRelease(v11);
    v16 = type metadata accessor for URL(0, v12, v13, v14, v15);
    v17 = *(_QWORD *)(v16 - 8);
    v19 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v3, 1, v16) != 1)
    {
      URL._bridgeToObjectiveC()(v18);
      v19 = v20;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v3, v16);
    }
    objc_msgSend(v8, "startSessionWithReferralURL:referralApplication:startingSessionType:", v19, 0, ICNASessionTypePaper);

  }
  v21 = (void *)objc_opt_self(ICExtensionSafeAPIShims);
  v22 = swift_allocObject(&unk_1000107E0, 24, 7);
  swift_unknownObjectWeakInit(v22 + 16, v1);
  aBlock[4] = sub_10000D300;
  v88 = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006E08;
  aBlock[3] = &unk_100010AA0;
  v23 = _Block_copy(aBlock);
  swift_release(v88);
  objc_msgSend(v21, "setOpenURLHandler:", v23);
  _Block_release(v23);
  if (qword_100014E10 != -1)
    swift_once(&qword_100014E10, sub_100005B04);
  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  v25 = (Class *)ICTK2NoteEditorViewController_ptr;
  if (!IsTextKit2Enabled)
    v25 = (Class *)ICNoteEditorViewController_ptr;
  v26 = objc_msgSend(objc_allocWithZone(*v25), "initWithIdentifier:options:", -1, 3);
  v27 = OBJC_IVAR___ICEditorExtensionViewController_noteEditor;
  v28 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
  *(_QWORD *)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor] = v26;

  v29 = *(void **)&v1[v27];
  if (!v29)
    goto LABEL_59;
  objc_msgSend(v29, "setDelegate:", v1);
  v30 = *(void **)&v1[v27];
  if (!v30)
  {
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  v31 = *(_QWORD *)&v1[OBJC_IVAR___ICEditorExtensionViewController_hostBundleIdentifier + 8];
  v32 = v30;
  if (v31)
  {
    swift_bridgeObjectRetain(v31);
    v33 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v31);
  }
  else
  {
    v33 = 0;
  }
  objc_msgSend(v30, "setHostBundleIdentifier:", v33);

  v34 = *(void **)&v1[v27];
  if (!v34)
    goto LABEL_61;
  objc_msgSend(v34, "setCanShowLinkBar:", (v1[OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar] & 1) == 0);
  v35 = *(_QWORD *)&v1[v27];
  if (!v35)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  v36 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", v35);
  objc_msgSend(v1, "addChildViewController:", v36);
  v37 = -[NSObject view](v36, "view");
  if (!v37)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  v38 = v37;
  v39 = objc_msgSend(v1, "view");
  if (!v39)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  v40 = v39;
  objc_msgSend(v39, "bounds");
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;

  objc_msgSend(v38, "setFrame:", v42, v44, v46, v48);
  v49 = -[NSObject view](v36, "view");
  if (!v49)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  v50 = v49;
  objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  v51 = -[NSObject view](v36, "view");
  if (!v51)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  v52 = v51;
  objc_msgSend(v51, "setAutoresizingMask:", 18);

  v53 = objc_msgSend(v1, "view");
  if (!v53)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  v54 = v53;
  v55 = -[NSObject view](v36, "view");
  if (!v55)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  v56 = v55;
  objc_msgSend(v54, "addSubview:", v55);

  -[NSObject didMoveToParentViewController:](v36, "didMoveToParentViewController:", v1);
  v57 = (void *)objc_opt_self(ICNoteContext);
  objc_msgSend(v57, "startSharedContextWithOptions:", 546);
  v58 = objc_msgSend(v57, "sharedContext");
  if (!v58)
  {
    if (qword_100014E18 != -1)
      swift_once(&qword_100014E18, sub_100005B9C);
    v75 = type metadata accessor for Logger(0);
    sub_10000CEAC(v75, (uint64_t)qword_100014E20);
    v76 = Logger.logObject.getter();
    v77 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v76, v77))
    {
      v78 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v78 = 0;
      _os_log_impl((void *)&_mh_execute_header, v76, v77, "No note context; preparing to show alert", v78, 2u);
      swift_slowDealloc(v78, -1, -1);
      v79 = v36;
    }
    else
    {
      v79 = v76;
      v76 = v36;
    }

    goto LABEL_56;
  }
  v59 = v58;
  -[NSObject addOrDeleteLocalAccountIfNecessary](v58, "addOrDeleteLocalAccountIfNecessary");
  v60 = -[NSObject managedObjectContext](v59, "managedObjectContext");
  v61 = (void *)objc_opt_self(ICAccount);
  if (!objc_msgSend(v61, "hasModernAccountInContext:", v60))
  {
LABEL_50:
    if (qword_100014E18 != -1)
      swift_once(&qword_100014E18, sub_100005B9C);
    v82 = type metadata accessor for Logger(0);
    sub_10000CEAC(v82, (uint64_t)qword_100014E20);
    v83 = Logger.logObject.getter();
    v84 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v83, v84))
    {
      v85 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v85 = 0;
      _os_log_impl((void *)&_mh_execute_header, v83, v84, "No modern account; preparing to show alert", v85, 2u);
      swift_slowDealloc(v85, -1, -1);
      v86 = v36;
    }
    else
    {
      v86 = v83;
      v83 = v59;
      v59 = v60;
      v60 = v36;
    }

LABEL_56:
    v1[OBJC_IVAR___ICEditorExtensionViewController_showOpenNotesAlertOnAppear] = 1;
    return;
  }
  v62 = objc_msgSend(v61, "defaultAccountInContext:", v60);
  if (v62)
    goto LABEL_33;
  v63 = objc_msgSend(v61, "allActiveAccountsInContext:", v60);
  v64 = sub_10000D3A4(0, &qword_100015130, ICAccount_ptr);
  v65 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v63, v64);

  if (!((unint64_t)v65 >> 62))
  {
    if (*(_QWORD *)((v65 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_29;
    goto LABEL_49;
  }
  if (v65 < 0)
    v80 = v65;
  else
    v80 = v65 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v65);
  v81 = _CocoaArrayWrapper.endIndex.getter(v80);
  swift_bridgeObjectRelease(v65);
  if (!v81)
  {
LABEL_49:
    swift_bridgeObjectRelease(v65);
    goto LABEL_50;
  }
LABEL_29:
  if ((v65 & 0xC000000000000001) != 0)
  {
    v66 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v65);
    goto LABEL_32;
  }
  if (!*(_QWORD *)((v65 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  v66 = *(id *)(v65 + 32);
LABEL_32:
  v62 = v66;
  swift_bridgeObjectRelease(v65);
LABEL_33:
  v67 = (void *)objc_opt_self(ICNote);
  v68 = objc_msgSend(v62, "defaultFolder");
  v69 = objc_msgSend(v67, "newEmptyNoteInFolder:", v68);

  objc_msgSend(v69, "markAsSystemPaperIfNeeded:", 1);
  -[NSObject ic_save](v60, "ic_save");
  v70 = *(void **)&v1[v27];
  if (!v70)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  objc_msgSend(v70, "setNote:", v69);
  v71 = *(void **)&v1[v27];
  if (!v71)
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  objc_msgSend(v71, "startEditing");
  v72 = *(void **)&v1[v27];
  if (!v72)
  {
LABEL_71:
    __break(1u);
    return;
  }
  v73 = objc_msgSend(v72, "eventReporter");
  if (v73)
  {
    v74 = v73;
    objc_msgSend(v73, "submitNoteCreateEventForModernNote:createApproach:", v69, 18);

  }
}

void sub_100006C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t Strong;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSURL *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  uint64_t v20;
  void *v21;
  char v22[24];

  v6 = a4 + 16;
  swift_beginAccess(a4 + 16, v22, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v6);
  if (Strong)
  {
    v8 = (void *)Strong;
    v9 = *(void **)(Strong + OBJC_IVAR___ICEditorExtensionViewController_hostConnection);
    if (v9
      && (v10 = objc_msgSend(v9, "remoteObjectProxy"),
          _bridgeAnyObjectToAny(_:)(v19),
          swift_unknownObjectRelease(v10),
          v11 = sub_10000CD04(&qword_1000150A0),
          (swift_dynamicCast(&v21, v19, (char *)&type metadata for Any + 8, v11, 6) & 1) != 0))
    {
      v12 = v21;

      URL._bridgeToObjectiveC()(v13);
      v15 = v14;
      v16 = swift_allocObject(&unk_100010B00, 32, 7);
      *(_QWORD *)(v16 + 16) = a2;
      *(_QWORD *)(v16 + 24) = a3;
      v19[4] = sub_10000D368;
      v20 = v16;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 1107296256;
      v19[2] = sub_100005D68;
      v19[3] = &unk_100010B18;
      v17 = _Block_copy(v19);
      v18 = v20;
      sub_10000D394(a2, a3);
      swift_release(v18);
      objc_msgSend(v12, "openURL:completion:", v15, v17);
      swift_unknownObjectRelease(v12);
      _Block_release(v17);

    }
    else
    {

    }
  }
}

uint64_t sub_100006E08(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, void *, uint64_t);
  void *v14;
  uint64_t v15;
  uint64_t v17;

  v8 = type metadata accessor for URL(0, a2, a3, a4, a5);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, void *, uint64_t))(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v14 = _Block_copy(a3);
  if (v14)
  {
    v15 = swift_allocObject(&unk_100010AD8, 24, 7);
    *(_QWORD *)(v15 + 16) = v14;
    v14 = sub_10000D468;
  }
  else
  {
    v15 = 0;
  }
  swift_retain(v12);
  v13(v11, v14, v15);
  sub_10000D308((uint64_t)v14, v15);
  swift_release(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_100006F3C()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  NSString v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSString v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;

  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for EditorExtensionViewController();
  objc_msgSendSuper2(&v18, "viewWillLayoutSubviews");
  v1 = OBJC_IVAR___ICEditorExtensionViewController_didSetWindowTintColor;
  if ((*((_BYTE *)v0 + OBJC_IVAR___ICEditorExtensionViewController_didSetWindowTintColor) & 1) == 0)
  {
    v2 = objc_msgSend(v0, "view");
    if (v2)
    {
      v3 = v2;
      v4 = objc_msgSend(v2, "window");

      if (v4)
      {
        v5 = String._bridgeToObjectiveC()();
        v6 = objc_msgSend((id)objc_opt_self(UIColor), "colorNamed:", v5);

        objc_msgSend(v4, "setTintColor:", v6);
      }
      v7 = objc_msgSend(v0, "view");
      if (v7)
      {
        v8 = v7;
        v9 = objc_msgSend(v7, "window");

        if (v9)
        {
          v10 = String._bridgeToObjectiveC()();
          v11 = objc_msgSend(v9, "valueForKey:", v10);

          if (v11)
          {
            _bridgeAnyObjectToAny(_:)(v14);
            swift_unknownObjectRelease(v11);
          }
          else
          {
            *(_OWORD *)v14 = 0u;
            v15 = 0u;
          }
          sub_10000CFD0((uint64_t)v14, (uint64_t)&v16);
          if (*((_QWORD *)&v17 + 1))
          {
            v12 = sub_10000D3A4(0, &qword_100015128, UIPresentationController_ptr);
            if ((swift_dynamicCast(v14, &v16, (char *)&type metadata for Any + 8, v12, 6) & 1) != 0)
            {
              v13 = v14[0];
              objc_msgSend(v14[0], "setDelegate:", v0);

            }
            goto LABEL_15;
          }
        }
        else
        {
          v16 = 0u;
          v17 = 0u;
        }
        sub_10000D1C0((uint64_t)&v16, &qword_1000150D8);
LABEL_15:
        *((_BYTE *)v0 + v1) = 1;
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

void sub_1000071BC(char a1)
{
  char *v1;
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
  objc_class *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  Class isa;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  NSString v37;
  NSURL *v38;
  void *v39;
  void *v40;
  Class v41;
  char *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  void (*v56)(char *, uint64_t, uint64_t);
  char *v57;
  char *v58;
  objc_super v59;

  sub_10000CD04(&qword_1000150F0);
  __chkstk_darwin();
  v57 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0, v4, v5, v6, v7);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v58 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CD04(&qword_1000150E8);
  __chkstk_darwin();
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (objc_class *)type metadata accessor for EditorExtensionViewController();
  v59.receiver = v1;
  v59.super_class = v13;
  objc_msgSendSuper2(&v59, "viewDidAppear:", a1 & 1);
  v14 = OBJC_IVAR___ICEditorExtensionViewController_linkContentItem;
  v15 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_linkContentItem];
  if (v15)
  {
    v16 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
    if (!v16)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    v17 = v15;
    objc_msgSend(v16, "addSystemPaperLink:updateFirstResponder:", v17, 1);
    v18 = *(void **)&v1[v14];
    *(_QWORD *)&v1[v14] = 0;

  }
  v19 = OBJC_IVAR___ICEditorExtensionViewController_imageData;
  v20 = *(_QWORD *)&v1[OBJC_IVAR___ICEditorExtensionViewController_imageData];
  if (*(_QWORD *)(v20 + 16))
  {
    v21 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
    if (!v21)
    {
LABEL_21:
      __break(1u);
      return;
    }
    v22 = v21;
    swift_bridgeObjectRetain(v20);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v20);
    objc_msgSend(v22, "addSystemPaperImageData:updateFirstResponder:", isa, 1);

    v24 = *(_QWORD *)&v1[v19];
    *(_QWORD *)&v1[v19] = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease(v24);
  }
  v25 = *(_QWORD *)&v1[OBJC_IVAR___ICEditorExtensionViewController_webURLs];
  v26 = *(_QWORD *)(v25 + 16);
  if (v26)
  {
    v49 = OBJC_IVAR___ICEditorExtensionViewController_webURLs;
    v53 = OBJC_IVAR___ICEditorExtensionViewController_noteEditor;
    v27 = v25 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v50 = *(_QWORD *)(v9 + 72);
    v56 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v52 = SYContentItemSourceIdentifierWeb;
    v48 = v25;
    swift_bridgeObjectRetain(v25);
    v54 = v9;
    v55 = v1;
    v51 = v12;
    while (1)
    {
      v56(v12, v27, v8);
      v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      v28(v12, 0, 1, v8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v12, 1, v8) == 1)
        goto LABEL_15;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v52, v29);
      v31 = v30;
      v32 = v12;
      v33 = v8;
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v58, v32, v8);
      v34 = type metadata accessor for UUID(0);
      v35 = *(_QWORD *)(v34 - 8);
      v36 = v57;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56))(v57, 1, 1, v34);
      v37 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v31);
      URL._bridgeToObjectiveC()(v38);
      v40 = v39;
      v41 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v36, 1, v34) != 1)
      {
        v42 = v57;
        v41 = UUID._bridgeToObjectiveC()().super.isa;
        (*(void (**)(char *, uint64_t))(v35 + 8))(v42, v34);
      }
      v43 = objc_msgSend(objc_allocWithZone((Class)SYContentItem), "initWithDisplayTitle:sourceIdentifier:sourceName:itemURL:identifier:", 0, v37, 0, v40, v41);

      v9 = v54;
      v8 = v33;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v58, v33);
      v1 = v55;
      v44 = *(void **)&v55[v53];
      if (!v44)
        break;
      objc_msgSend(v44, "addSystemPaperLink:updateFirstResponder:", v43, 1);

      v12 = v51;
      v27 += v50;
      if (!--v26)
      {
        v28(v51, 1, 1, v8);
LABEL_15:
        swift_bridgeObjectRelease(v48);
        v45 = *(_QWORD *)&v1[v49];
        *(_QWORD *)&v1[v49] = &_swiftEmptyArrayStorage;
        swift_bridgeObjectRelease(v45);
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_20;
  }
LABEL_16:
  v46 = OBJC_IVAR___ICEditorExtensionViewController_showOpenNotesAlertOnAppear;
  if (v1[OBJC_IVAR___ICEditorExtensionViewController_showOpenNotesAlertOnAppear] == 1)
  {
    sub_100009DD4();
    v1[v46] = 0;
  }
}

void sub_100007620(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  _QWORD v23[2];
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;

  v2 = type metadata accessor for DispatchPredicate(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (_QWORD *)((char *)&v23[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000D3A4(0, &qword_1000150A8, OS_dispatch_queue_ptr);
  *v5 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  v6 = _dispatchPreconditionTest(_:)(v5);
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  v7 = objc_msgSend(a1, "userInfo");
  if (!v7)
  {
    v25 = 0u;
    v26 = 0u;
LABEL_11:
    sub_10000D1C0((uint64_t)&v25, &qword_1000150D8);
    goto LABEL_12;
  }
  v8 = v7;
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v7, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v23[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(SYNotesUserActivityKeyContentItemData, v10);
  v23[1] = v11;
  AnyHashable.init<A>(_:)(v24, v23, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v9 + 16) && (v12 = sub_10000C148((uint64_t)v24), (v13 & 1) != 0))
  {
    sub_10000CEE4(*(_QWORD *)(v9 + 56) + 32 * v12, (uint64_t)&v25);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  sub_10000D28C((uint64_t)v24);
  swift_bridgeObjectRelease(v9);
  if (!*((_QWORD *)&v26 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast(v24, &v25, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0)
  {
    v15 = v24[0];
    v14 = v24[1];
    v16 = objc_allocWithZone((Class)SYContentItem);
    sub_10000CDD8(v15, v14);
    v21 = sub_10000C50C();
    sub_10000CD44(v15, v14);
    if (v21)
    {
      sub_10000987C(v21);

      sub_10000CD44(v15, v14);
      return;
    }
    sub_10000CD44(v15, v14);
  }
LABEL_12:
  if (qword_100014E18 != -1)
LABEL_20:
    swift_once(&qword_100014E18, sub_100005B9C);
  v17 = type metadata accessor for Logger(0);
  sub_10000CEAC(v17, (uint64_t)qword_100014E20);
  v18 = Logger.logObject.getter();
  v19 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to insert link; user activity has no SYContentItem",
      v20,
      2u);
    swift_slowDealloc(v20, -1, -1);
  }

}

uint64_t sub_100007934(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  char v6;
  uint64_t result;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  uint64_t v19[5];
  __int128 v20;
  __int128 v21;

  v2 = type metadata accessor for DispatchPredicate(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (_QWORD *)((char *)&v18[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000D3A4(0, &qword_1000150A8, OS_dispatch_queue_ptr);
  *v5 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  v6 = _dispatchPreconditionTest(_:)(v5);
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
    return result;
  }
  v8 = objc_msgSend(a1, "userInfo");
  if (!v8)
  {
    v20 = 0u;
    v21 = 0u;
    return sub_10000D1C0((uint64_t)&v20, &qword_1000150D8);
  }
  v9 = v8;
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v8, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v18[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(SYNotesUserActivityKeyContentItemData, v11);
  v18[1] = v12;
  AnyHashable.init<A>(_:)(v19, v18, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v10 + 16) && (v13 = sub_10000C148((uint64_t)v19), (v14 & 1) != 0))
  {
    sub_10000CEE4(*(_QWORD *)(v10 + 56) + 32 * v13, (uint64_t)&v20);
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
  }
  sub_10000D28C((uint64_t)v19);
  swift_bridgeObjectRelease(v10);
  if (!*((_QWORD *)&v21 + 1))
    return sub_10000D1C0((uint64_t)&v20, &qword_1000150D8);
  v15 = sub_10000CD04(&qword_100015110);
  result = swift_dynamicCast(v19, &v20, (char *)&type metadata for Any + 8, v15, 6);
  if ((result & 1) != 0)
  {
    v16 = v19[0];
    if (*(_QWORD *)(v19[0] + 16))
      sub_100009978(v19[0]);
    return swift_bridgeObjectRelease(v16);
  }
  return result;
}

uint64_t sub_100007B2C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  _QWORD *v19;
  char v20;
  uint64_t result;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  Swift::String v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[2];
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71[5];
  __int128 v72;
  __int128 v73;

  v2 = v1;
  v4 = sub_10000CD04(&qword_1000150E8);
  __chkstk_darwin(v4);
  v6 = (char *)v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for URL(0, v7, v8, v9, v10);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v67 = (char *)v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v68 = (char *)v63 - v15;
  v16 = type metadata accessor for DispatchPredicate(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (_QWORD *)((char *)v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000D3A4(0, &qword_1000150A8, OS_dispatch_queue_ptr);
  *v19 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v17 + 104))(v19, enum case for DispatchPredicate.onQueue(_:), v16);
  v20 = _dispatchPreconditionTest(_:)(v19);
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v17 + 8))(v19, v16);
  if ((v20 & 1) == 0)
  {
LABEL_62:
    __break(1u);
    return result;
  }
  v22 = objc_msgSend(a1, "userInfo");
  if (!v22)
  {
    v72 = 0u;
    v73 = 0u;
LABEL_12:
    sub_10000D1C0((uint64_t)&v72, &qword_1000150D8);
    goto LABEL_13;
  }
  v23 = v22;
  v24 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v22, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(SYNotesUserActivityKeyAutoInsertLinkToCurrentUserActivity, v25);
  v70 = v26;
  AnyHashable.init<A>(_:)(v71, &v69, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v24 + 16) && (v27 = sub_10000C148((uint64_t)v71), (v28 & 1) != 0))
  {
    sub_10000CEE4(*(_QWORD *)(v24 + 56) + 32 * v27, (uint64_t)&v72);
  }
  else
  {
    v72 = 0u;
    v73 = 0u;
  }
  sub_10000D28C((uint64_t)v71);
  swift_bridgeObjectRelease(v24);
  if (!*((_QWORD *)&v73 + 1))
    goto LABEL_12;
  if (swift_dynamicCast(v71, &v72, (char *)&type metadata for Any + 8, &type metadata for Bool, 6)
    && (v71[0] & 1) != 0)
  {
    sub_10000824C();
    goto LABEL_42;
  }
LABEL_13:
  v29 = objc_msgSend(a1, "userInfo");
  if (!v29)
  {
    v72 = 0u;
    v73 = 0u;
LABEL_41:
    sub_10000D1C0((uint64_t)&v72, &qword_1000150D8);
    goto LABEL_42;
  }
  v30 = v29;
  v31 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v29, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(SYNotesUserActivityKeyContentItemURLs, v32);
  v70 = v33;
  AnyHashable.init<A>(_:)(v71, &v69, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v31 + 16) && (v34 = sub_10000C148((uint64_t)v71), (v35 & 1) != 0))
  {
    sub_10000CEE4(*(_QWORD *)(v31 + 56) + 32 * v34, (uint64_t)&v72);
  }
  else
  {
    v72 = 0u;
    v73 = 0u;
  }
  sub_10000D28C((uint64_t)v71);
  swift_bridgeObjectRelease(v31);
  if (!*((_QWORD *)&v73 + 1))
    goto LABEL_41;
  v36 = sub_10000CD04(&qword_100015118);
  result = swift_dynamicCast(v71, &v72, (char *)&type metadata for Any + 8, v36, 6);
  if ((result & 1) != 0)
  {
    v63[0] = a1;
    v63[1] = v2;
    v37 = v71[0];
    v71[0] = (uint64_t)&_swiftEmptyArrayStorage;
    v66 = *(_QWORD *)(v37 + 16);
    if (v66)
    {
      v38 = 0;
      v64 = v37;
      v65 = v6;
      while (1)
      {
        if (v38 >= *(_QWORD *)(v37 + 16))
        {
          __break(1u);
          goto LABEL_62;
        }
        v39 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
        v40 = *(_QWORD *)(v12 + 72);
        (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v6, v37 + v39 + v40 * v38, v11);
        v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
        v41(v6, 0, 1, v11);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) == 1)
          goto LABEL_57;
        v42 = *(uint64_t (**)(char *, char *, uint64_t))(v12 + 32);
        v43 = v42(v68, v6, v11);
        URL.scheme.getter(v43);
        if (v44)
        {
          v45 = v44;
          v46 = String.lowercased()();
          swift_bridgeObjectRelease(v45);
          if (v46._countAndFlagsBits == 1886680168 && v46._object == (void *)0xE400000000000000
            || (_stringCompareWithSmolCheck(_:_:expecting:)(v46._countAndFlagsBits, v46._object, 1886680168, 0xE400000000000000, 0) & 1) != 0|| v46._countAndFlagsBits == 0x7370747468 && v46._object == (void *)0xE500000000000000)
          {
            swift_bridgeObjectRelease(v46._object);
LABEL_33:
            v42(v67, v68, v11);
            v47 = v71[0];
            if ((swift_isUniquelyReferenced_nonNull_native(v71[0]) & 1) == 0)
            {
              sub_10000C23C(0, *(_QWORD *)(v47 + 16) + 1, 1, v48, v49);
              v47 = v71[0];
            }
            v51 = *(_QWORD *)(v47 + 16);
            v50 = *(_QWORD *)(v47 + 24);
            if (v51 >= v50 >> 1)
            {
              sub_10000C23C(v50 > 1, v51 + 1, 1, v48, v49);
              v47 = v71[0];
            }
            *(_QWORD *)(v47 + 16) = v51 + 1;
            result = v42((char *)(v47 + v39 + v51 * v40), v67, v11);
            v71[0] = v47;
            goto LABEL_23;
          }
          v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v46._countAndFlagsBits, v46._object, 0x7370747468, 0xE500000000000000, 0);
          swift_bridgeObjectRelease(v46._object);
          if ((v52 & 1) != 0)
            goto LABEL_33;
        }
        result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v68, v11);
LABEL_23:
        ++v38;
        v6 = v65;
        v37 = v64;
        if (v66 == v38)
          goto LABEL_56;
      }
    }
    v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
LABEL_56:
    v41(v6, 1, 1, v11);
LABEL_57:
    swift_bridgeObjectRelease(v37);
    sub_10000D1C0((uint64_t)v6, &qword_1000150E8);
    v62 = v71[0];
    if (*(_QWORD *)(v71[0] + 16))
    {
      sub_100009A50(v71[0]);
      swift_release(v62);
    }
    else
    {
      swift_release(v71[0]);
    }
    a1 = (void *)v63[0];
  }
LABEL_42:
  v53 = objc_msgSend(a1, "userInfo", v63[0]);
  if (!v53)
  {
    v72 = 0u;
    v73 = 0u;
    return sub_10000D1C0((uint64_t)&v72, &qword_1000150D8);
  }
  v54 = v53;
  v55 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v53, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(SYNotesUserActivityKeyContentItemImageData, v56);
  v70 = v57;
  AnyHashable.init<A>(_:)(v71, &v69, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v55 + 16) && (v58 = sub_10000C148((uint64_t)v71), (v59 & 1) != 0))
  {
    sub_10000CEE4(*(_QWORD *)(v55 + 56) + 32 * v58, (uint64_t)&v72);
  }
  else
  {
    v72 = 0u;
    v73 = 0u;
  }
  sub_10000D28C((uint64_t)v71);
  swift_bridgeObjectRelease(v55);
  if (!*((_QWORD *)&v73 + 1))
    return sub_10000D1C0((uint64_t)&v72, &qword_1000150D8);
  v60 = sub_10000CD04(&qword_100015110);
  result = swift_dynamicCast(v71, &v72, (char *)&type metadata for Any + 8, v60, 6);
  if ((result & 1) != 0)
  {
    v61 = v71[0];
    if (*(_QWORD *)(v71[0] + 16))
      sub_100009978(v71[0]);
    return swift_bridgeObjectRelease(v61);
  }
  return result;
}

void sub_10000824C()
{
  _BYTE *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  unint64_t v4;
  Class isa;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _BYTE *v9;
  _QWORD v10[5];
  uint64_t v11;

  v1 = OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar;
  v0[OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar] = 1;
  if (!objc_msgSend(v0, "isViewLoaded"))
    goto LABEL_4;
  v2 = *(void **)&v0[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
  if (v2)
  {
    objc_msgSend(v2, "setCanShowLinkBar:", (v0[v1] & 1) == 0);
LABEL_4:
    v3 = (void *)objc_opt_self(NSUserActivity);
    v4 = sub_1000083AC((uint64_t)&_swiftEmptyArrayStorage);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
    v6 = swift_allocObject(&unk_100010948, 24, 7);
    *(_QWORD *)(v6 + 16) = v0;
    v10[4] = sub_10000D070;
    v11 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    v10[2] = sub_100009740;
    v10[3] = &unk_100010960;
    v7 = _Block_copy(v10);
    v8 = v11;
    v9 = v0;
    swift_release(v8);
    objc_msgSend(v3, "_currentUserActivityUUIDWithOptions:completionHandler:", isa, v7);
    _Block_release(v7);

    return;
  }
  __break(1u);
}

unint64_t sub_1000083AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000CD04(&qword_100015100);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10000D1FC(v7, (uint64_t)v16, &qword_100015108);
    result = sub_10000C148((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_10000D240(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
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

void sub_1000084EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  Class isa;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  void **aBlock;
  _QWORD v37[4];
  uint64_t v38;

  v8 = sub_10000CD04(&qword_1000150F0);
  __chkstk_darwin(v8);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = __chkstk_darwin(v11);
  v15 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v35 - v16;
  sub_10000D1FC(a1, (uint64_t)v10, &qword_1000150F0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_10000D1C0((uint64_t)v10, &qword_1000150F0);
    if (qword_100014E18 != -1)
      swift_once(&qword_100014E18, sub_100005B9C);
    v18 = type metadata accessor for Logger(0);
    sub_10000CEAC(v18, (uint64_t)qword_100014E20);
    swift_errorRetain(a4);
    v19 = swift_errorRetain(a4);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v23 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v22 = 138412290;
      if (a4)
      {
        swift_errorRetain(a4);
        v24 = _swift_stdlib_bridgeErrorToNSError(a4);
        aBlock = (void **)v24;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v37, v22 + 4, v22 + 12);
      }
      else
      {
        aBlock = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v37, v22 + 4, v22 + 12);
        v24 = 0;
      }
      *v23 = v24;
      swift_errorRelease(a4);
      swift_errorRelease(a4);
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Failed to get current user activity uuid. Error: %@", v22, 0xCu);
      v34 = sub_10000CD04(&qword_1000150D0);
      swift_arrayDestroy(v23, 1, v34);
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v22, -1, -1);
    }
    else
    {
      swift_errorRelease(a4);
      swift_errorRelease(a4);
    }

  }
  else
  {
    v25 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v25(v17, v10, v11);
    v35 = (id)objc_opt_self(NSUserActivity);
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    v27 = *(unsigned __int8 *)(v12 + 80);
    v28 = (v27 + 16) & ~v27;
    v29 = (v13 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
    v30 = swift_allocObject(&unk_100010998, v29 + 8, v27 | 7);
    v25((char *)(v30 + v28), v15, v11);
    *(_QWORD *)(v30 + v29) = a5;
    v37[3] = sub_10000D0EC;
    v38 = v30;
    aBlock = _NSConcreteStackBlock;
    v37[0] = 1107296256;
    v37[1] = sub_1000096CC;
    v37[2] = &unk_1000109B0;
    v31 = _Block_copy(&aBlock);
    v32 = v38;
    v33 = a5;
    swift_release(v32);
    objc_msgSend(v35, "_fetchUserActivityWithUUID:completionHandler:", isa, v31);
    _Block_release(v31);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  }
}

void sub_1000088C4(void *a1, uint64_t a2, void *a3, void *a4)
{
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
  char *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t aBlock[5];
  uint64_t v66;

  v60 = a4;
  v63 = a3;
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v62 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v61 - 8);
  __chkstk_darwin(v61);
  v11 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v60 - v17;
  if (a1)
  {
    v19 = a1;
    if (sub_100008F88((uint64_t)v19, v20, v21, v22, v23))
    {
      sub_10000D3A4(0, &qword_1000150A8, OS_dispatch_queue_ptr);
      v24 = (void *)static OS_dispatch_queue.main.getter();
      v25 = swift_allocObject(&unk_1000109E8, 32, 7);
      v26 = v60;
      *(_QWORD *)(v25 + 16) = v19;
      *(_QWORD *)(v25 + 24) = v26;
      aBlock[4] = (uint64_t)sub_10000D1B8;
      v66 = v25;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1000096A0;
      aBlock[3] = (uint64_t)&unk_100010A00;
      v27 = _Block_copy(aBlock);
      v28 = v66;
      v29 = v19;
      v30 = v26;
      v31 = swift_release(v28);
      static DispatchQoS.unspecified.getter(v31);
      aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
      v32 = sub_10000D14C(&qword_1000150B0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v33 = sub_10000CD04(&qword_1000150B8);
      v34 = sub_10000CE1C();
      dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v33, v34, v6, v32);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v8, v27);
      _Block_release(v27);

      (*(void (**)(char *, uint64_t))(v62 + 8))(v8, v6);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v61);
      return;
    }
    if (qword_100014E18 != -1)
      swift_once(&qword_100014E18, sub_100005B9C);
    v47 = type metadata accessor for Logger(0);
    sub_10000CEAC(v47, (uint64_t)qword_100014E20);
    v48 = v12;
    v49 = (*(uint64_t (**)(char *, id, uint64_t))(v13 + 16))(v16, v63, v12);
    v38 = Logger.logObject.getter(v49);
    v50 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc(12, -1);
      v52 = swift_slowAlloc(32, -1);
      aBlock[0] = v52;
      v63 = v19;
      *(_DWORD *)v51 = 136315138;
      v53 = sub_10000D14C(&qword_1000150F8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v54 = dispatch thunk of CustomStringConvertible.description.getter(v48, v53);
      v56 = v55;
      v64 = sub_10000BB08(v54, v55, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, aBlock, v51 + 4, v51 + 12);
      swift_bridgeObjectRelease(v56);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v48);
      _os_log_impl((void *)&_mh_execute_header, v38, v50, "Fetched user activity %s, but it was not linkable.", v51, 0xCu);
      swift_arrayDestroy(v52, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v52, -1, -1);
      swift_slowDealloc(v51, -1, -1);

    }
    else
    {

      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v48);
    }
  }
  else
  {
    v35 = a2;
    if (qword_100014E18 != -1)
      swift_once(&qword_100014E18, sub_100005B9C);
    v36 = type metadata accessor for Logger(0);
    sub_10000CEAC(v36, (uint64_t)qword_100014E20);
    (*(void (**)(char *, id, uint64_t))(v13 + 16))(v18, v63, v12);
    swift_errorRetain(a2);
    v37 = swift_errorRetain(a2);
    v38 = Logger.logObject.getter(v37);
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = v12;
      v41 = swift_slowAlloc(22, -1);
      v62 = swift_slowAlloc(8, -1);
      v63 = (id)swift_slowAlloc(32, -1);
      aBlock[0] = (uint64_t)v63;
      *(_DWORD *)v41 = 136315394;
      v42 = sub_10000D14C(&qword_1000150F8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v43 = dispatch thunk of CustomStringConvertible.description.getter(v12, v42);
      v45 = v44;
      v64 = sub_10000BB08(v43, v44, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, aBlock, v41 + 4, v41 + 12);
      swift_bridgeObjectRelease(v45);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v40);
      *(_WORD *)(v41 + 12) = 2112;
      if (v35)
      {
        swift_errorRetain(v35);
        v46 = _swift_stdlib_bridgeErrorToNSError(v35);
        v64 = v46;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, aBlock, v41 + 14, v41 + 22);
      }
      else
      {
        v64 = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, aBlock, v41 + 14, v41 + 22);
        v46 = 0;
      }
      v57 = v62;
      *(_QWORD *)v62 = v46;
      swift_errorRelease(v35);
      swift_errorRelease(v35);
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Failed to fetch user activity %s. Error: %@", (uint8_t *)v41, 0x16u);
      v58 = sub_10000CD04(&qword_1000150D0);
      swift_arrayDestroy(v57, 1, v58);
      swift_slowDealloc(v57, -1, -1);
      v59 = v63;
      swift_arrayDestroy(v63, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v59, -1, -1);
      swift_slowDealloc(v41, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
    }
  }

}

BOOL sub_100008F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  id v19;
  void *v20;
  _BOOL8 v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v52;

  v6 = type metadata accessor for URL(0, a2, a3, a4, a5);
  v7 = *(_QWORD *)(v6 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CD04(&qword_1000150E8);
  v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v52 - v13;
  v15 = objc_msgSend(v5, "webpageURL");
  if (v15)
  {
    v16 = v15;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v15);

    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v9, v6);
    v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v17(v14, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v14, 1, v6) != 1)
    {
      v18 = (uint64_t)v14;
LABEL_8:
      sub_10000D1C0(v18, &qword_1000150E8);
      v21 = 1;
      goto LABEL_19;
    }
  }
  else
  {
    v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v17(v14, 1, 1, v6);
  }
  sub_10000D1C0((uint64_t)v14, &qword_1000150E8);
  v19 = objc_msgSend(v5, "_canonicalURL");
  if (v19)
  {
    v20 = v19;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v19);

    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v9, v6);
    v17(v12, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1)
    {
      v18 = (uint64_t)v12;
      goto LABEL_8;
    }
  }
  else
  {
    v17(v12, 1, 1, v6);
  }
  sub_10000D1C0((uint64_t)v12, &qword_1000150E8);
  v22 = objc_msgSend(v5, "persistentIdentifier");
  if (!v22)
    goto LABEL_15;
  v24 = v22;
  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22, v23);
  v27 = v26;

  swift_bridgeObjectRelease(v27);
  v28 = HIBYTE(v27) & 0xF;
  if ((v27 & 0x2000000000000000) == 0)
    v28 = v25 & 0xFFFFFFFFFFFFLL;
  if (v28)
  {
    v21 = 1;
  }
  else
  {
LABEL_15:
    v29 = objc_msgSend(v5, "targetContentIdentifier");
    v21 = (_BOOL8)v29;
    if (v29)
    {
      v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29, v30);
      v33 = v32;

      swift_bridgeObjectRelease(v33);
      v34 = HIBYTE(v33) & 0xF;
      if ((v33 & 0x2000000000000000) == 0)
        v34 = v31 & 0xFFFFFFFFFFFFLL;
      v21 = v34 != 0;
    }
  }
LABEL_19:
  v35 = objc_msgSend(v5, "activityType");
  v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35, v36);
  v39 = v38;

  swift_bridgeObjectRelease(v39);
  v40 = HIBYTE(v39) & 0xF;
  if ((v39 & 0x2000000000000000) == 0)
    v40 = v37 & 0xFFFFFFFFFFFFLL;
  if (!v40)
    return 0;
  v41 = objc_msgSend(v5, "activityType");
  v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41, v42);
  v45 = v44;

  v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(SYNotesUserActivityTypeEditNote, v46);
  v49 = v47;
  if (v43 == v48 && v45 == v47)
  {
    swift_bridgeObjectRelease_n(v45, 2, v48);
    return 0;
  }
  v50 = _stringCompareWithSmolCheck(_:_:expecting:)(v43, v45, v48, v47, 0);
  swift_bridgeObjectRelease(v45);
  swift_bridgeObjectRelease(v49);
  if ((v50 & 1) != 0)
    return 0;
  return v21;
}

void sub_100009324(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSString v14;
  Class isa;
  id v16;
  uint64_t v17;

  v4 = sub_10000CD04(&qword_1000150F0);
  __chkstk_darwin(v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)(a2 + OBJC_IVAR___ICEditorExtensionViewController_hostConnection);
  if (!v7 || (v8 = v7, sub_1000094A4(), v10 = v9, v8, !v10))
  {
    swift_bridgeObjectRelease(0);
    v10 = 0xE000000000000000;
  }
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v6, 1, 1, v11);
  v13 = a1;
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }
  v16 = objc_msgSend(objc_allocWithZone((Class)SYContentItem), "initWithUserActivity:sourceAppID:sourceAppName:identifier:", v13, v14, 0, isa);

  sub_10000987C(v16);
}

uint64_t sub_1000094A4()
{
  void *v0;
  __SecTask *v1;
  __SecTask *v2;
  CFStringRef v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  audit_token_t v16;

  objc_msgSend(v0, "auditToken");
  v1 = SecTaskCreateWithAuditToken(0, &v16);
  if (v1)
  {
    v2 = v1;
    v3 = SecTaskCopySigningIdentifier(v1, 0);
    if (v3)
    {
      v5 = (__CFString *)v3;
      v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

      return v6;
    }

  }
  if (qword_100014E18 != -1)
    swift_once(&qword_100014E18, sub_100005B9C);
  v7 = type metadata accessor for Logger(0);
  sub_10000CEAC(v7, (uint64_t)qword_100014E20);
  v8 = v0;
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v11 = 138412290;
    *(_QWORD *)v16.val = v8;
    v13 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v16.val[2], v11 + 4, v11 + 12);
    *v12 = v8;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Failed to get signing info for connection %@", v11, 0xCu);
    v14 = sub_10000CD04(&qword_1000150D0);
    swift_arrayDestroy(v12, 1, v14);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_1000096A0(uint64_t a1)
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

void sub_1000096CC(uint64_t a1, void *a2, void *a3)
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

uint64_t sub_100009740(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t, void *);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v19;

  sub_10000CD04(&qword_1000150F0);
  __chkstk_darwin();
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void (**)(char *, uint64_t, uint64_t, void *))(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a2);
    v12 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 0, 1, v12);
  }
  else
  {
    v14 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  if (a3)
  {
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v13);
    a3 = v16;
  }
  else
  {
    v15 = 0;
  }
  swift_retain(v10);
  v17 = a4;
  v11(v9, v15, a3, a4);
  swift_release(v10);

  swift_bridgeObjectRelease(a3);
  return sub_10000D1C0((uint64_t)v9, &qword_1000150F0);
}

void sub_10000987C(void *a1)
{
  _BYTE *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar;
  v1[OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar] = 1;
  if (objc_msgSend(v1, "isViewLoaded"))
  {
    v4 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
    if (!v4)
    {
      __break(1u);
      goto LABEL_11;
    }
    objc_msgSend(v4, "setCanShowLinkBar:", (v1[v3] & 1) == 0);
  }
  if (!objc_msgSend(v1, "isViewLoaded"))
    goto LABEL_9;
  v5 = OBJC_IVAR___ICEditorExtensionViewController_noteEditor;
  v6 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
  if (v6)
  {
    if (objc_msgSend(v6, "isViewLoaded"))
    {
      v7 = *(void **)&v1[v5];
      if (v7)
      {
        objc_msgSend(v7, "addSystemPaperLink:updateFirstResponder:", a1, 1);
        return;
      }
      goto LABEL_12;
    }
LABEL_9:
    v9 = *(id *)&v1[OBJC_IVAR___ICEditorExtensionViewController_linkContentItem];
    *(_QWORD *)&v1[OBJC_IVAR___ICEditorExtensionViewController_linkContentItem] = a1;
    v8 = a1;

    return;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void sub_100009978(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  Class isa;

  if (!objc_msgSend(v1, "isViewLoaded"))
    goto LABEL_6;
  v3 = OBJC_IVAR___ICEditorExtensionViewController_noteEditor;
  v4 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
  if (v4)
  {
    if (objc_msgSend(v4, "isViewLoaded"))
    {
      v5 = *(void **)&v1[v3];
      if (v5)
      {
        v6 = v5;
        isa = Array._bridgeToObjectiveC()().super.isa;
        objc_msgSend(v6, "addSystemPaperImageData:updateFirstResponder:", isa, 1);

        return;
      }
      goto LABEL_8;
    }
LABEL_6:
    v7 = *(_QWORD *)&v1[OBJC_IVAR___ICEditorExtensionViewController_imageData];
    *(_QWORD *)&v1[OBJC_IVAR___ICEditorExtensionViewController_imageData] = a1;
    swift_bridgeObjectRetain(a1);
    swift_bridgeObjectRelease(v7);
    return;
  }
  __break(1u);
LABEL_8:
  __break(1u);
}

void *sub_100009A50(uint64_t a1)
{
  char *v1;
  char *v2;
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
  char *v15;
  void *result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  NSString v27;
  NSURL *v28;
  void *v29;
  void *v30;
  Class isa;
  char *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  void (*v42)(char *, uint64_t, uint64_t);
  uint64_t v43;
  char *v44;
  char *v45;

  v2 = v1;
  v4 = sub_10000CD04(&qword_1000150F0);
  __chkstk_darwin(v4);
  v44 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for URL(0, v6, v7, v8, v9);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v45 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_10000CD04(&qword_1000150E8);
  __chkstk_darwin(v13);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!objc_msgSend(v2, "isViewLoaded"))
    goto LABEL_12;
  v43 = OBJC_IVAR___ICEditorExtensionViewController_noteEditor;
  result = *(void **)&v2[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
  if (!result)
  {
LABEL_18:
    __break(1u);
    return result;
  }
  if (!objc_msgSend(result, "isViewLoaded"))
  {
LABEL_12:
    v34 = *(_QWORD *)&v2[OBJC_IVAR___ICEditorExtensionViewController_webURLs];
    *(_QWORD *)&v2[OBJC_IVAR___ICEditorExtensionViewController_webURLs] = a1;
    swift_bridgeObjectRetain(a1);
    return (void *)swift_bridgeObjectRelease(v34);
  }
  v17 = *(_QWORD *)&v2[OBJC_IVAR___ICEditorExtensionViewController_webURLs];
  v18 = *(_QWORD *)(v17 + 16);
  if (v18)
  {
    v19 = v17 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v37 = *(_QWORD *)(v11 + 72);
    v42 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v39 = SYContentItemSourceIdentifierWeb;
    v36 = v17;
    swift_bridgeObjectRetain(v17);
    v40 = v11;
    v41 = v2;
    v38 = v15;
    while (1)
    {
      v42(v15, v19, v10);
      v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
      v20(v15, 0, 1, v10);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v15, 1, v10) == 1)
      {
        v35 = v36;
        return (void *)swift_bridgeObjectRelease(v35);
      }
      static String._unconditionallyBridgeFromObjectiveC(_:)(v39, v21);
      v23 = v22;
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v45, v15, v10);
      v24 = type metadata accessor for UUID(0);
      v25 = *(_QWORD *)(v24 - 8);
      v26 = v44;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v44, 1, 1, v24);
      v27 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v23);
      URL._bridgeToObjectiveC()(v28);
      v30 = v29;
      isa = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v26, 1, v24) != 1)
      {
        v32 = v44;
        isa = UUID._bridgeToObjectiveC()().super.isa;
        (*(void (**)(char *, uint64_t))(v25 + 8))(v32, v24);
      }
      v33 = objc_msgSend(objc_allocWithZone((Class)SYContentItem), "initWithDisplayTitle:sourceIdentifier:sourceName:itemURL:identifier:", 0, v27, 0, v30, isa);

      v11 = v40;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v45, v10);
      result = *(void **)&v41[v43];
      if (!result)
        break;
      objc_msgSend(result, "addSystemPaperLink:updateFirstResponder:", v33, 1);

      v15 = v38;
      v19 += v37;
      if (!--v18)
      {
        v17 = v36;
        goto LABEL_14;
      }
    }
    __break(1u);
    goto LABEL_18;
  }
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  swift_bridgeObjectRetain(*(_QWORD *)&v2[OBJC_IVAR___ICEditorExtensionViewController_webURLs]);
LABEL_14:
  v20(v15, 1, 1, v10);
  v35 = v17;
  return (void *)swift_bridgeObjectRelease(v35);
}

void sub_100009DD4()
{
  void *v0;
  int IsAppleAccountBrandingEnabled;
  id v2;
  unint64_t v3;
  unint64_t v4;
  Swift::String v5;
  unint64_t v6;
  void *object;
  void *v8;
  id v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  NSString v13;
  NSString v14;
  id v15;
  id v16;
  Swift::String v17;
  Swift::String v18;
  void *v19;
  uint64_t v20;
  NSString v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  Swift::String v26;
  Swift::String v27;
  void *v28;
  uint64_t v29;
  NSString v30;
  void *v31;
  id v32;
  unint64_t v33;
  void **aBlock;
  uint64_t v35;
  void (*v36)(uint64_t, void *);
  void *v37;
  void *v38;
  uint64_t v39;
  Swift::String v40;
  Swift::String v41;
  Swift::String v42;

  IsAppleAccountBrandingEnabled = ICInternalSettingsIsAppleAccountBrandingEnabled();
  v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  if (IsAppleAccountBrandingEnabled)
  {
    v33 = 0x800000010000EE60;
    v3 = 0x800000010000EF40;
    v4 = 0x1000000000000053;
  }
  else
  {
    v4 = 0xD000000000000053;
    v33 = 0x800000010000EE60;
    v3 = 0x800000010000EE00;
  }
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  v6 = 0xD000000000000033;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v4, (Swift::String_optional)0, (NSBundle)v2, v5, *(Swift::String *)(&v33 + -8))._object;

  v8 = (void *)objc_opt_self(NSBundle);
  v9 = objc_msgSend(v8, "mainBundle");
  v40._countAndFlagsBits = 0xD00000000000002DLL;
  v40._object = (void *)0x800000010000EEA0;
  v10._countAndFlagsBits = 0x6F4E206B63697551;
  v10._object = (void *)0xEB00000000736574;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, (Swift::String_optional)0, (NSBundle)v9, v11, v40)._object;

  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  v15 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1);

  v16 = objc_msgSend(v8, "mainBundle");
  v41._countAndFlagsBits = 0xD000000000000027;
  v41._object = (void *)0x800000010000EED0;
  v17._countAndFlagsBits = 0x746F4E206E65704FLL;
  v17._object = (void *)0xEA00000000007365;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v17, (Swift::String_optional)0, (NSBundle)v16, v18, v41)._object;

  v20 = swift_allocObject(&unk_1000108A8, 24, 7);
  swift_unknownObjectUnownedInit(v20 + 16, v0);
  swift_retain(v20);
  v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  v38 = sub_10000D03C;
  v39 = v20;
  aBlock = _NSConcreteStackBlock;
  v35 = 1107296256;
  v36 = sub_10000A5E0;
  v37 = &unk_1000108C0;
  v22 = _Block_copy(&aBlock);
  swift_release(v39);
  v23 = (void *)objc_opt_self(UIAlertAction);
  v24 = objc_msgSend(v23, "actionWithTitle:style:handler:", v21, 0, v22);
  _Block_release(v22);
  swift_release(v20);

  objc_msgSend(v15, "addAction:", v24);
  v25 = objc_msgSend(v8, "mainBundle");
  v42._countAndFlagsBits = 0xD000000000000012;
  v42._object = (void *)0x800000010000EF20;
  v26._countAndFlagsBits = 0x6C65636E6143;
  v26._object = (void *)0xE600000000000000;
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  v28 = NSLocalizedString(_:tableName:bundle:value:comment:)(v26, (Swift::String_optional)0, (NSBundle)v25, v27, v42)._object;

  v29 = swift_allocObject(&unk_1000108A8, 24, 7);
  swift_unknownObjectUnownedInit(v29 + 16, v0);
  swift_retain(v29);
  v30 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v28);
  v38 = sub_10000D044;
  v39 = v29;
  aBlock = _NSConcreteStackBlock;
  v35 = 1107296256;
  v36 = sub_10000A5E0;
  v37 = &unk_1000108E8;
  v31 = _Block_copy(&aBlock);
  swift_release(v39);
  v32 = objc_msgSend(v23, "actionWithTitle:style:handler:", v30, 1, v31);
  _Block_release(v31);
  swift_release(v29);

  objc_msgSend(v15, "addAction:", v32);
  objc_msgSend(v0, "presentViewController:animated:completion:", v15, 1, 0);

}

uint64_t sub_10000A28C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  char *Strong;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  NSURL *v31;
  char *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[5];
  uint64_t v37;
  void *v38;

  v35 = a2;
  sub_10000CD04(&qword_1000150E8);
  __chkstk_darwin();
  v3 = (char *)&aBlock[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URLComponents(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for URL(0, v8, v9, v10, v11);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin();
  v16 = (char *)&aBlock[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = URLComponents.init()(v14);
  v18 = (id)ICNotesAppURLScheme(v17);
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18, v19);
  v22 = v21;

  v23 = URLComponents.scheme.setter(v20, v22);
  URLComponents.url.getter(v23);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v3, 1, v12);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v25 = v35;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v3, v12);
    Strong = (char *)swift_unknownObjectUnownedLoadStrong(v25 + 16);
    v27 = *(void **)&Strong[OBJC_IVAR___ICEditorExtensionViewController_hostConnection];
    if (v27)
    {
      v28 = objc_msgSend(v27, "remoteObjectProxy");
      _bridgeAnyObjectToAny(_:)(aBlock);
      swift_unknownObjectRelease(v28);
      v29 = sub_10000CD04(&qword_1000150A0);
      if ((swift_dynamicCast(&v38, aBlock, (char *)&type metadata for Any + 8, v29, 6) & 1) != 0)
      {
        v30 = v38;

        URL._bridgeToObjectiveC()(v31);
        Strong = v32;
        aBlock[4] = sub_10000D044;
        v37 = v25;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100005D68;
        aBlock[3] = &unk_100010910;
        v33 = _Block_copy(aBlock);
        v34 = v37;
        swift_retain(v25);
        swift_release(v34);
        objc_msgSend(v30, "openURL:completion:", Strong, v33);
        _Block_release(v33);
        swift_unknownObjectRelease(v30);
      }
    }

    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  }
  return result;
}

void sub_10000A520(uint64_t a1, uint64_t a2)
{
  char *Strong;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  Strong = (char *)swift_unknownObjectUnownedLoadStrong(a2 + 16);
  v3 = *(void **)&Strong[OBJC_IVAR___ICEditorExtensionViewController_hostConnection];
  if (v3
    && (v4 = objc_msgSend(v3, "remoteObjectProxy"),
        _bridgeAnyObjectToAny(_:)(v8),
        swift_unknownObjectRelease(v4),
        v5 = sub_10000CD04(&qword_1000150A0),
        (swift_dynamicCast(&v7, v8, (char *)&type metadata for Any + 8, v5, 6) & 1) != 0))
  {
    v6 = v7;

    objc_msgSend(v6, "dismissViewControllerCancelled:", 1);
    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

void sub_10000A5E0(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

id sub_10000A630()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id result;

  v1 = *(void **)(v0 + OBJC_IVAR___ICEditorExtensionViewController_noteEditor);
  if (v1)
  {
    v2 = objc_msgSend(v1, "note");
    if (v2)
    {
      v3 = v2;
      if (objc_msgSend(v2, "isEmpty") && (objc_msgSend(v3, "isDeletedOrInTrash") & 1) == 0)
      {
        objc_msgSend((id)objc_opt_self(ICNote), "deleteEmptyNote:", v3);
        v4 = objc_msgSend(v3, "managedObjectContext");
        objc_msgSend(v4, "ic_save");

      }
    }
  }
  v5 = objc_msgSend((id)objc_opt_self(ICNoteContext), "sharedContext");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "crossProcessChangeCoordinator");

    objc_msgSend(v7, "postEditorExtensionDidSaveNotification");
  }
  v8 = OBJC_IVAR___ICEditorExtensionViewController_hostConnection;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR___ICEditorExtensionViewController_hostConnection), "invalidate");
  v9 = *(void **)(v0 + v8);
  *(_QWORD *)(v0 + v8) = 0;

  result = *(id *)(v0 + OBJC_IVAR___ICEditorExtensionViewController_analyticsController);
  if (result)
    return objc_msgSend(result, "endSessionSynchronously:forSessionType:endReason:", 0, ICNASessionTypePaper, 1);
  return result;
}

id sub_10000A7A4()
{
  void *v0;
  id result;
  void *v2;
  id v3;
  NSString v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  result = objc_msgSend(v0, "view");
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, "window");

    if (v3)
    {
      v4 = String._bridgeToObjectiveC()();
      v5 = objc_msgSend(v3, "valueForKey:", v4);

      if (v5)
      {
        _bridgeAnyObjectToAny(_:)(v9);
        swift_unknownObjectRelease(v5);
      }
      else
      {
        *(_OWORD *)v9 = 0u;
        v10 = 0u;
      }
      sub_10000CFD0((uint64_t)v9, (uint64_t)&v11);
      if (*((_QWORD *)&v12 + 1))
      {
        v6 = sub_10000D3A4(0, &qword_1000150E0, UIView_ptr);
        if ((swift_dynamicCast(v9, &v11, (char *)&type metadata for Any + 8, v6, 6) & 1) != 0)
        {
          v7 = v9[0];
          v8 = objc_msgSend(v9[0], "undoManager");

          return v8;
        }
        return 0;
      }
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }
    sub_10000D1C0((uint64_t)&v11, &qword_1000150D8);
    return 0;
  }
  __break(1u);
  return result;
}

void sub_10000A96C(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v4;
  void *Strong;
  void *v6;
  _BYTE v7[24];

  v4 = a2 + 16;
  swift_beginAccess(a2 + 16, v7, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v6 = Strong;
    objc_msgSend(Strong, *a3);

  }
}

uint64_t type metadata accessor for EditorExtensionViewController()
{
  return objc_opt_self(ICEditorExtensionViewController);
}

uint64_t sub_10000AB00(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void **aBlock;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  void *v44;
  _QWORD *v45;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v39 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v37 = *(_QWORD *)(v7 - 8);
  v38 = v7;
  __chkstk_darwin();
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void *)objc_opt_self(NSXPCInterface);
  v11 = objc_msgSend(v10, "ic_extensionInterface");
  objc_msgSend(a1, "setExportedInterface:", v11);

  objc_msgSend(a1, "setExportedObject:", v2);
  v12 = objc_msgSend(v10, "ic_hostInterface");
  objc_msgSend(a1, "setRemoteObjectInterface:", v12);

  v13 = swift_allocObject(&unk_1000107E0, 24, 7);
  swift_unknownObjectWeakInit(v13 + 16, v2);
  v44 = sub_10000CF88;
  v45 = (_QWORD *)v13;
  aBlock = _NSConcreteStackBlock;
  v41 = 1107296256;
  v42 = sub_1000096A0;
  v43 = &unk_1000107F8;
  v14 = _Block_copy(&aBlock);
  swift_release(v45);
  objc_msgSend(a1, "setInvalidationHandler:", v14);
  _Block_release(v14);
  objc_msgSend(a1, "resume");
  v15 = *(void **)&v2[OBJC_IVAR___ICEditorExtensionViewController_hostConnection];
  *(_QWORD *)&v2[OBJC_IVAR___ICEditorExtensionViewController_hostConnection] = a1;
  v16 = a1;

  v17 = sub_1000094A4();
  v19 = v18;
  v20 = (id)ICSystemPaperViewServiceBundleIdentifier();
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20, v21);
  v24 = v23;

  if (!v19)
  {
    swift_bridgeObjectRelease(v24);
    goto LABEL_8;
  }
  if (v17 != v22 || v19 != v24)
  {
    v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v19, v22, v24, 0);
    swift_bridgeObjectRelease(v24);
    if ((v25 & 1) != 0)
    {
      swift_bridgeObjectRelease(v19);
      return 1;
    }
LABEL_8:
    sub_10000D3A4(0, &qword_1000150A8, OS_dispatch_queue_ptr);
    v26 = (void *)static OS_dispatch_queue.main.getter();
    v27 = (_QWORD *)swift_allocObject(&unk_100010830, 40, 7);
    v27[2] = v2;
    v27[3] = v17;
    v27[4] = v19;
    v44 = sub_10000CFBC;
    v45 = v27;
    aBlock = _NSConcreteStackBlock;
    v41 = 1107296256;
    v42 = sub_1000096A0;
    v43 = &unk_100010848;
    v28 = _Block_copy(&aBlock);
    v29 = v45;
    v30 = v2;
    v31 = swift_release(v29);
    static DispatchQoS.unspecified.getter(v31);
    aBlock = (void **)&_swiftEmptyArrayStorage;
    v32 = sub_10000D14C(&qword_1000150B0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v33 = sub_10000CD04(&qword_1000150B8);
    v34 = sub_10000CE1C();
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v33, v34, v4, v32);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v6, v28);
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v38);
    return 1;
  }
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v24);
  return 1;
}

uint64_t sub_10000AED0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD aBlock[5];
  uint64_t v23;

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100014E18 != -1)
    swift_once(&qword_100014E18, sub_100005B9C);
  v10 = type metadata accessor for Logger(0);
  sub_10000CEAC(v10, (uint64_t)qword_100014E20);
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Host connection invalidated", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  sub_10000D3A4(0, &qword_1000150A8, OS_dispatch_queue_ptr);
  v14 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_10000CFC8;
  v23 = a1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000096A0;
  aBlock[3] = &unk_100010870;
  v15 = _Block_copy(aBlock);
  v16 = v23;
  swift_retain(a1);
  v17 = swift_release(v16);
  static DispatchQoS.unspecified.getter(v17);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v18 = sub_10000D14C(&qword_1000150B0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v19 = sub_10000CD04(&qword_1000150B8);
  v20 = sub_10000CE1C();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v19, v20, v2, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v5, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_10000B158(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  _BYTE v4[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v4, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    sub_10000A630();

  }
}

void sub_10000B1A8(char *a1, uint64_t a2, uint64_t a3)
{
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSString v9;

  v4 = &a1[OBJC_IVAR___ICEditorExtensionViewController_hostBundleIdentifier];
  v5 = *(_QWORD *)&a1[OBJC_IVAR___ICEditorExtensionViewController_hostBundleIdentifier + 8];
  *(_QWORD *)v4 = a2;
  *((_QWORD *)v4 + 1) = a3;
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRelease(v5);
  if (objc_msgSend(a1, "isViewLoaded"))
  {
    v6 = *(void **)&a1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
    if (v6)
    {
      v7 = *((_QWORD *)v4 + 1);
      v8 = v6;
      if (v7)
      {
        swift_bridgeObjectRetain(v7);
        v9 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v7);
      }
      else
      {
        v9 = 0;
      }
      objc_msgSend(v6, "setHostBundleIdentifier:", v9);

    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_10000B32C(uint64_t a1, unint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[5];
  _QWORD *v25;

  v3 = v2;
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v23 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D3A4(0, &qword_1000150A8, OS_dispatch_queue_ptr);
  v12 = (void *)static OS_dispatch_queue.main.getter();
  v13 = (_QWORD *)swift_allocObject(&unk_100010790, 40, 7);
  v13[2] = a1;
  v13[3] = a2;
  v13[4] = v2;
  aBlock[4] = sub_10000CDB4;
  v25 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000096A0;
  aBlock[3] = &unk_1000107A8;
  v14 = _Block_copy(aBlock);
  v15 = v25;
  sub_10000CDD8(a1, a2);
  v16 = v3;
  v17 = swift_release(v15);
  static DispatchQoS.unspecified.getter(v17);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v18 = sub_10000D14C(&qword_1000150B0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v19 = sub_10000CD04(&qword_1000150B8);
  v20 = sub_10000CE1C();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v19, v20, v6, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v22);
}

void sub_10000B53C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  Class isa;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;

  if (qword_100014E18 != -1)
    swift_once(&qword_100014E18, sub_100005B9C);
  v4 = type metadata accessor for Logger(0);
  sub_10000CEAC(v4, (uint64_t)qword_100014E20);
  sub_10000CDD8(a1, a2);
  v5 = sub_10000CDD8(a1, a2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v48 = v9;
    *(_DWORD *)v8 = 136315138;
    sub_10000CDD8(a1, a2);
    v10 = Data.description.getter(a1, a2);
    v12 = v11;
    sub_10000CD44(a1, a2);
    v47 = sub_10000BB08(v10, v12, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v12);
    sub_10000CD44(a1, a2);
    sub_10000CD44(a1, a2);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "got data: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {
    sub_10000CD44(a1, a2);
    sub_10000CD44(a1, a2);
  }

  v13 = (void *)objc_opt_self(NSUserActivity);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v15 = objc_msgSend(v13, "ic_userActivityWithData:", isa);

  if (v15)
  {
    v16 = objc_msgSend(v15, "activityType");
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);
    v20 = v19;

    v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(SYNotesUserActivityTypeCreateLink, v21);
    v24 = v23;
    if (v22 == v18 && v23 == v20)
    {
      swift_bridgeObjectRelease(v20);
LABEL_11:
      swift_bridgeObjectRelease(v20);
      sub_100007620(v15);
LABEL_12:

      return;
    }
    v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v23, v18, v20, 0);
    swift_bridgeObjectRelease(v24);
    if ((v25 & 1) != 0)
      goto LABEL_11;
    v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(SYNotesUserActivityTypeInsertImage, v26);
    v29 = v28;
    if (v27 == v18 && v28 == v20)
    {
      swift_bridgeObjectRelease(v20);
LABEL_18:
      swift_bridgeObjectRelease(v20);
      sub_100007934(v15);
      goto LABEL_12;
    }
    v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v27, v28, v18, v20, 0);
    swift_bridgeObjectRelease(v29);
    if ((v30 & 1) != 0)
      goto LABEL_18;
    v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(SYNotesUserActivityTypeInsertData, v31);
    v35 = v33;
    if (v32 == v18 && v33 == v20)
    {
      swift_bridgeObjectRelease_n(v20, 2, v34);
LABEL_23:
      sub_100007B2C(v15);
      goto LABEL_12;
    }
    v36 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v33, v18, v20, 0);
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v35);
    if ((v36 & 1) != 0)
      goto LABEL_23;
    v37 = v15;
    v38 = Logger.logObject.getter(v37);
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc(12, -1);
      v41 = swift_slowAlloc(32, -1);
      v48 = v41;
      *(_DWORD *)v40 = 136315138;
      v42 = objc_msgSend(v37, "activityType");
      v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42, v43);
      v46 = v45;

      v47 = sub_10000BB08(v44, v46, &v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v40 + 4, v40 + 12);

      swift_bridgeObjectRelease(v46);
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Ignoring unexpected user activity type %s", v40, 0xCu);
      swift_arrayDestroy(v41, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v41, -1, -1);
      swift_slowDealloc(v40, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_10000BB08(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000BBD8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000CEE4((uint64_t)v12, *a3);
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
      sub_10000CEE4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000CEC4(v12);
  return v7;
}

uint64_t sub_10000BBD8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000BD90(a5, a6);
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

uint64_t sub_10000BD90(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000BE24(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000BFFC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000BFFC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000BE24(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000BF98(v4, 0);
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

_QWORD *sub_10000BF98(uint64_t a1, uint64_t a2)
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
  v4 = sub_10000CD04(&qword_1000150C8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000BFFC(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000CD04(&qword_1000150C8);
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

unint64_t sub_10000C148(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10000C178(a1, v4);
}

unint64_t sub_10000C178(uint64_t a1, uint64_t a2)
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
      sub_10000D250(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000D28C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10000C23C(char a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t result;

  result = sub_10000C258(a1, a2, a3, (_QWORD *)*v5, a5);
  *v5 = result;
  return result;
}

uint64_t sub_10000C258(char a1, int64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  unint64_t v7;
  int64_t v8;
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
  _QWORD *v20;
  size_t v21;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v7 = a4[3];
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = a4[2];
  if (v8 <= v9)
    v10 = a4[2];
  else
    v10 = v8;
  if (!v10)
  {
    v20 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v11 = sub_10000CD04(&qword_100015120);
  v16 = *(_QWORD *)(type metadata accessor for URL(0, v12, v13, v14, v15) - 8);
  v17 = *(_QWORD *)(v16 + 72);
  v18 = *(unsigned __int8 *)(v16 + 80);
  v19 = (v18 + 32) & ~v18;
  v20 = (_QWORD *)swift_allocObject(v11, v19 + v17 * v10, v18 | 7);
  v21 = j__malloc_size(v20);
  if (!v17)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v21 - v19 == 0x8000000000000000 && v17 == -1)
    goto LABEL_34;
  v20[2] = v9;
  v20[3] = 2 * ((uint64_t)(v21 - v19) / v17);
LABEL_19:
  v23 = type metadata accessor for URL(0, a2, a3, a4, a5);
  v24 = *(_QWORD *)(v23 - 8);
  v25 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  v26 = (char *)v20 + v25;
  v27 = (char *)a4 + v25;
  if ((a1 & 1) != 0)
  {
    if (v20 < a4 || v26 >= &v27[*(_QWORD *)(v24 + 72) * v9])
    {
      swift_arrayInitWithTakeFrontToBack(v26, v27, v9, v23);
    }
    else if (v20 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v28 = *(_QWORD *)(v24 + 72) * v9;
  v29 = &v26[v28];
  v30 = (unint64_t)&v27[v28];
  if (v27 >= v29 || (unint64_t)v26 >= v30)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release(a4);
    return (uint64_t)v20;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void sub_10000C438(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, NSURL *a4@<X8>)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  uint64_t v12;

  URL._bridgeToObjectiveC()(a4);
  v8 = v7;
  if (a2)
  {
    v11[4] = a2;
    v12 = a3;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_100005D68;
    v11[3] = &unk_100010B68;
    v9 = _Block_copy(v11);
    v10 = v12;
    swift_retain(a3);
    swift_release(v10);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend((id)objc_opt_self(ICExtensionSafeAPIShims), "openURL:originatingView:completionHandler:", v8, a1, v9);
  _Block_release(v9);

}

id sub_10000C50C()
{
  void *v0;
  Class isa;
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;

  isa = Data._bridgeToObjectiveC()().super.isa;
  v7 = 0;
  v2 = objc_msgSend(v0, "initWithData:error:", isa, &v7);

  v3 = v7;
  if (v2)
  {
    v4 = v7;
  }
  else
  {
    v5 = v7;
    _convertNSErrorToError(_:)(v3);

    swift_willThrow();
  }
  return v2;
}

void sub_10000C5C8()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  if (UIAccessibilityIsShakeToUndoEnabled())
  {
    v1 = sub_10000A7A4();
    if (v1)
    {
      v7 = v1;
      if ((objc_msgSend(v1, "canUndo") & 1) != 0 || objc_msgSend(v7, "canRedo"))
      {
        v2 = objc_msgSend(objc_allocWithZone((Class)UINotificationFeedbackGenerator), "init");
        v3 = OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator;
        v4 = *(void **)(v0 + OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator);
        *(_QWORD *)(v0 + OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator) = v2;

        v5 = *(void **)(v0 + v3);
        if (v5)
        {
          v6 = v5;
          objc_msgSend(v6, "prepare");

        }
      }

    }
  }
}

void sub_10000C680()
{
  char *v0;
  id v1;
  void *v2;
  unsigned int v3;
  char **v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  Swift::String v10;
  Swift::String v11;
  void *object;
  id v13;
  uint64_t v14;
  void *v15;
  Swift::String v16;
  Swift::String v17;
  NSString v18;
  NSString v19;
  id v20;
  uint64_t v21;
  NSString v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSString v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  Swift::String v31;
  Swift::String v32;
  void *v33;
  NSString v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  void **aBlock;
  uint64_t v42;
  void (*v43)(uint64_t, void *);
  void *v44;
  void (*v45)(uint64_t);
  uint64_t v46;
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;

  if (UIAccessibilityIsShakeToUndoEnabled())
  {
    v1 = sub_10000A7A4();
    if (v1)
    {
      v40 = v1;
      if ((objc_msgSend(v1, "canUndo") & 1) != 0 || objc_msgSend(v40, "canRedo"))
      {
        v39 = OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator;
        v2 = *(void **)&v0[OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator];
        if (v2)
          objc_msgSend(v2, "notificationOccurred:", 0);
        v3 = objc_msgSend(v40, "canUndo");
        v4 = &selRef_undoMenuItemTitle;
        if (!v3)
          v4 = &selRef_redoMenuItemTitle;
        v5 = objc_msgSend(v40, *v4);
        static String._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);
        v8 = v7;

        if (objc_msgSend(v40, "canUndo"))
        {
          v9 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
          v10._countAndFlagsBits = 1868852821;
          v47._object = (void *)0x800000010000EF20;
          v10._object = (void *)0xE400000000000000;
          v11._countAndFlagsBits = 0;
          v11._object = (void *)0xE000000000000000;
          v47._countAndFlagsBits = 0xD000000000000012;
          object = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, (Swift::String_optional)0, (NSBundle)v9, v11, v47)._object;

        }
        else
        {
          object = (void *)0xE000000000000000;
        }
        if (objc_msgSend(v40, "canUndo"))
        {
          v13 = objc_msgSend(v40, "redoMenuItemTitle");
          static String._unconditionallyBridgeFromObjectiveC(_:)(v13, v14);
        }
        else
        {
          v13 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
          v48._object = (void *)0x800000010000EF20;
          v16._countAndFlagsBits = 1868850514;
          v16._object = (void *)0xE400000000000000;
          v17._countAndFlagsBits = 0;
          v17._object = (void *)0xE000000000000000;
          v48._countAndFlagsBits = 0xD000000000000012;
          v15 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v13, v17, v48)._object;
        }
        v37 = v15;

        v18 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v8);
        v19 = String._bridgeToObjectiveC()();
        v20 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v18, v19, 1);

        v38 = v20;
        if (objc_msgSend(v40, "canUndo"))
        {
          v21 = swift_allocObject(&unk_100010A38, 24, 7);
          swift_unknownObjectWeakInit(v21 + 16, v40);
          swift_retain(v21);
          v22 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(object);
          v45 = sub_10000D2E0;
          v46 = v21;
          aBlock = _NSConcreteStackBlock;
          v42 = 1107296256;
          v43 = sub_10000A5E0;
          v44 = &unk_100010A78;
          v23 = _Block_copy(&aBlock);
          swift_release(v46);
          v24 = objc_msgSend((id)objc_opt_self(UIAlertAction), "actionWithTitle:style:handler:", v22, 0, v23);
          _Block_release(v23);
          swift_release(v21);

          objc_msgSend(v20, "addAction:", v24);
        }
        else
        {
          swift_bridgeObjectRelease(object);
        }
        if (objc_msgSend(v40, "canRedo"))
        {
          v25 = swift_allocObject(&unk_100010A38, 24, 7);
          swift_unknownObjectWeakInit(v25 + 16, v40);
          swift_retain(v25);
          v26 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v37);
          v45 = sub_10000D2C0;
          v46 = v25;
          aBlock = _NSConcreteStackBlock;
          v42 = 1107296256;
          v43 = sub_10000A5E0;
          v44 = &unk_100010A50;
          v27 = _Block_copy(&aBlock);
          swift_release(v46);
          v28 = objc_msgSend((id)objc_opt_self(UIAlertAction), "actionWithTitle:style:handler:", v26, 0, v27);
          _Block_release(v27);
          swift_release(v25);

          v29 = v38;
          objc_msgSend(v38, "addAction:", v28);

        }
        else
        {
          swift_bridgeObjectRelease(v37);
          v29 = v20;
        }
        v30 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v49._object = (void *)0x800000010000EF20;
        v31._countAndFlagsBits = 0x6C65636E6143;
        v31._object = (void *)0xE600000000000000;
        v32._countAndFlagsBits = 0;
        v32._object = (void *)0xE000000000000000;
        v49._countAndFlagsBits = 0xD000000000000012;
        v33 = NSLocalizedString(_:tableName:bundle:value:comment:)(v31, (Swift::String_optional)0, (NSBundle)v30, v32, v49)._object;

        v34 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v33);
        v35 = objc_msgSend((id)objc_opt_self(UIAlertAction), "actionWithTitle:style:handler:", v34, 1, 0);

        objc_msgSend(v29, "addAction:", v35);
        objc_msgSend(v0, "presentViewController:animated:completion:", v29, 1, 0);
        v36 = *(void **)&v0[v39];
        *(_QWORD *)&v0[v39] = 0;

      }
      else
      {

      }
    }
  }
}

uint64_t sub_10000CC58(char a1)
{
  uint64_t v1;
  uint64_t result;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];

  result = *(_QWORD *)(v1 + OBJC_IVAR___ICEditorExtensionViewController_hostConnection);
  if (result)
  {
    v4 = objc_msgSend((id)result, "remoteObjectProxy");
    _bridgeAnyObjectToAny(_:)(v8);
    swift_unknownObjectRelease(v4);
    v5 = sub_10000CD04(&qword_1000150A0);
    result = swift_dynamicCast(&v7, v8, (char *)&type metadata for Any + 8, v5, 6);
    if ((result & 1) != 0)
    {
      v6 = v7;
      objc_msgSend(v7, "dismissViewControllerCancelled:", a1 & 1);
      return swift_unknownObjectRelease(v6);
    }
  }
  return result;
}

uint64_t sub_10000CD04(uint64_t *a1)
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

uint64_t sub_10000CD44(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000CD88()
{
  uint64_t v0;

  sub_10000CD44(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

void sub_10000CDB4()
{
  uint64_t v0;

  sub_10000B53C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10000CDC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000CDD0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000CDD8(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_10000CE1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000150C0;
  if (!qword_1000150C0)
  {
    v1 = sub_10000CE68(&qword_1000150B8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000150C0);
  }
  return result;
}

uint64_t sub_10000CE68(uint64_t *a1)
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

uint64_t sub_10000CEAC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_10000CEC4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000CEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_10000CF24(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000CF64()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000CF88()
{
  uint64_t v0;

  return sub_10000AED0(v0);
}

uint64_t sub_10000CF90()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_10000CFBC()
{
  uint64_t v0;

  sub_10000B1A8(*(char **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

void sub_10000CFC8()
{
  uint64_t v0;

  sub_10000B158(v0);
}

uint64_t sub_10000CFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000CD04(&qword_1000150D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D018()
{
  uint64_t v0;

  swift_unknownObjectUnownedDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D03C(uint64_t a1)
{
  uint64_t v1;

  return sub_10000A28C(a1, v1);
}

void sub_10000D044(uint64_t a1)
{
  uint64_t v1;

  sub_10000A520(a1, v1);
}

uint64_t sub_10000D04C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000D070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_1000084EC(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_10000D078()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_10000D0EC(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(type metadata accessor for UUID(0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_1000088C4(a1, a2, (void *)(v2 + v6), *(void **)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_10000D14C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_10000D18C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_10000D1B8()
{
  uint64_t v0;

  sub_100009324(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10000D1C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000CD04(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D1FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000CD04(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10000D240(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000D250(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10000D28C(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

void sub_10000D2C0(uint64_t a1)
{
  uint64_t v1;

  sub_10000A96C(a1, v1, (SEL *)&selRef_redo);
}

void sub_10000D2E0(uint64_t a1)
{
  uint64_t v1;

  sub_10000A96C(a1, v1, (SEL *)&selRef_undo);
}

void sub_10000D300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_100006C84(a1, a2, a3, v3);
}

uint64_t sub_10000D308(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000D318()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D33C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D368(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t);

  v2 = *(uint64_t (**)(uint64_t))(v1 + 16);
  if (v2)
    return v2(result & 1);
  return result;
}

uint64_t sub_10000D394(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_10000D3A4(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10000D3DC(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t sub_10000D46C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC37com_apple_mobilenotes_EditorExtensionP33_114BA5A3957FE28BF65020D63639891619ResourceBundleClass);
}
