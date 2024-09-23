@implementation AppExtensionHostView.HostCoordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4;
  _TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2491B1688(v4);

}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  void *v6;
  _TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator *v7;
  id v8;
  void (*v9)(_QWORD);
  id v10;

  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_connection);
  v10 = a3;
  v7 = self;
  v8 = a4;
  objc_msgSend(v6, sel_invalidate);
  v9 = *(void (**)(_QWORD))((char *)&v7->super.isa
                                     + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_remoteConnectionDidChange);
  if (v9)
  {
    swift_retain();
    v9(0);
    sub_2491B32D0((uint64_t)v9);
  }

}

- (_TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator)init
{
  _TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator *result;

  result = (_TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2491B32E0((uint64_t)self + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_parent, type metadata accessor for AppExtensionHostView);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_connection));
  sub_2491B32D0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_remoteConnectionDidChange));
  sub_2491B3378((uint64_t)self + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_identity, (uint64_t *)&unk_2578537E0);
}

@end
