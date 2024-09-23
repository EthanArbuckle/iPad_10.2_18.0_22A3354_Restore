@implementation _SwiftNSMutableArray

- (int64_t)count
{
  uint64_t v2;
  void *v4;

  v2 = *(_QWORD *)self->contents;
  if (!((unint64_t)v2 >> 62))
    return *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v2 < 0)
    v4 = *(void **)self->contents;
  else
    v4 = (void *)(v2 & 0xFFFFFFFFFFFFFF8);
  return (int64_t)objc_msgSend(v4, sel_count);
}

- (void)getObjects:(id *)a3 range:(id)a4
{
  int64_t var1;
  int64_t var0;
  char *v8;

  var1 = a4.var1;
  var0 = a4.var0;
  swift_retain((unint64_t *)self, (uint64_t)a2, (uint64_t)a3, (char *)a4.var0);
  _SwiftNSMutableArray.getObjects(_:range:)(a3, var0, var1, v8);
  swift_release((uint64_t)self);
}

- (int64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __objc2_class *v10;

  swift_retain((unint64_t *)self, (uint64_t)a2, (uint64_t)a3, (char *)a4);
  v10 = specialized _SwiftNSMutableArray.countByEnumerating(with:objects:count:)(a3, v7, v8, v9);
  swift_release((uint64_t)self);
  return (int64_t)v10;
}

- (id)copyWithZone:(void *)a3
{
  char *v3;
  unint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __objc2_class **v9;

  v5 = swift_retain((unint64_t *)self, (uint64_t)a2, (uint64_t)a3, v3);
  v9 = specialized _SwiftNSMutableArray.copy(with:)((uint64_t)v5, v6, v7, v8);
  swift_release((uint64_t)self);
  return v9;
}

- (void)insertObject:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;

  v7 = *(_QWORD *)self->contents;
  swift_unknownObjectRetain(a3, (uint64_t)a2, (uint64_t)a3, (char *)a4);
  swift_retain((unint64_t *)self, v8, v9, v10);
  specialized Array._checkIndex(_:)(a4, v7);
  swift_unknownObjectRetain(a3, v11, v12, v13);
  specialized Array.replaceSubrange<A>(_:with:)(a4, a4, (uint64_t)a3);
  swift_release((uint64_t)self);
  swift_unknownObjectRelease(a3);
}

- (void)removeObjectAtIndex:(int64_t)a3
{
  void *v3;

  v3 = (void *)specialized Array.remove(at:)(a3);
  swift_unknownObjectRelease(v3);
}

- (void)addObject:(id)a3
{
  char *v3;
  unsigned __int8 *contents;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;

  contents = self->contents;
  swift_unknownObjectRetain(a3, (uint64_t)a2, (uint64_t)a3, v3);
  swift_retain((unint64_t *)self, v7, v8, v9);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v10 = *(_QWORD *)self->contents;
  v11 = v10 & 0xFFFFFFFFFFFFFF8;
  v13 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v12 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v13 >= v12 >> 1)
  {
    v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v12 > 1, v13 + 1, 1, v10);
    *(_QWORD *)contents = v14;
    v11 = v14 & 0xFFFFFFFFFFFFFF8;
  }
  *(_QWORD *)(v11 + 16) = v13 + 1;
  *(_QWORD *)(v11 + 8 * v13 + 32) = a3;
  swift_release((uint64_t)self);
}

- (void)removeLastObject
{
  uint64_t v2;
  char *v3;
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = *(_QWORD *)self->contents;
  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0)
      v7 = *(void **)self->contents;
    else
      v7 = (void *)(v5 & 0xFFFFFFFFFFFFFF8);
    swift_retain((unint64_t *)self, (uint64_t)a2, v2, v3);
    if (!objc_msgSend(v7, sel_count))
      goto LABEL_5;
    goto LABEL_4;
  }
  if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain((unint64_t *)self, (uint64_t)a2, v2, v3);
LABEL_4:
    v6 = (void *)specialized RangeReplaceableCollection<>.removeLast()();
    swift_unknownObjectRelease(v6);
