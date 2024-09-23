@implementation _UIViewControllerTransitionManager

- (_UIViewControllerTransitionManager)init
{
  objc_class *v3;
  objc_super v5;

  _s17TransitionManagerCMa();
  v3 = (objc_class *)swift_allocObject();
  *((_QWORD *)v3 + 2) = MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionManager_transitionManager) = v3;
  v5.receiver = self;
  v5.super_class = (Class)_UIViewControllerTransitionManager;
  return -[_UIViewControllerTransitionManager init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)configureWithInitialViewControllers:(id)a3
{
  sub_1856B6ED0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1856B637C);
}

- (void)applyViewControllers:(id)a3
{
  sub_1856B6ED0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1856B6514);
}

- (void)performAnimatedTransitionWithRequest:(id)a3
{
  id v4;
  _UIViewControllerTransitionManager *v5;

  v4 = a3;
  v5 = self;
  sub_1856B6F48(v4);

}

@end
