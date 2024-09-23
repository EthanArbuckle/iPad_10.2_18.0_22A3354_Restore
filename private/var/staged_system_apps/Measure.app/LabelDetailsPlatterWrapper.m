@implementation LabelDetailsPlatterWrapper

- (void)remakePlatters
{
  _TtC7Measure26LabelDetailsPlatterWrapper *v2;

  v2 = self;
  sub_1000A2B78();

}

- (void)touchBackgroundFrom:(id)a3
{
  char *v3;
  char *v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  void (*v11)(uint64_t, uint64_t);
  id v12;
  _TtC7Measure26LabelDetailsPlatterWrapper *v13;
  char *v14;

  v3 = *(char **)((char *)self + qword_100480D98);
  if (v3)
  {
    v6 = &v3[qword_100480288];
    Strong = swift_unknownObjectWeakLoadStrong(&v3[qword_100480288], a2);
    if (Strong)
    {
      v8 = Strong;
      v9 = *((_QWORD *)v6 + 1);
      ObjectType = swift_getObjectType(Strong);
      v11 = *(void (**)(uint64_t, uint64_t))(v9 + 24);
      v12 = a3;
      v13 = self;
      v14 = v3;
      v11(ObjectType, v9);

      swift_unknownObjectRelease(v8);
    }
  }
}

@end
