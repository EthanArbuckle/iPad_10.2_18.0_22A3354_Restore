@implementation CRLMovieItem

- (double)startTime
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _UNKNOWN ****v6;
  uint64_t v7;
  _TtC8Freeform12CRLMovieItem *v8;
  uint64_t v9;
  double v10;
  _BYTE v13[24];

  v3 = type metadata accessor for CRLMovieItemAssetData(0);
  __chkstk_darwin(v3);
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = *(_UNKNOWN *****)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*v6 == &off_1013E07D8)
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  else
    v7 = 0;
  swift_beginAccess(v7 + qword_10147E7D8, v13, 32, 0);
  v8 = self;
  swift_retain(v6);
  v9 = sub_1004B804C(&qword_10140FCF0);
  CRRegister.wrappedValue.getter(v9);
  v10 = *(double *)&v5[*(int *)(v3 + 28)];
  swift_endAccess(v13);
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLMovieItemAssetData);

  swift_release(v6);
  return v10;
}

- (void)setStartTime:(double)a3
{
  _TtC8Freeform12CRLMovieItem *v4;

  v4 = self;
  sub_100A2E7E4(a3);

}

- (double)endTime
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _UNKNOWN ****v6;
  uint64_t v7;
  _TtC8Freeform12CRLMovieItem *v8;
  uint64_t v9;
  double v10;
  _BYTE v13[24];

  v3 = type metadata accessor for CRLMovieItemAssetData(0);
  __chkstk_darwin(v3);
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = *(_UNKNOWN *****)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*v6 == &off_1013E07D8)
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  else
    v7 = 0;
  swift_beginAccess(v7 + qword_10147E7D8, v13, 32, 0);
  v8 = self;
  swift_retain(v6);
  v9 = sub_1004B804C(&qword_10140FCF0);
  CRRegister.wrappedValue.getter(v9);
  v10 = *(double *)&v5[*(int *)(v3 + 32)];
  swift_endAccess(v13);
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLMovieItemAssetData);

  swift_release(v6);
  return v10;
}

- (void)setEndTime:(double)a3
{
  _TtC8Freeform12CRLMovieItem *v4;

  v4 = self;
  sub_100A2ED44(a3);

}

- (BOOL)isAudioOnly
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _UNKNOWN ****v6;
  uint64_t v7;
  _TtC8Freeform12CRLMovieItem *v8;
  uint64_t v9;
  char v10;
  _BYTE v13[24];

  v3 = type metadata accessor for CRLMovieItemAssetData(0);
  __chkstk_darwin(v3);
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = *(_UNKNOWN *****)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*v6 == &off_1013E07D8)
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  else
    v7 = 0;
  swift_beginAccess(v7 + qword_10147E7D8, v13, 32, 0);
  v8 = self;
  swift_retain(v6);
  v9 = sub_1004B804C(&qword_10140FCF0);
  CRRegister.wrappedValue.getter(v9);
  v10 = v5[*(int *)(v3 + 36)];
  swift_endAccess(v13);
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLMovieItemAssetData);

  swift_release(v6);
  return v10;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  _TtC8Freeform12CRLMovieItem *v4;

  v4 = self;
  sub_100A2F298(a3);

}

- (BOOL)isLooping
{
  _TtC8Freeform12CRLMovieItem *v2;
  char v3;

  v2 = self;
  v3 = sub_100A2F5A4();

  return v3 & 1;
}

- (void)setIsLooping:(BOOL)a3
{
  _TtC8Freeform12CRLMovieItem *v4;

  v4 = self;
  sub_100A2F6E0(a3);

}

- (BOOL)isSpatial
{
  _TtC8Freeform12CRLMovieItem *v2;
  char v3;

  v2 = self;
  v3 = sub_100A2F9EC();

  return v3 & 1;
}

- (double)posterTime
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _UNKNOWN ****v6;
  uint64_t v7;
  _TtC8Freeform12CRLMovieItem *v8;
  uint64_t v9;
  double v10;
  _BYTE v13[24];

  v3 = type metadata accessor for CRLMovieItemAssetData(0);
  __chkstk_darwin(v3);
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = *(_UNKNOWN *****)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*v6 == &off_1013E07D8)
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  else
    v7 = 0;
  swift_beginAccess(v7 + qword_10147E7D8, v13, 32, 0);
  v8 = self;
  swift_retain(v6);
  v9 = sub_1004B804C(&qword_10140FCF0);
  CRRegister.wrappedValue.getter(v9);
  v10 = *(double *)&v5[*(int *)(v3 + 24)];
  swift_endAccess(v13);
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLMovieItemAssetData);

  swift_release(v6);
  return v10;
}

