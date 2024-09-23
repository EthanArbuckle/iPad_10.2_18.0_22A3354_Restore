@implementation SharedAlbumsInvitationsViewModel

- (void)feedSectionInfosManager:(id)a3 sectionInfosDidChange:(id)a4
{
  void (*v5)(uint64_t);
  id v6;
  id v7;
  uint64_t v8;

  v5 = (void (*)(uint64_t))*((_QWORD *)self->super.isa + 35);
  v6 = a3;
  v7 = a4;
  v8 = sub_1A7ADBF34();
  v5(v8);

  swift_release();
}

@end
