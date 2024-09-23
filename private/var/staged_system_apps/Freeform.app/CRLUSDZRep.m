@implementation CRLUSDZRep

- (_TtC8Freeform10CRLUSDZRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (_TtC8Freeform10CRLUSDZRep *)sub_1009BE300(v5, a4);
}

- (BOOL)forcesPlacementOnTop
{
  return 1;
}

- (BOOL)shouldShowKnobs
{
  objc_super v3;

  if ((*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_hideKnobsDueToBoundsUpdate) & 1) != 0
    || *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_isZooming) == 1)
  {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
  return -[CRLCanvasRep shouldShowKnobs](&v3, "shouldShowKnobs");
}

- (void)dynamicRotateDidBegin
{
  _TtC8Freeform10CRLUSDZRep *v2;

  v2 = self;
  sub_100757E04(&_mh_execute_header, (uint64_t)"dynamicRotateDidBegin()", 23, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZRep.swift", 81, 2, 1460, "Unexpected call to dynamicRotateDidBegin.", 41, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"dynamicRotateDidBegin()", 23, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZRep.swift", 81, 2u, 1460, (uint64_t)"Unexpected call to dynamicRotateDidBegin.", 41, 2u);

}

- (void)dynamicallyRotatingWithTracker:(id)a3
{
  id v4;
  _TtC8Freeform10CRLUSDZRep *v5;

  v4 = a3;
  v5 = self;
  sub_100757E04(&_mh_execute_header, (uint64_t)"dynamicallyRotating(with:)", 26, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZRep.swift", 81, 2, 1464, "Unexpected call to dynamicallyRotating.", 39, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"dynamicallyRotating(with:)", 26, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZRep.swift", 81, 2u, 1464, (uint64_t)"Unexpected call to dynamicallyRotating.", 39, 2u);

}

- (void)dynamicRotateDidEndWithTracker:(id)a3
{
  id v4;
  _TtC8Freeform10CRLUSDZRep *v5;

  v4 = a3;
  v5 = self;
  sub_100757E04(&_mh_execute_header, (uint64_t)"dynamicRotateDidEnd(with:)", 26, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZRep.swift", 81, 2, 1468, "Unexpected call to dynamicRotateDidEnd.", 39, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"dynamicRotateDidEnd(with:)", 26, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZRep.swift", 81, 2u, 1468, (uint64_t)"Unexpected call to dynamicRotateDidEnd.", 39, 2u);

}

- (BOOL)manuallyControlsMiniFormatter
{
  uint64_t v2;
  _TtC8Freeform10CRLUSDZRep *v3;
  char v4;

  v2 = *(_QWORD *)(*(char **)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_knobController)
                 + OBJC_IVAR____TtC8Freeform21CRLUSDZKnobController_playPauseKnob);
  if (v2 && (*(_BYTE *)(v2 + OBJC_IVAR____TtC8Freeform20CRLUSDZPlayPauseKnob_isPlaying) & 1) != 0)
  {
    v3 = self;
    v4 = sub_1009D0508();

  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  id v4;
  _TtC8Freeform10CRLUSDZRep *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1009CA33C((uint64_t)v4);

  return self & 1;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  _TtC8Freeform10CRLUSDZRep *v4;
  char v5;

  v4 = self;
  v5 = sub_1009D759C();

  return v5 & 1;
}

- (void)hideMiniFormatterIfNecessary
{
  _TtC8Freeform10CRLUSDZRep *v2;

  v2 = self;
  sub_1009CA620();

}

- (void)interruptRendering
{
  _TtC8Freeform10CRLUSDZRep *v2;

  v2 = self;
  sub_1009CA7CC();

}

- (void)resumeRendering
{
  _TtC8Freeform10CRLUSDZRep *v2;

  v2 = self;
  sub_1009CAA84();

}

- (void)applicationDidEnterBackground
{
  _TtC8Freeform10CRLUSDZRep *v2;

  v2 = self;
  sub_1009C9658(0);
  sub_100BD56E4(1);

}

- (BOOL)wantsContentPlatformViewEventHandling
{
  return 0;
}

- (BOOL)occludesSelectedRep
{
  _TtC8Freeform10CRLUSDZRep *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1009CB2C4();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)canBeOccluded
{
  return 0;
}

- (BOOL)shouldShowSelectionHighlight
{
  return 0;
}

- (BOOL)shouldSuppressSelectionHighlightDuringMultiselection
{
  _TtC8Freeform10CRLUSDZRep *v2;
  char v3;

  v2 = self;
  v3 = sub_1009CB634();

  return v3 & 1;
}

- (UIView)contentPlatformView
{
  _TtC8Freeform10CRLUSDZRep *v2;
  id v3;

  v2 = self;
  v3 = sub_1009CB778();

  return (UIView *)v3;
}

