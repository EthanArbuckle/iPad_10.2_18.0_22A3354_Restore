@implementation UIKeyboardCandidateSceneHostingController

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___UIKeyboardCandidateSceneHostingController_sceneHostingController));
  sub_18563E558((uint64_t)self + OBJC_IVAR___UIKeyboardCandidateSceneHostingController_delegate);
  swift_bridgeObjectRelease();
}

- (UIKeyboardCandidateSceneHostingController)initWithDelegate:(id)a3
{
  UIKeyboardCandidateSceneHostingController *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___UIKeyboardCandidateSceneHostingController_sceneHostingController) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___UIKeyboardCandidateSceneHostingController_sceneConfigurationObservables) = (Class)MEMORY[0x1E0DEE9D8];
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardCandidateSceneHostingController;
  swift_unknownObjectRetain();
  v4 = -[UIKeyboardCandidateSceneHostingController init](&v6, sel_init);
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v4;
}

- (void)setupSceneHosting
{
  UIKeyboardCandidateSceneHostingController *v2;

  v2 = self;
  UIKeyboardCandidateSceneHostingController.setupSceneHosting()();

}

- (BOOL)isExpanded
{
  UIKeyboardCandidateSceneHostingController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = UIKeyboardCandidateSceneHostingController.isExpanded()();

  return v3;
}

- (void)setHostIsTextVertical:(BOOL)a3
{
  UIKeyboardCandidateSceneHostingController *v4;

  v4 = self;
  UIKeyboardCandidateSceneHostingController.setHostIsTextVertical(_:)(a3);

}

- (UIKeyboardCandidateSceneHostingController)init
{
  UIKeyboardCandidateSceneHostingController *result;

  result = (UIKeyboardCandidateSceneHostingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
