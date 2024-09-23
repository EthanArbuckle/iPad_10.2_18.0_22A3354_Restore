Swift::Void __swiftcall WKInterfaceController.presentController(withNamesAndContexts:)(Swift::OpaquePointer withNamesAndContexts)
{
  void *v1;
  void *v2;
  int64_t v4;
  uint64_t v5;
  uint64_t *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSArray v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  Class isa;
  void *v20;
  __int128 v21;
  uint64_t ObjectType;
  uint64_t v23;

  v2 = v1;
  v4 = *((_QWORD *)withNamesAndContexts._rawValue + 2);
  if (v4)
  {
    v20 = v1;
    *(_QWORD *)&v21 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4, 0);
    v5 = v21;
    v6 = (uint64_t *)((char *)withNamesAndContexts._rawValue + 40);
    v7 = v4;
    do
    {
      v9 = *(v6 - 1);
      v8 = *v6;
      *(_QWORD *)&v21 = v5;
      v11 = *(_QWORD *)(v5 + 16);
      v10 = *(_QWORD *)(v5 + 24);
      swift_bridgeObjectRetain();
      if (v11 >= v10 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
        v5 = v21;
      }
      v6 += 3;
      *(_QWORD *)(v5 + 16) = v11 + 1;
      v12 = v5 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v9;
      *(_QWORD *)(v12 + 40) = v8;
      --v7;
    }
    while (v7);
    v2 = v20;
  }
  v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (v4)
  {
    v23 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4, 0);
    v14 = v23;
    v15 = (uint64_t *)((char *)withNamesAndContexts._rawValue + 48);
    do
    {
      v16 = *v15;
      ObjectType = swift_getObjectType();
      v23 = v14;
      *(_QWORD *)&v21 = v16;
      v18 = *(_QWORD *)(v14 + 16);
      v17 = *(_QWORD *)(v14 + 24);
      swift_unknownObjectRetain();
      if (v18 >= v17 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v17 > 1), v18 + 1, 1);
        v14 = v23;
      }
      *(_QWORD *)(v14 + 16) = v18 + 1;
      outlined init with take of Any(&v21, (_OWORD *)(v14 + 32 * v18 + 32));
      v15 += 3;
      --v4;
    }
    while (v4);
  }
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_presentControllerWithNames_contexts_, v13.super.isa, isa);

}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void specialized static WKInterfaceController.reloadRootControllers(withNamesAndContexts:)(int64_t *a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSArray v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  Class isa;
  __int128 v19;
  uint64_t ObjectType;
  uint64_t v21;

  v2 = a1[2];
  if (v2)
  {
    *(_QWORD *)&v19 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0);
    v3 = v19;
    v4 = a1 + 5;
    v5 = v2;
    do
    {
      v7 = *(v4 - 1);
      v6 = *v4;
      *(_QWORD *)&v19 = v3;
      v8 = *(_QWORD *)(v3 + 16);
      v9 = *(_QWORD *)(v3 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v9 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v9 > 1), v8 + 1, 1);
        v3 = v19;
      }
      v4 += 3;
      *(_QWORD *)(v3 + 16) = v8 + 1;
      v10 = v3 + 16 * v8;
      *(_QWORD *)(v10 + 32) = v7;
      *(_QWORD *)(v10 + 40) = v6;
      --v5;
    }
    while (v5);
  }
  v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (v2)
  {
    v21 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0);
    v12 = v21;
    v13 = a1 + 6;
    do
    {
      v14 = *v13;
      ObjectType = swift_getObjectType();
      v21 = v12;
      *(_QWORD *)&v19 = v14;
      v15 = *(_QWORD *)(v12 + 16);
      v16 = *(_QWORD *)(v12 + 24);
      swift_unknownObjectRetain();
      if (v15 >= v16 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v16 > 1), v15 + 1, 1);
        v12 = v21;
      }
      *(_QWORD *)(v12 + 16) = v15 + 1;
      outlined init with take of Any(&v19, (_OWORD *)(v12 + 32 * v15 + 32));
      v13 += 3;
      --v2;
    }
    while (v2);
  }
  v17 = (void *)objc_opt_self();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_reloadRootControllersWithNames_contexts_, v11.super.isa, isa);

}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2F9860]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

