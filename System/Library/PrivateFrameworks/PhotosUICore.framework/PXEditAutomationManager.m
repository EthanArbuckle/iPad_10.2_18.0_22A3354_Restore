@implementation PXEditAutomationManager

- (void)dealloc
{
  _QWORD *v2;
  uint64_t (*v3)(void);
  _TtC12PhotosUICore23PXEditAutomationManager *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v8;

  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x60);
  v4 = self;
  v5 = v3();
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    objc_msgSend(v7, sel_removeObserver_, v6);

    (*(void (**)(_QWORD))((*v2 & (uint64_t)v4->super.isa) + 0x68))(0);
    swift_unknownObjectRelease();
  }
  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for PXEditAutomationManager();
  -[PXEditAutomationManager dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1A688D368((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore23PXEditAutomationManager__automationDelegate);
}

- (_TtC12PhotosUICore23PXEditAutomationManager)init
{
  _TtC12PhotosUICore23PXEditAutomationManager *result;

  result = (_TtC12PhotosUICore23PXEditAutomationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
