@implementation TVRUITipManager

- (BOOL)isPresentingTip
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVRUITipManager_tipsViewController) != 0;
}

- (TVRUITipManager)initWithTipSourceViewProvider:(id)a3 tipType:(int64_t)a4
{
  return (TVRUITipManager *)TVRUITipManager.init(tipSourceViewProvider:tipType:)(a3, a4);
}

- (void)activate
{
  TVRUITipManager *v2;

  v2 = self;
  TVRUITipManager.activate()();

}

- (void)invalidate:(BOOL)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)();
  TVRUITipManager *v9;

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v8 = _sIeyB_Ieg_TRTA_0;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = self;
  specialized TVRUITipManager.invalidate(_:completion:)((uint64_t)v8, v7);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed FMR1HapticPattern?, @in_guaranteed Any?) -> ())?((uint64_t)v8);

}

- (void)dealloc
{
  TVRUITipManager *v2;

  v2 = self;
  TVRUITipManager.deinit();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___TVRUITipManager_tip);
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___TVRUITipManager____lazy_storage___popoverPresentationConductor));
}

- (TVRUITipManager)init
{
  TVRUITipManager *result;

  result = (TVRUITipManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
