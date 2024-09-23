@implementation PASUIGuardianViewPresenter

- (PASUIGuardianViewPresenterDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  swift_beginAccess();
  return (PASUIGuardianViewPresenterDelegate *)(id)MEMORY[0x227665880](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (PASUIGuardianViewPresenter)initWithSharingViewController:(id)a3
{
  id v3;
  PASUIGuardianViewPresenter *v4;

  v3 = a3;
  v4 = (PASUIGuardianViewPresenter *)sub_220D82650(v3);

  return v4;
}

- (void)dealloc
{
  PASUIGuardianViewPresenter *v2;

  v2 = self;
  PASUISourceViewPresenter.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_220D671D8((uint64_t)self + OBJC_IVAR___PASUIGuardianViewPresenter_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  sub_220D5D018((uint64_t)self + OBJC_IVAR___PASUIGuardianViewPresenter_cardAdapter, &qword_25564C520);
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
  PASUIGuardianViewPresenter *v16;
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
  v13[4] = &unk_25564C508;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25564C510;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_220D8240C((uint64_t)v9, (uint64_t)&unk_25564C518, (uint64_t)v14);
  swift_release();
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
  PASUIGuardianViewPresenter *v16;
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
  v13[4] = &unk_25564C4D8;
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

- (PASUIGuardianViewPresenter)init
{
  PASUIGuardianViewPresenter *result;

  result = (PASUIGuardianViewPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
