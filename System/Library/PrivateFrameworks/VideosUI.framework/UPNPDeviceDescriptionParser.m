@implementation UPNPDeviceDescriptionParser

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  void *v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;

  v11 = OUTLINED_FUNCTION_19_132();
  v13 = v12;
  if (a5)
    sub_1DA143E80();
  if (a6)
    sub_1DA143E80();
  sub_1DA143C7C();
  v14 = a3;
  v15 = v7;
  sub_1D9F1E348((uint64_t)v15, v11, v13);

  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_137();
  OUTLINED_FUNCTION_54_0();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  void *v4;
  id v6;
  id v7;

  OUTLINED_FUNCTION_19_132();
  v6 = a3;
  v7 = v4;
  sub_1D9F1E5DC();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  void *v6;
  id v10;
  id v11;

  OUTLINED_FUNCTION_19_132();
  if (a5)
    sub_1DA143E80();
  if (a6)
    sub_1DA143E80();
  v10 = a3;
  v11 = v6;
  sub_1D9F1E818();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_74();
  swift_bridgeObjectRelease();
}

- (_TtC8VideosUI27UPNPDeviceDescriptionParser)init
{
  _TtC8VideosUI27UPNPDeviceDescriptionParser *result;

  sub_1D9F1E954();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_19_5();
}

@end
