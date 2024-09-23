@implementation ShazamEventsService

- (SHServiceDelegate)serviceDelegate
{
  return (SHServiceDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setServiceDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12ShazamEvents19ShazamEventsService_underlyingServiceDelegate) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

+ (id)machServiceName
{
  return (id)sub_22799F10C();
}

- (void)liveMusicEventWithEventID:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _TtC12ShazamEvents19ShazamEventsService *v17;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255905B38);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = sub_22799F118();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v9;
  v14 = sub_22799F1FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
  v15 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12ShazamEvents19ShazamEventsService_liveMusicEventFetcher);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v15;
  v16[5] = v10;
  v16[6] = v12;
  v16[7] = sub_22798C6D0;
  v16[8] = v13;
  v17 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22798ADE0((uint64_t)v8, (uint64_t)&unk_255905C28, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)liveMusicScheduleWithArtistID:(id)a3 startDate:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _TtC12ShazamEvents19ShazamEventsService *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (**v28)();
  _TtC12ShazamEvents19ShazamEventsService *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  _TtC12ShazamEvents19ShazamEventsService *v35;

  v35 = self;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255905B38);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = v8;
  v32 = sub_22799F034();
  v9 = *(_QWORD *)(v32 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](v32);
  v12 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v30 - v13;
  v15 = _Block_copy(a5);
  v16 = sub_22799F118();
  v30 = v17;
  v31 = v16;
  v34 = v14;
  sub_22799F01C();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v15;
  v19 = sub_22799F1FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 1, 1, v19);
  v20 = v35;
  v21 = *(uint64_t *)((char *)&v35->super.isa + OBJC_IVAR____TtC12ShazamEvents19ShazamEventsService_liveMusicEventFetcher);
  v22 = v32;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v32);
  v23 = (*(unsigned __int8 *)(v9 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v24 = (v10 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  v25 = (char *)swift_allocObject();
  *((_QWORD *)v25 + 2) = 0;
  *((_QWORD *)v25 + 3) = 0;
  v27 = v30;
  v26 = v31;
  *((_QWORD *)v25 + 4) = v21;
  *((_QWORD *)v25 + 5) = v26;
  *((_QWORD *)v25 + 6) = v27;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v25[v23], v12, v22);
  v28 = (uint64_t (**)())&v25[v24];
  *v28 = sub_22798C870;
  v28[1] = (uint64_t (*)())v18;
  v29 = v20;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22798ADE0((uint64_t)v33, (uint64_t)&unk_255905C20, (uint64_t)v25);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v34, v22);
}

- (void)liveMusicScheduleWithVenueID:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _TtC12ShazamEvents19ShazamEventsService *v17;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255905B38);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = sub_22799F118();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v9;
  v14 = sub_22799F1FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
  v15 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12ShazamEvents19ShazamEventsService_liveMusicEventFetcher);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v15;
  v16[5] = v10;
  v16[6] = v12;
  v16[7] = sub_22798C870;
  v16[8] = v13;
  v17 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22798ADE0((uint64_t)v8, (uint64_t)&unk_255905C18, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)shutdownService
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _TtC12ShazamEvents19ShazamEventsService *v9;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255905B38);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22799F1FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12ShazamEvents19ShazamEventsService_liveMusicEventFetcher);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v7;
  v9 = self;
  swift_retain();
  sub_22798ADE0((uint64_t)v5, (uint64_t)&unk_255905C10, (uint64_t)v8);

  swift_release();
}

- (_TtC12ShazamEvents19ShazamEventsService)init
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC12ShazamEvents19ShazamEventsService *v5;
  objc_class *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC12ShazamEvents19ShazamEventsService_liveMusicEventFetcher;
  type metadata accessor for LiveMusicEventFetcher();
  swift_allocObject();
  v5 = self;
  sub_227959918();
  *(Class *)((char *)&self->super.isa + v4) = v6;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC12ShazamEvents19ShazamEventsService_underlyingServiceDelegate) = 0;

  v8.receiver = v5;
  v8.super_class = ObjectType;
  return -[ShazamEventsService init](&v8, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

@end