- (void)handleSpinnerTapWithSender:(id)a3
{
  _TtC8Freeform10CRLUSDZRep *v4;
  uint64_t v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6, v5);

    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_1004CB800((uint64_t)v6, &qword_1013E0230);
}

- (void)handleFadeOutForZoom
{
  id v2;
  objc_super v3;

  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_isZooming) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
  v2 = v3.receiver;
  -[CRLCanvasRep handleFadeOutForZoom](&v3, "handleFadeOutForZoom");
  sub_1009CC2FC();

}

- (void)handleFadeInForZoom
{
  _TtC8Freeform10CRLUSDZRep *v2;

  v2 = self;
  sub_1009CC174();

}

- (void)viewScaleDidChange
{
  sub_1009CEFBC(self, (uint64_t)a2, (const char **)&selRef_viewScaleDidChange, (void (*)(id))sub_1009CBF18);
}

- (BOOL)directlyManagesContentPlatformView
{
  int v2;

  v2 = *((unsigned __int8 *)&self->super.mCanvas + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_renderingState) >> 6;
  if (v2 == 2)
    return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_isInteractive);
  if (v2 == 1)
    return ((*(_BYTE **)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_renderingState))[48] & 0x20) == 0;
  return 0;
}

- (NSArray)additionalRenderablesOverRenderable
{
  _TtC8Freeform10CRLUSDZRep *v2;
  Class isa;

  v2 = self;
  sub_1009CC5C0();

  sub_1004B8930(0, (unint64_t *)&qword_1013EE6D0, off_101229820);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)processChangedProperty:(unint64_t)a3
{
  _TtC8Freeform10CRLUSDZRep *v4;

  v4 = self;
  sub_1009CC6D4(a3);

}

- (void)updateRenderableGeometryFromLayout:(id)a3
{
  _TtC8Freeform10CRLUSDZRep *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1009CC8C8((uint64_t)v5);

}

- (NSArray)overlayRenderables
{
  id v2;
  NSArray *v3;
  uint64_t v4;
  Class isa;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
  v2 = v7.receiver;
  v3 = -[CRLCanvasRep overlayRenderables](&v7, "overlayRenderables");
  v4 = sub_1004B8930(0, (unint64_t *)&qword_1013EE6D0, off_101229820);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (id)resizedGeometryForTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _TtC8Freeform10CRLUSDZRep *v4;
  void *v5;
  void *v6;
  _OWORD v8[3];

  v3 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v3;
  v8[2] = *(_OWORD *)&a3->tx;
  v4 = self;
  sub_1009CCF88((CGFloat *)v8);
  v6 = v5;

  return v6;
}

- (CGRect)frameInUnscaledCanvasForMarqueeSelecting
{
  _TtC8Freeform10CRLUSDZRep *v2;
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
  double v14;
  CGRect result;

  v2 = self;
  -[CRLCanvasRep boundsForStandardKnobs](v2, "boundsForStandardKnobs");
  -[CRLCanvasRep convertNaturalRectToUnscaledCanvas:](v2, "convertNaturalRectToUnscaledCanvas:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)becameSelected
{
  _TtC8Freeform10CRLUSDZRep *v2;

  v2 = self;
  sub_1009CD1E8();

}

- (void)becameNotSelected
{
  _TtC8Freeform10CRLUSDZRep *v2;

  v2 = self;
  sub_1009CD574();

}

- (void)prepareForPencilKitSnapshotting
{
  _TtC8Freeform10CRLUSDZRep *v2;

  v2 = self;
  sub_1009CD9BC();

}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  CGFloat y;
  CGFloat x;
  _TtC8Freeform10CRLUSDZRep *v7;
  unsigned __int8 v8;

  y = a3.y;
  x = a3.x;
  v7 = self;
  v8 = sub_1009CDEC4(a4, x, y);

  return v8 & 1;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  -[CRLUSDZRep enterPreviewMode](self, "enterPreviewMode", a4, a3.x, a3.y);
  return 1;
}

- (void)didUpdateRenderable:(id)a3
{
  _TtC8Freeform10CRLUSDZRep *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1009CE1C8((uint64_t)v5);

}

- (void)dynamicDragDidBegin
{
  sub_1009CE9B8(self, (uint64_t)a2, (const char **)&selRef_dynamicDragDidBegin, 0, (void (*)(_QWORD))sub_100BD5AEC);
}

- (void)dynamicDragDidEnd
{
  sub_1009CE9B8(self, (uint64_t)a2, (const char **)&selRef_dynamicDragDidEnd, 1, (void (*)(_QWORD))sub_100BD59F8);
}

- (id)dynamicResizeDidBegin
{
  _TtC8Freeform10CRLUSDZRep *v2;
  id v3;

  v2 = self;
  v3 = sub_1009CEA5C();

  return v3;
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  _TtC8Freeform10CRLUSDZRep *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1009CEB64((uint64_t)a3);

}

- (void)willBeginZooming
{
  _TtC8Freeform10CRLUSDZRep *v2;

  v2 = self;
  sub_1009CEDA0();

}

- (void)didEndZooming
{
  _TtC8Freeform10CRLUSDZRep *v2;

  v2 = self;
  sub_1009CEE7C();

}

- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
  v4 = v5.receiver;
  -[CRLCanvasRep dynamicOperationDidBeginWithRealTimeCommands:](&v5, "dynamicOperationDidBeginWithRealTimeCommands:", v3);
  sub_1009C10FC();

}

