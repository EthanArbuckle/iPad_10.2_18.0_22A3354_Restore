@implementation AppStoreNotificationListener

- (void)becameActive:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t v11;

  v4 = sub_1B1371C68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371C5C();
  v8 = *(void **)self->theLock;
  swift_retain();
  objc_msgSend(v8, sel_lock);
  if (MEMORY[0x1B5E1B0F0](self->lifecycleDelegate))
  {
    v9 = *(_QWORD *)&self->lifecycleDelegate[8];
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(ObjectType, v9);
    swift_unknownObjectRelease();
  }
  objc_msgSend(v8, sel_unlock);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)resignActive:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t v11;

  v4 = sub_1B1371C68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371C5C();
  v8 = *(void **)self->theLock;
  swift_retain();
  objc_msgSend(v8, sel_lock);
  if (MEMORY[0x1B5E1B0F0](self->lifecycleDelegate))
  {
    v9 = *(_QWORD *)&self->lifecycleDelegate[8];
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(ObjectType, v9);
    swift_unknownObjectRelease();
  }
  objc_msgSend(v8, sel_unlock);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)backgrounded:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t v11;

  v4 = sub_1B1371C68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371C5C();
  v8 = *(void **)self->theLock;
  swift_retain();
  objc_msgSend(v8, sel_lock);
  if (MEMORY[0x1B5E1B0F0](self->lifecycleDelegate))
  {
    v9 = *(_QWORD *)&self->lifecycleDelegate[8];
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v9 + 24))(ObjectType, v9);
    swift_unknownObjectRelease();
  }
  objc_msgSend(v8, sel_unlock);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
