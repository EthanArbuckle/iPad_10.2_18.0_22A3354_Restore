@implementation FMAccessoryPairingEmojiSelectionCard

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAccessoryPairingEmojiSelectionCard();
  v4 = (char *)v5.receiver;
  -[FMAccessoryPairingEmojiSelectionCard viewWillAppear:](&v5, "viewWillAppear:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC6FindMy36FMAccessoryPairingEmojiSelectionCard_emojiSelectionView], "becomeFirstResponder", v5.receiver, v5.super_class);

}

- (void)updateButtonState
{
  _TtC6FindMy36FMAccessoryPairingEmojiSelectionCard *v2;

  v2 = self;
  sub_1002D31D4();

}

- (_TtC6FindMy36FMAccessoryPairingEmojiSelectionCard)initWithContentView:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy36FMAccessoryPairingEmojiSelectionCard *v8;
  _TtC6FindMy36FMAccessoryPairingEmojiSelectionCard *v9;
  objc_super v11;

  swift_unknownObjectWeakInit(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy36FMAccessoryPairingEmojiSelectionCard_coordinator]);
  v5 = OBJC_IVAR____TtC6FindMy36FMAccessoryPairingEmojiSelectionCard_emojiSelectionView;
  v6 = objc_allocWithZone((Class)type metadata accessor for FMAccessoryPairingEmojiSelectionTextField());
  v7 = a3;
  v8 = self;
  *(_QWORD *)&self->PRXCardContentViewController_opaque[v5] = objc_msgSend(v6, "init");
  *(_QWORD *)&v8->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy36FMAccessoryPairingEmojiSelectionCard_continueAction] = 0;

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for FMAccessoryPairingEmojiSelectionCard();
  v9 = -[FMAccessoryPairingEmojiSelectionCard initWithContentView:](&v11, "initWithContentView:", v7);

  return v9;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy36FMAccessoryPairingEmojiSelectionCard_coordinator]);

}

@end
