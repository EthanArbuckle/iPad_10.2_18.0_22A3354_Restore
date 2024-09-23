@implementation PASUIDependentViewPresenter

- (PASUIDependentViewPresenterDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  return (PASUIDependentViewPresenterDelegate *)(id)MEMORY[0x227665880](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)shouldSignInForSelf
{
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t (*v5)(uint64_t, uint64_t);
  PASUIDependentViewPresenter *v6;
  char v7;

  v3 = *(_QWORD *)&self->delegate[OBJC_IVAR___PASUIDependentViewPresenter_flowController];
  ObjectType = swift_getObjectType();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 40);
  v6 = self;
  v7 = v5(ObjectType, v3);

  return v7 & 1;
}

- (void)setShouldSignInForSelf:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(_BOOL8, uint64_t, uint64_t);
  PASUIDependentViewPresenter *v8;

  v3 = a3;
  v5 = *(_QWORD *)&self->delegate[OBJC_IVAR___PASUIDependentViewPresenter_flowController];
  ObjectType = swift_getObjectType();
  v7 = *(void (**)(_BOOL8, uint64_t, uint64_t))(v5 + 48);
  v8 = self;
  v7(v3, ObjectType, v5);

}

- (PASUIDependentViewPresenter)init
{
  return (PASUIDependentViewPresenter *)PASUITargetViewPresenter.init()();
}

- (void)dealloc
{
  PASUIDependentViewPresenter *v2;

  v2 = self;
  PASUITargetViewPresenter.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_220D671D8((uint64_t)self + OBJC_IVAR___PASUIDependentViewPresenter_delegate);
  swift_unknownObjectRelease();
  sub_220D5D018((uint64_t)self + OBJC_IVAR___PASUIDependentViewPresenter_navigationController, &qword_25564AC28);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)activateWithTemplateMessageSession:(CUMessageSession *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CUMessageSession *v15;
  PASUIDependentViewPresenter *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25564ADB8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25564ADC0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_220D8240C((uint64_t)v9, (uint64_t)&unk_25564ADC8, (uint64_t)v14);
  swift_release();
}

- (void)activateWithTemplateMessageSession:(CUMessageSession *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CUMessageSession *v15;
  PASUIDependentViewPresenter *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25564AD98;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25564ADA0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_220D8240C((uint64_t)v9, (uint64_t)&unk_25564ADA8, (uint64_t)v14);
  swift_release();
}

- (void)startFlowWithNavigationController:(id)a3
{
  PASUIDependentViewPresenter *v5;
  uint64_t v6;

  type metadata accessor for PASViewControllerPresentationHandler();
  *(_QWORD *)(swift_allocObject() + 16) = a3;
  swift_unknownObjectRetain_n();
  v5 = self;
  v6 = swift_retain();
  sub_220D66020(v6, (uint64_t)v5);
  swift_unknownObjectRelease();

  swift_release_n();
}

- (void)startFlowWithContainerViewController:(id)a3
{
  UIViewController *v4;
  PASUIDependentViewPresenter *v5;

  v4 = (UIViewController *)a3;
  v5 = self;
  PASUITargetViewPresenter.startFlow(withContainerViewController:)(v4);

}

- (void)setTemplateMessageSession:(CUMessageSession *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CUMessageSession *v15;
  PASUIDependentViewPresenter *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25564AD80;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25564AD88;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_220D8240C((uint64_t)v9, (uint64_t)&unk_25564C330, (uint64_t)v14);
  swift_release();
}

- (PASUIDependentViewPresenter)initWithParentViewController:(id)a3
{
  return (PASUIDependentViewPresenter *)PASUITargetViewPresenter.init(parentViewController:)(a3);
}

@end
