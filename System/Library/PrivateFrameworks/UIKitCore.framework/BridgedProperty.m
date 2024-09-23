@implementation BridgedProperty

- (void)setVelocity:(id)a3 target:(BOOL)a4
{
  _BOOL4 v4;
  _TtC5UIKit15BridgedProperty *v6;
  _TtC5UIKit15BridgedProperty *v7;
  uint64_t v8;
  uint64_t ObjectType;
  _OWORD v10[2];

  v4 = a4;
  if (a3)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_186507B1C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = *(_QWORD *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  ObjectType = swift_getObjectType();
  sub_1855DC194((uint64_t)v10, v4, ObjectType, v8);

  sub_1855BDE94((uint64_t)v10);
}

- (id)velocityTarget:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t ObjectType;
  _TtC5UIKit15BridgedProperty *v7;
  void *v8;
  _QWORD v10[4];

  v3 = a3;
  v5 = *(_QWORD *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  ObjectType = swift_getObjectType();
  v7 = self;
  sub_1855DC5AC(v3, ObjectType, v5);

  __swift_project_boxed_opaque_existential_0Tm(v10, v10[3]);
  v8 = (void *)sub_186507FB4();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
  return v8;
}

- (id)value
{
  return sub_18579C778((char *)self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t))sub_18579C394);
}

- (void)setValue:(id)a3
{
  sub_18579C820(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_BYTE *, uint64_t, uint64_t))sub_18579C478);
}

- (id)presentationValue
{
  return sub_18579C778((char *)self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t))sub_18579C58C);
}

- (void)setPresentationValue:(id)a3
{
  sub_18579C820(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_BYTE *, uint64_t, uint64_t))sub_18579C670);
}

- (id)velocity
{
  return sub_18579C778((char *)self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t))sub_18579C8C4);
}

- (void)setVelocity:(id)a3
{
  sub_18579C820(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_BYTE *, uint64_t, uint64_t))sub_18579C9A8);
}

- (void)invalidateAndStopImmediately:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(_BOOL8, uint64_t, uint64_t);
  _TtC5UIKit15BridgedProperty *v8;

  v3 = a3;
  v5 = *(_QWORD *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  ObjectType = swift_getObjectType();
  v7 = *(void (**)(_BOOL8, uint64_t, uint64_t))(v5 + 32);
  v8 = self;
  v7(v3, ObjectType, v5);

}

- (BOOL)isInvalidated
{
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t (*v5)(uint64_t, uint64_t);
  _TtC5UIKit15BridgedProperty *v6;
  char v7;

  v3 = *(_QWORD *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  ObjectType = swift_getObjectType();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 24);
  v6 = self;
  v7 = v5(ObjectType, v3);

  return v7 & 1;
}

- (id)transformer
{
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t (*v5)(uint64_t, uint64_t);
  _TtC5UIKit15BridgedProperty *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD v16[4];

  v3 = *(_QWORD *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  ObjectType = swift_getObjectType();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 40);
  v6 = self;
  v7 = v5(ObjectType, v3);
  if (v7)
  {
    v8 = _s29AnimatablePropertyTransformerCMa();
    v16[3] = v8;
    v16[0] = v7;

    if (v8)
    {
      v9 = __swift_project_boxed_opaque_existential_0Tm(v16, v8);
      v10 = *(_QWORD *)(v8 - 8);
      v11 = MEMORY[0x1E0C80A78](v9);
      v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, __n128))(v10 + 16))(v13, v11);
      v14 = (void *)sub_186507FB4();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v16);
      return v14;
    }
  }
  else
  {

  }
  return 0;
}

- (void)setTransformer:(id)a3
{
  _TtC5UIKit15BridgedProperty *v3;
  _TtC5UIKit15BridgedProperty *v4;
  _OWORD v6[2];

  if (a3)
  {
    v3 = self;
    swift_unknownObjectRetain();
    sub_186507B1C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v4 = self;
  }
  sub_18579CD0C((uint64_t)v6);

}

- (BOOL)isVelocityUsableForVFD
{
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t (*v5)(uint64_t, uint64_t);
  _TtC5UIKit15BridgedProperty *v6;
  char v7;

  v3 = *(_QWORD *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  ObjectType = swift_getObjectType();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 64);
  v6 = self;
  v7 = v5(ObjectType, v3);

  return v7 & 1;
}

- (void)setIsVelocityUsableForVFD:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(_BOOL8, uint64_t, uint64_t);
  _TtC5UIKit15BridgedProperty *v8;

  v3 = a3;
  v5 = *(_QWORD *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  ObjectType = swift_getObjectType();
  v7 = *(void (**)(_BOOL8, uint64_t, uint64_t))(v5 + 72);
  v8 = self;
  v7(v3, ObjectType, v5);

}

- (_TtC5UIKit15BridgedProperty)init
{
  _TtC5UIKit15BridgedProperty *result;

  result = (_TtC5UIKit15BridgedProperty *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
