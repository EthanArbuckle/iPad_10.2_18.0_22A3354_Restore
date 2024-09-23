@implementation SynapseLinkView

- (_TtC8PaperKit15SynapseLinkView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized SynapseLinkView.init(coder:)();
}

- (void)didMoveToWindow
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SynapseLinkView();
  v2 = (char *)v4.receiver;
  -[SynapseLinkView didMoveToWindow](&v4, sel_didMoveToWindow);
  v3 = objc_msgSend(v2, sel_window, v4.receiver, v4.super_class);

  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)&v2[OBJC_IVAR____TtC8PaperKit15SynapseLinkView_synapseLink]+ OBJC_IVAR____TtC8PaperKit15SynapseLinkItem_synapseItem), sel_loadFullPreviewIfNeeded);

}

- (void)layoutSubviews
{
  _TtC8PaperKit15SynapseLinkView *v2;

  v2 = self;
  SynapseLinkView.layoutSubviews()();

}

- (id)_contextMenuActionsForLinkView:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  id v8;
  _TtC8PaperKit15SynapseLinkView *v9;
  uint64_t v10;
  id v11;
  _TtC8PaperKit15SynapseLinkView *v12;
  Class isa;

  v5 = (char *)self + OBJC_IVAR____TtC8PaperKit8LinkView_delegate;
  if (!MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit8LinkView_delegate, a2))
  {
    v11 = a3;
    v12 = self;
    goto LABEL_5;
  }
  v6 = *((_QWORD *)v5 + 1);
  swift_getObjectType();
  v7 = *(uint64_t (**)(void))(v6 + 8);
  v8 = a3;
  v9 = self;
  v10 = v7();
  swift_unknownObjectRelease();
  if (!v10)
  {
LABEL_5:

    swift_bridgeObjectRelease();
    goto LABEL_6;
  }

LABEL_6:
  type metadata accessor for UIAction();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (BOOL)_wantsContextMenuPreviewForLinkView:(id)a3
{
  id v4;
  _TtC8PaperKit15SynapseLinkView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = specialized SynapseLinkView._wantsContextMenuPreview(for:)();

  return self & 1;
}

- (void)linkViewNeedsResize:(id)a3
{
  LPLinkView *v4;
  _TtC8PaperKit15SynapseLinkView *v5;

  v4 = (LPLinkView *)a3;
  v5 = self;
  SynapseLinkView.linkViewNeedsResize(_:)(v4);

}

- (_TtC8PaperKit15SynapseLinkView)init
{
  _TtC8PaperKit15SynapseLinkView *result;

  result = (_TtC8PaperKit15SynapseLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit15SynapseLinkView____lazy_storage___linkPresentationView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit15SynapseLinkView_synapseLink));
  swift_unknownObjectWeakDestroy();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC8PaperKit15SynapseLinkView *v8;
  id v9;
  id v10;
  id v11;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = SynapseLinkView.linkPresentationView.getter();
  v10 = objc_msgSend(v9, sel__contextMenuInteractionDelegate);

  if (v10)
  {
    v11 = objc_msgSend(v10, sel_contextMenuInteraction_configurationForMenuAtLocation_, v7, x, y);

    swift_unknownObjectRelease();
  }
  else
  {

    v11 = 0;
  }
  return v11;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  _TtC8PaperKit15SynapseLinkView *v9;
  id v10;
  id v11;
  id v12;

  v8 = a3;
  v12 = a4;
  v9 = self;
  swift_unknownObjectRetain();
  v10 = SynapseLinkView.linkPresentationView.getter();
  v11 = objc_msgSend(v10, sel__contextMenuInteractionDelegate);

  if (v11)
  {
    if ((objc_msgSend(v11, sel_respondsToSelector_, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_) & 1) != 0)objc_msgSend(v11, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, v8, v12, a5);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();

  }
}

@end
