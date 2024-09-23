@implementation TUITextCompositionClientWrapper

- (_TtC11TextInputUI31TUITextCompositionClientWrapper)init
{
  id v3;
  _TtC11TextInputUI31TUITextCompositionClientWrapper *v4;
  objc_class *v5;
  objc_super v7;

  v3 = objc_allocWithZone((Class)sub_18C802AB8());
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC11TextInputUI31TUITextCompositionClientWrapper_textCompositionClient) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for TUITextCompositionClientWrapper();
  return -[TUITextCompositionClientWrapper init](&v7, sel_init);
}

- (unint64_t)generateRequestToken
{
  id v3;
  _TtC11TextInputUI31TUITextCompositionClientWrapper *v4;
  id v5;
  id v6;

  v3 = objc_allocWithZone(MEMORY[0x1E0DBDAA0]);
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  v6 = objc_msgSend(v5, sel_nextToken);

  return (unint64_t)v6;
}

+ (BOOL)isGMAvailableWithUseCase:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = sub_18C802B78();
  v5 = _s11TextInputUI31TUITextCompositionClientWrapperC13isGMAvailable7useCaseSbSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

+ (BOOL)isGMAvailableForMessagesReply
{
  uint64_t ObjCClassMetadata;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  return (*(uint64_t (**)(unint64_t, unint64_t))(ObjCClassMetadata + 96))(0xD00000000000001DLL, 0x800000018C80CF00) & 1;
}

+ (BOOL)isGMAvailableForMailReply
{
  uint64_t ObjCClassMetadata;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  return (*(uint64_t (**)(unint64_t, unint64_t))(ObjCClassMetadata + 96))(0xD000000000000019, 0x800000018C80CF20) & 1;
}

+ (BOOL)isGMAvailableForMailReplyLongFormBasic
{
  uint64_t ObjCClassMetadata;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  return (*(uint64_t (**)(unint64_t, unint64_t))(ObjCClassMetadata + 96))(0xD000000000000026, 0x800000018C80CF40) & 1;
}

- (void)requestSmartRepliesWithInputContextHistory:(id)a3 shortForm:(BOOL)a4 clientID:(id)a5 threadIdentifier:(id)a6 candidateString:(id)a7 options:(id)a8 completion:(id)aBlock
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _TtC11TextInputUI31TUITextCompositionClientWrapper *v23;
  _BOOL4 v25;

  v25 = a4;
  v10 = _Block_copy(aBlock);
  v11 = sub_18C802B78();
  v13 = v12;
  v14 = sub_18C802B78();
  v16 = v15;
  v17 = sub_18C802B78();
  v19 = v18;
  v20 = sub_18C802B54();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v10;
  v22 = a3;
  v23 = self;
  TUITextCompositionClientWrapper.requestSmartReplies(inputContextHistory:shortForm:clientID:threadIdentifier:candidateString:options:completion:)(v22, v25, v11, v13, v14, v16, v17, v19, v20, (uint64_t)sub_18C7978B4, v21);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)cancelRequestWithToken:(unint64_t)a3
{
  _TtC11TextInputUI31TUITextCompositionClientWrapper *v4;

  v4 = self;
  TUITextCompositionClientWrapper.cancelRequest(token:)(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11TextInputUI31TUITextCompositionClientWrapper_textCompositionClient));
}

@end
