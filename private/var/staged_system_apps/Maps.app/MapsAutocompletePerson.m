@implementation MapsAutocompletePerson

+ (void)autoCompletePersonFrom:(MapsSuggestionsEntry *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  MapsSuggestionsEntry *v15;
  uint64_t v16;

  v7 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1011A3038, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1011A3060, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10149AEB8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1011A3088, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10149A9C0;
  v14[5] = v13;
  v15 = a3;
  sub_10020D758((uint64_t)v9, (uint64_t)&unk_10149F0F0, (uint64_t)v14);
  swift_release();
}

+ (void)autoCompletePersonWithHandleIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  uint64_t v16;

  v7 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1011AA308, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1011AA330, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10149F9F8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1011AA358, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10149FA00;
  v14[5] = v13;
  v15 = a3;
  sub_10020D758((uint64_t)v9, (uint64_t)&unk_10149FA08, (uint64_t)v14);
  swift_release();
}

+ (void)autoCompletePersonWithContact:(CNContact *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CNContact *v15;
  uint64_t v16;

  v7 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1011AA290, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1011AA2B8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10149F9D0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1011AA2E0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10149A9C0;
  v14[5] = v13;
  v15 = a3;
  sub_10020D758((uint64_t)v9, (uint64_t)&unk_10149F0F0, (uint64_t)v14);
  swift_release();
}

- (CNContact)contact
{
  return (CNContact *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contact));
}

- (void)setContact:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contact);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contact) = (Class)a3;
  v3 = a3;

}

- (AutocompleteMatchInfo)contactMatchInfo
{
  return (AutocompleteMatchInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contactMatchInfo));
}

- (void)setContactMatchInfo:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contactMatchInfo);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contactMatchInfo) = (Class)a3;
  v3 = a3;

}

- (_TtC4Maps24MapsFindMyLocationHandle)handle
{
  return (_TtC4Maps24MapsFindMyLocationHandle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                        + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_handle));
}

- (void)setHandle:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_handle);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_handle) = (Class)a3;
  v3 = a3;

}

- (AutocompleteMatchInfo)handleMatchInfo
{
  return (AutocompleteMatchInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_handleMatchInfo));
}

- (void)setHandleMatchInfo:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_handleMatchInfo);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_handleMatchInfo) = (Class)a3;
  v3 = a3;

}

- (BOOL)placeSummaryShowsStackedIconsAndLabels
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_placeSummaryShowsStackedIconsAndLabels);
}

- (void)setPlaceSummaryShowsStackedIconsAndLabels:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_placeSummaryShowsStackedIconsAndLabels) = a3;
}

- (NSString)locationString
{
  return (NSString *)sub_10001B1D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_locationString);
}

- (NSString)locationJustNowString
{
  return (NSString *)sub_10001B1D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_locationJustNowString);
}

- (NSString)locationJustNowForPin
{
  return (NSString *)sub_10001B1D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_locationJustNowForPin);
}

- (NSString)noSharedLocationString
{
  return (NSString *)sub_10001B1D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_noSharedLocationString);
}

+ (NSString)sharedLocationLabelIdentifier
{
  uint64_t v2;
  NSString v3;

  if (qword_101491140 != -1)
    swift_once(&qword_101491140, sub_1001EEDD0);
  v2 = unk_1014D50D0;
  swift_bridgeObjectRetain(unk_1014D50D0);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtC4Maps22MapsAutocompletePerson)initWithContact:(id)a3 contactMatchInfo:(id)a4 handle:(id)a5 handleMatchInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC4Maps22MapsAutocompletePerson *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (_TtC4Maps22MapsAutocompletePerson *)sub_1001F10E0(a3, a4, a5, a6);

  return v14;
}

- (NSString)title
{
  _TtC4Maps22MapsAutocompletePerson *v2;
  id v3;

  v2 = self;
  v3 = sub_1001EEFA0();

  return (NSString *)v3;
}

- (NSString)description
{
  return (NSString *)sub_1001EE654(self, (uint64_t)a2, (void (*)(void))sub_1001EF0A4);
}

