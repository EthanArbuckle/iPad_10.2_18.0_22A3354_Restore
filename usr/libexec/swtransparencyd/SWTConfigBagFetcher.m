@implementation SWTConfigBagFetcher

- (void)fetchConfigBag:(NSURLRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSURLRequest *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_10001D138(&qword_100127220);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100107918, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100107940, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100127128;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100107968, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100127138;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_100032E54((uint64_t)v9, (uint64_t)&unk_100127148, (uint64_t)v14);
  swift_release(v16);
}

- (void)triggerConfigBagFetch:(double)a3
{
  swift_retain(self);
  sub_1000329DC(a3);
  swift_release(self);
}

@end
