@implementation RUIXMLParserDelegate

- (RUIXMLElement)xmlElement
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___RUIXMLParserDelegate_xmlElement);
  swift_beginAccess();
  return (RUIXMLElement *)*v2;
}

- (void)setXmlElement:(id)a3
{
  RUIXMLParserDelegate *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_209F55254(a3);

}

- (NSArray)stack
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_209F673FC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setStack:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = sub_209F67408();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___RUIXMLParserDelegate_stack);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (RUIXMLParserDelegate)initWithRoot:(id)a3
{
  id v4;
  RUIXMLParserDelegate *v5;

  v4 = a3;
  v5 = (RUIXMLParserDelegate *)sub_209F552DC(a3);

  return v5;
}

- (RUIXMLParserDelegate)init
{
  return -[RUIXMLParserDelegate initWithRoot:](self, sel_initWithRoot_, 0);
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  RUIXMLParserDelegate *v15;

  v11 = sub_209F672C4();
  v13 = v12;
  if (a5)
    sub_209F672C4();
  if (a6)
    sub_209F672C4();
  sub_209F67258();
  v14 = a3;
  v15 = self;
  sub_209F5539C(v11, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  RUIXMLParserDelegate *v11;

  v6 = a3;
  v7 = a4;
  v11 = self;
  v8 = sub_209F66AB4();
  v10 = v9;

  sub_209F5559C();
  sub_209EE4928(v8, v10);

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  RUIXMLParserDelegate *v10;

  v6 = sub_209F672C4();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_209F55734(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  RUIXMLParserDelegate *v14;

  v10 = sub_209F672C4();
  v12 = v11;
  if (a5)
    sub_209F672C4();
  if (a6)
    sub_209F672C4();
  v13 = a3;
  v14 = self;
  sub_209F55A24(v10, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