- (NSURL)openFindMyURL
{
  _TtC4Maps22MapsAutocompletePerson *v2;
  id v3;

  v2 = self;
  v3 = sub_1001EF3D4();

  return (NSURL *)v3;
}

- (NSURL)requestLocationURL
{
  _TtC4Maps22MapsAutocompletePerson *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1001EF510();
  v4 = v3;

  return (NSURL *)v4;
}

- (BOOL)canShowRequestLocation
{
  _TtC4Maps22MapsAutocompletePerson *v2;
  void *v3;
  void *v4;

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contact))
    return 0;
  v2 = self;
  sub_1001EF510();
  v4 = v3;

  if (!v4)
    return 0;

  return 1;
}

- (BOOL)canShowOpenFindMy
{
  _TtC4Maps22MapsAutocompletePerson *v2;
  char v3;

  v2 = self;
  v3 = sub_1001EF990();

  return v3 & 1;
}

- (id)locationTimestampString:(BOOL)a3
{
  _TtC4Maps22MapsAutocompletePerson *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v4 = self;
  sub_1001EFA14(a3);
  v6 = v5;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (NSString)subTitle
{
  _TtC4Maps22MapsAutocompletePerson *v2;
  NSString v3;

  v2 = self;
  v3 = sub_1001EFC78();

  return (NSString *)v3;
}

- (NSString)identifier
{
  return (NSString *)sub_1001EE654(self, (uint64_t)a2, (void (*)(void))sub_1001EFDB8);
}

- (id)updatedContactFrom:(id)a3
{
  id v4;
  _TtC4Maps22MapsAutocompletePerson *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1001EFF54(v4);

  return v6;
}

- (id)contactPrioritizingWithAddressFor:(id)a3 kind:(unsigned int)a4 cnLabelValueIdentifier:(id)a5 followedBy:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _TtC4Maps22MapsAutocompletePerson *v15;
  id v16;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v12 = v11;
  v13 = a3;
  v14 = a6;
  v15 = self;
  v16 = sub_1001F04F8(v13, a4, v10, v12, a6);

  swift_bridgeObjectRelease(v12);
  return v16;
}

- (id)copyWithZone:(void *)a3
{
  _TtC4Maps22MapsAutocompletePerson *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD v8[3];
  uint64_t v9;

  v3 = self;
  sub_1001F0C00(v8);

  v4 = v9;
  v5 = sub_10000BE88(v8, v9);
  v6 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v5, v4);
  sub_10000BEAC(v8);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t ObjectType;
  _TtC4Maps22MapsAutocompletePerson *v6;
  _TtC4Maps22MapsAutocompletePerson *v7;
  void *v8;
  BOOL v9;
  void *v11;
  _BYTE v12[24];
  uint64_t v13;
  _OWORD v14[2];

  ObjectType = swift_getObjectType();
  if (a3)
  {
    v6 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v14);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    v7 = self;
  }
  sub_1000110D4((uint64_t)v14, (uint64_t)v12);
  if (!v13)
  {
    sub_10000C180((uint64_t)v12);
    goto LABEL_8;
  }
  if ((swift_dynamicCast(&v11, v12, (char *)&type metadata for Any + 8, ObjectType, 6) & 1) == 0)
  {
LABEL_8:

    v9 = 0;
    goto LABEL_9;
  }
  v8 = v11;
  v9 = sub_1001F13D0((uint64_t)v11, (uint64_t)self);

LABEL_9:
  sub_10000C180((uint64_t)v14);
  return v9;
}

- (_TtC4Maps22MapsAutocompletePerson)init
{
  _TtC4Maps22MapsAutocompletePerson *result;

  result = (_TtC4Maps22MapsAutocompletePerson *)_swift_stdlib_reportUnimplementedInitializer("Maps.MapsAutocompletePerson", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->contact[OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_locationString]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->contact[OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_locationJustNowString]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->contact[OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_locationJustNowForPin]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->contact[OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_noSharedLocationString]);
}

@end
