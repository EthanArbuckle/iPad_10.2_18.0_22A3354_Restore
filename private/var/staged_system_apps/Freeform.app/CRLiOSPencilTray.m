@implementation CRLiOSPencilTray

- (void)dealloc
{
  char v2;
  _TtC8Freeform16CRLiOSPencilTray *v3;
  objc_super v4;

  v2 = *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_wasTearDownCalled);
  v3 = self;
  if ((v2 & 1) == 0)
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2, 194, "Must call tearDown() before CRLiOSPencilTray is deinitialized.", 62, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2u, 194, (uint64_t)"Must call tearDown() before CRLiOSPencilTray is deinitialized.", 62, 2u);
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CRLiOSPencilTray();
  -[CRLiOSPencilTray dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1006F2BD4((uint64_t)self + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_delegate, (uint64_t)a2);
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_documentModeController, v3);
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_cvc, v4);
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_icc, v5);
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_editorController, v6);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_lassoEditingViewClippingWorkaround));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_lassoSegmentedViewController));

  sub_1004CB49C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray____lazy_storage___pickerManager));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)fillColorChangedFromTrayWithSender:(id)a3
{
  sub_100A0BEA0(self, (uint64_t)a2, (uint64_t)a3, sub_100B55BA8);
}

- (void)strokeColorChangedFromTrayWithSender:(id)a3
{
  sub_100A0BEA0(self, (uint64_t)a2, (uint64_t)a3, sub_100B55DC4);
}

- (void)sendBackwardWithSender:(id)a3
{
  sub_100B5743C(self, (uint64_t)a2, (uint64_t)a3, sub_100B5D284);
}

- (void)sendToBackWithSender:(id)a3
{
  sub_100B5743C(self, (uint64_t)a2, (uint64_t)a3, sub_100B5D3A4);
}

- (void)bringForwardWithSender:(id)a3
{
  sub_100B5743C(self, (uint64_t)a2, (uint64_t)a3, sub_100B5D4C4);
}

- (void)bringToFrontWithSender:(id)a3
{
  sub_100B5743C(self, (uint64_t)a2, (uint64_t)a3, sub_100B5D5E4);
}

- (_TtC8Freeform16CRLiOSPencilTray)init
{
  _TtC8Freeform16CRLiOSPencilTray *result;

  result = (_TtC8Freeform16CRLiOSPencilTray *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSPencilTray", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (BOOL)hidden
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_isHidden);
}

- (CGRect)rectangleObscuringCanvasScrollView
{
  _TtC8Freeform16CRLiOSPencilTray *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = sub_100B57634();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)installToolTray
{
  _TtC8Freeform16CRLiOSPencilTray *v2;
  _TtC8Freeform16CRLiOSPencilTray *v3;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_isInstalled) == 1)
  {
    v2 = self;
    sub_100757E04(&_mh_execute_header, (uint64_t)"installToolTray()", 17, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2, 1421, "Should not try to install a pencil tray which is already installed.", 67, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"installToolTray()", 17, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2u, 1421, (uint64_t)"Should not try to install a pencil tray which is already installed.", 67, 2u);
  }
  else
  {
    *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_isInstalled) = 1;
    v3 = self;
    sub_100B4FA6C();
  }

}

- (void)uninstallToolTray
{
  _TtC8Freeform16CRLiOSPencilTray *v2;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_isInstalled) == 1)
  {
    *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_isInstalled) = 0;
  }
  else
  {
    v2 = self;
    sub_100757E04(&_mh_execute_header, (uint64_t)"uninstallToolTray()", 19, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2, 1432, "Should not try to uninstall a pencil tray which is not installed.", 65, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"uninstallToolTray()", 19, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2u, 1432, (uint64_t)"Should not try to uninstall a pencil tray which is not installed.", 65, 2u);

  }
}

- (void)setToolTrayHidden:(BOOL)a3 animated:(BOOL)a4
{
  _TtC8Freeform16CRLiOSPencilTray *v5;

  v5 = self;
  sub_100B5D704(a3);

}

