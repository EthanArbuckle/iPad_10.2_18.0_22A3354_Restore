@implementation A:

- (uint64_t)B
{
  uint64_t result;
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)a3 + 8);
  result = swift_getWitnessTable(&protocol conformance descriptor for <> [A : B], a2, &v5);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

- (double)B
{
  uint64_t *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  double result;
  __int128 v12;
  _QWORD v13[5];
  _OWORD v14[2];
  uint64_t v15;

  v3 = *v1;
  if ((v3 & 0xC000000000000001) != 0)
  {
    v4 = (void *)specialized _ArrayBuffer._nonNative.getter(v3);
    swift_unknownObjectRetain(v4, v5, v6, v7);
    swift_bridgeObjectRelease(v3);
    v8 = type metadata accessor for __CocoaDictionary.Iterator();
    v9 = swift_allocObject(v8, 0xE8uLL, 7uLL);
    *((_OWORD *)v9 + 1) = 0u;
    *((_OWORD *)v9 + 2) = 0u;
    *((_OWORD *)v9 + 3) = 0u;
    *((_OWORD *)v9 + 4) = 0u;
    *((_OWORD *)v9 + 5) = 0u;
    *((_OWORD *)v9 + 6) = 0u;
    *((_OWORD *)v9 + 7) = 0u;
    *((_OWORD *)v9 + 8) = 0u;
    *((_OWORD *)v9 + 9) = 0u;
    *((_OWORD *)v9 + 10) = 0u;
    *((_OWORD *)v9 + 11) = 0u;
    *((_OWORD *)v9 + 12) = 0u;
    v9[27] = 0;
    v9[28] = 0;
    v9[26] = v4;
    Dictionary.Iterator.init(_cocoa:)((uint64_t)v9, (uint64_t)v14);
  }
  else
  {
    _NativeDictionary.makeIterator()(v3, v13);
    Dictionary.Iterator.init(_native:)((uint64_t)v13, (uint64_t)v14);
  }
  v10 = v15;
  result = *(double *)v14;
  v12 = v14[1];
  *(_OWORD *)a1 = v14[0];
  *(_OWORD *)(a1 + 16) = v12;
  *(_QWORD *)(a1 + 32) = v10;
  return result;
}

- (unint64_t)B
{
  return swift_retain((unint64_t *)(a1 & 0x7FFFFFFFFFFFFFFFLL), a2, a3, a4);
}

- (id)B
{
  uint64_t *v0;

  return Dictionary.Keys.count.getter(*v0);
}

- (void)B
{
  if ((a3 & 1) != 0)
    swift_bridgeObjectRelease(a1);
}

- (Swift::Int)B
{
  uint64_t v1;
  _QWORD v3[5];
  __int128 v4;
  __int128 v5;

  v3[0] = 0;
  v3[1] = _swift_stdlib_Hashing_parameters ^ a1 ^ 0x736F6D6570736575;
  v3[2] = unk_1ECD25520 ^ 0x646F72616E646F6DLL;
  v3[3] = _swift_stdlib_Hashing_parameters ^ a1 ^ 0x6C7967656E657261;
  v3[4] = unk_1ECD25520 ^ 0x7465646279746573;
  v4 = 0u;
  v5 = 0u;
  Dictionary.Index.hash(into:)((uint64_t)v3, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16));
  return Hasher._finalize()();
}

- (_QWORD)B
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4]);
  return a1;
}

- (_UNKNOWN)B
{
  return &protocol witness table for [A : B].Index;
}

@end
