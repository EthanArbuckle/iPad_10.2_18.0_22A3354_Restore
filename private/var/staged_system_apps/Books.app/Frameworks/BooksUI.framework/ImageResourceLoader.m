@implementation ImageResourceLoader

- (void)imageResourceDidChangeImage:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_5440(&qword_25E2E8);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain(a3);
  swift_retain(self);
  v8 = objc_msgSend(a3, "image");
  v9 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  type metadata accessor for MainActor(0);
  swift_unknownObjectRetain(a3);
  swift_retain(self);
  v10 = v8;
  v11 = static MainActor.shared.getter(v10);
  v12 = (_QWORD *)swift_allocObject(&unk_24D828, 56, 7);
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = a3;
  v12[5] = self;
  v12[6] = v8;
  v13 = sub_13BC30((uint64_t)v7, (uint64_t)&unk_2613C8, (uint64_t)v12);
  swift_unknownObjectRelease(a3);
  swift_release(self);
  swift_release(v13);

}

@end