- (void)setPosterTime:(double)a3
{
  _TtC8Freeform12CRLMovieItem *v4;

  v4 = self;
  sub_100A2FCF8(a3);

}

- (float)volume
{
  _UNKNOWN ****v3;
  uint64_t v4;
  _TtC8Freeform12CRLMovieItem *v5;
  uint64_t v6;
  float result;
  float v8;
  char v9;
  _BYTE v10[24];

  v3 = *(_UNKNOWN *****)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*v3 == &off_1013E07D8)
    v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  else
    v4 = 0;
  swift_beginAccess(v4 + qword_10147E7D8, v10, 32, 0);
  type metadata accessor for CRLMovieItemCRDTData(0);
  v5 = self;
  swift_retain(v3);
  v6 = sub_1004B804C(&qword_1013E0A90);
  CRRegister.wrappedValue.getter(v6);
  swift_endAccess(v10);

  swift_release(v3);
  result = 1.0;
  if (!v9)
    return v8;
  return result;
}

- (void)setVolume:(float)a3
{
  _TtC8Freeform12CRLMovieItem *v4;

  v4 = self;
  sub_100A300F4(a3);

}

- (float)cornerRadius
{
  _UNKNOWN ****v3;
  uint64_t v4;
  _TtC8Freeform12CRLMovieItem *v5;
  uint64_t v6;
  float v8;
  _BYTE v9[24];

  v3 = *(_UNKNOWN *****)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*v3 == &off_1013E07D8)
    v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  else
    v4 = 0;
  swift_beginAccess(v4 + qword_10147E7D8, v9, 32, 0);
  type metadata accessor for CRLMovieItemCRDTData(0);
  v5 = self;
  swift_retain(v3);
  v6 = sub_1004B804C(&qword_1013DFA58);
  CRRegister.wrappedValue.getter(v6);
  swift_endAccess(v9);

  swift_release(v3);
  swift_bridgeObjectRelease();
  return v8;
}

- (void)setCornerRadius:(float)a3
{
  _TtC8Freeform12CRLMovieItem *v4;

  v4 = self;
  sub_100A30408(a3);

}

- (NSString)title
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _UNKNOWN ****v6;
  uint64_t v7;
  _TtC8Freeform12CRLMovieItem *v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  _BYTE v14[24];

  v3 = type metadata accessor for CRLMovieItemAssetData(0);
  __chkstk_darwin(v3);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = *(_UNKNOWN *****)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*v6 == &off_1013E07D8)
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  else
    v7 = 0;
  swift_beginAccess(v7 + qword_10147E7D8, v14, 32, 0);
  v8 = self;
  swift_retain(v6);
  v9 = sub_1004B804C(&qword_10140FCF0);
  CRRegister.wrappedValue.getter(v9);
  swift_endAccess(v14);
  swift_release(v6);
  v10 = *(_QWORD *)&v5[*(int *)(v3 + 40) + 8];
  swift_bridgeObjectRetain(v10);
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLMovieItemAssetData);

  if (!v10)
    return (NSString *)0;
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v11;
}

- (void)setTitle:(id)a3
{
  sub_100A30CBC(self, (uint64_t)a2, (uint64_t)a3, sub_100A30878);
}

- (NSString)creator
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _UNKNOWN ****v6;
  uint64_t v7;
  _TtC8Freeform12CRLMovieItem *v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  _BYTE v14[24];

  v3 = type metadata accessor for CRLMovieItemAssetData(0);
  __chkstk_darwin(v3);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = *(_UNKNOWN *****)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*v6 == &off_1013E07D8)
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  else
    v7 = 0;
  swift_beginAccess(v7 + qword_10147E7D8, v14, 32, 0);
  v8 = self;
  swift_retain(v6);
  v9 = sub_1004B804C(&qword_10140FCF0);
  CRRegister.wrappedValue.getter(v9);
  swift_endAccess(v14);
  swift_release(v6);
  v10 = *(_QWORD *)&v5[*(int *)(v3 + 44) + 8];
  swift_bridgeObjectRetain(v10);
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLMovieItemAssetData);

  if (!v10)
    return (NSString *)0;
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v11;
}

- (void)setCreator:(id)a3
{
  sub_100A30CBC(self, (uint64_t)a2, (uint64_t)a3, sub_100A30D2C);
}

