@implementation TTRReminderCopyPasteItem

- (_TtC15RemindersUICore24TTRReminderCopyPasteItem)init
{
  _TtC15RemindersUICore24TTRReminderCopyPasteItem *result;

  result = (_TtC15RemindersUICore24TTRReminderCopyPasteItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B41EB4E0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore24TTRReminderCopyPasteItem_metadata), *(_QWORD *)&self->metadata[OBJC_IVAR____TtC15RemindersUICore24TTRReminderCopyPasteItem_metadata]);
  sub_1B41EB4E0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore24TTRReminderCopyPasteItem_storages), *(_QWORD *)&self->metadata[OBJC_IVAR____TtC15RemindersUICore24TTRReminderCopyPasteItem_storages]);
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15RemindersUICore24TTRReminderCopyPasteItem *v5;

  v4 = a3;
  v5 = self;
  TTRReminderCopyPasteItem.encode(with:)((NSCoder)v4);

}

- (_TtC15RemindersUICore24TTRReminderCopyPasteItem)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore24TTRReminderCopyPasteItem *)TTRReminderCopyPasteItem.init(coder:)(a3);
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void *v5;
  _TtC15RemindersUICore24TTRReminderCopyPasteItem *v6;
  void *v7;

  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = self;
  v7 = (void *)sub_1B4621AE8((uint64_t)v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  return v7;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4ED110);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1B4911D70;
  if (qword_1ED4E5A88 != -1)
    swift_once();
  v1 = *(_QWORD *)algn_1ED4F1ED8;
  *(_QWORD *)(v0 + 32) = static TTRReminderCopyPasteItem.pasteboardTypeString;
  *(_QWORD *)(v0 + 40) = v1;
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  v2 = (void *)sub_1B4906DA0();
  swift_bridgeObjectRelease();
  return v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = sub_1B4903710();
  v10 = v9;

  swift_getObjCClassMetadata();
  v11 = sub_1B4621C40();
  sub_1B41EB4E0(v8, v10);
  return v11;
}

@end
