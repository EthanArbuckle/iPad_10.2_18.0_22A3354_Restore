@implementation SearchCollectionViewCellRegistrationFactory

- (void)getRichLinkMetadataForRichLinkID:(id)a3 messageID:(id)a4 handler:(id)a5
{
  id v6;
  id v7;
  _TtC10MobileMail43SearchCollectionViewCellRegistrationFactory *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v12 = _Block_copy(a5);
  v8 = self;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = v9;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v10;
  v15 = swift_allocObject(&unk_10052DBC0, 24, 7);
  *(_QWORD *)(v15 + 16) = v12;
  sub_1003290E4(v14, v18, v13, v16, (uint64_t)sub_10031A2F8, v15);
  swift_release();
  swift_bridgeObjectRelease(v16);

  swift_bridgeObjectRelease(v18);
}

- (_TtC10MobileMail43SearchCollectionViewCellRegistrationFactory)init
{
  return (_TtC10MobileMail43SearchCollectionViewCellRegistrationFactory *)sub_100329384();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail43SearchCollectionViewCellRegistrationFactory_contactStore));
  sub_1001ED890((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC10MobileMail43SearchCollectionViewCellRegistrationFactory_contactKeys));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail43SearchCollectionViewCellRegistrationFactory_suggestionHighlightedTextColor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail43SearchCollectionViewCellRegistrationFactory_suggestionTextColor));
  swift_release();
}

@end