LABEL_5:
    swift_release((uint64_t)self);
  }
}

- (void)replaceObjectAtIndex:(int64_t)a3 withObject:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int isUniquelyReferenced_nonNull_bridgeObject;
  void *v12;

  v7 = *(_QWORD *)self->contents;
  swift_unknownObjectRetain(a4, (uint64_t)a2, a3, (char *)a4);
  swift_retain((unint64_t *)self, v8, v9, v10);
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(v7);
  *(_QWORD *)self->contents = v7;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v7 < 0 || (v7 & 0x4000000000000000) != 0)
  {
    v7 = specialized _ArrayBuffer._consumeAndCreateNew()(v7);
    *(_QWORD *)self->contents = v7;
  }
  specialized Array._checkSubscript_mutating(_:)(a3, v7);
  v12 = *(void **)((*(_QWORD *)self->contents & 0xFFFFFFFFFFFFFF8) + 8 * a3 + 0x20);
  *(_QWORD *)((*(_QWORD *)self->contents & 0xFFFFFFFFFFFFFF8) + 8 * a3 + 0x20) = a4;
  swift_unknownObjectRelease(v12);
  swift_release((uint64_t)self);
}

- (void)exchangeObjectAtIndex:(int64_t)a3 withObjectAtIndex:(int64_t)a4
{
  swift_retain((unint64_t *)self, (uint64_t)a2, a3, (char *)a4);
  _SwiftNSMutableArray.exchange(at:with:)(a3, a4);
  swift_release((uint64_t)self);
}

- (void)replaceObjectsInRange:(id)a3 withObjects:(const void *)a4 count:(int64_t)a5
{
  int64_t var1;
  char *var0;

  var1 = a3.var1;
  var0 = (char *)a3.var0;
  swift_retain((unint64_t *)self, (uint64_t)a2, a3.var0, (char *)a3.var1);
  _SwiftNSMutableArray.replaceObjects(in:with:count:)(var0, var1, (char *)a4, a5);
  swift_release((uint64_t)self);
}

- (void)insertObjects:(const void *)a3 count:(int64_t)a4 atIndex:(int64_t)a5
{
  if (a4 < 0)
    _fatalErrorMessage(_:_:file:line:flags:)((unint64_t)"Fatal error", 11, 2, "UnsafeBufferPointer with negative count", 39, 2, "Swift/UnsafeBufferPointer.swift", 31, 2, 0x53FuLL, 0);
  specialized Array.replaceSubrange<A>(_:with:)(a5, a5, (char *)a3, a4);
}

- (int64_t)indexOfObjectIdenticalTo:(id)a3
{
  return @objc _SwiftNSMutableArray.index(ofObjectIdenticalTo:)((unint64_t *)self, (uint64_t)a2, a3, (char *)_SwiftNSMutableArray.index(ofObjectIdenticalTo:));
}

- (void)removeObjectsInRange:(id)a3
{
  int64_t v3;

  v3 = a3.var0 + a3.var1;
  if (__OFADD__(a3.var0, a3.var1))
  {
    __break(1u);
LABEL_5:
    _assertionFailure(_:_:file:line:flags:)((unint64_t)"Fatal error", 11, 2, "Range requires lowerBound <= upperBound", 39, 2, "Swift/Range.swift", 17, 2, 0x2F2uLL, 0);
  }
  if (v3 < a3.var0)
    goto LABEL_5;
  specialized Array.replaceSubrange<A>(_:with:)((char *)a3.var0, v3, (uint64_t)&_swiftEmptyArrayStorage);
}

- (void)removeAllObjects
{
  uint64_t v2;
  char *v3;
  __objc2_class **v5;
  uint64_t v6;

  swift_retain((unint64_t *)self, (uint64_t)a2, v2, v3);
  v5 = specialized static Array._allocateUninitialized(_:)(0);
  v6 = *(_QWORD *)self->contents;
  *(_QWORD *)self->contents = v5;
  swift_bridgeObjectRelease(v6);
  swift_release((uint64_t)self);
}

@end
