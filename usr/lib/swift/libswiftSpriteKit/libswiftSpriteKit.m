uint64_t copyImageData(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  Class isa;
  id v11;
  uint64_t result;

  if ((objc_msgSend(a1, sel_respondsToSelector_, sel__copyImageData) & 1) == 0
    || (v4 = objc_msgSend(a1, sel__copyImageData)) == 0)
  {
    v6 = 0;
    v8 = 0xF000000000000000;
LABEL_6:
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
    goto LABEL_7;
  }
  v5 = v4;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;

  v9 = objc_allocWithZone(MEMORY[0x24BEBD640]);
  outlined copy of Data._Representation(v6, v8);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v11 = objc_msgSend(v9, sel_initWithData_, isa);
  outlined consume of Data._Representation(v6, v8);

  if (!v11)
    goto LABEL_6;
LABEL_7:
  *(_QWORD *)(a2 + 24) = type metadata accessor for UIImage();
  result = outlined consume of Data?(v6, v8);
  *(_QWORD *)a2 = v11;
  *(_BYTE *)(a2 + 32) = 16;
  return result;
}

uint64_t SKShapeNode.customPlaygroundQuickLook.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;

  return copyImageData(_:)(v1, a1);
}

uint64_t protocol witness for _CustomPlaygroundQuickLookable.customPlaygroundQuickLook.getter in conformance SKShapeNode@<X0>(uint64_t a1@<X8>)
{
  void **v1;

  return copyImageData(_:)(*v1, a1);
}

unint64_t type metadata accessor for UIImage()
{
  unint64_t result;

  result = lazy cache variable for type metadata for UIImage;
  if (!lazy cache variable for type metadata for UIImage)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for UIImage);
  }
  return result;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

id __SpriteKitMethodProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for __SpriteKitMethodProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

SKWarpGeometryGrid __swiftcall SKWarpGeometryGrid.init(columns:rows:sourcePositions:destinationPositions:)(SKWarpGeometryGrid columns, Swift::Int rows, Swift::OpaquePointer sourcePositions, Swift::OpaquePointer destinationPositions)
{
  uint64_t v4;
  Swift::Int v6;
  Swift::Int v7;
  Class isa;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = (uint64_t)columns.super.super.isa + 1;
  if (__OFADD__(columns.super.super.isa, 1))
  {
    __break(1u);
    goto LABEL_17;
  }
  v6 = rows + 1;
  if (__OFADD__(rows, 1))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v7 = v4 * v6;
  if ((unsigned __int128)(v4 * (__int128)v6) >> 64 != (v4 * v6) >> 63)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  isa = columns.super.super.isa;
  v11 = *((_QWORD *)destinationPositions._rawValue + 2);
  v12 = *((_QWORD *)sourcePositions._rawValue + 2);
  if (!v11)
  {
    if (!v12)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (SKWarpGeometryGrid)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithColumns_rows_sourcePositions_destPositions_, isa, rows, 0, 0);
    }
    columns.super.super.isa = (Class)swift_bridgeObjectRelease();
    if (v12 == v7)
    {
      v13 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithColumns_rows_sourcePositions_destPositions_, isa, rows, (char *)sourcePositions._rawValue + 32, 0);
      goto LABEL_14;
    }
    goto LABEL_20;
  }
  if (!v12)
  {
    columns.super.super.isa = (Class)swift_bridgeObjectRelease();
    if (v11 == v7)
    {
      v13 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithColumns_rows_sourcePositions_destPositions_, isa, rows, 0, (char *)destinationPositions._rawValue + 32);
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  if (v11 == v7 && v12 == v7)
  {
    v13 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithColumns_rows_sourcePositions_destPositions_, columns.super.super.isa, rows, (char *)sourcePositions._rawValue + 32, (char *)destinationPositions._rawValue + 32);
    swift_bridgeObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();
    return (SKWarpGeometryGrid)v13;
  }
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
  return columns;
}

SKWarpGeometryGrid __swiftcall SKWarpGeometryGrid.replacingBySourcePositions(positions:)(Swift::OpaquePointer positions)
{
  void *v1;

  return (SKWarpGeometryGrid)objc_msgSend(v1, sel_gridByReplacingSourcePositions_, (char *)positions._rawValue + 32);
}

SKWarpGeometryGrid __swiftcall SKWarpGeometryGrid.replacingByDestinationPositions(positions:)(Swift::OpaquePointer positions)
{
  void *v1;

  return (SKWarpGeometryGrid)objc_msgSend(v1, sel_gridByReplacingDestPositions_, (char *)positions._rawValue + 32);
}

uint64_t type metadata accessor for __SpriteKitMethodProvider()
{
  return objc_opt_self();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

