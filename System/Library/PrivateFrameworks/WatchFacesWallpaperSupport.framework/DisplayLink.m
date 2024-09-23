@implementation DisplayLink

- (void)_displayLinkFired
{
  unsigned __int8 *delegate;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;

  delegate = self->delegate;
  swift_beginAccess();
  if (MEMORY[0x24BD0C63C](delegate))
  {
    v4 = *(_QWORD *)&self->delegate[8];
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8);
    v7 = swift_retain();
    v6(v7, ObjectType, v4);
    swift_release();
    swift_unknownObjectRelease();
  }
}

@end
