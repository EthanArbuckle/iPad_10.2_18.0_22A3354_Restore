@implementation CRLPropertyMap

- (id)getProperty:(unint64_t)a3
{
  return sub_1008EC02C((uint64_t)self, (uint64_t)a2, a3, (void (*)(_QWORD *__return_ptr, uint64_t))sub_1008EBDEC);
}

- (void)setProperty:(unint64_t)a3 value:(id)a4
{
  _TtC8Freeform14CRLPropertyMap *v7;
  uint64_t v8;
  _TtC8Freeform14CRLPropertyMap *v9;
  _BYTE v10[24];
  _BYTE v11[32];
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  sub_1004F370C((uint64_t)v12, (uint64_t)v11);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform14CRLPropertyMap_data, v10, 33, 0);
  sub_10083DAD8((uint64_t)v11, a3);
  swift_endAccess(v10);

  sub_1004CB800((uint64_t)v12, &qword_1013E0230);
}

- (BOOL)containsProperty:(unint64_t)a3
{
  _TtC8Freeform14CRLPropertyMap *v4;

  v4 = self;
  LOBYTE(a3) = sub_1008EBEB8(a3);

  return a3 & 1;
}

- (BOOL)isEmpty
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform14CRLPropertyMap_data;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform14CRLPropertyMap_data, v4, 0, 0);
  return *(_QWORD *)(*(_QWORD *)v2 + 16) == 0;
}

- (int64_t)count
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform14CRLPropertyMap_data;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform14CRLPropertyMap_data, v4, 0, 0);
  return *(_QWORD *)(*(_QWORD *)v2 + 16);
}

- (id)objectForKeyedSubscript:(unint64_t)a3
{
  return sub_1008EC02C((uint64_t)self, (uint64_t)a2, a3, (void (*)(_QWORD *__return_ptr, uint64_t))sub_1008EBDEC);
}

- (void)setObject:(id)a3 forKeyedSubscript:(unint64_t)a4
{
  _TtC8Freeform14CRLPropertyMap *v7;
  uint64_t v8;
  _TtC8Freeform14CRLPropertyMap *v9;
  _BYTE v10[24];
  _BYTE v11[32];
  _OWORD v12[2];

  if (a3)
  {
    v7 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  sub_1004F370C((uint64_t)v12, (uint64_t)v11);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform14CRLPropertyMap_data, v10, 33, 0);
  sub_10083DAD8((uint64_t)v11, a4);
  swift_endAccess(v10);
  sub_1004CB800((uint64_t)v12, &qword_1013E0230);

}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  void *v4;
  _TtC8Freeform14CRLPropertyMap *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1008EC600((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (_TtC8Freeform14CRLPropertyMap)init
{
  _TtC8Freeform14CRLPropertyMap *result;

  result = (_TtC8Freeform14CRLPropertyMap *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLPropertyMap", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14CRLPropertyMap_data));
}

@end