- (void)toolPickerSelectedToolDidChange:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  void *v8;
  _TtC8Freeform16CRLiOSPencilTray *v9;

  v4 = a3;
  v9 = self;
  v5 = (char *)sub_100B4F46C();
  if (v5)
  {
    v6 = v5;
    v7 = *(id *)&v5[OBJC_IVAR____TtC8Freeform29CRLiOSPencilTrayPickerManager_picker];

  }
  else
  {
    sub_100B4F3B8();
    v7 = v8;
  }
  sub_1005892BC((uint64_t)v4, (uint64_t)v7, &_mh_execute_header, (uint64_t)"toolPickerSelectedToolDidChange(_:)", 35, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2u, 1496);

  sub_100B5191C();
}

- (void)toolPickerIsRulerActiveDidChange:(id)a3
{
  id v4;
  _TtC8Freeform16CRLiOSPencilTray *v5;

  v4 = a3;
  v5 = self;
  sub_100B57AC4(v4);

}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4;
  _TtC8Freeform16CRLiOSPencilTray *v5;

  v4 = a3;
  v5 = self;
  sub_100B57C6C((uint64_t)v4);

}

- (void)updateForToolPickerVisibilityDidChange
{
  _TtC8Freeform16CRLiOSPencilTray *v2;

  v2 = self;
  sub_100B57E9C();

}

- (void)toolPickerFramesObscuredDidChange:(id)a3
{
  id v4;
  _TtC8Freeform16CRLiOSPencilTray *v5;

  v4 = a3;
  v5 = self;
  sub_100B58194((uint64_t)v4);

}

- (void)_toolPicker:(id)a3 didChangeColor:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform16CRLiOSPencilTray *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100B582F4((uint64_t)v6, a4);

}

- (id)_toolPickerCurrentSelectionColor:(id)a3
{
  id v4;
  _TtC8Freeform16CRLiOSPencilTray *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100B58558((uint64_t)v4);

  return v6;
}

- (void)_toggleLassoToolEditingViewColorPickerForToolPicker:(id)a3
{
  id v4;
  _TtC8Freeform16CRLiOSPencilTray *v5;

  v4 = a3;
  v5 = self;
  sub_100B58688((uint64_t)v4);

}

- (id)_colorPickerPopoverPresentationBarButtonItem:(id)a3
{
  void *Strong;
  id v6;
  _TtC8Freeform16CRLiOSPencilTray *v7;
  id v8;

  Strong = (void *)swift_unknownObjectUnownedLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_delegate);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(Strong, "barButtonItemForPresentingColorPickerWithHiddenPencilTray:", v7);

  swift_unknownObjectRelease(Strong);
  return v8;
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  _TtC8Freeform16CRLiOSPencilTray *v9;
  _QWORD v10[4];

  v7 = type metadata accessor for CRLChangeRecord();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  swift_unknownObjectRetain(a4);
  v9 = self;
  _bridgeAnyObjectToAny(_:)(v10, a4);
  swift_unknownObjectRelease(a4);
  sub_100B58914(v8);

  swift_bridgeObjectRelease();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v10);
}

- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  id v7;
  _TtC8Freeform16CRLiOSPencilTray *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = self;
  if (objc_msgSend(v9, "pencilModeType"))
    sub_100B4FA6C();

}

- (void)toolkitDidUpdateCurrentToolSelection
{
  void *Strong;
  id v4;
  id v5;
  _TtC8Freeform16CRLiOSPencilTray *v6;

  Strong = (void *)swift_unknownObjectUnownedLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_documentModeController);
  v6 = self;
  v4 = objc_msgSend(Strong, "mode");

  v5 = objc_msgSend(v4, "pencilModeType");
  if (v5 == (id)1)
    sub_100B4FA6C();

}

- (void)toolkitDidUpdateRulerVisibility
{
  _TtC8Freeform16CRLiOSPencilTray *v2;

  v2 = self;
  sub_100B58E2C();

}

- (void)lassoSegmentedControlDidChangeType:(unint64_t)a3
{
  void *Strong;
  _TtC8Freeform16CRLiOSPencilTray *v6;
  id v7;
  id v8;

  Strong = (void *)swift_unknownObjectUnownedLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_icc);
  v6 = self;
  v7 = objc_msgSend(Strong, "freehandDrawingToolkit");

  if (v7)
  {
    v8 = objc_msgSend(v7, "toolkitUIState");

    objc_msgSend(v8, "setCurrentLassoType:", a3);
  }
  else
  {
    __break(1u);
  }
}

@end
