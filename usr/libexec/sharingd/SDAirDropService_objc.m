@implementation SDAirDropService_objc

- (void)start
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  swift_retain_n(self, 2);
  v7 = static Task<>.noThrow(priority:operation:)(v5, &unk_1007BD808, self, (char *)&type metadata for () + 8);
  swift_release(v7);
  swift_release(self);
  sub_100322564((uint64_t)v5);
  swift_release(self);
}

- (void)stop
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  swift_retain_n(self, 2);
  v7 = sub_100008384(&qword_1007B6440);
  v8 = static Task<>.noThrow(priority:operation:)(v5, &unk_1007BD7F8, self, v7);
  swift_release(v8);
  swift_release(self);
  sub_100322564((uint64_t)v5);
  swift_release(self);
}

- (SDAirDropService_objc)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  swift_defaultActor_initialize(self);
  *(_QWORD *)self->service = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[SDAirDropService_objc init](&v5, "init");
}

@end
