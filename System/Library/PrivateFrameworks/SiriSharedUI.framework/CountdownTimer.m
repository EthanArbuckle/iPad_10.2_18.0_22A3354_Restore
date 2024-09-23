@implementation CountdownTimer

- (void)notifyDelegate
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);

  if (MEMORY[0x1DF0E8588](self->delegate, a2))
  {
    v3 = *(_QWORD *)&self->delegate[8];
    ObjectType = swift_getObjectType();
    v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    swift_retain();
    v5(ObjectType, v3);
    swift_release();
    swift_unknownObjectRelease();
  }
}

@end