- (_TtC8Freeform8CRLAsset)movieAssetPayload
{
  _TtC8Freeform12CRLMovieItem *v2;
  Class v3;

  v2 = self;
  v3 = sub_100A3104C();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (_TtC8Freeform8CRLAsset)posterImageAssetPayload
{
  _TtC8Freeform12CRLMovieItem *v2;
  char *v3;

  v2 = self;
  v3 = sub_100A315D4();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (CGSize)mediaRawPixelSize
{
  _TtC8Freeform12CRLMovieItem *v2;
  char *v3;
  char *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v2 = self;
  v3 = sub_100A315D4();
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(CRLImageProviderPool), "sharedPool");
    v6 = objc_msgSend(v5, "providerForAsset:shouldValidate:", v4, 1);

    objc_msgSend(v6, "naturalSize");
    v8 = v7;
    v10 = v9;

  }
  else
  {

    v8 = 0.0;
    v10 = 0.0;
  }
  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (NSString)localizedName
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, (void (*)(void))sub_100A31C24);
}

- (NSString)localizedAccessibilityDescriptionPlaceholder
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, (void (*)(void))sub_100A31E0C);
}

- (void)setPosterImageData:(id)a3
{
  id v5;
  _TtC8Freeform12CRLMovieItem *v6;

  v5 = a3;
  v6 = self;
  sub_100A3244C(a3);

}

- (void)setAssetMediaWithMovieData:(id)a3 posterImageData:(id)a4 posterTime:(double)a5 startTime:(double)a6 endTime:(double)a7 isAudioOnly:(BOOL)a8 title:(id)a9 creator:(id)a10 isLooping:(BOOL)a11
{
  id v11;
  _BOOL4 v12;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  _TtC8Freeform12CRLMovieItem *v26;
  _BOOL4 v27;

  v27 = a11;
  v11 = a10;
  v12 = a8;
  if (!a9)
  {
    v19 = 0;
    v21 = 0;
    if (a10)
      goto LABEL_3;
LABEL_5:
    v22 = 0;
    goto LABEL_6;
  }
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9);
  v21 = v20;
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v11 = v23;
LABEL_6:
  v24 = a3;
  v25 = a4;
  v26 = self;
  sub_100A327BC(a3, a4, v12, v19, v21, v22, (uint64_t)v11, v27, a5, a6, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)supportsTogglingLooping
{
  return 1;
}

- (float)roundedCornerAmount
{
  _UNKNOWN ****v3;
  uint64_t v4;
  _TtC8Freeform12CRLMovieItem *v5;
  uint64_t v6;
  float v8;
  _BYTE v9[24];

  v3 = *(_UNKNOWN *****)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*v3 == &off_1013E07D8)
    v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  else
    v4 = 0;
  swift_beginAccess(v4 + qword_10147E7D8, v9, 32, 0);
  type metadata accessor for CRLMovieItemCRDTData(0);
  v5 = self;
  swift_retain(v3);
  v6 = sub_1004B804C(&qword_1013DFA58);
  CRRegister.wrappedValue.getter(v6);
  swift_endAccess(v9);

  swift_release(v3);
  swift_bridgeObjectRelease();
  return v8;
}

- (id)commandToSetRoundedCornersEnabled:(BOOL)a3
{
  _TtC8Freeform12CRLMovieItem *v4;
  id v5;

  v4 = self;
  v5 = sub_100A33544(a3);

  return v5;
}

