GKPath __swiftcall GKPath.init(points:radius:cyclical:)(Swift::OpaquePointer points, Swift::Float radius, Swift::Bool cyclical)
{
  return (GKPath)GKPath.init(points:radius:cyclical:)((uint64_t)points._rawValue, cyclical, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t))specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:), (SEL *)&selRef_initWithPoints_count_radius_cyclical_, radius);
}

{
  return (GKPath)GKPath.init(points:radius:cyclical:)((uint64_t)points._rawValue, cyclical, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t))specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:), (SEL *)&selRef_initWithFloat3Points_count_radius_cyclical_, radius);
}

id GKPath.init(points:radius:cyclical:)(uint64_t a1, char a2, uint64_t (*a3)(_QWORD, uint64_t, _QWORD, uint64_t), SEL *a4, float a5)
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  id v13;

  v9 = a1;
  v10 = *(_QWORD *)(a1 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v9 = a3(0, v10, 0, v9);
  v11 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  *(float *)&v12 = a5;
  v13 = objc_msgSend(v11, *a4, v9 + 32, v10, a2 & 1, v12);
  swift_bridgeObjectRelease();
  return v13;
}

GKPolygonObstacle __swiftcall GKPolygonObstacle.init(points:)(Swift::OpaquePointer points)
{
  char *rawValue;
  int64_t v2;
  id v3;

  rawValue = (char *)points._rawValue;
  v2 = *((_QWORD *)points._rawValue + 2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    rawValue = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, rawValue);
  v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPoints_count_, rawValue + 32, v2);
  swift_bridgeObjectRelease();
  return (GKPolygonObstacle)v3;
}

id GKEntity.component<A>(ofType:)()
{
  void *v0;
  id result;
  void *v2;

  result = objc_msgSend(v0, sel_componentForClass_, swift_getObjCClassFromMetadata());
  if (result)
  {
    v2 = result;
    result = (id)swift_dynamicCastUnknownClass();
    if (!result)
    {

      return 0;
    }
  }
  return result;
}

id GKEntity.removeComponent<A>(ofType:)()
{
  void *v0;

  return objc_msgSend(v0, sel_removeComponentForClass_, swift_getObjCClassFromMetadata());
}

uint64_t GKStateMachine.state<A>(forClass:)()
{
  void *v0;
  id v1;

  swift_getMetatypeMetadata();
  v1 = objc_msgSend(objc_retainAutorelease(v0), sel_performSelector_withObject_, sel_stateForClass_, _bridgeAnythingToObjectiveC<A>(_:)());
  swift_unknownObjectRelease();
  if (!v1)
    return 0;
  swift_unknownObjectRetain();
  return swift_dynamicCastUnknownClassUnconditional();
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SIMD2<Float>>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SIMD3<Float>>);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207B6C84]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x24BEE3A20]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x24BEE4C90]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

