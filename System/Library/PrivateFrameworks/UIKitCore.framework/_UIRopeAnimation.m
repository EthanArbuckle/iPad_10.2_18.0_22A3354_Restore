@implementation _UIRopeAnimation

- (_UIRopeAnimation)init
{
  return (_UIRopeAnimation *)sub_1855A8C0C();
}

- (void)addAnimation:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  _UIRopeAnimation *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1855A956C;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = (_QWORD **)((char *)self + OBJC_IVAR____UIRopeAnimation__animations);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_185646DB0(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v12 = v8[2];
  v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_185646DB0((_QWORD *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1855A65EC;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (void)beginUsingSpringBehavior:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _UIRopeAnimation *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1855A94D4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1855A905C((uint64_t)v8, (uint64_t)v6, v7);
  sub_18518D718((uint64_t)v6);

}

- (void)invalidate
{
  _QWORD *v2;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____UIRopeAnimation__animations);
  swift_beginAccess();
  *v2 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
