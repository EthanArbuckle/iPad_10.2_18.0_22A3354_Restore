@implementation XPCExportProxy

- (void)receiveEvent:(int64_t)a3 data:(id)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t Strong;

  swift_retain();
  if (!a4)
  {
    Strong = swift_weakLoadStrong();
    v9 = 0xF000000000000000;
    if (!Strong)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v11 = (void *)Strong;
    v7 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  v6 = a4;
  v7 = sub_1CE0B3D64();
  v9 = v8;

  v10 = swift_weakLoadStrong();
  if (v10)
  {
    v11 = (void *)v10;
    if (v9 >> 60 == 15)
      v12 = 0;
    else
      v12 = (void *)sub_1CE0B3D58();
LABEL_8:
    objc_msgSend(v11, sel_receiveEvent_data_, a3, v12);
    swift_release();

  }
LABEL_9:
  sub_1CDFC094C(v7, v9);
  swift_release();
}

- (void)receiveRequest:(int64_t)a3 data:(id)a4 completion:(id)a5
{
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v7 = _Block_copy(a5);
  swift_retain();
  if (a4)
  {
    v8 = a4;
    a4 = (id)sub_1CE0B3D64();
    v10 = v9;

  }
  else
  {
    v10 = 0xF000000000000000;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  sub_1CDFD29E0(a3, (uint64_t)a4, v10, (uint64_t)sub_1CDFBA48C, v11);
  swift_release();
  sub_1CDFC094C((uint64_t)a4, v10);
  swift_release();
}

@end
