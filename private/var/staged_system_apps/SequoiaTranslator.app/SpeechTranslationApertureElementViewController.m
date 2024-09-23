@implementation SpeechTranslationApertureElementViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  _TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController *v4;

  v4 = self;
  sub_100176BE0(a3);

}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_preferredLayoutMode) = (Class)a3;
}

- (unint64_t)presentationBehaviors
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_presentationBehaviors);
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_presentationBehaviors) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_maximumLayoutMode) = (Class)a3;
}

- (NSString)associatedScenePersistenceIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->currentActivity[OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_associatedScenePersistenceIdentifier];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->currentActivity[OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_associatedScenePersistenceIdentifier]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setAssociatedScenePersistenceIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_associatedScenePersistenceIdentifier);
  v7 = *(_QWORD *)&self->currentActivity[OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_associatedScenePersistenceIdentifier];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (BOOL)preventsInteractiveDismissal
{
  return 0;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_minimalView));
}

- (_TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController *)sub_100176E38(v5, v7, a4);
}

- (_TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100177B74();
}

- (void)viewDidLoad
{
  _TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController *v2;

  v2 = self;
  sub_100177190();

}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  _TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100177DA8();
  swift_unknownObjectRelease(a3);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[6];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SpeechTranslationApertureElementViewController();
  swift_unknownObjectRetain(a3);
  v4 = v8.receiver;
  -[SpeechTranslationApertureElementViewController preferredContentSizeDidChangeForChildContentContainer:](&v8, "preferredContentSizeDidChangeForChildContentContainer:", a3);
  v5 = objc_msgSend(v4, "systemApertureElementContext");
  v7[4] = nullsub_1;
  v7[5] = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_100075908;
  v7[3] = &unk_10026F388;
  v6 = _Block_copy(v7);
  objc_msgSend(v5, "setElementNeedsUpdateWithCoordinatedAnimations:", v6);
  _Block_release(v6);
  swift_unknownObjectRelease(a3);

  swift_unknownObjectRelease(v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_currentActivity));
  swift_bridgeObjectRelease(*(_QWORD *)&self->currentActivity[OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_associatedScenePersistenceIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_minimalView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_hostingController));
}

@end
