@implementation GenerativeStoryPPTTests

- (void)testNavigatingToMemoryCreationView
{
  uint64_t v3;
  void (*v4)(void *, uint64_t);
  GenerativeStoryPPTTests *v5;

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v4 = *(void (**)(void *, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0x58);
  v5 = self;
  v4(&unk_1EE8DBC80, v3);

  swift_release();
}

@end
