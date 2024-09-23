@implementation XMLTreeParser.Element

- (_TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element)init
{
  _TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element *result;

  result = (_TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element_parent);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element_parent) = 0;
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced())
        break;
      v4 = *(char **)&v6[OBJC_IVAR____TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element_parent];
      v5 = v4;

      v3 = v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:

}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  sub_247ECFEE4(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, sub_247ED02B8);
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  uint64_t v8;
  id v9;
  _TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element *v10;
  id v11;
  _TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element *v12;

  if (a5)
  {
    sub_247F0F56C();
    if (!a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a6)
LABEL_3:
    sub_247F0F56C();
LABEL_4:
  v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element_parent);
  if (v8)
  {
    v9 = a3;
    v10 = self;
    objc_msgSend(v9, sel_setDelegate_, v8);
  }
  else
  {
    v11 = a3;
    v12 = self;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element *v10;

  v6 = sub_247F0F56C();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_247ED0474(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6;
  _TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_247ED0514(v8);

}

@end