- (id)commandToSetLoopingEnabled:(BOOL)a3
{
  _TtC8Freeform12CRLMovieItem *v4;
  id v5;

  v4 = self;
  v5 = sub_100A33694(a3);

  return v5;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (void)takePropertiesFromReplacedBoardItem:(id)a3
{
  _QWORD *v4;
  _TtC8Freeform12CRLMovieItem *v5;

  v4 = a3;
  v5 = self;
  sub_100A337DC(v4);

}

- (BOOL)placeHolderDataNeedsDownload
{
  _TtC8Freeform12CRLMovieItem *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_100A33AE0();

  return v3;
}

- (BOOL)isSelectable
{
  return 1;
}

- (BOOL)isPreviewable
{
  return 1;
}

- (NSString)previewTooltip
{
  _TtC8Freeform12CRLMovieItem *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100A33C94();
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

- (BOOL)isShareable
{
  return 1;
}

- (Class)layoutClass
{
  _TtC8Freeform12CRLMovieItem *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self;
  v3 = sub_100A33EAC();

  return (Class)swift_getObjCClassFromMetadata(v3, v4);
}

- (Class)repClass
{
  _TtC8Freeform12CRLMovieItem *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self;
  v3 = sub_100A3401C();

  if (v3)
    return (Class)swift_getObjCClassFromMetadata(v3, v4);
  else
    return 0;
}

- (Class)editorClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_101403178, off_101229938);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (id)makeAVAssetAndReturnError:(id *)a3
{
  _TtC8Freeform12CRLMovieItem *v3;
  Class v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = self;
  v4 = sub_100A3104C();
  v5 = *(_QWORD *)((char *)v4 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24);
  v6 = *(_QWORD *)((char *)v4 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 32);
  sub_1004BB5A4((Class)((char *)v4 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v5);
  v7 = (void *)(*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v6 + 56))(_swiftEmptyDictionarySingleton, v5, v6);

  return v7;
}

- (id)makeAVAssetWithOptionsWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v5;
  _TtC8Freeform12CRLMovieItem *v6;
  Class v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v6 = self;
  v7 = sub_100A3104C();
  v8 = *(_QWORD *)((char *)v7 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24);
  v9 = *(_QWORD *)((char *)v7 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 32);
  sub_1004BB5A4((Class)((char *)v7 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v8);
  v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, v8, v9);
  swift_bridgeObjectRelease();

  return v10;
}

- (id)generateEmptyPosterImage
{
  _TtC8Freeform12CRLMovieItem *v2;
  id v3;

  v2 = self;
  v3 = sub_100A373F0();

  return v3;
}

- (BOOL)isAnimatedImage
{
  _TtC8Freeform12CRLMovieItem *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100A376C8();

  return v3 & 1;
}

- (id)synchronouslyGenerateDefaultPosterImageForAnimatedImage
{
  _TtC8Freeform12CRLMovieItem *v2;
  id v3;

  v2 = self;
  v3 = sub_100A378C0();

  return v3;
}

- (id)synchronouslyGenerateDefaultPosterImage
{
  _TtC8Freeform12CRLMovieItem *v2;
  id v3;

  v2 = self;
  v3 = sub_100A37B10();

  return v3;
}

- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem
{
  _TtC8Freeform12CRLMovieItem *v2;
  Class isa;

  v2 = self;
  sub_100A38340();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (id)promisedDataForPublicType:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC8Freeform12CRLMovieItem *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  Class isa;
  uint64_t v16;

  v5 = type metadata accessor for UTType(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)(a3);

  v11 = sub_100A2D9BC((uint64_t)v8);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v13 >> 60 == 15)
    return 0;
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1004BE2FC(v11, v13);
  return isa;
}

- (BOOL)wantsStandardPublicTypesInAdditionToCustomTypesToPromiseWhenCopyingSingleBoardItem
{
  return 1;
}

- (BOOL)supportsTogglingShadowAndRoundedCorners
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _UNKNOWN ****v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  _BYTE v12[24];

  v2 = type metadata accessor for CRLMovieItemAssetData(0);
  __chkstk_darwin(v2);
  v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = *(_UNKNOWN *****)&a1[OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData];
  if (*v5 == &off_1013E07D8)
    v6 = *(_QWORD *)&a1[OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData];
  else
    v6 = 0;
  swift_beginAccess(v6 + qword_10147E7D8, v12, 32, 0);
  v7 = a1;
  swift_retain(v5);
  v8 = sub_1004B804C(&qword_10140FCF0);
  CRRegister.wrappedValue.getter(v8);
  v9 = v4[*(int *)(v2 + 36)];
  swift_endAccess(v12);
  sub_1004B84A4((uint64_t)v4, type metadata accessor for CRLMovieItemAssetData);

  swift_release(v5);
  return (v9 & 1) == 0;
}

+ (CGSize)defaultAudioItemSize
{
  double v2;
  double v3;
  CGSize result;

  if (qword_1013DD938 != -1)
    swift_once(&qword_1013DD938, sub_100A2DF9C);
  v3 = *((double *)&xmmword_1014030B0 + 1);
  v2 = *(double *)&xmmword_1014030B0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)defaultVideoItemSizeWithOriginalSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (qword_1013DD940 != -1)
    swift_once(&qword_1013DD940, sub_100A2DFB8);
  v5 = sub_100062E10(width, height, *(double *)&xmmword_1014030C0, *((double *)&xmmword_1014030C0 + 1));
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform12CRLMovieItem__movieAssetAsData));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform12CRLMovieItem__posterImageAssetAsData));
}

- (BOOL)shouldCacheBackingAssetOnCopy
{
  return 1;
}

@end
