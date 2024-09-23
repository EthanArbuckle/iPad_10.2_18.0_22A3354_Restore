@implementation SRSmartRepliesCaptioner

- (NSString)preferredLanguageCode
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12SmartReplies23SRSmartRepliesCaptioner_preferredLanguageCode);
  swift_beginAccess();
  v3 = v2[1];
  if (!v3)
    return (NSString *)0;
  v4 = *v2;
  swift_bridgeObjectRetain();
  v5 = (void *)MEMORY[0x24957DF1C](v4, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setPreferredLanguageCode:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12SmartReplies23SRSmartRepliesCaptioner_preferredLanguageCode);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)friendlyCaptionFor:(id)a3 onComplete:(id)a4
{
  void *v4;

  v4 = _Block_copy(a4);
  _Block_release(v4);
}

- (void)captionsWithLinkMetadata:(id)a3 onComplete:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC12SmartReplies23SRSmartRepliesCaptioner *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  specialized SRSmartRepliesCaptioner.simpleCaptions(for:onComplete:)(v8, (uint64_t)v9, (uint64_t (*)(uint64_t))thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray?) -> ()partial apply, v7);

  swift_release();
}

- (void)summaryCaptionsFor:(id)a3 withTopicsOnly:(BOOL)a4 preferBusinessTopics:(BOOL)a5 onComplete:(id)a6
{
  _BOOL4 v7;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC12SmartReplies23SRSmartRepliesCaptioner *v13;

  v7 = a4;
  v9 = _Block_copy(a6);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;
  _Block_copy(v9);
  v13 = self;
  specialized SRSmartRepliesCaptioner.summaryCaptions(for:withTopicsOnly:preferBusinessTopics:onComplete:)(v10, v12, v7, a5, v13, (uint64_t)v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)summaryCaptionsFor:(id)a3 withTopicsOnly:(BOOL)a4 onComplete:(id)a5
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, _BOOL8, _QWORD, uint64_t (*)(), uint64_t);
  _TtC12SmartReplies23SRSmartRepliesCaptioner *v13;

  v5 = a4;
  v7 = _Block_copy(a5);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = *(void (**)(uint64_t, uint64_t, _BOOL8, _QWORD, uint64_t (*)(), uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xE8);
  v13 = self;
  v12(v8, v10, v5, 0, thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray?) -> ()partial apply, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)captionsWithText:(id)a3 preferBusinessTopics:(BOOL)a4 onComplete:(id)a5
{
  void *v6;
  _TtC12SmartReplies23SRSmartRepliesCaptioner *v7;

  v6 = _Block_copy(a5);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = self;
  SRSmartRepliesCaptioner.captions(text:preferBusinessTopics:onComplete:)();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)captionsWithText:(id)a3 onComplete:(id)a4
{
  void *v5;
  _TtC12SmartReplies23SRSmartRepliesCaptioner *v6;

  v5 = _Block_copy(a4);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  v6 = self;
  SRSmartRepliesCaptioner.captions(text:onComplete:)();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)unifiedImageCaptionFor:(id)a3 onComplete:(id)a4
{
  void *v6;
  _TtC12SmartReplies23SRSmartRepliesCaptioner *v7;

  v6 = _Block_copy(a4);
  if (a3)
  {
    type metadata accessor for SRSmartRepliesCaption();
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  _Block_copy(v6);
  v7 = self;
  specialized SRSmartRepliesCaptioner.unifiedImageCaption(for:onComplete:)((unint64_t)a3, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)captionsWithImageURL:(id)a3 onComplete:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC12SmartReplies23SRSmartRepliesCaptioner *v13;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = type metadata accessor for URL();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  _Block_copy(v10);
  v13 = self;
  specialized SRSmartRepliesCaptioner.captions(imageURL:onComplete:)((uint64_t)v9, v13, (void (**)(_QWORD, _QWORD))v10);
  _Block_release(v10);
  _Block_release(v10);

  outlined destroy of Any?((uint64_t)v9, (uint64_t *)&demangling cache variable for type metadata for URL?);
}

- (void)captionsWithImageURLs:(id)a3 onComplete:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  _TtC12SmartReplies23SRSmartRepliesCaptioner *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  if (a3)
  {
    type metadata accessor for URL();
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = self;
  _Block_copy(v10);
  if ((SRSmartRepliesCaptioner.languageIsAppropriateForImageCaptioning()() & 1) != 0)
  {
    v13 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = v12;
    v14[5] = a3;
    v14[6] = thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray?) -> ()partial apply;
    v14[7] = v11;
    swift_bridgeObjectRetain();
    swift_retain();
    v12 = v12;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in SRSmartRepliesCaptioner.captions(imageURLs:onComplete:)partial apply, (uint64_t)v14);
    swift_release();
  }
  else
  {
    (*((void (**)(void *, _QWORD))v10 + 2))(v10, 0);
  }
  swift_release();
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

