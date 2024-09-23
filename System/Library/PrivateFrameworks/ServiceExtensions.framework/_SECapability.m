@implementation _SECapability

+ (id)mediaWithWebsite:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = sub_245DC4CB8();
  v5 = _s17ServiceExtensions13_SECapabilityC9assertion7websiteACSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (NSString)mediaEnvironment
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  NSString *result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _SECapability *v16;
  uint64_t v17;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____SECapability_inner);
  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____SECapability_inner);
  v3 = *(_QWORD *)&self->inner[OBJC_IVAR____SECapability_inner];
  v5 = self->inner[OBJC_IVAR____SECapability_inner + 72];
  if (v5 == 3)
  {
    swift_bridgeObjectRetain();
    v6 = (void *)sub_245DC4CAC();
    swift_bridgeObjectRelease();
    return (NSString *)v6;
  }
  else
  {
    if (v5 == 2)
    {
      self = (_SECapability *)sub_245DC4E68();
      __break(1u);
    }
    v8 = v5;
    v9 = v2[8];
    v10 = v2[9];
    v11 = v2[6];
    v17 = v2[7];
    v13 = v2[4];
    v12 = v2[5];
    v15 = v2[2];
    v14 = v2[3];
    v16 = self;
    sub_245DBFF3C(v4, v3, v15, v14, v13, v12, v11, v17, v9, v10, v8);
    result = (NSString *)sub_245DC4ED4();
    __break(1u);
  }
  return result;
}

+ (id)assertionWithDomain:(id)a3 name:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  char *v11;
  char *v12;
  objc_super v14;

  v4 = sub_245DC4CB8();
  v6 = v5;
  v7 = sub_245DC4CB8();
  v9 = v8;
  v10 = (objc_class *)type metadata accessor for _SECapability();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = &v11[OBJC_IVAR____SECapability_inner];
  *(_QWORD *)v12 = v4;
  *((_QWORD *)v12 + 1) = v6;
  *((_QWORD *)v12 + 2) = v7;
  *((_QWORD *)v12 + 3) = v9;
  *((_QWORD *)v12 + 4) = 0;
  *((_QWORD *)v12 + 5) = 0;
  *((_QWORD *)v12 + 6) = nullsub_1;
  *((_QWORD *)v12 + 7) = 0;
  *((_QWORD *)v12 + 8) = nullsub_1;
  *((_QWORD *)v12 + 9) = 0;
  v12[80] = 2;
  v14.receiver = v11;
  v14.super_class = v10;
  return objc_msgSendSuper2(&v14, sel_init);
}

- (void).cxx_destruct
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____SECapability_inner;
  sub_245DB3AA4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____SECapability_inner), *((_QWORD *)v2 + 1), *((_QWORD *)v2 + 2), *((_QWORD *)v2 + 3), *((_QWORD *)v2 + 4), *((_QWORD *)v2 + 5), *((_QWORD *)v2 + 6), *((_QWORD *)v2 + 7), *((_QWORD *)v2 + 8), *((_QWORD *)v2 + 9), v2[80]);
}

+ (id)assertionWithDomain:(id)a3 name:(id)a4 environmentIdentifier:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  char *v15;
  char *v16;
  objc_super v18;

  v5 = sub_245DC4CB8();
  v7 = v6;
  v8 = sub_245DC4CB8();
  v10 = v9;
  v11 = sub_245DC4CB8();
  v13 = v12;
  v14 = (objc_class *)type metadata accessor for _SECapability();
  v15 = (char *)objc_allocWithZone(v14);
  v16 = &v15[OBJC_IVAR____SECapability_inner];
  *(_QWORD *)v16 = v5;
  *((_QWORD *)v16 + 1) = v7;
  *((_QWORD *)v16 + 2) = v8;
  *((_QWORD *)v16 + 3) = v10;
  *((_QWORD *)v16 + 4) = v11;
  *((_QWORD *)v16 + 5) = v13;
  *((_QWORD *)v16 + 6) = nullsub_1;
  *((_QWORD *)v16 + 7) = 0;
  *((_QWORD *)v16 + 8) = nullsub_1;
  *((_QWORD *)v16 + 9) = 0;
  v16[80] = 2;
  v18.receiver = v15;
  v18.super_class = v14;
  return objc_msgSendSuper2(&v18, sel_init);
}

+ (id)assertionWithDomain:(id)a3 name:(id)a4 environmentIdentifier:(id)a5 willInvalidate:(id)a6 didInvalidate:(id)a7
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  char *v22;
  char *v23;
  objc_super v25;

  v8 = _Block_copy(a6);
  v9 = _Block_copy(a7);
  v10 = sub_245DC4CB8();
  v12 = v11;
  v13 = sub_245DC4CB8();
  v15 = v14;
  v16 = sub_245DC4CB8();
  v18 = v17;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v8;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v9;
  v21 = (objc_class *)type metadata accessor for _SECapability();
  v22 = (char *)objc_allocWithZone(v21);
  v23 = &v22[OBJC_IVAR____SECapability_inner];
  *(_QWORD *)v23 = v10;
  *((_QWORD *)v23 + 1) = v12;
  *((_QWORD *)v23 + 2) = v13;
  *((_QWORD *)v23 + 3) = v15;
  *((_QWORD *)v23 + 4) = v16;
  *((_QWORD *)v23 + 5) = v18;
  *((_QWORD *)v23 + 6) = sub_245DC0450;
  *((_QWORD *)v23 + 7) = v19;
  *((_QWORD *)v23 + 8) = sub_245DC0580;
  *((_QWORD *)v23 + 9) = v20;
  v23[80] = 2;
  v25.receiver = v22;
  v25.super_class = v21;
  return objc_msgSendSuper2(&v25, sel_init);
}

- (BOOL)setActive:(BOOL)a3
{
  return sub_245DBDDD8(a3) & 1;
}

- (_SECapability)init
{
  _SECapability *result;

  result = (_SECapability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
