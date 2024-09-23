@implementation ContextActionsPresentationRegistration

- (void)appWillResignActive
{
  if ((*((_BYTE *)&self->super.isa
        + OBJC_IVAR____TtC12NowPlayingUI38ContextActionsPresentationRegistration_showingRealPreview) & 1) == 0)
    objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC12NowPlayingUI38ContextActionsPresentationRegistration_interaction), "dismissMenu");
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC12NowPlayingUI38ContextActionsPresentationRegistration *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = _s12NowPlayingUI38ContextActionsPresentationRegistrationC22contextMenuInteraction_016configurationForI10AtLocationSo09UIContextI13ConfigurationCSgSo0oiJ0C_So7CGPointVtF_0();

  return v7;
}

- (id)contextMenuInteraction:(void *)a3 previewForHighlightingMenuWithConfiguration:(void *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = _s12NowPlayingUI38ContextActionsPresentationRegistrationC22contextMenuInteraction_020previewForDismissingI17WithConfigurationSo17UITargetedPreviewCSgSo09UIContextiJ0C_So0riO0CtF_0();

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC12NowPlayingUI38ContextActionsPresentationRegistration *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_737D0(a5);

  swift_unknownObjectRelease(a5);
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC12NowPlayingUI38ContextActionsPresentationRegistration *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_738BC(v8, a5);

  swift_unknownObjectRelease(a5);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC12NowPlayingUI38ContextActionsPresentationRegistration *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_73AA8(v8, a5);

  swift_unknownObjectRelease(a5);
}

- (_TtC12NowPlayingUI38ContextActionsPresentationRegistration)init
{
  _TtC12NowPlayingUI38ContextActionsPresentationRegistration *result;

  result = (_TtC12NowPlayingUI38ContextActionsPresentationRegistration *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.ContextActionsPresentationRegistration", 51, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI38ContextActionsPresentationRegistration_interaction));
  swift_release(*(_QWORD *)&self->interaction[OBJC_IVAR____TtC12NowPlayingUI38ContextActionsPresentationRegistration_handler]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC12NowPlayingUI38ContextActionsPresentationRegistration_viewController);
}

@end