- (void)dynamicOperationDidEnd
{
  sub_1009CEFBC(self, (uint64_t)a2, (const char **)&selRef_dynamicOperationDidEnd, (void (*)(id))sub_1009C10FC);
}

- (uint64_t)canvasWillScroll:(uint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = a1;
  sub_1009C10FC();

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC8Freeform11CRLUSDZItem)usdzItem
{
  return (_TtC8Freeform11CRLUSDZItem *)sub_1009CF0E8(self, (uint64_t)a2, (SEL *)&selRef_info, type metadata accessor for CRLUSDZItem);
}

- (_TtC8Freeform13CRLUSDZLayout)usdzLayout
{
  return (_TtC8Freeform13CRLUSDZLayout *)sub_1009CF0E8(self, (uint64_t)a2, (SEL *)&selRef_layout, (uint64_t (*)(_QWORD))type metadata accessor for CRLUSDZLayout);
}

- (void)willBeRemoved
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
  v2 = v3.receiver;
  -[CRLCanvasRep willBeRemoved](&v3, "willBeRemoved");
  sub_1009CF6DC();
  sub_1009D0104();
  sub_1009D02E0();

}

- (void)selectionPathDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC8Freeform10CRLUSDZRep *v5;

  v4 = a3;
  v5 = self;
  if (-[CRLCanvasRep isLocked](v5, "isLocked"))
    -[CRLCanvasRep invalidateKnobs](v5, "invalidateKnobs");

}

- (void)drawInContext:(CGContext *)a3
{
  _TtC8Freeform10CRLUSDZRep *v4;
  CGContext *v5;

  v5 = a3;
  v4 = self;
  sub_1009D06C0(v5);

}

- (void).cxx_destruct
{
  sub_1004B84A4((uint64_t)self + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_posterLoadingState, type metadata accessor for CRLUSDZRep.PosterLoadingState);
  sub_1004B84A4((uint64_t)self + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_assetLoadingState, type metadata accessor for CRLUSDZRep.AssetLoadingState);
  sub_1009D3B68(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_renderingState), *((_BYTE *)&self->super.mCanvas + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_renderingState));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform10CRLUSDZRep____lazy_storage___spinnerView));
}

- (void)addKnobsToArray:(id)a3
{
  id v4;
  _TtC8Freeform10CRLUSDZRep *v5;

  v4 = a3;
  v5 = self;
  sub_1009D16BC(v4);

}

- (id)newTrackerForKnob:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC8Freeform10CRLUSDZRep *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_knobController);
  v5 = a3;
  v6 = self;
  v7 = sub_1009D6E5C((uint64_t)v5, v6, v4);
  if (!v7)
  {
    v10.receiver = v6;
    v10.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
    v7 = -[CRLCanvasRep newTrackerForKnob:](&v10, "newTrackerForKnob:", v5);
  }
  v8 = v7;

  return v8;
}

- (NSString)crlaxLabel
{
  _TtC8Freeform10CRLUSDZRep *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1009D36A8();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)crlaxShouldSetAccessibilityFrameWithFrameInUnscaledCanvasForMarqueeSelecting
{
  return 1;
}

- (int64_t)supportedMediaTypes
{
  return 2;
}

- (int64_t)preferredReplacingInterfaceKind
{
  return 1;
}

- (BOOL)replacingInterfaceAllowsMultipleSelection
{
  return 0;
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 1;
}

- (NSString)debugDescription
{
  _TtC8Freeform10CRLUSDZRep *v2;
  NSString v3;

  v2 = self;
  sub_1009D60CC();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)enterPreviewMode
{
  _TtC8Freeform10CRLUSDZRep *v2;

  v2 = self;
  sub_100D468B8((void (*)(__n128))sub_100D47854);

}

- (void)didExitPreviewMode
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
  -[CRLCanvasRep didExitPreviewMode](&v2, "didExitPreviewMode");
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 1;
}

@end