- (void)captionsWithImage:(CGImage *)a3 onComplete:(id)a4
{
  void *v6;
  CGImage *v7;
  _TtC12SmartReplies23SRSmartRepliesCaptioner *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  specialized SRSmartRepliesCaptioner.captions(image:onComplete:)(a3, v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

+ (BOOL)looksLikePhoneShortCodeWithHandle:(id)a3
{
  char v3;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v3 = String.looksLikeAPhoneShortCode.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (id)normalizedShortCodeMessageTextWithContactDetail:(id)a3 originalMessageText:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _TtC12SmartReplies23SRSmartRepliesCaptioner *v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  void *v15;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  v14 = SRSmartRepliesCaptioner.normalizedShortCodeMessageText(contactDetail:originalMessageText:)(v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15 = (void *)MEMORY[0x24957DF1C](v14._countAndFlagsBits, v14._object);
  swift_bridgeObjectRelease();
  return v15;
}

- (void)captionsWithContactDetail:(id)a3 associatedText:(id)a4 onComplete:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _TtC12SmartReplies23SRSmartRepliesCaptioner *v18;
  uint64_t v19;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;
  if (a4)
    a4 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v11;
  v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v12;
  v17[5] = v14;
  v17[6] = self;
  v17[7] = a4;
  v17[8] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray?) -> ();
  v17[9] = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  v18 = self;
  swift_bridgeObjectRetain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v10, (uint64_t)&closure #1 in SRSmartRepliesCaptioner.captions(contactDetail:associatedText:onComplete:)partial apply, (uint64_t)v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (_TtC12SmartReplies23SRSmartRepliesCaptioner)init
{
  _QWORD *v2;
  _QWORD *v3;
  objc_super v5;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies23SRSmartRepliesCaptioner_preferredLanguageCode);
  *v2 = 0;
  v2[1] = 0;
  *(_OWORD *)((char *)&self->super.isa
            + OBJC_IVAR____TtC12SmartReplies23SRSmartRepliesCaptioner____lazy_storage___captionPhraseArbiter) = xmmword_247656A10;
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12SmartReplies23SRSmartRepliesCaptioner____lazy_storage___shortcodeResolutionManager);
  *v3 = 0;
  v3[1] = 0;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC12SmartReplies23SRSmartRepliesCaptioner____lazy_storage___predictionExemptTermsDetector) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SRSmartRepliesCaptioner();
  return -[SRSmartRepliesCaptioner init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  outlined consume of CaptionPhraseResolver?(*(uint64_t *)((char *)&self->super.isa
                                                        + OBJC_IVAR____TtC12SmartReplies23SRSmartRepliesCaptioner____lazy_storage___captionPhraseArbiter));
  outlined consume of ShortcodeResolutionManager?(*(uint64_t *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12SmartReplies23SRSmartRepliesCaptioner____lazy_storage___shortcodeResolutionManager));
}

@end
