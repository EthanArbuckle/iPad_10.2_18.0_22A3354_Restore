@implementation RUIXMLElement

- (void)traverseWithDelegate:(id)a3
{
  RUIXMLElement *v5;

  swift_unknownObjectRetain();
  v5 = self;
  RUIXMLElement.traverse(withDelegate:)(a3);
  swift_unknownObjectRelease();

}

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_209F672A0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDictionary)attributtes
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_209F6724C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setAttributtes:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = sub_209F67258();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___RUIXMLElement_attributtes);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (RUIXMLElement)parent
{
  return (RUIXMLElement *)(id)MEMORY[0x20BD1DC9C]((char *)self + OBJC_IVAR___RUIXMLElement_mutableParent, a2);
}

- (NSString)stringValue
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___RUIXMLElement_stringValue;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_209F672A0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setStringValue:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_209F672C4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___RUIXMLElement_stringValue);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSArray)children
{
  uint64_t v2;
  void *v3;

  v2 = swift_beginAccess();
  type metadata accessor for RUIXMLElement(v2);
  swift_bridgeObjectRetain();
  v3 = (void *)sub_209F673FC();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (RUIXMLElement)initWithName:(id)a3
{
  void *v4;
  void *v5;
  RUIXMLElement *v6;

  sub_209F672C4();
  v4 = (void *)sub_209F672A0();
  swift_bridgeObjectRelease();
  sub_209F416EC(MEMORY[0x24BEE4AF8]);
  v5 = (void *)sub_209F6724C();
  swift_bridgeObjectRelease();
  v6 = -[RUIXMLElement initWithName:attributes:](self, sel_initWithName_attributes_, v4, v5);

  return v6;
}

- (RUIXMLElement)initWithName:(id)a3 attributes:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  _QWORD *v9;
  uint64_t *v10;
  objc_super v12;

  v5 = sub_209F672C4();
  v7 = v6;
  v8 = (objc_class *)sub_209F67258();
  v9 = (Class *)((char *)&self->super.isa + OBJC_IVAR___RUIXMLElement_stringValue);
  *v9 = 0;
  v9[1] = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___RUIXMLElement_shouldTrimWhitespaces) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___RUIXMLElement_mutableChildren) = (Class)MEMORY[0x24BEE4AF8];
  swift_unknownObjectWeakInit();
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___RUIXMLElement_name);
  *v10 = v5;
  v10[1] = v7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___RUIXMLElement_attributtes) = v8;
  v12.receiver = self;
  v12.super_class = (Class)RUIXMLElement;
  return -[RUIXMLElement init](&v12, sel_init);
}

- (void)appendChildren:(id)a3
{
  uint64_t v4;
  RUIXMLElement *v5;

  type metadata accessor for RUIXMLElement((uint64_t)self);
  v4 = sub_209F67408();
  v5 = self;
  RUIXMLElement.appendChildren(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)appendChild:(id)a3
{
  _QWORD *v5;
  id v6;
  RUIXMLElement *v7;

  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___RUIXMLElement_mutableChildren);
  swift_beginAccess();
  v6 = a3;
  v7 = self;
  MEMORY[0x20BD1C7A8]();
  if (*(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_209F6742C();
  sub_209F67450();
  sub_209F67414();
  swift_endAccess();
  swift_unknownObjectWeakAssign();

}

- (RUIXMLElement)init
{
  RUIXMLElement *result;

  result = (RUIXMLElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

- (NSString)xmlString
{
  RUIXMLElement *v2;
  void *v3;

  v2 = self;
  sub_209F54930(v2);

  v3 = (void *)sub_209F672A0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
