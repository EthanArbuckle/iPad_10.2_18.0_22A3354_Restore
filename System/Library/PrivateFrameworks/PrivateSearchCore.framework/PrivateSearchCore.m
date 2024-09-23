void *AESCounterRandomNumberGenerator.kSeedSizeBytes.unsafeMutableAddressor()
{
  return &static AESCounterRandomNumberGenerator.kSeedSizeBytes;
}

uint64_t static AESCounterRandomNumberGenerator.kSeedSizeBytes.getter()
{
  return 32;
}

void *AESCounterRandomNumberGenerator.kCipherOutputBytes.unsafeMutableAddressor()
{
  return &static AESCounterRandomNumberGenerator.kCipherOutputBytes;
}

uint64_t static AESCounterRandomNumberGenerator.kCipherOutputBytes.getter()
{
  return 16;
}

void *AESCounterRandomNumberGenerator.kCipherOutputBits.unsafeMutableAddressor()
{
  return &static AESCounterRandomNumberGenerator.kCipherOutputBits;
}

uint64_t static AESCounterRandomNumberGenerator.kCipherOutputBits.getter()
{
  return 128;
}

_QWORD *AESCounterRandomNumberGenerator.__allocating_init(_:)(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = (_QWORD *)swift_allocObject();
  v2[2] = a1;
  v2[3] = 0;
  v3 = (_QWORD *)sub_244B45274();
  v3[2] = 16;
  v3[4] = 0;
  v3[5] = 0;
  v4 = MEMORY[0x24BEE4AF8];
  v2[4] = v3;
  v2[5] = v4;
  return v2;
}

_QWORD *AESCounterRandomNumberGenerator.init(_:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v1[2] = a1;
  v1[3] = 0;
  v2 = (_QWORD *)sub_244B45274();
  v2[2] = 16;
  v2[4] = 0;
  v2[5] = 0;
  v3 = MEMORY[0x24BEE4AF8];
  v1[4] = v2;
  v1[5] = v3;
  return v1;
}

uint64_t sub_244B1EFFC(int a1, size_t a2)
{
  uint64_t v4;
  uint64_t result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_244B454A8();
    __break(1u);
  }
  else
  {
    if (!a2)
      return MEMORY[0x24BEE4AF8];
    v4 = sub_244B45274();
    *(_QWORD *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

_QWORD *sub_244B1F0B4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  size_t dataOutAvailable;
  size_t v6;
  size_t v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)sub_244B45274();
  v3[2] = 16;
  v3[5] = 0;
  v3[4] = 0;
  v8[0] = 16;
  v4 = *(_QWORD *)(v1 + 16);
  dataOutAvailable = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  CCCrypt(0, 0, 2u, (const void *)(v4 + 32), dataOutAvailable, 0, (const void *)(a1 + 32), v6, v3 + 4, dataOutAvailable, v8);
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t AESCounterRandomNumberGenerator.blockForOffset(_:)(uint64_t a1)
{
  BOOL v1;
  unint64_t result;
  uint64_t v3;
  _QWORD *v4;

  v1 = __OFADD__(a1, 1);
  result = a1 + 1;
  if (v1)
  {
    __break(1u);
  }
  else
  {
    v3 = sub_244B1FD68(result);
    v4 = sub_244B1F0B4(v3);
    swift_bridgeObjectRelease();
    return (unint64_t)v4;
  }
  return result;
}

Swift::Void __swiftcall AESCounterRandomNumberGenerator.incrementCounter()()
{
  uint64_t v0;
  char **v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  char v8;

  v1 = (char **)(v0 + 32);
  swift_beginAccess();
  v2 = *(char **)(v0 + 32);
  v3 = *((_QWORD *)v2 + 2);
  if (v3)
  {
    v4 = -v3;
    v5 = 32;
    while (1)
    {
      v6 = v5 - 32;
      if ((unint64_t)(v5 - 32) >= *((_QWORD *)v2 + 2))
      {
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
      if (v2[v5] != 255)
        break;
      swift_beginAccess();
      v2 = *v1;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v1 = v2;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v2 = sub_244B1F91C((uint64_t)v2);
        *v1 = v2;
      }
      if (v6 >= *((_QWORD *)v2 + 2))
        goto LABEL_16;
      v2[v5] = 0;
      v2 = *v1;
      swift_endAccess();
      ++v5;
      if (v4 + v5 == 32)
        return;
    }
    swift_beginAccess();
    v2 = *v1;
    v8 = swift_isUniquelyReferenced_nonNull_native();
    *v1 = v2;
    if ((v8 & 1) != 0)
      goto LABEL_11;
LABEL_17:
    v2 = sub_244B1F91C((uint64_t)v2);
    *v1 = v2;
LABEL_11:
    if (v6 >= *((_QWORD *)v2 + 2))
    {
      __break(1u);
    }
    else if ((((v2[v5] + 1) >> 8) & 1) == 0)
    {
      ++v2[v5];
      swift_endAccess();
      return;
    }
    __break(1u);
  }
}

_QWORD *AESCounterRandomNumberGenerator.nextBlock()()
{
  uint64_t v0;
  _QWORD *v1;

  AESCounterRandomNumberGenerator.incrementCounter()();
  swift_beginAccess();
  v0 = swift_bridgeObjectRetain();
  v1 = sub_244B1F0B4(v0);
  swift_bridgeObjectRelease();
  return v1;
}

Swift::UInt32 __swiftcall AESCounterRandomNumberGenerator.nextUInt32()()
{
  Swift::UInt32 result;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  Swift::UInt32 v11;
  Swift::UInt32 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(v2[5] + 16))
    goto LABEL_4;
  v3 = v2[3];
  if (__OFSUB__(16, v3))
    goto LABEL_25;
  if (16 - v3 <= 3)
  {
LABEL_4:
    AESCounterRandomNumberGenerator.incrementCounter()();
    swift_beginAccess();
    v1 = v2[4];
    v4 = swift_bridgeObjectRetain();
    v5 = sub_244B1F0B4(v4);
    swift_bridgeObjectRelease();
    v2[5] = v5;
    swift_bridgeObjectRelease();
    v3 = 0;
    v2[3] = 0;
  }
  v6 = v3 + 4;
  if (__OFADD__(v3, 4))
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v6 <= v3)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v3 < 0)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v1 = v2[5];
  v7 = *(_QWORD *)(v1 + 16);
  if (v7 < v3 || (uint64_t)v7 < v6)
    goto LABEL_22;
  sub_244B45514();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
  }
  v10 = *(_QWORD *)(v9 + 16);
  swift_release();
  if (v10 == 4)
  {
    if (!swift_dynamicCastClass())
      swift_bridgeObjectRelease();
    goto LABEL_17;
  }
LABEL_23:
  swift_bridgeObjectRelease();
  sub_244B1F930(v1, v1 + 32, v3, (2 * v6) | 1);
LABEL_17:
  swift_bridgeObjectRelease();
  Array<A>.parseUInt32BigEndian()();
  v12 = v11;
  result = swift_release();
  v13 = v2[3];
  v14 = __OFADD__(v13, 4);
  v15 = v13 + 4;
  if (!v14)
  {
    v2[3] = v15;
    return v12;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t AESCounterRandomNumberGenerator.getCounter()()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t AESCounterRandomNumberGenerator.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AESCounterRandomNumberGenerator.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t variable initialization expression of BenchmarkConfig._indexer()
{
  return 0;
}

uint64_t variable initialization expression of BenchmarkConfig._dataSet()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport.indexedTopLevelDirs()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of IndexReport._totalDocuments()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._totalDocumentBytes()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._totalDocumentTokens()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._totalIndexSizeBytes()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._totalIndexingMillis()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._totalUniqueTokens()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._documentsPerSecond()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._tokensPerSecond()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._indexBytesToDocsBytesRatio()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._averageDocumentBytes()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._averageIndexBytes()
{
  return 0;
}

uint64_t variable initialization expression of SearchReport.falsePositiveQueryTokens()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of SearchReport._uniqueTokenCount()
{
  return 0;
}

uint64_t variable initialization expression of SearchReport._durationMillis()
{
  return 0;
}

uint64_t variable initialization expression of SearchReport._falsePositiveQueryCount()
{
  return 0;
}

uint64_t variable initialization expression of SearchReport._falsePositiveQueryPercentage()
{
  return 0;
}

uint64_t variable initialization expression of SearchReport._averageFalsePositiveResultPercentage()
{
  return 0;
}

uint64_t variable initialization expression of SearchReport._searchesPerSecond()
{
  return 0;
}

uint64_t variable initialization expression of BenchmarkReport._storage()
{
  if (qword_2573DBB60 != -1)
    swift_once();
  return swift_retain();
}

double variable initialization expression of CallContextImpl.clientContext@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t variable initialization expression of LevelCapacityUsageState.concurrentQueue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_244B453AC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244B450F4();
  MEMORY[0x24BDAC7A8]();
  sub_244B453A0();
  MEMORY[0x24BDAC7A8]();
  sub_244B1FE10();
  sub_244B45394();
  sub_244B450E8();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  return sub_244B453D0();
}

uint64_t variable initialization expression of TestDataBundle.IndexingData.documents()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of TestDataBundle.IndexingData.Document._name()
{
  return 0;
}

uint64_t variable initialization expression of TestDataBundle.IndexingData.Document._body()
{
  return 0;
}

uint64_t variable initialization expression of TestDataBundle.IndexingData.Document._path()
{
  return 0;
}

uint64_t variable initialization expression of TestDataBundle.SearchingData.tokens()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of TestDataBundle.SearchingData.Token._token()
{
  return 0;
}

uint64_t variable initialization expression of TestDataBundle.SearchingData.Token._frequency()
{
  return 0x100000000;
}

uint64_t variable initialization expression of TestDataBundle._indexingData@<X0>(uint64_t a1@<X8>)
{
  return sub_244B1F8DC(type metadata accessor for TestDataBundle.IndexingData, a1);
}

uint64_t variable initialization expression of TestDataBundle._searchingData@<X0>(uint64_t a1@<X8>)
{
  return sub_244B1F8DC(type metadata accessor for TestDataBundle.SearchingData, a1);
}

uint64_t sub_244B1F8DC@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a2, 1, 1, v3);
}

char *sub_244B1F91C(uint64_t a1)
{
  return sub_244B30AEC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_244B1F930(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  int64_t v5;
  _QWORD *v8;
  size_t v9;
  void *v10;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5)
      return MEMORY[0x24BEE4AF8];
    if (v5 <= 0)
    {
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0)
          goto LABEL_17;
        v10 = v8 + 4;
        if (a2 + a3 < (unint64_t)v8 + v5 + 32 && (unint64_t)v10 < a2 + a3 + v5)
          goto LABEL_17;
        memcpy(v10, (const void *)(a2 + a3), v5);
        return (uint64_t)v8;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD28);
      v8 = (_QWORD *)swift_allocObject();
      v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * v9 - 64;
      if (v4 != a3)
        goto LABEL_5;
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  result = sub_244B454D8();
  __break(1u);
  return result;
}

_QWORD *sub_244B1FA88(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD20);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_244B1FB6C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_244B1FE6C();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_244B1FB6C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_244B1FD68(unint64_t a1)
{
  uint64_t result;

  result = sub_244B45274();
  *(_QWORD *)(result + 16) = 16;
  *(_QWORD *)(result + 32) = 0;
  *(_QWORD *)(result + 40) = 0;
  if ((uint64_t)a1 >= 1)
  {
    *(_BYTE *)(result + 32) = a1;
    if (a1 >= 0x100)
    {
      *(_BYTE *)(result + 33) = BYTE1(a1);
      if (a1 >= 0x10000)
      {
        *(_BYTE *)(result + 34) = BYTE2(a1);
        if (a1 >> 24)
        {
          *(_BYTE *)(result + 35) = BYTE3(a1);
          if (HIDWORD(a1))
          {
            *(_BYTE *)(result + 36) = BYTE4(a1);
            if (a1 >> 40)
            {
              *(_BYTE *)(result + 37) = BYTE5(a1);
              if (HIWORD(a1))
              {
                *(_BYTE *)(result + 38) = BYTE6(a1);
                if (HIBYTE(a1))
                  *(_BYTE *)(result + 39) = HIBYTE(a1);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_244B1FE10()
{
  unint64_t result;

  result = qword_2573DBBE0;
  if (!qword_2573DBBE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2573DBBE0);
  }
  return result;
}

uint64_t type metadata accessor for AESCounterRandomNumberGenerator()
{
  return objc_opt_self();
}

uint64_t sub_244B1FE6C()
{
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24951FF28]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t AsyncThrowingStream.toArray()(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[3] = a1;
  v2[4] = v1;
  v4 = a1[2];
  v2[5] = v4;
  v2[6] = *(_QWORD *)(v4 - 8);
  v2[7] = swift_task_alloc();
  v5 = a1[3];
  v2[8] = v5;
  v2[9] = *(_QWORD *)(v5 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  sub_244B453DC();
  v2[12] = swift_task_alloc();
  v2[13] = a1[4];
  v6 = sub_244B45328();
  v2[14] = v6;
  v2[15] = *(_QWORD *)(v6 - 8);
  v2[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B1FFB0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = sub_244B45268();
  v0[17] = v1;
  v0[2] = v1;
  sub_244B45310();
  v2 = (_QWORD *)swift_task_alloc();
  v0[18] = v2;
  *v2 = v0;
  v2[1] = sub_244B20040;
  return sub_244B4531C();
}

uint64_t sub_244B20040()
{
  uint64_t v0;

  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_244B200A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
    v4 = *(_QWORD *)(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 56), v1, v2);
    sub_244B4528C();
    sub_244B45280();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_244B201DC;
    return sub_244B4531C();
  }
}

uint64_t sub_244B201DC()
{
  uint64_t v0;

  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_244B20244()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 72) + 32);
  v1(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 64));
  v2 = sub_244B454FC();
  v3 = *(_QWORD *)(v0 + 64);
  if (v2)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 80);
    swift_allocError();
    v1(v5, v4, v3);
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AsyncThrowingStream.transform<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE v13[16];
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573DBD38);
  sub_244B452E0();
  MEMORY[0x24BDAC7A8]();
  v10 = &v13[-v9];
  v14 = *(_OWORD *)(a3 + 16);
  v11 = *(_QWORD *)(a3 + 32);
  v15 = a4;
  v16 = v11;
  v17 = v4;
  v18 = a1;
  v19 = a2;
  sub_244B20F7C((uint64_t)v10);
  return sub_244B45340();
}

uint64_t sub_244B20418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v34 = a8;
  v35 = a7;
  v32 = a5;
  v33 = a6;
  v36 = a3;
  v37 = a4;
  v31 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573DBD38);
  v9 = sub_244B45304();
  v10 = *(_QWORD *)(v9 - 8);
  v30 = v9;
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v30 - v11;
  v13 = sub_244B45334();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v30 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD40);
  MEMORY[0x24BDAC7A8]();
  v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_244B452BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v31, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  v21 = (*(unsigned __int8 *)(v14 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v22 = (v15 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (*(unsigned __int8 *)(v10 + 80) + v22 + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v24 = (char *)swift_allocObject();
  *((_QWORD *)v24 + 2) = 0;
  *((_QWORD *)v24 + 3) = 0;
  v25 = v33;
  *((_QWORD *)v24 + 4) = v32;
  *((_QWORD *)v24 + 5) = v25;
  v26 = v34;
  *((_QWORD *)v24 + 6) = v35;
  *((_QWORD *)v24 + 7) = v26;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v24[v21], v17, v13);
  v27 = &v24[v22];
  v28 = v37;
  *(_QWORD *)v27 = v36;
  *((_QWORD *)v27 + 1) = v28;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v24[v23], v12, v30);
  swift_retain();
  sub_244B3B958((uint64_t)v19, (uint64_t)&unk_2573DBD50, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_244B20650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8[10] = v15;
  v8[11] = v16;
  v8[8] = a8;
  v8[9] = v14;
  v8[6] = a6;
  v8[7] = a7;
  v8[4] = a4;
  v8[5] = a5;
  v8[12] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573DBD38);
  v10 = sub_244B452D4();
  v8[13] = v10;
  v8[14] = *(_QWORD *)(v10 - 8);
  v8[15] = swift_task_alloc();
  v8[16] = *(_QWORD *)(v15 - 8);
  v8[17] = swift_task_alloc();
  v8[18] = swift_task_alloc();
  v11 = sub_244B453DC();
  v8[19] = v11;
  v8[20] = *(_QWORD *)(v11 - 8);
  v8[21] = swift_task_alloc();
  v8[22] = swift_task_alloc();
  v8[23] = *(_QWORD *)(a8 - 8);
  v8[24] = swift_task_alloc();
  v8[25] = *(_QWORD *)(v14 - 8);
  v8[26] = swift_task_alloc();
  v8[27] = swift_task_alloc();
  sub_244B453DC();
  v8[28] = swift_task_alloc();
  v12 = sub_244B45328();
  v8[29] = v12;
  v8[30] = *(_QWORD *)(v12 - 8);
  v8[31] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B20800()
{
  uint64_t v0;
  _QWORD *v1;

  sub_244B45334();
  sub_244B45310();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 256) = v1;
  *v1 = v0;
  v1[1] = sub_244B20880;
  return sub_244B4531C();
}

uint64_t sub_244B20880()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B208E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v5;
  _QWORD *v6;
  int *v7;

  v1 = *(_QWORD *)(v0 + 224);
  v2 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 64);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232));
    *(_QWORD *)(v0 + 24) = 0;
    sub_244B45304();
    sub_244B452F8();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v5 = *(int **)(v0 + 40);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(*(_QWORD *)(v0 + 192), v1, v3);
    v7 = (int *)((char *)v5 + *v5);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v6;
    *v6 = v0;
    v6[1] = sub_244B20A78;
    return ((uint64_t (*)(_QWORD, _QWORD))v7)(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 192));
  }
}

uint64_t sub_244B20A78()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 272) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B20ADC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = v0[21];
  v2 = v0[16];
  v3 = v0[10];
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[20] + 16))(v1, v0[22], v0[19]);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3);
  v6 = v0[23];
  v5 = v0[24];
  v7 = v0[21];
  v9 = v0[19];
  v8 = v0[20];
  if (v4 == 1)
  {
    v10 = v0[8];
    v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v11(v0[22], v0[19]);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v10);
    v11(v7, v9);
  }
  else
  {
    v23 = v0[23];
    v24 = v0[24];
    v13 = v0[17];
    v12 = v0[18];
    v15 = v0[15];
    v14 = v0[16];
    v19 = v0[14];
    v20 = v0[13];
    v16 = v0[10];
    v21 = v0[22];
    v22 = v0[8];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v12, v7, v16);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v12, v16);
    sub_244B45304();
    sub_244B452EC();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v15, v20);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v16);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v21, v9);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v22);
  }
  v17 = (_QWORD *)swift_task_alloc();
  v0[35] = v17;
  *v17 = v0;
  v17[1] = sub_244B20C94;
  return sub_244B4531C();
}

uint64_t sub_244B20C94()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B20CF8()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 200) + 32);
  v1(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 72));
  v2 = sub_244B454FC();
  v3 = *(_QWORD *)(v0 + 208);
  v4 = *(_QWORD *)(v0 + 72);
  if (v2)
  {
    v5 = v2;
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 72));
  }
  else
  {
    v5 = swift_allocError();
    v1(v6, v3, v4);
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232));
  *(_QWORD *)(v0 + 16) = v5;
  sub_244B45304();
  sub_244B452F8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B20E70()
{
  uint64_t v0;
  uint64_t v1;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 184) + 8))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 64));
  v1 = *(_QWORD *)(v0 + 272);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232));
  *(_QWORD *)(v0 + 16) = v1;
  sub_244B45304();
  sub_244B452F8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B20F7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BEE6CA0];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573DBD38);
  v3 = sub_244B452E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24951FF34](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_244B2102C(uint64_t a1)
{
  uint64_t *v1;

  return sub_244B20418(a1, v1[6], v1[7], v1[8], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_244B21040()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_244B45334();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573DBD38);
  v5 = sub_244B45304();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_244B21138(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;

  v16 = v1[4];
  v3 = *(_QWORD *)(sub_244B45334() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573DBD38);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(sub_244B45304() - 8) + 80);
  v7 = (v5 + v6 + 16) & ~v6;
  v8 = v1[2];
  v9 = v1[3];
  v10 = (uint64_t)v1 + v4;
  v11 = *(_QWORD *)((char *)v1 + v5);
  v12 = *(_QWORD *)((char *)v1 + v5 + 8);
  v13 = (uint64_t)v1 + v7;
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_244B21254;
  return sub_244B20650(a1, v8, v9, v10, v11, v12, v13, v16);
}

uint64_t sub_244B21254()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t IndexableFileType.init()()
{
  return 0;
}

void sub_244B212C0(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

unint64_t sub_244B212D0@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = result < 3;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

uint64_t sub_244B212E8()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

_QWORD *sub_244B212F0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;
  char v3;

  v2 = *result >= 3uLL;
  *(_QWORD *)a2 = *result;
  v3 = !v2;
  *(_BYTE *)(a2 + 8) = v3;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

void sub_244B2130C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_244B21318()
{
  sub_244B45580();
  sub_244B4510C();
  return sub_244B45598();
}

uint64_t sub_244B21380()
{
  sub_244B2ADE4();
  return sub_244B44FA4();
}

uint64_t sub_244B213B8()
{
  sub_244B45580();
  sub_244B4510C();
  return sub_244B45598();
}

BOOL sub_244B2141C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_244B21430()
{
  static IndexableFileType.allCases = (uint64_t)&unk_2515B22D0;
}

uint64_t *IndexableFileType.allCases.unsafeMutableAddressor()
{
  if (qword_2573DBB30 != -1)
    swift_once();
  return &static IndexableFileType.allCases;
}

uint64_t static IndexableFileType.allCases.getter()
{
  if (qword_2573DBB30 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static IndexableFileType.allCases.setter(uint64_t a1)
{
  if (qword_2573DBB30 != -1)
    swift_once();
  swift_beginAccess();
  static IndexableFileType.allCases = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static IndexableFileType.allCases.modify())()
{
  if (qword_2573DBB30 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_244B215D4@<X0>(_QWORD *a1@<X8>)
{
  if (qword_2573DBB30 != -1)
    swift_once();
  swift_beginAccess();
  *a1 = static IndexableFileType.allCases;
  return swift_bridgeObjectRetain();
}

uint64_t BenchmarkConfig.indexer.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 20));
  if (v1[1])
    v2 = *v1;
  else
    v2 = 0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t type metadata accessor for BenchmarkConfig(uint64_t a1)
{
  return sub_244B22F38(a1, qword_2573DBE90);
}

uint64_t BenchmarkConfig.indexer.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 20));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*BenchmarkConfig.indexer.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for BenchmarkConfig(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_244B21758;
}

BOOL BenchmarkConfig.hasIndexer.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 20) + 8) != 0;
}

Swift::Void __swiftcall BenchmarkConfig.clearIndexer()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 20));
  swift_bridgeObjectRelease();
  *v1 = 0;
  v1[1] = 0;
}

uint64_t BenchmarkConfig.dataSet.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 24));
  if (v1[1])
    v2 = *v1;
  else
    v2 = 0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BenchmarkConfig.dataSet.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 24));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*BenchmarkConfig.dataSet.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for BenchmarkConfig(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_244B21758;
}

uint64_t sub_244B218B8(uint64_t *a1, char a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;

  v2 = a1[1];
  v3 = (_QWORD *)(a1[2] + *((int *)a1 + 6));
  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *v3 = v4;
    v3[1] = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    result = swift_bridgeObjectRelease();
    *v3 = v4;
    v3[1] = v2;
  }
  return result;
}

BOOL BenchmarkConfig.hasDataSet.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 24) + 8) != 0;
}

Swift::Void __swiftcall BenchmarkConfig.clearDataSet()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 24));
  swift_bridgeObjectRelease();
  *v1 = 0;
  v1[1] = 0;
}

uint64_t (*BenchmarkConfig.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t BenchmarkConfig.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  _QWORD *v3;
  _QWORD *v4;

  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  result = type metadata accessor for BenchmarkConfig(0);
  v3 = (_QWORD *)(a1 + *(int *)(result + 20));
  *v3 = 0;
  v3[1] = 0;
  v4 = (_QWORD *)(a1 + *(int *)(result + 24));
  *v4 = 0;
  v4[1] = 0;
  return result;
}

uint64_t IndexReport.totalDocuments.getter()
{
  return sub_244B224AC(type metadata accessor for IndexReport);
}

uint64_t type metadata accessor for IndexReport(uint64_t a1)
{
  return sub_244B22F38(a1, qword_2573DBF28);
}

uint64_t IndexReport.totalDocuments.setter(uint64_t a1)
{
  return sub_244B22500(a1, type metadata accessor for IndexReport);
}

uint64_t (*IndexReport.totalDocuments.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for IndexReport(0) + 24);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_244B21A60;
}

BOOL IndexReport.hasTotalDocuments.getter()
{
  return sub_244B22594(type metadata accessor for IndexReport);
}

Swift::Void __swiftcall IndexReport.clearTotalDocuments()()
{
  sub_244B225D0(type metadata accessor for IndexReport);
}

uint64_t IndexReport.totalDocumentBytes.getter()
{
  return sub_244B2260C(type metadata accessor for IndexReport);
}

uint64_t IndexReport.totalDocumentBytes.setter(uint64_t a1)
{
  return sub_244B2264C(a1, type metadata accessor for IndexReport);
}

uint64_t (*IndexReport.totalDocumentBytes.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for IndexReport(0) + 28);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_244B21A60;
}

BOOL IndexReport.hasTotalDocumentBytes.getter()
{
  return sub_244B226E0(type metadata accessor for IndexReport);
}

Swift::Void __swiftcall IndexReport.clearTotalDocumentBytes()()
{
  sub_244B2271C(type metadata accessor for IndexReport);
}

uint64_t IndexReport.totalDocumentTokens.getter()
{
  return sub_244B22758(type metadata accessor for IndexReport);
}

uint64_t IndexReport.totalDocumentTokens.setter(uint64_t a1)
{
  return sub_244B22798(a1, type metadata accessor for IndexReport);
}

uint64_t (*IndexReport.totalDocumentTokens.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for IndexReport(0) + 32);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_244B21A60;
}

BOOL IndexReport.hasTotalDocumentTokens.getter()
{
  return sub_244B22844(type metadata accessor for IndexReport);
}

Swift::Void __swiftcall IndexReport.clearTotalDocumentTokens()()
{
  sub_244B22880(type metadata accessor for IndexReport);
}

uint64_t IndexReport.totalIndexSizeBytes.getter()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = (_BYTE *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 36));
  if (v1[8])
    return 0;
  else
    return *(_QWORD *)v1;
}

uint64_t IndexReport.totalIndexSizeBytes.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for IndexReport(0);
  v4 = v1 + *(int *)(result + 36);
  *(_QWORD *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.totalIndexSizeBytes.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for IndexReport(0) + 36);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_244B21A60;
}

BOOL IndexReport.hasTotalIndexSizeBytes.getter()
{
  return sub_244B229BC(type metadata accessor for IndexReport);
}

Swift::Void __swiftcall IndexReport.clearTotalIndexSizeBytes()()
{
  sub_244B229F8(type metadata accessor for IndexReport);
}

uint64_t IndexReport.totalIndexingMillis.getter()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = (_BYTE *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 40));
  if (v1[8])
    return 0;
  else
    return *(_QWORD *)v1;
}

uint64_t IndexReport.totalIndexingMillis.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for IndexReport(0);
  v4 = v1 + *(int *)(result + 40);
  *(_QWORD *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.totalIndexingMillis.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for IndexReport(0) + 40);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_244B21A60;
}

BOOL IndexReport.hasTotalIndexingMillis.getter()
{
  return sub_244B22AF4(type metadata accessor for IndexReport);
}

Swift::Void __swiftcall IndexReport.clearTotalIndexingMillis()()
{
  sub_244B22B30(type metadata accessor for IndexReport);
}

uint64_t IndexReport.totalUniqueTokens.getter()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = (_BYTE *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 44));
  if (v1[8])
    return 0;
  else
    return *(_QWORD *)v1;
}

uint64_t IndexReport.totalUniqueTokens.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for IndexReport(0);
  v4 = v1 + *(int *)(result + 44);
  *(_QWORD *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.totalUniqueTokens.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for IndexReport(0) + 44);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_244B21A60;
}

BOOL IndexReport.hasTotalUniqueTokens.getter()
{
  return sub_244B22C2C(type metadata accessor for IndexReport);
}

Swift::Void __swiftcall IndexReport.clearTotalUniqueTokens()()
{
  sub_244B22C68(type metadata accessor for IndexReport);
}

uint64_t (*IndexReport.indexedTopLevelDirs.modify())()
{
  return nullsub_1;
}

double IndexReport.documentsPerSecond.getter()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 48);
  result = *(double *)v1;
  if (*(_BYTE *)(v1 + 8))
    return 0.0;
  return result;
}

uint64_t IndexReport.documentsPerSecond.setter(double a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for IndexReport(0);
  v4 = v1 + *(int *)(result + 48);
  *(double *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.documentsPerSecond.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  double v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for IndexReport(0) + 48);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = v1 + v3;
  v5 = *(double *)v4;
  if (*(_BYTE *)(v4 + 8))
    v5 = 0.0;
  *(double *)a1 = v5;
  return sub_244B21A60;
}

BOOL IndexReport.hasDocumentsPerSecond.getter()
{
  uint64_t v0;

  return (*(_BYTE *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 48) + 8) & 1) == 0;
}

Swift::Void __swiftcall IndexReport.clearDocumentsPerSecond()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 48);
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 1;
}

double IndexReport.tokensPerSecond.getter()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 52);
  result = *(double *)v1;
  if (*(_BYTE *)(v1 + 8))
    return 0.0;
  return result;
}

uint64_t IndexReport.tokensPerSecond.setter(double a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for IndexReport(0);
  v4 = v1 + *(int *)(result + 52);
  *(double *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.tokensPerSecond.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  double v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for IndexReport(0) + 52);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = v1 + v3;
  v5 = *(double *)v4;
  if (*(_BYTE *)(v4 + 8))
    v5 = 0.0;
  *(double *)a1 = v5;
  return sub_244B21A60;
}

BOOL IndexReport.hasTokensPerSecond.getter()
{
  uint64_t v0;

  return (*(_BYTE *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 52) + 8) & 1) == 0;
}

Swift::Void __swiftcall IndexReport.clearTokensPerSecond()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 52);
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 1;
}

double IndexReport.indexBytesToDocsBytesRatio.getter()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 56);
  result = *(double *)v1;
  if (*(_BYTE *)(v1 + 8))
    return 0.0;
  return result;
}

uint64_t IndexReport.indexBytesToDocsBytesRatio.setter(double a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for IndexReport(0);
  v4 = v1 + *(int *)(result + 56);
  *(double *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.indexBytesToDocsBytesRatio.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  double v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for IndexReport(0) + 56);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = v1 + v3;
  v5 = *(double *)v4;
  if (*(_BYTE *)(v4 + 8))
    v5 = 0.0;
  *(double *)a1 = v5;
  return sub_244B21A60;
}

BOOL IndexReport.hasIndexBytesToDocsBytesRatio.getter()
{
  uint64_t v0;

  return (*(_BYTE *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 56) + 8) & 1) == 0;
}

Swift::Void __swiftcall IndexReport.clearIndexBytesToDocsBytesRatio()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 56);
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 1;
}

uint64_t IndexReport.averageDocumentBytes.getter()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = (_BYTE *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 60));
  if (v1[8])
    return 0;
  else
    return *(_QWORD *)v1;
}

uint64_t IndexReport.averageDocumentBytes.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for IndexReport(0);
  v4 = v1 + *(int *)(result + 60);
  *(_QWORD *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.averageDocumentBytes.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for IndexReport(0) + 60);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_244B21A60;
}

BOOL IndexReport.hasAverageDocumentBytes.getter()
{
  uint64_t v0;

  return (*(_BYTE *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 60) + 8) & 1) == 0;
}

Swift::Void __swiftcall IndexReport.clearAverageDocumentBytes()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 60);
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 1;
}

uint64_t IndexReport.averageIndexBytes.getter()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = (_BYTE *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 64));
  if (v1[8])
    return 0;
  else
    return *(_QWORD *)v1;
}

uint64_t IndexReport.averageIndexBytes.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for IndexReport(0);
  v4 = v1 + *(int *)(result + 64);
  *(_QWORD *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.averageIndexBytes.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for IndexReport(0) + 64);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_244B21A60;
}

BOOL IndexReport.hasAverageIndexBytes.getter()
{
  uint64_t v0;

  return (*(_BYTE *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 64) + 8) & 1) == 0;
}

Swift::Void __swiftcall IndexReport.clearAverageIndexBytes()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 64);
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 1;
}

uint64_t IndexReport.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B22CA4(type metadata accessor for IndexReport, a1);
}

uint64_t IndexReport.unknownFields.setter(uint64_t a1)
{
  return sub_244B22CFC(a1, type metadata accessor for IndexReport);
}

uint64_t (*IndexReport.unknownFields.modify())()
{
  type metadata accessor for IndexReport(0);
  return nullsub_1;
}

uint64_t IndexReport.init()@<X0>(_QWORD *a1@<X8>)
{
  int *v2;
  uint64_t result;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;

  *a1 = MEMORY[0x24BEE4AF8];
  v2 = (int *)type metadata accessor for IndexReport(0);
  result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v4 = (char *)a1 + v2[6];
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)a1 + v2[7];
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v6 = (char *)a1 + v2[8];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v7 = (char *)a1 + v2[9];
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v8 = (char *)a1 + v2[10];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = (char *)a1 + v2[11];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = (char *)a1 + v2[12];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = (char *)a1 + v2[13];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = (char *)a1 + v2[14];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = (char *)a1 + v2[15];
  *(_QWORD *)v13 = 0;
  v13[8] = 1;
  v14 = (char *)a1 + v2[16];
  *(_QWORD *)v14 = 0;
  v14[8] = 1;
  return result;
}

uint64_t SearchReport.uniqueTokenCount.getter()
{
  return sub_244B224AC(type metadata accessor for SearchReport);
}

uint64_t sub_244B224AC(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  _BYTE *v2;

  v2 = (_BYTE *)(v1 + *(int *)(a1(0) + 24));
  if (v2[8])
    return 0;
  else
    return *(_QWORD *)v2;
}

uint64_t type metadata accessor for SearchReport(uint64_t a1)
{
  return sub_244B22F38(a1, qword_2573DBFE8);
}

uint64_t SearchReport.uniqueTokenCount.setter(uint64_t a1)
{
  return sub_244B22500(a1, type metadata accessor for SearchReport);
}

uint64_t sub_244B22500(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = a2(0);
  v5 = v2 + *(int *)(result + 24);
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = 0;
  return result;
}

uint64_t (*SearchReport.uniqueTokenCount.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for SearchReport(0) + 24);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_244B21A60;
}

BOOL SearchReport.hasUniqueTokenCount.getter()
{
  return sub_244B22594(type metadata accessor for SearchReport);
}

BOOL sub_244B22594(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return (*(_BYTE *)(v1 + *(int *)(a1(0) + 24) + 8) & 1) == 0;
}

Swift::Void __swiftcall SearchReport.clearUniqueTokenCount()()
{
  sub_244B225D0(type metadata accessor for SearchReport);
}

uint64_t sub_244B225D0(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = a1(0);
  v3 = v1 + *(int *)(result + 24);
  *(_QWORD *)v3 = 0;
  *(_BYTE *)(v3 + 8) = 1;
  return result;
}

uint64_t SearchReport.durationMillis.getter()
{
  return sub_244B2260C(type metadata accessor for SearchReport);
}

uint64_t sub_244B2260C(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  _BYTE *v2;

  v2 = (_BYTE *)(v1 + *(int *)(a1(0) + 28));
  if (v2[8])
    return 0;
  else
    return *(_QWORD *)v2;
}

uint64_t SearchReport.durationMillis.setter(uint64_t a1)
{
  return sub_244B2264C(a1, type metadata accessor for SearchReport);
}

uint64_t sub_244B2264C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = a2(0);
  v5 = v2 + *(int *)(result + 28);
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = 0;
  return result;
}

uint64_t (*SearchReport.durationMillis.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for SearchReport(0) + 28);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_244B21A60;
}

BOOL SearchReport.hasDurationMillis.getter()
{
  return sub_244B226E0(type metadata accessor for SearchReport);
}

BOOL sub_244B226E0(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return (*(_BYTE *)(v1 + *(int *)(a1(0) + 28) + 8) & 1) == 0;
}

Swift::Void __swiftcall SearchReport.clearDurationMillis()()
{
  sub_244B2271C(type metadata accessor for SearchReport);
}

uint64_t sub_244B2271C(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = a1(0);
  v3 = v1 + *(int *)(result + 28);
  *(_QWORD *)v3 = 0;
  *(_BYTE *)(v3 + 8) = 1;
  return result;
}

uint64_t SearchReport.falsePositiveQueryCount.getter()
{
  return sub_244B22758(type metadata accessor for SearchReport);
}

uint64_t sub_244B22758(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  _BYTE *v2;

  v2 = (_BYTE *)(v1 + *(int *)(a1(0) + 32));
  if (v2[8])
    return 0;
  else
    return *(_QWORD *)v2;
}

uint64_t SearchReport.falsePositiveQueryCount.setter(uint64_t a1)
{
  return sub_244B22798(a1, type metadata accessor for SearchReport);
}

uint64_t sub_244B22798(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = a2(0);
  v5 = v2 + *(int *)(result + 32);
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = 0;
  return result;
}

uint64_t (*SearchReport.falsePositiveQueryCount.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for SearchReport(0) + 32);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_244B21A60;
}

uint64_t sub_244B22820(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 8) + *(int *)(result + 16);
  *(_QWORD *)v1 = *(_QWORD *)result;
  *(_BYTE *)(v1 + 8) = 0;
  return result;
}

BOOL SearchReport.hasFalsePositiveQueryCount.getter()
{
  return sub_244B22844(type metadata accessor for SearchReport);
}

BOOL sub_244B22844(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return (*(_BYTE *)(v1 + *(int *)(a1(0) + 32) + 8) & 1) == 0;
}

Swift::Void __swiftcall SearchReport.clearFalsePositiveQueryCount()()
{
  sub_244B22880(type metadata accessor for SearchReport);
}

uint64_t sub_244B22880(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = a1(0);
  v3 = v1 + *(int *)(result + 32);
  *(_QWORD *)v3 = 0;
  *(_BYTE *)(v3 + 8) = 1;
  return result;
}

uint64_t SearchReport.falsePositiveQueryTokens.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SearchReport.falsePositiveQueryTokens.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*SearchReport.falsePositiveQueryTokens.modify())()
{
  return nullsub_1;
}

double SearchReport.falsePositiveQueryPercentage.getter()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = v0 + *(int *)(type metadata accessor for SearchReport(0) + 36);
  result = *(double *)v1;
  if (*(_BYTE *)(v1 + 8))
    return 0.0;
  return result;
}

uint64_t SearchReport.falsePositiveQueryPercentage.setter(double a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for SearchReport(0);
  v4 = v1 + *(int *)(result + 36);
  *(double *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*SearchReport.falsePositiveQueryPercentage.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  double v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for SearchReport(0) + 36);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = v1 + v3;
  v5 = *(double *)v4;
  if (*(_BYTE *)(v4 + 8))
    v5 = 0.0;
  *(double *)a1 = v5;
  return sub_244B21A60;
}

BOOL SearchReport.hasFalsePositiveQueryPercentage.getter()
{
  return sub_244B229BC(type metadata accessor for SearchReport);
}

BOOL sub_244B229BC(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return (*(_BYTE *)(v1 + *(int *)(a1(0) + 36) + 8) & 1) == 0;
}

Swift::Void __swiftcall SearchReport.clearFalsePositiveQueryPercentage()()
{
  sub_244B229F8(type metadata accessor for SearchReport);
}

uint64_t sub_244B229F8(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = a1(0);
  v3 = v1 + *(int *)(result + 36);
  *(_QWORD *)v3 = 0;
  *(_BYTE *)(v3 + 8) = 1;
  return result;
}

double SearchReport.averageFalsePositiveResultPercentage.getter()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = v0 + *(int *)(type metadata accessor for SearchReport(0) + 40);
  result = *(double *)v1;
  if (*(_BYTE *)(v1 + 8))
    return 0.0;
  return result;
}

uint64_t SearchReport.averageFalsePositiveResultPercentage.setter(double a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for SearchReport(0);
  v4 = v1 + *(int *)(result + 40);
  *(double *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*SearchReport.averageFalsePositiveResultPercentage.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  double v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for SearchReport(0) + 40);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = v1 + v3;
  v5 = *(double *)v4;
  if (*(_BYTE *)(v4 + 8))
    v5 = 0.0;
  *(double *)a1 = v5;
  return sub_244B21A60;
}

BOOL SearchReport.hasAverageFalsePositiveResultPercentage.getter()
{
  return sub_244B22AF4(type metadata accessor for SearchReport);
}

BOOL sub_244B22AF4(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return (*(_BYTE *)(v1 + *(int *)(a1(0) + 40) + 8) & 1) == 0;
}

Swift::Void __swiftcall SearchReport.clearAverageFalsePositiveResultPercentage()()
{
  sub_244B22B30(type metadata accessor for SearchReport);
}

uint64_t sub_244B22B30(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = a1(0);
  v3 = v1 + *(int *)(result + 40);
  *(_QWORD *)v3 = 0;
  *(_BYTE *)(v3 + 8) = 1;
  return result;
}

double SearchReport.searchesPerSecond.getter()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = v0 + *(int *)(type metadata accessor for SearchReport(0) + 44);
  result = *(double *)v1;
  if (*(_BYTE *)(v1 + 8))
    return 0.0;
  return result;
}

uint64_t SearchReport.searchesPerSecond.setter(double a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for SearchReport(0);
  v4 = v1 + *(int *)(result + 44);
  *(double *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*SearchReport.searchesPerSecond.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  double v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for SearchReport(0) + 44);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = v1 + v3;
  v5 = *(double *)v4;
  if (*(_BYTE *)(v4 + 8))
    v5 = 0.0;
  *(double *)a1 = v5;
  return sub_244B21A60;
}

BOOL SearchReport.hasSearchesPerSecond.getter()
{
  return sub_244B22C2C(type metadata accessor for SearchReport);
}

BOOL sub_244B22C2C(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return (*(_BYTE *)(v1 + *(int *)(a1(0) + 44) + 8) & 1) == 0;
}

Swift::Void __swiftcall SearchReport.clearSearchesPerSecond()()
{
  sub_244B22C68(type metadata accessor for SearchReport);
}

uint64_t sub_244B22C68(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = a1(0);
  v3 = v1 + *(int *)(result + 44);
  *(_QWORD *)v3 = 0;
  *(_BYTE *)(v3 + 8) = 1;
  return result;
}

uint64_t SearchReport.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B22CA4(type metadata accessor for SearchReport, a1);
}

uint64_t sub_244B22CA4@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1(0) + 20);
  v5 = sub_244B44F80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t SearchReport.unknownFields.setter(uint64_t a1)
{
  return sub_244B22CFC(a1, type metadata accessor for SearchReport);
}

uint64_t sub_244B22CFC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2(0) + 20);
  v5 = sub_244B44F80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*SearchReport.unknownFields.modify())()
{
  type metadata accessor for SearchReport(0);
  return nullsub_1;
}

uint64_t SearchReport.init()@<X0>(_QWORD *a1@<X8>)
{
  int *v2;
  uint64_t result;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;

  *a1 = MEMORY[0x24BEE4AF8];
  v2 = (int *)type metadata accessor for SearchReport(0);
  result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v4 = (char *)a1 + v2[6];
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)a1 + v2[7];
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v6 = (char *)a1 + v2[8];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v7 = (char *)a1 + v2[9];
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v8 = (char *)a1 + v2[10];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = (char *)a1 + v2[11];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  return result;
}

uint64_t BenchmarkReport.startMillis.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20));
  swift_beginAccess();
  if (*(_BYTE *)(v1 + 24))
    return 0;
  else
    return *(_QWORD *)(v1 + 16);
}

uint64_t type metadata accessor for BenchmarkReport(uint64_t a1)
{
  return sub_244B22F38(a1, qword_2573DC090);
}

uint64_t BenchmarkReport.startMillis.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    v4 = swift_retain();
    *(_QWORD *)(v1 + v3) = sub_244B26858(v4);
    swift_release();
  }
  v5 = *(_QWORD *)(v1 + v3);
  result = swift_beginAccess();
  *(_QWORD *)(v5 + 16) = a1;
  *(_BYTE *)(v5 + 24) = 0;
  return result;
}

uint64_t type metadata accessor for BenchmarkReport._StorageClass(uint64_t a1)
{
  return sub_244B22F38(a1, (uint64_t *)&unk_2573DC0F0);
}

uint64_t sub_244B22F38(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void (*BenchmarkReport.startMillis.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[10] = v1;
  v4 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  *((_DWORD *)v3 + 22) = v4;
  v5 = *(_QWORD *)(v1 + v4);
  swift_beginAccess();
  v6 = *(_QWORD *)(v5 + 16);
  if (*(_BYTE *)(v5 + 24))
    v6 = 0;
  v3[9] = v6;
  return sub_244B22FEC;
}

void sub_244B22FEC(uint64_t *a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *a1;
  v4 = *(_QWORD *)(*a1 + 72);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if ((a2 & 1) == 0)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    v6 = *(int *)(v3 + 88);
    v7 = *(_QWORD *)(v3 + 80);
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    v8 = swift_retain();
    *(_QWORD *)(v7 + v6) = sub_244B26858(v8);
    swift_release();
  }
LABEL_4:
  v9 = *(_QWORD *)(*(_QWORD *)(v3 + 80) + *(int *)(v3 + 88));
  swift_beginAccess();
  *(_QWORD *)(v9 + 16) = v4;
  *(_BYTE *)(v9 + 24) = 0;
  free((void *)v3);
}

BOOL BenchmarkReport.hasStartMillis.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20));
  swift_beginAccess();
  return (*(_BYTE *)(v1 + 24) & 1) == 0;
}

Swift::Void __swiftcall BenchmarkReport.clearStartMillis()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    v2 = swift_retain();
    *(_QWORD *)(v0 + v1) = sub_244B26858(v2);
    swift_release();
  }
  v3 = *(_QWORD *)(v0 + v1);
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = 0;
  *(_BYTE *)(v3 + 24) = 1;
}

uint64_t BenchmarkReport.startDate.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20));
  swift_beginAccess();
  if (*(_QWORD *)(v1 + 40))
    v2 = *(_QWORD *)(v1 + 32);
  else
    v2 = 0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BenchmarkReport.startDate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    v6 = swift_retain();
    *(_QWORD *)(v2 + v5) = sub_244B26858(v6);
    swift_release();
  }
  v7 = *(_QWORD *)(v2 + v5);
  swift_beginAccess();
  *(_QWORD *)(v7 + 32) = a1;
  *(_QWORD *)(v7 + 40) = a2;
  return swift_bridgeObjectRelease();
}

void (*BenchmarkReport.startDate.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[11] = v1;
  v4 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  *((_DWORD *)v3 + 24) = v4;
  v5 = *(_QWORD *)(v1 + v4);
  swift_beginAccess();
  if (*(_QWORD *)(v5 + 40))
  {
    v6 = *(_QWORD *)(v5 + 32);
    v7 = *(_QWORD *)(v5 + 40);
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  v3[9] = v6;
  v3[10] = v7;
  swift_bridgeObjectRetain();
  return sub_244B23378;
}

void sub_244B23378(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *a1;
  v3 = *(_QWORD *)(*a1 + 72);
  v4 = *(_QWORD *)(*a1 + 80);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v5 = *(int *)(v2 + 96);
      v6 = *(_QWORD *)(v2 + 88);
      type metadata accessor for BenchmarkReport._StorageClass(0);
      swift_allocObject();
      v7 = swift_retain();
      *(_QWORD *)(v6 + v5) = sub_244B26858(v7);
      swift_release();
    }
    v8 = *(_QWORD *)(*(_QWORD *)(v2 + 88) + *(int *)(v2 + 96));
    swift_beginAccess();
    *(_QWORD *)(v8 + 32) = v3;
    *(_QWORD *)(v8 + 40) = v4;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v9 = *(int *)(v2 + 96);
      v10 = *(_QWORD *)(v2 + 88);
      type metadata accessor for BenchmarkReport._StorageClass(0);
      swift_allocObject();
      v11 = swift_retain();
      *(_QWORD *)(v10 + v9) = sub_244B26858(v11);
      swift_release();
    }
    v12 = *(_QWORD *)(*(_QWORD *)(v2 + 88) + *(int *)(v2 + 96));
    swift_beginAccess();
    *(_QWORD *)(v12 + 32) = v3;
    *(_QWORD *)(v12 + 40) = v4;
  }
  swift_bridgeObjectRelease();
  free((void *)v2);
}

BOOL BenchmarkReport.hasStartDate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20));
  swift_beginAccess();
  return *(_QWORD *)(v1 + 40) != 0;
}

Swift::Void __swiftcall BenchmarkReport.clearStartDate()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    v2 = swift_retain();
    *(_QWORD *)(v0 + v1) = sub_244B26858(v2);
    swift_release();
  }
  v3 = *(_QWORD *)(v0 + v1);
  swift_beginAccess();
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = 0;
  swift_bridgeObjectRelease();
}

uint64_t BenchmarkReport.config.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD60);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20))
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
  swift_beginAccess();
  sub_244B26C8C(v5, (uint64_t)v4, &qword_2573DBD60);
  v6 = type metadata accessor for BenchmarkConfig(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v4, 1, v6) != 1)
    return sub_244B26BC8((uint64_t)v4, a1, type metadata accessor for BenchmarkConfig);
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v7 = (_QWORD *)(a1 + *(int *)(v6 + 20));
  *v7 = 0;
  v7[1] = 0;
  v8 = (_QWORD *)(a1 + *(int *)(v6 + 24));
  *v8 = 0;
  v8[1] = 0;
  return sub_244B2AE28((uint64_t)v4, &qword_2573DBD60);
}

uint64_t BenchmarkReport.config.setter(uint64_t a1)
{
  return sub_244B24100(a1, &qword_2573DBD60, type metadata accessor for BenchmarkConfig, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config);
}

void (*BenchmarkReport.config.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD60);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[4] = v5;
  v6 = type metadata accessor for BenchmarkConfig(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v3[5] = malloc(v8);
  v9 = (char *)malloc(v8);
  v3[6] = v9;
  v10 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20))
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
  swift_beginAccess();
  sub_244B26C8C(v10, (uint64_t)v5, &qword_2573DBD60);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    v11 = &v9[*(int *)(v6 + 20)];
    *(_QWORD *)v11 = 0;
    *((_QWORD *)v11 + 1) = 0;
    v12 = &v9[*(int *)(v6 + 24)];
    *(_QWORD *)v12 = 0;
    *((_QWORD *)v12 + 1) = 0;
    sub_244B2AE28((uint64_t)v5, &qword_2573DBD60);
  }
  else
  {
    sub_244B26BC8((uint64_t)v5, (uint64_t)v9, type metadata accessor for BenchmarkConfig);
  }
  return sub_244B2384C;
}

void sub_244B2384C(uint64_t a1, char a2)
{
  sub_244B23C88(a1, a2, (void (*)(void *))BenchmarkReport.config.setter, type metadata accessor for BenchmarkConfig);
}

BOOL BenchmarkReport.hasConfig.getter()
{
  return sub_244B23D38(&qword_2573DBD60, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config, type metadata accessor for BenchmarkConfig);
}

Swift::Void __swiftcall BenchmarkReport.clearConfig()()
{
  sub_244B23E34(&qword_2573DBD60, type metadata accessor for BenchmarkConfig, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config);
}

uint64_t BenchmarkReport.indexReport.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD70);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20))
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
  swift_beginAccess();
  sub_244B26C8C(v6, (uint64_t)v5, &qword_2573DBD70);
  v7 = (int *)type metadata accessor for IndexReport(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v7 - 1) + 48))(v5, 1, v7) != 1)
    return sub_244B26BC8((uint64_t)v5, (uint64_t)a1, type metadata accessor for IndexReport);
  *a1 = MEMORY[0x24BEE4AF8];
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v8 = (char *)a1 + v7[6];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = (char *)a1 + v7[7];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = (char *)a1 + v7[8];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = (char *)a1 + v7[9];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = (char *)a1 + v7[10];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = (char *)a1 + v7[11];
  *(_QWORD *)v13 = 0;
  v13[8] = 1;
  v14 = (char *)a1 + v7[12];
  *(_QWORD *)v14 = 0;
  v14[8] = 1;
  v15 = (char *)a1 + v7[13];
  *(_QWORD *)v15 = 0;
  v15[8] = 1;
  v16 = (char *)a1 + v7[14];
  *(_QWORD *)v16 = 0;
  v16[8] = 1;
  v17 = (char *)a1 + v7[15];
  *(_QWORD *)v17 = 0;
  v17[8] = 1;
  v18 = (char *)a1 + v7[16];
  *(_QWORD *)v18 = 0;
  v18[8] = 1;
  return sub_244B2AE28((uint64_t)v5, &qword_2573DBD70);
}

uint64_t BenchmarkReport.indexReport.setter(uint64_t a1)
{
  return sub_244B24100(a1, &qword_2573DBD70, type metadata accessor for IndexReport, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport);
}

void (*BenchmarkReport.indexReport.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  int *v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD70);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[4] = v5;
  v6 = (int *)type metadata accessor for IndexReport(0);
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(_QWORD *)(v7 + 64);
  v3[5] = malloc(v8);
  v9 = malloc(v8);
  v3[6] = v9;
  v10 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20))
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
  swift_beginAccess();
  sub_244B26C8C(v10, (uint64_t)v5, &qword_2573DBD70);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v7 + 48))(v5, 1, v6) == 1)
  {
    *v9 = MEMORY[0x24BEE4AF8];
    _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    v11 = (char *)v9 + v6[6];
    *(_QWORD *)v11 = 0;
    v11[8] = 1;
    v12 = (char *)v9 + v6[7];
    *(_QWORD *)v12 = 0;
    v12[8] = 1;
    v13 = (char *)v9 + v6[8];
    *(_QWORD *)v13 = 0;
    v13[8] = 1;
    v14 = (char *)v9 + v6[9];
    *(_QWORD *)v14 = 0;
    v14[8] = 1;
    v15 = (char *)v9 + v6[10];
    *(_QWORD *)v15 = 0;
    v15[8] = 1;
    v16 = (char *)v9 + v6[11];
    *(_QWORD *)v16 = 0;
    v16[8] = 1;
    v17 = (char *)v9 + v6[12];
    *(_QWORD *)v17 = 0;
    v17[8] = 1;
    v18 = (char *)v9 + v6[13];
    *(_QWORD *)v18 = 0;
    v18[8] = 1;
    v19 = (char *)v9 + v6[14];
    *(_QWORD *)v19 = 0;
    v19[8] = 1;
    v20 = (char *)v9 + v6[15];
    *(_QWORD *)v20 = 0;
    v20[8] = 1;
    v21 = (char *)v9 + v6[16];
    *(_QWORD *)v21 = 0;
    v21[8] = 1;
    sub_244B2AE28((uint64_t)v5, &qword_2573DBD70);
  }
  else
  {
    sub_244B26BC8((uint64_t)v5, (uint64_t)v9, type metadata accessor for IndexReport);
  }
  return sub_244B23C74;
}

void sub_244B23C74(uint64_t a1, char a2)
{
  sub_244B23C88(a1, a2, (void (*)(void *))BenchmarkReport.indexReport.setter, type metadata accessor for IndexReport);
}

void sub_244B23C88(uint64_t a1, char a2, void (*a3)(void *), uint64_t (*a4)(_QWORD))
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = *(void **)a1;
  v6 = *(void **)(*(_QWORD *)a1 + 40);
  v7 = *(void **)(*(_QWORD *)a1 + 48);
  v8 = *(void **)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    sub_244B26C0C(*(_QWORD *)(*(_QWORD *)a1 + 48), (uint64_t)v6, a4);
    a3(v6);
    sub_244B26C50((uint64_t)v7, a4);
  }
  else
  {
    a3(*(void **)(*(_QWORD *)a1 + 48));
  }
  free(v7);
  free(v6);
  free(v8);
  free(v5);
}

BOOL BenchmarkReport.hasIndexReport.getter()
{
  return sub_244B23D38(&qword_2573DBD70, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport, type metadata accessor for IndexReport);
}

BOOL sub_244B23D38(uint64_t *a1, _QWORD *a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v3 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20)) + *a2;
  swift_beginAccess();
  sub_244B26C8C(v10, (uint64_t)v9, a1);
  v11 = a3(0);
  v12 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v9, 1, v11) != 1;
  sub_244B2AE28((uint64_t)v9, a1);
  return v12;
}

Swift::Void __swiftcall BenchmarkReport.clearIndexReport()()
{
  sub_244B23E34(&qword_2573DBD70, type metadata accessor for IndexReport, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport);
}

uint64_t sub_244B23E34(uint64_t *a1, uint64_t (*a2)(_QWORD), _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    v11 = swift_retain();
    *(_QWORD *)(v3 + v10) = sub_244B26858(v11);
    swift_release();
  }
  v12 = *(_QWORD *)(v3 + v10);
  v13 = a2(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = v12 + *a3;
  swift_beginAccess();
  swift_retain();
  sub_244B26D14((uint64_t)v9, v14, a1);
  swift_endAccess();
  return swift_release();
}

uint64_t BenchmarkReport.searchReport.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD80);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20))
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
  swift_beginAccess();
  sub_244B26C8C(v6, (uint64_t)v5, &qword_2573DBD80);
  v7 = (int *)type metadata accessor for SearchReport(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v7 - 1) + 48))(v5, 1, v7) != 1)
    return sub_244B26BC8((uint64_t)v5, (uint64_t)a1, type metadata accessor for SearchReport);
  *a1 = MEMORY[0x24BEE4AF8];
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v8 = (char *)a1 + v7[6];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = (char *)a1 + v7[7];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = (char *)a1 + v7[8];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = (char *)a1 + v7[9];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = (char *)a1 + v7[10];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = (char *)a1 + v7[11];
  *(_QWORD *)v13 = 0;
  v13[8] = 1;
  return sub_244B2AE28((uint64_t)v5, &qword_2573DBD80);
}

uint64_t BenchmarkReport.searchReport.setter(uint64_t a1)
{
  return sub_244B24100(a1, &qword_2573DBD80, type metadata accessor for SearchReport, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport);
}

uint64_t sub_244B24100(uint64_t a1, uint64_t *a2, uint64_t (*a3)(_QWORD), _QWORD *a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(a2);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v20 - v12;
  v14 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    v15 = swift_retain();
    *(_QWORD *)(v4 + v14) = sub_244B26858(v15);
    swift_release();
  }
  v16 = *(_QWORD *)(v4 + v14);
  sub_244B26BC8(a1, (uint64_t)v13, a3);
  v17 = a3(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 0, 1, v17);
  sub_244B26CD0((uint64_t)v13, (uint64_t)v11, a2);
  v18 = v16 + *a4;
  swift_beginAccess();
  swift_retain();
  sub_244B26D14((uint64_t)v11, v18, a2);
  swift_endAccess();
  return swift_release();
}

void (*BenchmarkReport.searchReport.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  int *v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD80);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[4] = v5;
  v6 = (int *)type metadata accessor for SearchReport(0);
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(_QWORD *)(v7 + 64);
  v3[5] = malloc(v8);
  v9 = malloc(v8);
  v3[6] = v9;
  v10 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20))
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
  swift_beginAccess();
  sub_244B26C8C(v10, (uint64_t)v5, &qword_2573DBD80);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v7 + 48))(v5, 1, v6) == 1)
  {
    *v9 = MEMORY[0x24BEE4AF8];
    _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    v11 = (char *)v9 + v6[6];
    *(_QWORD *)v11 = 0;
    v11[8] = 1;
    v12 = (char *)v9 + v6[7];
    *(_QWORD *)v12 = 0;
    v12[8] = 1;
    v13 = (char *)v9 + v6[8];
    *(_QWORD *)v13 = 0;
    v13[8] = 1;
    v14 = (char *)v9 + v6[9];
    *(_QWORD *)v14 = 0;
    v14[8] = 1;
    v15 = (char *)v9 + v6[10];
    *(_QWORD *)v15 = 0;
    v15[8] = 1;
    v16 = (char *)v9 + v6[11];
    *(_QWORD *)v16 = 0;
    v16[8] = 1;
    sub_244B2AE28((uint64_t)v5, &qword_2573DBD80);
  }
  else
  {
    sub_244B26BC8((uint64_t)v5, (uint64_t)v9, type metadata accessor for SearchReport);
  }
  return sub_244B2442C;
}

void sub_244B2442C(uint64_t a1, char a2)
{
  sub_244B23C88(a1, a2, (void (*)(void *))BenchmarkReport.searchReport.setter, type metadata accessor for SearchReport);
}

BOOL BenchmarkReport.hasSearchReport.getter()
{
  return sub_244B23D38(&qword_2573DBD80, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport, type metadata accessor for SearchReport);
}

Swift::Void __swiftcall BenchmarkReport.clearSearchReport()()
{
  sub_244B23E34(&qword_2573DBD80, type metadata accessor for SearchReport, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport);
}

uint64_t _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_244B44F80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvs_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_244B44F80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*BenchmarkReport.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t BenchmarkReport.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v2 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if (qword_2573DBB60 != -1)
    swift_once();
  *(_QWORD *)(a1 + v2) = qword_2573DBD58;
  return swift_retain();
}

uint64_t sub_244B24560()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_244B450A0();
  __swift_allocate_value_buffer(v0, static IndexableFileType._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static IndexableFileType._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC278);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC280);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_244B45A10;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 0;
  *(_QWORD *)v7 = "UNKNOWN";
  *(_QWORD *)(v7 + 8) = 7;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_244B45088();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 1;
  *(_QWORD *)v11 = "TXT";
  *((_QWORD *)v11 + 1) = 3;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 2;
  *(_QWORD *)v12 = "PDF";
  *(_QWORD *)(v12 + 8) = 3;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_244B45094();
}

uint64_t IndexableFileType._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_244B266BC(&qword_2573DBB38, (uint64_t)static IndexableFileType._protobuf_nameMap);
}

uint64_t static IndexableFileType._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B26718(&qword_2573DBB38, (uint64_t)static IndexableFileType._protobuf_nameMap, a1);
}

uint64_t sub_244B24724@<X0>(uint64_t a1@<X8>)
{
  return sub_244B28450(&qword_2573DBB38, (uint64_t)static IndexableFileType._protobuf_nameMap, a1);
}

void *BenchmarkConfig.protoMessageName.unsafeMutableAddressor()
{
  return &static BenchmarkConfig.protoMessageName;
}

uint64_t static BenchmarkConfig.protoMessageName.getter()
{
  return 0x72616D68636E6542;
}

uint64_t sub_244B24770()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_244B450A0();
  __swift_allocate_value_buffer(v0, static BenchmarkConfig._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static BenchmarkConfig._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC278);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC280);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_244B45A20;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "indexer";
  *(_QWORD *)(v7 + 8) = 7;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_244B45088();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "dataSet";
  *((_QWORD *)v11 + 1) = 7;
  v11[16] = 2;
  v10();
  return sub_244B45094();
}

uint64_t BenchmarkConfig._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_244B266BC(&qword_2573DBB40, (uint64_t)static BenchmarkConfig._protobuf_nameMap);
}

uint64_t static BenchmarkConfig._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B26718(&qword_2573DBB40, (uint64_t)static BenchmarkConfig._protobuf_nameMap, a1);
}

uint64_t BenchmarkConfig.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_244B44FB0();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 2 || result == 1)
    {
      type metadata accessor for BenchmarkConfig(0);
      sub_244B44FEC();
    }
    v0 = 0;
  }
  return result;
}

uint64_t BenchmarkConfig.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  result = sub_244B24A14(v0);
  if (!v1)
  {
    sub_244B24A88(v0);
    return sub_244B44F68();
  }
  return result;
}

uint64_t sub_244B24A14(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for BenchmarkConfig(0);
  if (*(_QWORD *)(a1 + *(int *)(result + 20) + 8))
    return sub_244B45064();
  return result;
}

uint64_t sub_244B24A88(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for BenchmarkConfig(0);
  if (*(_QWORD *)(a1 + *(int *)(result + 24) + 8))
    return sub_244B45064();
  return result;
}

uint64_t BenchmarkConfig.hashValue.getter()
{
  return sub_244B282C0(type metadata accessor for BenchmarkConfig, &qword_2573DBD90, (uint64_t)&protocol conformance descriptor for BenchmarkConfig);
}

uint64_t sub_244B24B1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v5 = *(int *)(a1 + 24);
  v6 = (_QWORD *)(a2 + *(int *)(a1 + 20));
  *v6 = 0;
  v6[1] = 0;
  v7 = (_QWORD *)(a2 + v5);
  *v7 = 0;
  v7[1] = 0;
  return result;
}

uint64_t sub_244B24B54()
{
  return 0x72616D68636E6542;
}

uint64_t (*sub_244B24B84())()
{
  return nullsub_1;
}

uint64_t sub_244B24B94()
{
  return BenchmarkConfig.decodeMessage<A>(decoder:)();
}

uint64_t sub_244B24BA8()
{
  return BenchmarkConfig.traverse<A>(visitor:)();
}

uint64_t sub_244B24BC0()
{
  sub_244B28C74(&qword_2573DC248, type metadata accessor for BenchmarkConfig, (uint64_t)&protocol conformance descriptor for BenchmarkConfig);
  return sub_244B44F98();
}

uint64_t sub_244B24C14@<X0>(uint64_t a1@<X8>)
{
  return sub_244B28450(&qword_2573DBB40, (uint64_t)static BenchmarkConfig._protobuf_nameMap, a1);
}

uint64_t sub_244B24C30()
{
  sub_244B28C74(&qword_2573DBDE0, type metadata accessor for BenchmarkConfig, (uint64_t)&protocol conformance descriptor for BenchmarkConfig);
  return sub_244B4501C();
}

uint64_t sub_244B24C74()
{
  sub_244B28C74(&qword_2573DBDE0, type metadata accessor for BenchmarkConfig, (uint64_t)&protocol conformance descriptor for BenchmarkConfig);
  return sub_244B45028();
}

const char *IndexReport.protoMessageName.unsafeMutableAddressor()
{
  return "IndexReport";
}

uint64_t static IndexReport.protoMessageName.getter()
{
  return 0x7065527865646E49;
}

uint64_t sub_244B24CF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  char *v26;
  _QWORD *v27;
  char *v28;
  _QWORD *v29;
  char *v30;

  v0 = sub_244B450A0();
  __swift_allocate_value_buffer(v0, static IndexReport._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static IndexReport._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC278);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC280);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_244B45A30;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "totalDocuments";
  *(_QWORD *)(v7 + 8) = 14;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_244B45088();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "totalDocumentBytes";
  *(_QWORD *)(v11 + 8) = 18;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "totalDocumentTokens";
  *((_QWORD *)v13 + 1) = 19;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "totalIndexSizeBytes";
  *((_QWORD *)v15 + 1) = 19;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 5;
  *(_QWORD *)v17 = "totalIndexingMillis";
  *((_QWORD *)v17 + 1) = 19;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 6;
  *(_QWORD *)v19 = "totalUniqueTokens";
  *((_QWORD *)v19 + 1) = 17;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 7;
  *(_QWORD *)v21 = "indexedTopLevelDirs";
  *((_QWORD *)v21 + 1) = 19;
  v21[16] = 2;
  v10();
  v22 = (_QWORD *)(v6 + 7 * v3);
  v23 = (char *)v22 + *(int *)(v1 + 48);
  *v22 = 8;
  *(_QWORD *)v23 = "documentsPerSecond";
  *((_QWORD *)v23 + 1) = 18;
  v23[16] = 2;
  v10();
  v24 = v6 + 8 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + 8 * v3) = 9;
  *(_QWORD *)v24 = "tokensPerSecond";
  *(_QWORD *)(v24 + 8) = 15;
  *(_BYTE *)(v24 + 16) = 2;
  v10();
  v25 = (_QWORD *)(v6 + 9 * v3);
  v26 = (char *)v25 + *(int *)(v1 + 48);
  *v25 = 10;
  *(_QWORD *)v26 = "indexBytesToDocsBytesRatio";
  *((_QWORD *)v26 + 1) = 26;
  v26[16] = 2;
  v10();
  v27 = (_QWORD *)(v6 + 10 * v3);
  v28 = (char *)v27 + *(int *)(v1 + 48);
  *v27 = 11;
  *(_QWORD *)v28 = "averageDocumentBytes";
  *((_QWORD *)v28 + 1) = 20;
  v28[16] = 2;
  v10();
  v29 = (_QWORD *)(v6 + 11 * v3);
  v30 = (char *)v29 + *(int *)(v1 + 48);
  *v29 = 12;
  *(_QWORD *)v30 = "averageIndexBytes";
  *((_QWORD *)v30 + 1) = 17;
  v30[16] = 2;
  v10();
  return sub_244B45094();
}

uint64_t IndexReport._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_244B266BC(&qword_2573DBB48, (uint64_t)static IndexReport._protobuf_nameMap);
}

uint64_t static IndexReport._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B26718(&qword_2573DBB48, (uint64_t)static IndexReport._protobuf_nameMap, a1);
}

uint64_t IndexReport.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t v3;
  uint64_t v4;

  result = sub_244B44FB0();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 11:
        case 12:
          type metadata accessor for IndexReport(0);
          v4 = v3;
          sub_244B44FC8();
          goto LABEL_8;
        case 7:
          v4 = v3;
          sub_244B44FD4();
          goto LABEL_8;
        case 8:
        case 9:
        case 10:
          type metadata accessor for IndexReport(0);
          v4 = v3;
          sub_244B44FE0();
LABEL_8:
          v3 = v4;
          break;
        default:
          break;
      }
      result = sub_244B44FB0();
    }
  }
  return result;
}

uint64_t IndexReport.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v5 = v3;
  result = sub_244B25F3C(v5, a1, a2, a3, type metadata accessor for IndexReport);
  if (!v4)
  {
    sub_244B25FB0(v5, a1, a2, a3, type metadata accessor for IndexReport);
    sub_244B26024(v5, a1, a2, a3, type metadata accessor for IndexReport);
    sub_244B253D4(v5);
    sub_244B25448(v5);
    sub_244B254BC(v5);
    if (*(_QWORD *)(*(_QWORD *)v5 + 16))
      sub_244B4504C();
    sub_244B25530(v5);
    sub_244B255A4(v5);
    sub_244B25618(v5);
    sub_244B2568C(v5);
    sub_244B25700(v5);
    type metadata accessor for IndexReport(0);
    return sub_244B44F68();
  }
  return result;
}

uint64_t sub_244B253D4(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for IndexReport(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 36) + 8) & 1) == 0)
    return sub_244B45040();
  return result;
}

uint64_t sub_244B25448(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for IndexReport(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 40) + 8) & 1) == 0)
    return sub_244B45040();
  return result;
}

uint64_t sub_244B254BC(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for IndexReport(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 44) + 8) & 1) == 0)
    return sub_244B45040();
  return result;
}

uint64_t sub_244B25530(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for IndexReport(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 48) + 8) & 1) == 0)
    return sub_244B45058();
  return result;
}

uint64_t sub_244B255A4(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for IndexReport(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 52) + 8) & 1) == 0)
    return sub_244B45058();
  return result;
}

uint64_t sub_244B25618(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for IndexReport(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 56) + 8) & 1) == 0)
    return sub_244B45058();
  return result;
}

uint64_t sub_244B2568C(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for IndexReport(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 60) + 8) & 1) == 0)
    return sub_244B45040();
  return result;
}

uint64_t sub_244B25700(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for IndexReport(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 64) + 8) & 1) == 0)
    return sub_244B45040();
  return result;
}

uint64_t IndexReport.hashValue.getter()
{
  return sub_244B282C0(type metadata accessor for IndexReport, &qword_2573DBD98, (uint64_t)&protocol conformance descriptor for IndexReport);
}

uint64_t sub_244B25794@<X0>(int *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;

  *a2 = MEMORY[0x24BEE4AF8];
  result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v5 = a1[7];
  v6 = (char *)a2 + a1[6];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v7 = (char *)a2 + v5;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v8 = a1[9];
  v9 = (char *)a2 + a1[8];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = (char *)a2 + v8;
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = a1[11];
  v12 = (char *)a2 + a1[10];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = (char *)a2 + v11;
  *(_QWORD *)v13 = 0;
  v13[8] = 1;
  v14 = a1[13];
  v15 = (char *)a2 + a1[12];
  *(_QWORD *)v15 = 0;
  v15[8] = 1;
  v16 = (char *)a2 + v14;
  *(_QWORD *)v16 = 0;
  v16[8] = 1;
  v17 = a1[15];
  v18 = (char *)a2 + a1[14];
  *(_QWORD *)v18 = 0;
  v18[8] = 1;
  v19 = (char *)a2 + v17;
  *(_QWORD *)v19 = 0;
  v19[8] = 1;
  v20 = (char *)a2 + a1[16];
  *(_QWORD *)v20 = 0;
  v20[8] = 1;
  return result;
}

uint64_t sub_244B2586C()
{
  return 0x7065527865646E49;
}

uint64_t (*sub_244B25894())()
{
  return nullsub_1;
}

uint64_t sub_244B258A8()
{
  return IndexReport.decodeMessage<A>(decoder:)();
}

uint64_t sub_244B258BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return IndexReport.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_244B258D0()
{
  sub_244B28C74(&qword_2573DC240, type metadata accessor for IndexReport, (uint64_t)&protocol conformance descriptor for IndexReport);
  return sub_244B44F98();
}

uint64_t sub_244B25920@<X0>(uint64_t a1@<X8>)
{
  return sub_244B28450(&qword_2573DBB48, (uint64_t)static IndexReport._protobuf_nameMap, a1);
}

uint64_t sub_244B2593C()
{
  sub_244B28C74(&qword_2573DBDF8, type metadata accessor for IndexReport, (uint64_t)&protocol conformance descriptor for IndexReport);
  return sub_244B4501C();
}

uint64_t sub_244B2597C()
{
  sub_244B28C74(&qword_2573DBDF8, type metadata accessor for IndexReport, (uint64_t)&protocol conformance descriptor for IndexReport);
  return sub_244B45028();
}

const char *SearchReport.protoMessageName.unsafeMutableAddressor()
{
  return "SearchReport";
}

uint64_t static SearchReport.protoMessageName.getter()
{
  return 0x6552686372616553;
}

uint64_t sub_244B259FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;

  v0 = sub_244B450A0();
  __swift_allocate_value_buffer(v0, static SearchReport._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static SearchReport._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC278);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC280);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_244B45A40;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "uniqueTokenCount";
  *(_QWORD *)(v7 + 8) = 16;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_244B45088();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "durationMillis";
  *(_QWORD *)(v11 + 8) = 14;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "falsePositiveQueryCount";
  *((_QWORD *)v13 + 1) = 23;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "falsePositiveQueryTokens";
  *((_QWORD *)v15 + 1) = 24;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 5;
  *(_QWORD *)v17 = "falsePositiveQueryPercentage";
  *((_QWORD *)v17 + 1) = 28;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 6;
  *(_QWORD *)v19 = "averageFalsePositiveResultPercentage";
  *((_QWORD *)v19 + 1) = 36;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 7;
  *(_QWORD *)v21 = "searchesPerSecond";
  *((_QWORD *)v21 + 1) = 17;
  v21[16] = 2;
  v10();
  return sub_244B45094();
}

uint64_t SearchReport._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_244B266BC(&qword_2573DBB50, (uint64_t)static SearchReport._protobuf_nameMap);
}

uint64_t static SearchReport._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B26718(&qword_2573DBB50, (uint64_t)static SearchReport._protobuf_nameMap, a1);
}

uint64_t SearchReport.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t v3;
  uint64_t v4;

  result = sub_244B44FB0();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
          type metadata accessor for SearchReport(0);
          v4 = v3;
          sub_244B44FC8();
          goto LABEL_8;
        case 4:
          v4 = v3;
          sub_244B44FD4();
          goto LABEL_8;
        case 5:
        case 6:
        case 7:
          type metadata accessor for SearchReport(0);
          v4 = v3;
          sub_244B44FE0();
LABEL_8:
          v3 = v4;
          break;
        default:
          break;
      }
      result = sub_244B44FB0();
    }
  }
  return result;
}

uint64_t SearchReport.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_244B25F3C(v3, a1, a2, a3, type metadata accessor for SearchReport);
  if (!v4)
  {
    sub_244B25FB0(v3, a1, a2, a3, type metadata accessor for SearchReport);
    sub_244B26024(v3, a1, a2, a3, type metadata accessor for SearchReport);
    if (*(_QWORD *)(*(_QWORD *)v3 + 16))
      sub_244B4504C();
    sub_244B26098(v3);
    sub_244B2610C(v3);
    sub_244B26180(v3);
    type metadata accessor for SearchReport(0);
    return sub_244B44F68();
  }
  return result;
}

uint64_t sub_244B25F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t result;

  result = a5(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 24) + 8) & 1) == 0)
    return sub_244B45040();
  return result;
}

uint64_t sub_244B25FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t result;

  result = a5(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 28) + 8) & 1) == 0)
    return sub_244B45040();
  return result;
}

uint64_t sub_244B26024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t result;

  result = a5(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 32) + 8) & 1) == 0)
    return sub_244B45040();
  return result;
}

uint64_t sub_244B26098(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for SearchReport(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 36) + 8) & 1) == 0)
    return sub_244B45058();
  return result;
}

uint64_t sub_244B2610C(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for SearchReport(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 40) + 8) & 1) == 0)
    return sub_244B45058();
  return result;
}

uint64_t sub_244B26180(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for SearchReport(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 44) + 8) & 1) == 0)
    return sub_244B45058();
  return result;
}

uint64_t SearchReport.hashValue.getter()
{
  return sub_244B282C0(type metadata accessor for SearchReport, &qword_2573DBDA0, (uint64_t)&protocol conformance descriptor for SearchReport);
}

uint64_t sub_244B26214@<X0>(int *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;

  *a2 = MEMORY[0x24BEE4AF8];
  result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v5 = a1[7];
  v6 = (char *)a2 + a1[6];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v7 = (char *)a2 + v5;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v8 = a1[9];
  v9 = (char *)a2 + a1[8];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = (char *)a2 + v8;
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = a1[11];
  v12 = (char *)a2 + a1[10];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = (char *)a2 + v11;
  *(_QWORD *)v13 = 0;
  v13[8] = 1;
  return result;
}

uint64_t sub_244B262A4()
{
  return 0x6552686372616553;
}

uint64_t sub_244B262C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = sub_244B44F80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_244B26304(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 20);
  v5 = sub_244B44F80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t sub_244B26344()
{
  return SearchReport.decodeMessage<A>(decoder:)();
}

uint64_t sub_244B26358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SearchReport.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_244B2636C()
{
  sub_244B28C74(&qword_2573DC238, type metadata accessor for SearchReport, (uint64_t)&protocol conformance descriptor for SearchReport);
  return sub_244B44F98();
}

uint64_t sub_244B263BC@<X0>(uint64_t a1@<X8>)
{
  return sub_244B28450(&qword_2573DBB50, (uint64_t)static SearchReport._protobuf_nameMap, a1);
}

uint64_t sub_244B263D8()
{
  sub_244B28C74(&qword_2573DBE10, type metadata accessor for SearchReport, (uint64_t)&protocol conformance descriptor for SearchReport);
  return sub_244B4501C();
}

uint64_t sub_244B26418()
{
  sub_244B28C74(&qword_2573DBE10, type metadata accessor for SearchReport, (uint64_t)&protocol conformance descriptor for SearchReport);
  return sub_244B45028();
}

void *BenchmarkReport.protoMessageName.unsafeMutableAddressor()
{
  return &static BenchmarkReport.protoMessageName;
}

uint64_t static BenchmarkReport.protoMessageName.getter()
{
  return 0x72616D68636E6542;
}

uint64_t sub_244B2649C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;

  v0 = sub_244B450A0();
  __swift_allocate_value_buffer(v0, static BenchmarkReport._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static BenchmarkReport._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC278);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC280);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_244B45A50;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "startMillis";
  *(_QWORD *)(v7 + 8) = 11;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_244B45088();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "startDate";
  *(_QWORD *)(v11 + 8) = 9;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "config";
  *((_QWORD *)v13 + 1) = 6;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "IndexReport";
  *((_QWORD *)v15 + 1) = 11;
  v15[16] = 2;
  v10();
  v16 = v6 + 4 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + 4 * v3) = 5;
  *(_QWORD *)v16 = "searchReport";
  *(_QWORD *)(v16 + 8) = 12;
  *(_BYTE *)(v16 + 16) = 2;
  v10();
  return sub_244B45094();
}

uint64_t BenchmarkReport._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_244B266BC(&qword_2573DBB58, (uint64_t)static BenchmarkReport._protobuf_nameMap);
}

uint64_t sub_244B266BC(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_244B450A0();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static BenchmarkReport._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B26718(&qword_2573DBB58, (uint64_t)static BenchmarkReport._protobuf_nameMap, a1);
}

uint64_t sub_244B26718@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_244B450A0();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_244B26780()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  type metadata accessor for BenchmarkReport._StorageClass(0);
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 24) = 1;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  v1 = v0
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
  v2 = type metadata accessor for BenchmarkConfig(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = v0
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
  v4 = type metadata accessor for IndexReport(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = v0
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
  v6 = type metadata accessor for SearchReport(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  qword_2573DBD58 = v0;
  return result;
}

uint64_t sub_244B26858(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD80);
  MEMORY[0x24BDAC7A8]();
  v26 = (uint64_t)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD70);
  MEMORY[0x24BDAC7A8]();
  v25 = (uint64_t)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD60);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v1 + 16) = 0;
  *(_BYTE *)(v1 + 24) = 1;
  *(_QWORD *)(v1 + 40) = 0;
  *(_QWORD *)(v1 + 32) = 0;
  v8 = v1
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
  v9 = type metadata accessor for BenchmarkConfig(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = v1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
  v11 = type metadata accessor for IndexReport(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = v1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
  v13 = type metadata accessor for SearchReport(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  swift_beginAccess();
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_BYTE *)(a1 + 24);
  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = v14;
  *(_BYTE *)(v1 + 24) = v15;
  swift_beginAccess();
  v17 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  swift_beginAccess();
  *(_QWORD *)(v1 + 32) = v17;
  *(_QWORD *)(v1 + 40) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = a1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
  swift_beginAccess();
  sub_244B26C8C(v18, (uint64_t)v7, &qword_2573DBD60);
  swift_beginAccess();
  sub_244B26D14((uint64_t)v7, v8, &qword_2573DBD60);
  swift_endAccess();
  v19 = a1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
  swift_beginAccess();
  v20 = v25;
  sub_244B26C8C(v19, v25, &qword_2573DBD70);
  swift_beginAccess();
  sub_244B26D14(v20, v10, &qword_2573DBD70);
  swift_endAccess();
  v21 = a1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
  swift_beginAccess();
  v22 = v26;
  sub_244B26C8C(v21, v26, &qword_2573DBD80);
  swift_release();
  swift_beginAccess();
  sub_244B26D14(v22, v12, &qword_2573DBD80);
  swift_endAccess();
  return v2;
}

uint64_t sub_244B26BC8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_244B26C0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_244B26C50(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_244B26C8C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_244B26CD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_244B26D14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_244B26D70()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_244B2AE28(v0+ OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config, &qword_2573DBD60);
  sub_244B2AE28(v0+ OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport, &qword_2573DBD70);
  sub_244B2AE28(v0+ OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport, &qword_2573DBD80);
  return swift_deallocClassInstance();
}

uint64_t BenchmarkReport.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    v8 = swift_retain();
    *(_QWORD *)(v3 + v7) = sub_244B26858(v8);
    swift_release();
  }
  v9 = swift_retain();
  sub_244B26EA8(v9, a1, a2, a3);
  return swift_release();
}

uint64_t sub_244B26EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t (*v16)(uint64_t);
  unint64_t *v17;
  void *v18;

  result = sub_244B44FB0();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_244B27024();
          break;
        case 2:
          sub_244B270A0();
          break;
        case 3:
          v11 = a2;
          v12 = a1;
          v13 = a3;
          v14 = a4;
          v15 = &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
          v16 = type metadata accessor for BenchmarkConfig;
          v17 = &qword_2573DBDE0;
          v18 = &protocol conformance descriptor for BenchmarkConfig;
          goto LABEL_5;
        case 4:
          v11 = a2;
          v12 = a1;
          v13 = a3;
          v14 = a4;
          v15 = &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
          v16 = type metadata accessor for IndexReport;
          v17 = &qword_2573DBDF8;
          v18 = &protocol conformance descriptor for IndexReport;
          goto LABEL_5;
        case 5:
          v11 = a2;
          v12 = a1;
          v13 = a3;
          v14 = a4;
          v15 = &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
          v16 = type metadata accessor for SearchReport;
          v17 = &qword_2573DBE10;
          v18 = &protocol conformance descriptor for SearchReport;
LABEL_5:
          sub_244B2711C(v11, v12, v13, v14, (uint64_t)v15, v16, v17, (uint64_t)v18);
          break;
        default:
          break;
      }
      result = sub_244B44FB0();
    }
  }
  return result;
}

uint64_t sub_244B27024()
{
  swift_beginAccess();
  sub_244B44FC8();
  return swift_endAccess();
}

uint64_t sub_244B270A0()
{
  swift_beginAccess();
  sub_244B44FEC();
  return swift_endAccess();
}

uint64_t sub_244B2711C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t), unint64_t *a7, uint64_t a8)
{
  swift_beginAccess();
  a6(0);
  sub_244B28C74(a7, a6, a8);
  sub_244B45004();
  return swift_endAccess();
}

uint64_t BenchmarkReport.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t result;

  type metadata accessor for BenchmarkReport(0);
  v7 = swift_retain();
  sub_244B27270(v7, a1, a2, a3);
  result = swift_release();
  if (!v3)
    return sub_244B44F68();
  return result;
}

uint64_t sub_244B27270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;

  result = sub_244B27304(a1);
  if (!v4)
  {
    sub_244B27388(a1);
    sub_244B27424(a1, a2, a3, a4);
    sub_244B275B0(a1, a2, a3, a4);
    return sub_244B2773C(a1, a2, a3, a4);
  }
  return result;
}

uint64_t sub_244B27304(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  if ((*(_BYTE *)(a1 + 24) & 1) == 0)
    return sub_244B45040();
  return result;
}

uint64_t sub_244B27388(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  if (*(_QWORD *)(a1 + 40))
  {
    swift_bridgeObjectRetain();
    sub_244B45064();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_244B27424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[6];

  v14[5] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD60);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for BenchmarkConfig(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
  swift_beginAccess();
  sub_244B26C8C(v12, (uint64_t)v7, &qword_2573DBD60);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_244B2AE28((uint64_t)v7, &qword_2573DBD60);
  sub_244B26BC8((uint64_t)v7, (uint64_t)v11, type metadata accessor for BenchmarkConfig);
  sub_244B28C74(&qword_2573DBDE0, type metadata accessor for BenchmarkConfig, (uint64_t)&protocol conformance descriptor for BenchmarkConfig);
  sub_244B4507C();
  return sub_244B26C50((uint64_t)v11, type metadata accessor for BenchmarkConfig);
}

uint64_t sub_244B275B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[6];

  v14[5] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD70);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for IndexReport(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
  swift_beginAccess();
  sub_244B26C8C(v12, (uint64_t)v7, &qword_2573DBD70);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_244B2AE28((uint64_t)v7, &qword_2573DBD70);
  sub_244B26BC8((uint64_t)v7, (uint64_t)v11, type metadata accessor for IndexReport);
  sub_244B28C74(&qword_2573DBDF8, type metadata accessor for IndexReport, (uint64_t)&protocol conformance descriptor for IndexReport);
  sub_244B4507C();
  return sub_244B26C50((uint64_t)v11, type metadata accessor for IndexReport);
}

uint64_t sub_244B2773C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[6];

  v14[5] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD80);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SearchReport(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
  swift_beginAccess();
  sub_244B26C8C(v12, (uint64_t)v7, &qword_2573DBD80);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_244B2AE28((uint64_t)v7, &qword_2573DBD80);
  sub_244B26BC8((uint64_t)v7, (uint64_t)v11, type metadata accessor for SearchReport);
  sub_244B28C74(&qword_2573DBE10, type metadata accessor for SearchReport, (uint64_t)&protocol conformance descriptor for SearchReport);
  sub_244B4507C();
  return sub_244B26C50((uint64_t)v11, type metadata accessor for SearchReport);
}

BOOL sub_244B278CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  _BOOL8 result;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  int v55;
  _QWORD **v56;
  uint64_t v57;
  _QWORD **v58;
  int v59;
  char *v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned int (*v68)(uint64_t, uint64_t, uint64_t);
  uint64_t v69;
  char *v70;
  char v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD **v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;

  v76 = type metadata accessor for SearchReport(0);
  v75 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v72 = (char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC260);
  MEMORY[0x24BDAC7A8](v74);
  v77 = (uint64_t)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD80);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v85 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v84 = (char *)&v72 - v9;
  v82 = type metadata accessor for IndexReport(0);
  v81 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v73 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC268);
  MEMORY[0x24BDAC7A8](v80);
  v83 = (uint64_t)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD70);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v78 = (_QWORD **)((char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v13);
  v87 = (uint64_t)&v72 - v15;
  v16 = type metadata accessor for BenchmarkConfig(0);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v79 = (uint64_t)&v72 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC270);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD60);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v86 = (uint64_t)&v72 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v72 - v25;
  swift_beginAccess();
  v27 = *(_QWORD *)(a1 + 16);
  v28 = a1;
  v29 = *(_BYTE *)(a1 + 24);
  swift_beginAccess();
  v88 = a2;
  v30 = *(_BYTE *)(a2 + 24);
  if ((v29 & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 24))
      return 0;
  }
  else
  {
    if (v27 != *(_QWORD *)(a2 + 16))
      v30 = 1;
    if ((v30 & 1) != 0)
      return 0;
  }
  swift_beginAccess();
  v32 = *(_QWORD *)(a1 + 32);
  v31 = *(_QWORD *)(a1 + 40);
  v33 = v88;
  swift_beginAccess();
  v34 = *(_QWORD *)(v33 + 40);
  if (!v31)
  {
    if (v34)
      return 0;
    goto LABEL_14;
  }
  if (!v34)
    return 0;
  if (v32 == *(_QWORD *)(v33 + 32) && v31 == v34 || (v35 = sub_244B45508(), result = 0, (v35 & 1) != 0))
  {
LABEL_14:
    v37 = v28;
    v38 = v28
        + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
    swift_beginAccess();
    sub_244B26C8C(v38, (uint64_t)v26, &qword_2573DBD60);
    v39 = v88;
    v40 = v88
        + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
    swift_beginAccess();
    v41 = (uint64_t)&v21[*(int *)(v19 + 48)];
    sub_244B26C8C((uint64_t)v26, (uint64_t)v21, &qword_2573DBD60);
    sub_244B26C8C(v40, v41, &qword_2573DBD60);
    v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48);
    if (v42((uint64_t)v21, 1, v16) == 1)
    {
      swift_retain();
      swift_retain();
      sub_244B2AE28((uint64_t)v26, &qword_2573DBD60);
      if (v42(v41, 1, v16) == 1)
      {
        sub_244B2AE28((uint64_t)v21, &qword_2573DBD60);
LABEL_21:
        v48 = v37
            + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
        swift_beginAccess();
        v49 = v87;
        sub_244B26C8C(v48, v87, &qword_2573DBD70);
        v50 = v39
            + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
        swift_beginAccess();
        v51 = v83;
        v52 = v83 + *(int *)(v80 + 48);
        sub_244B26C8C(v49, v83, &qword_2573DBD70);
        sub_244B26C8C(v50, v52, &qword_2573DBD70);
        v53 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v81 + 48);
        v54 = v82;
        if (v53(v51, 1, v82) == 1)
        {
          sub_244B2AE28(v49, &qword_2573DBD70);
          v55 = v53(v52, 1, v54);
          v56 = (_QWORD **)v85;
          v57 = (uint64_t)v84;
          if (v55 == 1)
          {
            sub_244B2AE28(v51, &qword_2573DBD70);
LABEL_31:
            v62 = v37
                + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
            swift_beginAccess();
            sub_244B26C8C(v62, v57, &qword_2573DBD80);
            v63 = v39
                + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
            swift_beginAccess();
            v64 = v77;
            v65 = v77 + *(int *)(v74 + 48);
            sub_244B26C8C(v57, v77, &qword_2573DBD80);
            v66 = v63;
            v67 = v64;
            sub_244B26C8C(v66, v65, &qword_2573DBD80);
            v68 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v75 + 48);
            v69 = v76;
            if (v68(v67, 1, v76) == 1)
            {
              swift_release();
              swift_release();
              sub_244B2AE28(v57, &qword_2573DBD80);
              if (v68(v65, 1, v69) == 1)
              {
                sub_244B2AE28(v67, &qword_2573DBD80);
                return 1;
              }
              goto LABEL_36;
            }
            sub_244B26C8C(v67, (uint64_t)v56, &qword_2573DBD80);
            if (v68(v65, 1, v69) == 1)
            {
              swift_release();
              swift_release();
              sub_244B2AE28(v57, &qword_2573DBD80);
              sub_244B26C50((uint64_t)v56, type metadata accessor for SearchReport);
LABEL_36:
              sub_244B2AE28(v67, &qword_2573DC260);
              return 0;
            }
            v70 = v72;
            sub_244B26BC8(v65, (uint64_t)v72, type metadata accessor for SearchReport);
            v71 = _s17PrivateSearchCore0B6ReportV2eeoiySbAC_ACtFZ_0(v56, v70);
            swift_release();
            swift_release();
            sub_244B26C50((uint64_t)v70, type metadata accessor for SearchReport);
            sub_244B2AE28(v57, &qword_2573DBD80);
            sub_244B26C50((uint64_t)v56, type metadata accessor for SearchReport);
            sub_244B2AE28(v67, &qword_2573DBD80);
            return (v71 & 1) != 0;
          }
          goto LABEL_26;
        }
        v58 = v78;
        sub_244B26C8C(v51, (uint64_t)v78, &qword_2573DBD70);
        v59 = v53(v52, 1, v54);
        v56 = (_QWORD **)v85;
        v57 = (uint64_t)v84;
        if (v59 == 1)
        {
          sub_244B2AE28(v87, &qword_2573DBD70);
          sub_244B26C50((uint64_t)v58, type metadata accessor for IndexReport);
LABEL_26:
          v44 = &qword_2573DC268;
          v45 = v51;
          goto LABEL_27;
        }
        v60 = v73;
        sub_244B26BC8(v52, (uint64_t)v73, type metadata accessor for IndexReport);
        v61 = _s17PrivateSearchCore11IndexReportV2eeoiySbAC_ACtFZ_0(v58, v60);
        sub_244B26C50((uint64_t)v60, type metadata accessor for IndexReport);
        sub_244B2AE28(v87, &qword_2573DBD70);
        sub_244B26C50((uint64_t)v58, type metadata accessor for IndexReport);
        sub_244B2AE28(v51, &qword_2573DBD70);
        if ((v61 & 1) != 0)
          goto LABEL_31;
LABEL_28:
        swift_release();
        swift_release();
        return 0;
      }
    }
    else
    {
      v43 = v86;
      sub_244B26C8C((uint64_t)v21, v86, &qword_2573DBD60);
      if (v42(v41, 1, v16) != 1)
      {
        v46 = v79;
        sub_244B26BC8(v41, v79, type metadata accessor for BenchmarkConfig);
        swift_retain();
        swift_retain();
        v47 = _s17PrivateSearchCore15BenchmarkConfigV2eeoiySbAC_ACtFZ_0(v43, v46);
        sub_244B26C50(v46, type metadata accessor for BenchmarkConfig);
        sub_244B2AE28((uint64_t)v26, &qword_2573DBD60);
        sub_244B26C50(v43, type metadata accessor for BenchmarkConfig);
        v39 = v88;
        sub_244B2AE28((uint64_t)v21, &qword_2573DBD60);
        if ((v47 & 1) == 0)
          goto LABEL_28;
        goto LABEL_21;
      }
      swift_retain();
      swift_retain();
      sub_244B2AE28((uint64_t)v26, &qword_2573DBD60);
      sub_244B26C50(v43, type metadata accessor for BenchmarkConfig);
    }
    v44 = &qword_2573DC270;
    v45 = (uint64_t)v21;
LABEL_27:
    sub_244B2AE28(v45, v44);
    goto LABEL_28;
  }
  return result;
}

uint64_t BenchmarkReport.hashValue.getter()
{
  return sub_244B282C0(type metadata accessor for BenchmarkReport, &qword_2573DBDA8, (uint64_t)&protocol conformance descriptor for BenchmarkReport);
}

uint64_t sub_244B282C0(uint64_t (*a1)(uint64_t), unint64_t *a2, uint64_t a3)
{
  sub_244B45580();
  a1(0);
  sub_244B28C74(a2, a1, a3);
  sub_244B4510C();
  return sub_244B45598();
}

uint64_t sub_244B2833C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v4 = *(int *)(a1 + 20);
  if (qword_2573DBB60 != -1)
    swift_once();
  *(_QWORD *)(a2 + v4) = qword_2573DBD58;
  return swift_retain();
}

uint64_t sub_244B28398()
{
  return 0x72616D68636E6542;
}

uint64_t sub_244B283BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return BenchmarkReport.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_244B283D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return BenchmarkReport.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_244B283E4()
{
  sub_244B28C74(&qword_2573DC230, type metadata accessor for BenchmarkReport, (uint64_t)&protocol conformance descriptor for BenchmarkReport);
  return sub_244B44F98();
}

uint64_t sub_244B28434@<X0>(uint64_t a1@<X8>)
{
  return sub_244B28450(&qword_2573DBB58, (uint64_t)static BenchmarkReport._protobuf_nameMap, a1);
}

uint64_t sub_244B28450@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_244B450A0();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_244B284BC()
{
  sub_244B28C74(&qword_2573DBE28, type metadata accessor for BenchmarkReport, (uint64_t)&protocol conformance descriptor for BenchmarkReport);
  return sub_244B4501C();
}

uint64_t sub_244B284FC()
{
  sub_244B45580();
  sub_244B4510C();
  return sub_244B45598();
}

uint64_t sub_244B28550()
{
  sub_244B28C74(&qword_2573DBE28, type metadata accessor for BenchmarkReport, (uint64_t)&protocol conformance descriptor for BenchmarkReport);
  return sub_244B45028();
}

uint64_t sub_244B285A0()
{
  sub_244B45580();
  sub_244B4510C();
  return sub_244B45598();
}

uint64_t _s17PrivateSearchCore15BenchmarkReportV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  void (*v15)(char *, uint64_t, uint64_t);
  char v16;
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = sub_244B44F80();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - v9;
  v11 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  v12 = *(_QWORD *)(a1 + v11);
  v13 = *(_QWORD *)(a2 + v11);
  if (v12 == v13
    || (swift_retain(), swift_retain(), v14 = sub_244B278CC(v12, v13), swift_release(), swift_release(), v14))
  {
    v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v15(v10, a1, v4);
    v15(v8, a2, v4);
    sub_244B28C74((unint64_t *)&qword_2573DC258, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v16 = sub_244B45124();
    v17 = *(void (**)(char *, uint64_t))(v5 + 8);
    v17(v8, v4);
    v17(v10, v4);
  }
  else
  {
    v16 = 0;
  }
  return v16 & 1;
}

uint64_t _s17PrivateSearchCore15BenchmarkConfigV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void (*v25)(char *, uint64_t, uint64_t);
  void (*v26)(char *, uint64_t);
  uint64_t v28;

  v4 = sub_244B44F80();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v28 - v9;
  v11 = type metadata accessor for BenchmarkConfig(0);
  v12 = *(int *)(v11 + 20);
  v13 = (_QWORD *)(a1 + v12);
  v14 = *(_QWORD *)(a1 + v12 + 8);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  if (!v14)
  {
    if (v16)
      goto LABEL_19;
    goto LABEL_10;
  }
  if (!v16)
    goto LABEL_19;
  v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (v18 = 0, (sub_244B45508() & 1) != 0))
  {
LABEL_10:
    v19 = *(int *)(v11 + 24);
    v20 = (_QWORD *)(a1 + v19);
    v21 = *(_QWORD *)(a1 + v19 + 8);
    v22 = (_QWORD *)(a2 + v19);
    v23 = v22[1];
    if (v21)
    {
      if (v23)
      {
        if (*v20 != *v22 || v21 != v23)
        {
          v18 = 0;
          if ((sub_244B45508() & 1) == 0)
            return v18 & 1;
        }
LABEL_20:
        v25 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v25(v10, a1, v4);
        v25(v8, a2, v4);
        sub_244B28C74((unint64_t *)&qword_2573DC258, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
        v18 = sub_244B45124();
        v26 = *(void (**)(char *, uint64_t))(v5 + 8);
        v26(v8, v4);
        v26(v10, v4);
        return v18 & 1;
      }
    }
    else if (!v23)
    {
      goto LABEL_20;
    }
LABEL_19:
    v18 = 0;
  }
  return v18 & 1;
}

uint64_t _s17PrivateSearchCore11IndexReportV2eeoiySbAC_ACtFZ_0(_QWORD **a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int *v11;
  int *v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  char *v16;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  char v20;
  char *v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  char v25;
  char *v26;
  int v27;
  uint64_t v28;
  _QWORD *v29;
  char v30;
  char *v31;
  int v32;
  uint64_t v33;
  _QWORD *v34;
  char v35;
  char *v36;
  int v37;
  uint64_t v38;
  _QWORD *v39;
  char v40;
  char *v41;
  int v42;
  uint64_t v43;
  double *v44;
  char v45;
  double *v46;
  int v47;
  uint64_t v48;
  double *v49;
  char v50;
  double *v51;
  int v52;
  uint64_t v53;
  double *v54;
  char v55;
  double *v56;
  int v57;
  uint64_t v58;
  _QWORD *v59;
  char v60;
  char *v61;
  int v62;
  uint64_t v63;
  _QWORD *v64;
  char v65;
  char *v66;
  int v67;
  char v68;
  char *v70;
  void (*v71)(char *, char *, uint64_t);
  void (*v72)(char *, uint64_t);
  uint64_t v73;

  v4 = sub_244B44F80();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v73 - v9;
  v11 = (int *)type metadata accessor for IndexReport(0);
  v12 = v11;
  v13 = v11[6];
  v14 = (_QWORD **)((char *)a1 + v13);
  v15 = *((_BYTE *)a1 + v13 + 8);
  v16 = &a2[v13];
  v17 = a2[v13 + 8];
  if ((v15 & 1) != 0)
  {
    if (!v17)
      goto LABEL_64;
  }
  else
  {
    if (*v14 != *(_QWORD *)v16)
      LOBYTE(v17) = 1;
    if ((v17 & 1) != 0)
      goto LABEL_64;
  }
  v18 = v11[7];
  v19 = (_QWORD **)((char *)a1 + v18);
  v20 = *((_BYTE *)a1 + v18 + 8);
  v21 = &a2[v18];
  v22 = a2[v18 + 8];
  if ((v20 & 1) != 0)
  {
    if (!v22)
      goto LABEL_64;
  }
  else
  {
    if (*v19 != *(_QWORD *)v21)
      LOBYTE(v22) = 1;
    if ((v22 & 1) != 0)
      goto LABEL_64;
  }
  v23 = v11[8];
  v24 = (_QWORD **)((char *)a1 + v23);
  v25 = *((_BYTE *)a1 + v23 + 8);
  v26 = &a2[v23];
  v27 = a2[v23 + 8];
  if ((v25 & 1) != 0)
  {
    if (!v27)
      goto LABEL_64;
  }
  else
  {
    if (*v24 != *(_QWORD *)v26)
      LOBYTE(v27) = 1;
    if ((v27 & 1) != 0)
      goto LABEL_64;
  }
  v28 = v11[9];
  v29 = (_QWORD **)((char *)a1 + v28);
  v30 = *((_BYTE *)a1 + v28 + 8);
  v31 = &a2[v28];
  v32 = a2[v28 + 8];
  if ((v30 & 1) != 0)
  {
    if (!v32)
      goto LABEL_64;
  }
  else
  {
    if (*v29 != *(_QWORD *)v31)
      LOBYTE(v32) = 1;
    if ((v32 & 1) != 0)
      goto LABEL_64;
  }
  v33 = v11[10];
  v34 = (_QWORD **)((char *)a1 + v33);
  v35 = *((_BYTE *)a1 + v33 + 8);
  v36 = &a2[v33];
  v37 = a2[v33 + 8];
  if ((v35 & 1) != 0)
  {
    if (!v37)
      goto LABEL_64;
  }
  else
  {
    if (*v34 != *(_QWORD *)v36)
      LOBYTE(v37) = 1;
    if ((v37 & 1) != 0)
      goto LABEL_64;
  }
  v38 = v11[11];
  v39 = (_QWORD **)((char *)a1 + v38);
  v40 = *((_BYTE *)a1 + v38 + 8);
  v41 = &a2[v38];
  v42 = a2[v38 + 8];
  if ((v40 & 1) != 0)
  {
    if (!v42)
      goto LABEL_64;
  }
  else
  {
    if (*v39 != *(_QWORD *)v41)
      LOBYTE(v42) = 1;
    if ((v42 & 1) != 0)
      goto LABEL_64;
  }
  if ((sub_244B2BE74(*a1, *(_QWORD **)a2) & 1) != 0)
  {
    v43 = v12[12];
    v44 = (double *)((char *)a1 + v43);
    v45 = *((_BYTE *)a1 + v43 + 8);
    v46 = (double *)&a2[v43];
    v47 = a2[v43 + 8];
    if ((v45 & 1) != 0)
    {
      if (!v47)
        goto LABEL_64;
    }
    else
    {
      if (*v44 != *v46)
        LOBYTE(v47) = 1;
      if ((v47 & 1) != 0)
        goto LABEL_64;
    }
    v48 = v12[13];
    v49 = (double *)((char *)a1 + v48);
    v50 = *((_BYTE *)a1 + v48 + 8);
    v51 = (double *)&a2[v48];
    v52 = a2[v48 + 8];
    if ((v50 & 1) != 0)
    {
      if (!v52)
        goto LABEL_64;
    }
    else
    {
      if (*v49 != *v51)
        LOBYTE(v52) = 1;
      if ((v52 & 1) != 0)
        goto LABEL_64;
    }
    v53 = v12[14];
    v54 = (double *)((char *)a1 + v53);
    v55 = *((_BYTE *)a1 + v53 + 8);
    v56 = (double *)&a2[v53];
    v57 = a2[v53 + 8];
    if ((v55 & 1) != 0)
    {
      if (!v57)
        goto LABEL_64;
    }
    else
    {
      if (*v54 != *v56)
        LOBYTE(v57) = 1;
      if ((v57 & 1) != 0)
        goto LABEL_64;
    }
    v58 = v12[15];
    v59 = (_QWORD **)((char *)a1 + v58);
    v60 = *((_BYTE *)a1 + v58 + 8);
    v61 = &a2[v58];
    v62 = a2[v58 + 8];
    if ((v60 & 1) == 0)
    {
      if (*v59 != *(_QWORD *)v61)
        LOBYTE(v62) = 1;
      if ((v62 & 1) != 0)
        goto LABEL_64;
LABEL_62:
      v63 = v12[16];
      v64 = (_QWORD **)((char *)a1 + v63);
      v65 = *((_BYTE *)a1 + v63 + 8);
      v66 = &a2[v63];
      v67 = a2[v63 + 8];
      if ((v65 & 1) != 0)
      {
        if (!v67)
          goto LABEL_64;
      }
      else
      {
        if (*v64 != *(_QWORD *)v66)
          LOBYTE(v67) = 1;
        if ((v67 & 1) != 0)
          goto LABEL_64;
      }
      v70 = (char *)a1 + v12[5];
      v71 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v71(v10, v70, v4);
      v71(v8, &a2[v12[5]], v4);
      sub_244B28C74((unint64_t *)&qword_2573DC258, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v68 = sub_244B45124();
      v72 = *(void (**)(char *, uint64_t))(v5 + 8);
      v72(v8, v4);
      v72(v10, v4);
      return v68 & 1;
    }
    if (v62)
      goto LABEL_62;
  }
LABEL_64:
  v68 = 0;
  return v68 & 1;
}

uint64_t sub_244B28C74(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24951FF40](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s17PrivateSearchCore0B6ReportV2eeoiySbAC_ACtFZ_0(_QWORD **a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int *v11;
  int *v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  char *v16;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  char v20;
  char *v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  char v25;
  char *v26;
  int v27;
  uint64_t v28;
  double *v29;
  char v30;
  double *v31;
  int v32;
  uint64_t v33;
  double *v34;
  char v35;
  double *v36;
  int v37;
  uint64_t v38;
  double *v39;
  char v40;
  double *v41;
  int v42;
  char v43;
  char *v45;
  void (*v46)(char *, char *, uint64_t);
  void (*v47)(char *, uint64_t);
  uint64_t v48;

  v4 = sub_244B44F80();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v48 - v9;
  v11 = (int *)type metadata accessor for SearchReport(0);
  v12 = v11;
  v13 = v11[6];
  v14 = (_QWORD **)((char *)a1 + v13);
  v15 = *((_BYTE *)a1 + v13 + 8);
  v16 = &a2[v13];
  v17 = a2[v13 + 8];
  if ((v15 & 1) != 0)
  {
    if (!v17)
      goto LABEL_34;
  }
  else
  {
    if (*v14 != *(_QWORD *)v16)
      LOBYTE(v17) = 1;
    if ((v17 & 1) != 0)
      goto LABEL_34;
  }
  v18 = v11[7];
  v19 = (_QWORD **)((char *)a1 + v18);
  v20 = *((_BYTE *)a1 + v18 + 8);
  v21 = &a2[v18];
  v22 = a2[v18 + 8];
  if ((v20 & 1) != 0)
  {
    if (!v22)
      goto LABEL_34;
  }
  else
  {
    if (*v19 != *(_QWORD *)v21)
      LOBYTE(v22) = 1;
    if ((v22 & 1) != 0)
      goto LABEL_34;
  }
  v23 = v11[8];
  v24 = (_QWORD **)((char *)a1 + v23);
  v25 = *((_BYTE *)a1 + v23 + 8);
  v26 = &a2[v23];
  v27 = a2[v23 + 8];
  if ((v25 & 1) != 0)
  {
    if (!v27)
      goto LABEL_34;
  }
  else
  {
    if (*v24 != *(_QWORD *)v26)
      LOBYTE(v27) = 1;
    if ((v27 & 1) != 0)
      goto LABEL_34;
  }
  if ((sub_244B2BE74(*a1, *(_QWORD **)a2) & 1) != 0)
  {
    v28 = v12[9];
    v29 = (double *)((char *)a1 + v28);
    v30 = *((_BYTE *)a1 + v28 + 8);
    v31 = (double *)&a2[v28];
    v32 = a2[v28 + 8];
    if ((v30 & 1) != 0)
    {
      if (!v32)
        goto LABEL_34;
    }
    else
    {
      if (*v29 != *v31)
        LOBYTE(v32) = 1;
      if ((v32 & 1) != 0)
        goto LABEL_34;
    }
    v33 = v12[10];
    v34 = (double *)((char *)a1 + v33);
    v35 = *((_BYTE *)a1 + v33 + 8);
    v36 = (double *)&a2[v33];
    v37 = a2[v33 + 8];
    if ((v35 & 1) == 0)
    {
      if (*v34 != *v36)
        LOBYTE(v37) = 1;
      if ((v37 & 1) != 0)
        goto LABEL_34;
LABEL_32:
      v38 = v12[11];
      v39 = (double *)((char *)a1 + v38);
      v40 = *((_BYTE *)a1 + v38 + 8);
      v41 = (double *)&a2[v38];
      v42 = a2[v38 + 8];
      if ((v40 & 1) != 0)
      {
        if (!v42)
          goto LABEL_34;
      }
      else
      {
        if (*v39 != *v41)
          LOBYTE(v42) = 1;
        if ((v42 & 1) != 0)
          goto LABEL_34;
      }
      v45 = (char *)a1 + v12[5];
      v46 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v46(v10, v45, v4);
      v46(v8, &a2[v12[5]], v4);
      sub_244B28C74((unint64_t *)&qword_2573DC258, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v43 = sub_244B45124();
      v47 = *(void (**)(char *, uint64_t))(v5 + 8);
      v47(v8, v4);
      v47(v10, v4);
      return v43 & 1;
    }
    if (v37)
      goto LABEL_32;
  }
LABEL_34:
  v43 = 0;
  return v43 & 1;
}

unint64_t sub_244B28F20()
{
  unint64_t result;

  result = qword_2573DBDB0;
  if (!qword_2573DBDB0)
  {
    result = MEMORY[0x24951FF40](&protocol conformance descriptor for IndexableFileType, &type metadata for IndexableFileType);
    atomic_store(result, (unint64_t *)&qword_2573DBDB0);
  }
  return result;
}

unint64_t sub_244B28F68()
{
  unint64_t result;

  result = qword_2573DBDB8;
  if (!qword_2573DBDB8)
  {
    result = MEMORY[0x24951FF40](&protocol conformance descriptor for IndexableFileType, &type metadata for IndexableFileType);
    atomic_store(result, (unint64_t *)&qword_2573DBDB8);
  }
  return result;
}

unint64_t sub_244B28FB0()
{
  unint64_t result;

  result = qword_2573DBDC0;
  if (!qword_2573DBDC0)
  {
    result = MEMORY[0x24951FF40](&protocol conformance descriptor for IndexableFileType, &type metadata for IndexableFileType);
    atomic_store(result, (unint64_t *)&qword_2573DBDC0);
  }
  return result;
}

unint64_t sub_244B28FF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573DBDC8;
  if (!qword_2573DBDC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573DBDD0);
    result = MEMORY[0x24951FF40](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2573DBDC8);
  }
  return result;
}

uint64_t sub_244B29044()
{
  return sub_244B28C74(&qword_2573DBDD8, type metadata accessor for BenchmarkConfig, (uint64_t)&protocol conformance descriptor for BenchmarkConfig);
}

uint64_t sub_244B29070()
{
  return sub_244B28C74(&qword_2573DBDE0, type metadata accessor for BenchmarkConfig, (uint64_t)&protocol conformance descriptor for BenchmarkConfig);
}

uint64_t sub_244B2909C()
{
  return sub_244B28C74(&qword_2573DBD90, type metadata accessor for BenchmarkConfig, (uint64_t)&protocol conformance descriptor for BenchmarkConfig);
}

uint64_t sub_244B290C8()
{
  return sub_244B28C74(&qword_2573DBDE8, type metadata accessor for BenchmarkConfig, (uint64_t)&protocol conformance descriptor for BenchmarkConfig);
}

uint64_t sub_244B290F4()
{
  return sub_244B28C74(&qword_2573DBDF0, type metadata accessor for IndexReport, (uint64_t)&protocol conformance descriptor for IndexReport);
}

uint64_t sub_244B29120()
{
  return sub_244B28C74(&qword_2573DBDF8, type metadata accessor for IndexReport, (uint64_t)&protocol conformance descriptor for IndexReport);
}

uint64_t sub_244B2914C()
{
  return sub_244B28C74(&qword_2573DBD98, type metadata accessor for IndexReport, (uint64_t)&protocol conformance descriptor for IndexReport);
}

uint64_t sub_244B29178()
{
  return sub_244B28C74(&qword_2573DBE00, type metadata accessor for IndexReport, (uint64_t)&protocol conformance descriptor for IndexReport);
}

uint64_t sub_244B291A4()
{
  return sub_244B28C74(&qword_2573DBE08, type metadata accessor for SearchReport, (uint64_t)&protocol conformance descriptor for SearchReport);
}

uint64_t sub_244B291D0()
{
  return sub_244B28C74(&qword_2573DBE10, type metadata accessor for SearchReport, (uint64_t)&protocol conformance descriptor for SearchReport);
}

uint64_t sub_244B291FC()
{
  return sub_244B28C74(&qword_2573DBDA0, type metadata accessor for SearchReport, (uint64_t)&protocol conformance descriptor for SearchReport);
}

uint64_t sub_244B29228()
{
  return sub_244B28C74(&qword_2573DBE18, type metadata accessor for SearchReport, (uint64_t)&protocol conformance descriptor for SearchReport);
}

uint64_t sub_244B29254()
{
  return sub_244B28C74(&qword_2573DBE20, type metadata accessor for BenchmarkReport, (uint64_t)&protocol conformance descriptor for BenchmarkReport);
}

uint64_t sub_244B29280()
{
  return sub_244B28C74(&qword_2573DBE28, type metadata accessor for BenchmarkReport, (uint64_t)&protocol conformance descriptor for BenchmarkReport);
}

uint64_t sub_244B292AC()
{
  return sub_244B28C74(&qword_2573DBDA8, type metadata accessor for BenchmarkReport, (uint64_t)&protocol conformance descriptor for BenchmarkReport);
}

uint64_t sub_244B292D8()
{
  return sub_244B28C74(&qword_2573DBE30, type metadata accessor for BenchmarkReport, (uint64_t)&protocol conformance descriptor for BenchmarkReport);
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for IndexableFileType(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for IndexableFileType(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_244B2936C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_244B29388(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for IndexableFileType()
{
  return &type metadata for IndexableFileType;
}

uint64_t *initializeBufferWithCopyOfBuffer for BenchmarkConfig(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_244B44F80();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for BenchmarkConfig(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BenchmarkConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BenchmarkConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for BenchmarkConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for BenchmarkConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 24);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BenchmarkConfig()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B296DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_244B44F80();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for BenchmarkConfig()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B29774(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_244B44F80();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  return result;
}

uint64_t sub_244B297F0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244B44F80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for IndexReport(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_244B44F80();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = a3[7];
    v15 = (char *)v7 + v13;
    v16 = (char *)a2 + v13;
    *(_QWORD *)v15 = *(_QWORD *)v16;
    v15[8] = v16[8];
    v17 = (char *)v7 + v14;
    v18 = (char *)a2 + v14;
    *(_QWORD *)v17 = *(_QWORD *)v18;
    v17[8] = v18[8];
    v19 = a3[8];
    v20 = a3[9];
    v21 = (char *)v7 + v19;
    v22 = (char *)a2 + v19;
    *(_QWORD *)v21 = *(_QWORD *)v22;
    v21[8] = v22[8];
    v23 = (char *)v7 + v20;
    v24 = (char *)a2 + v20;
    *(_QWORD *)v23 = *(_QWORD *)v24;
    v23[8] = v24[8];
    v25 = a3[10];
    v26 = a3[11];
    v27 = (char *)v7 + v25;
    v28 = (char *)a2 + v25;
    v29 = *(_QWORD *)v28;
    v27[8] = v28[8];
    *(_QWORD *)v27 = v29;
    v30 = (char *)v7 + v26;
    v31 = (char *)a2 + v26;
    v30[8] = v31[8];
    *(_QWORD *)v30 = *(_QWORD *)v31;
    v32 = a3[12];
    v33 = a3[13];
    v34 = (char *)v7 + v32;
    v35 = (char *)a2 + v32;
    v34[8] = v35[8];
    *(_QWORD *)v34 = *(_QWORD *)v35;
    v36 = (char *)v7 + v33;
    v37 = (char *)a2 + v33;
    v36[8] = v37[8];
    *(_QWORD *)v36 = *(_QWORD *)v37;
    v38 = a3[14];
    v39 = a3[15];
    v40 = (char *)v7 + v38;
    v41 = (char *)a2 + v38;
    v40[8] = v41[8];
    *(_QWORD *)v40 = *(_QWORD *)v41;
    v42 = (char *)v7 + v39;
    v43 = (char *)a2 + v39;
    v42[8] = v43[8];
    *(_QWORD *)v42 = *(_QWORD *)v43;
    v44 = a3[16];
    v45 = (char *)v7 + v44;
    v46 = (char *)a2 + v44;
    v45[8] = v46[8];
    *(_QWORD *)v45 = *(_QWORD *)v46;
  }
  return v7;
}

_QWORD *initializeWithCopy for IndexReport(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244B44F80();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = a3[6];
  v12 = a3[7];
  v13 = (char *)a1 + v11;
  v14 = (char *)a2 + v11;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  v13[8] = v14[8];
  v15 = (char *)a1 + v12;
  v16 = (char *)a2 + v12;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  v17 = a3[8];
  v18 = a3[9];
  v19 = (char *)a1 + v17;
  v20 = (char *)a2 + v17;
  *(_QWORD *)v19 = *(_QWORD *)v20;
  v19[8] = v20[8];
  v21 = (char *)a1 + v18;
  v22 = (char *)a2 + v18;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  v23 = a3[10];
  v24 = a3[11];
  v25 = (char *)a1 + v23;
  v26 = (char *)a2 + v23;
  v27 = *(_QWORD *)v26;
  v25[8] = v26[8];
  *(_QWORD *)v25 = v27;
  v28 = (char *)a1 + v24;
  v29 = (char *)a2 + v24;
  v28[8] = v29[8];
  *(_QWORD *)v28 = *(_QWORD *)v29;
  v30 = a3[12];
  v31 = a3[13];
  v32 = (char *)a1 + v30;
  v33 = (char *)a2 + v30;
  v32[8] = v33[8];
  *(_QWORD *)v32 = *(_QWORD *)v33;
  v34 = (char *)a1 + v31;
  v35 = (char *)a2 + v31;
  v34[8] = v35[8];
  *(_QWORD *)v34 = *(_QWORD *)v35;
  v36 = a3[14];
  v37 = a3[15];
  v38 = (char *)a1 + v36;
  v39 = (char *)a2 + v36;
  v38[8] = v39[8];
  *(_QWORD *)v38 = *(_QWORD *)v39;
  v40 = (char *)a1 + v37;
  v41 = (char *)a2 + v37;
  v40[8] = v41[8];
  *(_QWORD *)v40 = *(_QWORD *)v41;
  v42 = a3[16];
  v43 = (char *)a1 + v42;
  v44 = (char *)a2 + v42;
  v43[8] = v44[8];
  *(_QWORD *)v43 = *(_QWORD *)v44;
  return a1;
}

_QWORD *assignWithCopy for IndexReport(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char v45;
  uint64_t v46;
  char *v47;
  char *v48;
  char v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char v53;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244B44F80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = v12[8];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v11[8] = v13;
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = v16[8];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v17;
  v18 = a3[8];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = v20[8];
  *(_QWORD *)v19 = *(_QWORD *)v20;
  v19[8] = v21;
  v22 = a3[9];
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = v24[8];
  *(_QWORD *)v23 = *(_QWORD *)v24;
  v23[8] = v25;
  v26 = a3[10];
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  v29 = v28[8];
  *(_QWORD *)v27 = *(_QWORD *)v28;
  v27[8] = v29;
  v30 = a3[11];
  v31 = (char *)a1 + v30;
  v32 = (char *)a2 + v30;
  v33 = v32[8];
  *(_QWORD *)v31 = *(_QWORD *)v32;
  v31[8] = v33;
  v34 = a3[12];
  v35 = (char *)a1 + v34;
  v36 = (char *)a2 + v34;
  v37 = v36[8];
  *(_QWORD *)v35 = *(_QWORD *)v36;
  v35[8] = v37;
  v38 = a3[13];
  v39 = (char *)a1 + v38;
  v40 = (char *)a2 + v38;
  v41 = v40[8];
  *(_QWORD *)v39 = *(_QWORD *)v40;
  v39[8] = v41;
  v42 = a3[14];
  v43 = (char *)a1 + v42;
  v44 = (char *)a2 + v42;
  v45 = v44[8];
  *(_QWORD *)v43 = *(_QWORD *)v44;
  v43[8] = v45;
  v46 = a3[15];
  v47 = (char *)a1 + v46;
  v48 = (char *)a2 + v46;
  v49 = v48[8];
  *(_QWORD *)v47 = *(_QWORD *)v48;
  v47[8] = v49;
  v50 = a3[16];
  v51 = (char *)a1 + v50;
  v52 = (char *)a2 + v50;
  v53 = v52[8];
  *(_QWORD *)v51 = *(_QWORD *)v52;
  v51[8] = v53;
  return a1;
}

_QWORD *initializeWithTake for IndexReport(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244B44F80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  v14 = (char *)a1 + v11;
  v15 = (char *)a2 + v11;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v15[8];
  v16 = a3[8];
  v17 = a3[9];
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  v20 = (char *)a1 + v17;
  v21 = (char *)a2 + v17;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v21[8];
  v22 = a3[10];
  v23 = a3[11];
  v24 = (char *)a1 + v22;
  v25 = (char *)a2 + v22;
  v26 = *(_QWORD *)v25;
  v24[8] = v25[8];
  *(_QWORD *)v24 = v26;
  v27 = (char *)a1 + v23;
  v28 = (char *)a2 + v23;
  v27[8] = v28[8];
  *(_QWORD *)v27 = *(_QWORD *)v28;
  v29 = a3[12];
  v30 = a3[13];
  v31 = (char *)a1 + v29;
  v32 = (char *)a2 + v29;
  v31[8] = v32[8];
  *(_QWORD *)v31 = *(_QWORD *)v32;
  v33 = (char *)a1 + v30;
  v34 = (char *)a2 + v30;
  v33[8] = v34[8];
  *(_QWORD *)v33 = *(_QWORD *)v34;
  v35 = a3[14];
  v36 = a3[15];
  v37 = (char *)a1 + v35;
  v38 = (char *)a2 + v35;
  v37[8] = v38[8];
  *(_QWORD *)v37 = *(_QWORD *)v38;
  v39 = (char *)a1 + v36;
  v40 = (char *)a2 + v36;
  v39[8] = v40[8];
  *(_QWORD *)v39 = *(_QWORD *)v40;
  v41 = a3[16];
  v42 = (char *)a1 + v41;
  v43 = (char *)a2 + v41;
  v42[8] = v43[8];
  *(_QWORD *)v42 = *(_QWORD *)v43;
  return a1;
}

_QWORD *assignWithTake for IndexReport(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244B44F80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  v14 = (char *)a1 + v11;
  v15 = (char *)a2 + v11;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v15[8];
  v16 = a3[8];
  v17 = a3[9];
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  v20 = (char *)a1 + v17;
  v21 = (char *)a2 + v17;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v21[8];
  v22 = a3[10];
  v23 = a3[11];
  v24 = (char *)a1 + v22;
  v25 = (char *)a2 + v22;
  v26 = *(_QWORD *)v25;
  v24[8] = v25[8];
  *(_QWORD *)v24 = v26;
  v27 = (char *)a1 + v23;
  v28 = (char *)a2 + v23;
  v27[8] = v28[8];
  *(_QWORD *)v27 = *(_QWORD *)v28;
  v29 = a3[12];
  v30 = a3[13];
  v31 = (char *)a1 + v29;
  v32 = (char *)a2 + v29;
  v31[8] = v32[8];
  *(_QWORD *)v31 = *(_QWORD *)v32;
  v33 = (char *)a1 + v30;
  v34 = (char *)a2 + v30;
  v33[8] = v34[8];
  *(_QWORD *)v33 = *(_QWORD *)v34;
  v35 = a3[14];
  v36 = a3[15];
  v37 = (char *)a1 + v35;
  v38 = (char *)a2 + v35;
  v37[8] = v38[8];
  *(_QWORD *)v37 = *(_QWORD *)v38;
  v39 = (char *)a1 + v36;
  v40 = (char *)a2 + v36;
  v39[8] = v40[8];
  *(_QWORD *)v39 = *(_QWORD *)v40;
  v41 = a3[16];
  v42 = (char *)a1 + v41;
  v43 = (char *)a2 + v41;
  v42[8] = v43[8];
  *(_QWORD *)v42 = *(_QWORD *)v43;
  return a1;
}

uint64_t getEnumTagSinglePayload for IndexReport()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for IndexReport()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B2A0C0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244B44F80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SearchReport(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_244B44F80();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = a3[7];
    v15 = (char *)v7 + v13;
    v16 = (char *)a2 + v13;
    *(_QWORD *)v15 = *(_QWORD *)v16;
    v15[8] = v16[8];
    v17 = (char *)v7 + v14;
    v18 = (char *)a2 + v14;
    *(_QWORD *)v17 = *(_QWORD *)v18;
    v17[8] = v18[8];
    v19 = a3[8];
    v20 = a3[9];
    v21 = (char *)v7 + v19;
    v22 = (char *)a2 + v19;
    *(_QWORD *)v21 = *(_QWORD *)v22;
    v21[8] = v22[8];
    v23 = (char *)v7 + v20;
    v24 = (char *)a2 + v20;
    *(_QWORD *)v23 = *(_QWORD *)v24;
    v23[8] = v24[8];
    v25 = a3[10];
    v26 = a3[11];
    v27 = (char *)v7 + v25;
    v28 = (char *)a2 + v25;
    v29 = *(_QWORD *)v28;
    v27[8] = v28[8];
    *(_QWORD *)v27 = v29;
    v30 = (char *)v7 + v26;
    v31 = (char *)a2 + v26;
    v30[8] = v31[8];
    *(_QWORD *)v30 = *(_QWORD *)v31;
  }
  return v7;
}

uint64_t _s17PrivateSearchCore11IndexReportVwxx_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_244B44F80();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for SearchReport(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244B44F80();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = a3[6];
  v12 = a3[7];
  v13 = (char *)a1 + v11;
  v14 = (char *)a2 + v11;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  v13[8] = v14[8];
  v15 = (char *)a1 + v12;
  v16 = (char *)a2 + v12;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  v17 = a3[8];
  v18 = a3[9];
  v19 = (char *)a1 + v17;
  v20 = (char *)a2 + v17;
  *(_QWORD *)v19 = *(_QWORD *)v20;
  v19[8] = v20[8];
  v21 = (char *)a1 + v18;
  v22 = (char *)a2 + v18;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  v23 = a3[10];
  v24 = a3[11];
  v25 = (char *)a1 + v23;
  v26 = (char *)a2 + v23;
  v27 = *(_QWORD *)v26;
  v25[8] = v26[8];
  *(_QWORD *)v25 = v27;
  v28 = (char *)a1 + v24;
  v29 = (char *)a2 + v24;
  v28[8] = v29[8];
  *(_QWORD *)v28 = *(_QWORD *)v29;
  return a1;
}

_QWORD *assignWithCopy for SearchReport(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char v33;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244B44F80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = v12[8];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v11[8] = v13;
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = v16[8];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v17;
  v18 = a3[8];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = v20[8];
  *(_QWORD *)v19 = *(_QWORD *)v20;
  v19[8] = v21;
  v22 = a3[9];
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = v24[8];
  *(_QWORD *)v23 = *(_QWORD *)v24;
  v23[8] = v25;
  v26 = a3[10];
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  v29 = v28[8];
  *(_QWORD *)v27 = *(_QWORD *)v28;
  v27[8] = v29;
  v30 = a3[11];
  v31 = (char *)a1 + v30;
  v32 = (char *)a2 + v30;
  v33 = v32[8];
  *(_QWORD *)v31 = *(_QWORD *)v32;
  v31[8] = v33;
  return a1;
}

_QWORD *initializeWithTake for SearchReport(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244B44F80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  v14 = (char *)a1 + v11;
  v15 = (char *)a2 + v11;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v15[8];
  v16 = a3[8];
  v17 = a3[9];
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  v20 = (char *)a1 + v17;
  v21 = (char *)a2 + v17;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v21[8];
  v22 = a3[10];
  v23 = a3[11];
  v24 = (char *)a1 + v22;
  v25 = (char *)a2 + v22;
  v26 = *(_QWORD *)v25;
  v24[8] = v25[8];
  *(_QWORD *)v24 = v26;
  v27 = (char *)a1 + v23;
  v28 = (char *)a2 + v23;
  v27[8] = v28[8];
  *(_QWORD *)v27 = *(_QWORD *)v28;
  return a1;
}

_QWORD *assignWithTake for SearchReport(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244B44F80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  v14 = (char *)a1 + v11;
  v15 = (char *)a2 + v11;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v15[8];
  v16 = a3[8];
  v17 = a3[9];
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  v20 = (char *)a1 + v17;
  v21 = (char *)a2 + v17;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v21[8];
  v22 = a3[10];
  v23 = a3[11];
  v24 = (char *)a1 + v22;
  v25 = (char *)a2 + v22;
  v26 = *(_QWORD *)v25;
  v24[8] = v25[8];
  *(_QWORD *)v24 = v26;
  v27 = (char *)a1 + v23;
  v28 = (char *)a2 + v23;
  v27[8] = v28[8];
  *(_QWORD *)v27 = *(_QWORD *)v28;
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchReport()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_index_1Tm(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_244B44F80();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for SearchReport()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *__swift_store_extra_inhabitant_index_2Tm(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_244B44F80();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_244B2A848()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244B44F80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for BenchmarkReport(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_244B44F80();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t destroy for BenchmarkReport(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t initializeWithCopy for BenchmarkReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for BenchmarkReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for BenchmarkReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for BenchmarkReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BenchmarkReport()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B2AB38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_244B44F80();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for BenchmarkReport()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B2ABC0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_244B44F80();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_244B2AC38()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244B44F80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_244B2ACAC()
{
  return type metadata accessor for BenchmarkReport._StorageClass(0);
}

void sub_244B2ACB4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_244B2AD98(319, &qword_2573DC100, (void (*)(uint64_t))type metadata accessor for BenchmarkConfig);
  if (v0 <= 0x3F)
  {
    sub_244B2AD98(319, &qword_2573DC108, (void (*)(uint64_t))type metadata accessor for IndexReport);
    if (v1 <= 0x3F)
    {
      sub_244B2AD98(319, qword_2573DC110, (void (*)(uint64_t))type metadata accessor for SearchReport);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_244B2AD98(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_244B453DC();
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_244B2ADE4()
{
  unint64_t result;

  result = qword_2573DC250;
  if (!qword_2573DC250)
  {
    result = MEMORY[0x24951FF40](&protocol conformance descriptor for IndexableFileType, &type metadata for IndexableFileType);
    atomic_store(result, (unint64_t *)&qword_2573DC250);
  }
  return result;
}

uint64_t sub_244B2AE28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

const char *BitArray.kBitsInByte.unsafeMutableAddressor()
{
  return "\b";
}

uint64_t static BitArray.kBitsInByte.getter()
{
  return 8;
}

void *BitArray.kDefaultNumberOfBytes.unsafeMutableAddressor()
{
  return &static BitArray.kDefaultNumberOfBytes;
}

uint64_t static BitArray.kDefaultNumberOfBytes.getter()
{
  return 0x2000;
}

unint64_t BitArray.init(hex:)()
{
  unint64_t v0;

  v0 = _s17PrivateSearchCore8HexCodecV04fromD0ySays5UInt8VGSSFZ_0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BitArray.init(numBytes:defaultBitValue:)(size_t a1, int a2)
{
  int v3;
  uint64_t v4;
  uint64_t result;

  if ((a1 & 0x8000000000000000) != 0)
  {
    result = sub_244B454A8();
    __break(1u);
  }
  else
  {
    if (!a1)
      return MEMORY[0x24BEE4AF8];
    v3 = a2 << 31 >> 31;
    v4 = sub_244B45274();
    *(_QWORD *)(v4 + 16) = a1;
    memset((void *)(v4 + 32), v3, a1);
    return v4;
  }
  return result;
}

uint64_t BitArray.init(numBits:defaultBitValue:)(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  size_t v4;
  int v5;
  uint64_t v6;
  uint64_t result;

  v2 = a1 + 8;
  if (__OFADD__(a1, 8))
  {
    __break(1u);
LABEL_10:
    result = sub_244B454A8();
    __break(1u);
    return result;
  }
  v3 = a1 + 7;
  if (v2 < 1)
    v3 = a1 + 14;
  if (v2 <= -7)
    goto LABEL_10;
  if (v2 < 9)
    return MEMORY[0x24BEE4AF8];
  v4 = v3 >> 3;
  v5 = a2 << 31 >> 31;
  v6 = sub_244B45274();
  *(_QWORD *)(v6 + 16) = v4;
  memset((void *)(v6 + 32), v5, v4);
  return v6;
}

uint64_t static BitArray.bitsToBytes(_:)(uint64_t result)
{
  uint64_t v1;

  if (__OFADD__(result, 8))
  {
    __break(1u);
  }
  else
  {
    v1 = result + 14;
    if (result + 8 >= 1)
      v1 = result + 7;
    return v1 >> 3;
  }
  return result;
}

uint64_t static BitArray.bytesToBits(_:)(uint64_t result)
{
  if ((unint64_t)(result - 0x1000000000000000) >> 61 == 7)
    result *= 8;
  else
    __break(1u);
  return result;
}

uint64_t BitArray.numBytes.getter(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t BitArray.numBits.getter(uint64_t result)
{
  unint64_t v1;

  v1 = *(_QWORD *)(result + 16);
  if (!(v1 >> 60))
    return 8 * v1;
  __break(1u);
  return result;
}

uint64_t static BitArray.random(_:)(size_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;

  if ((a1 & 0x8000000000000000) != 0)
  {
LABEL_10:
    result = sub_244B454A8();
    __break(1u);
    return result;
  }
  if (a1)
  {
    v2 = sub_244B45274();
    *(_QWORD *)(v2 + 16) = a1;
    bzero((void *)(v2 + 32), a1);
    v3 = 0;
    while (1)
    {
      v5 = 0;
      MEMORY[0x24951FFD0](&v5, 8);
      if (v3 >= *(_QWORD *)(v2 + 16))
        break;
      *(_BYTE *)(v2 + v3++ + 32) = v5;
      if (a1 == v3)
        return v2;
    }
    __break(1u);
    goto LABEL_10;
  }
  return MEMORY[0x24BEE4AF8];
}

BOOL BitArray.innerProduct(_:)(int8x16_t *a1, int8x16_t *a2)
{
  unint64_t v2;
  unsigned int v3;
  uint64_t v4;
  int8x16_t *v5;
  int8x16_t *v6;
  int8x16_t v7;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;
  unint64_t v11;
  uint64_t v12;
  int8x8_t v13;
  int8x8_t *v14;
  int8x8_t *v15;
  unint64_t v16;
  int8x8_t v17;
  int8x8_t v18;
  int8x8_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  int v25;
  int v26;
  int v27;

  v2 = a2[1].u64[0];
  if (a1[1].i64[0] < v2)
    v2 = a1[1].u64[0];
  if (!v2)
  {
    v3 = 0;
    return ((((v3 >> 2) ^ (v3 >> 1) ^ (v3 >> 3) ^ (v3 >> 4) ^ (v3 >> 5) ^ (v3 >> 6)) ^ v3) & 1) != v3 >> 7;
  }
  if (v2 < 8)
  {
    v3 = 0;
    v4 = 0;
    goto LABEL_16;
  }
  if (v2 >= 0x20)
  {
    v4 = v2 & 0x7FFFFFFFFFFFFFE0;
    v5 = a2 + 3;
    v6 = a1 + 3;
    v7 = 0uLL;
    v8 = v2 & 0x7FFFFFFFFFFFFFE0;
    v9 = 0uLL;
    do
    {
      v7 = veorq_s8(vandq_s8(v6[-1], v5[-1]), v7);
      v9 = veorq_s8(vandq_s8(*v6, *v5), v9);
      v5 += 2;
      v6 += 2;
      v8 -= 32;
    }
    while (v8);
    v10 = veorq_s8(v9, v7);
    *(int8x8_t *)v10.i8 = veor_s8(*(int8x8_t *)v10.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL));
    v11 = v10.i64[0] ^ HIDWORD(v10.i64[0]) ^ ((unint64_t)(v10.i64[0] ^ HIDWORD(v10.i64[0])) >> 16);
    v3 = v11 ^ (v11 >> 8);
    if (v2 == v4)
      return ((((v3 >> 2) ^ (v3 >> 1) ^ (v3 >> 3) ^ (v3 >> 4) ^ (v3 >> 5) ^ (v3 >> 6)) ^ v3) & 1) != v3 >> 7;
    if ((v2 & 0x18) == 0)
    {
LABEL_16:
      v21 = v2 - v4;
      v22 = v4 + 32;
      v23 = &a1[2].u8[v4];
      v24 = &a2->u8[v22];
      do
      {
        v26 = *v24++;
        v25 = v26;
        v27 = *v23++;
        v3 ^= v27 & v25;
        --v21;
      }
      while (v21);
      return ((((v3 >> 2) ^ (v3 >> 1) ^ (v3 >> 3) ^ (v3 >> 4) ^ (v3 >> 5) ^ (v3 >> 6)) ^ v3) & 1) != v3 >> 7;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
    v4 = 0;
  }
  v12 = v4;
  v4 = v2 & 0x7FFFFFFFFFFFFFF8;
  v13 = (int8x8_t)v3;
  v14 = (int8x8_t *)&a2[2].i8[v12];
  v15 = (int8x8_t *)&a1[2].i8[v12];
  v16 = v12 - (v2 & 0x7FFFFFFFFFFFFFF8);
  do
  {
    v17 = *v14++;
    v18 = v17;
    v19 = *v15++;
    v13 = veor_s8(vand_s8(v19, v18), v13);
    v16 += 8;
  }
  while (v16);
  v20 = *(_QWORD *)&v13 ^ HIDWORD(*(_QWORD *)&v13) ^ ((*(_QWORD *)&v13 ^ HIDWORD(*(_QWORD *)&v13)) >> 16);
  v3 = v20 ^ (v20 >> 8);
  if (v2 != v4)
    goto LABEL_16;
  return ((((v3 >> 2) ^ (v3 >> 1) ^ (v3 >> 3) ^ (v3 >> 4) ^ (v3 >> 5) ^ (v3 >> 6)) ^ v3) & 1) != v3 >> 7;
}

char *BitArray.setRange(startBit:endBit:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v10 = a1 + 8;
  if (__OFADD__(a1, 8))
  {
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v11 = a1 + 7;
  if (v10 < 1)
    v11 = a1 + 14;
  v5 = a2 + 8;
  if (__OFADD__(a2, 8))
    goto LABEL_35;
  v9 = v11 >> 3;
  v12 = a2 + 7;
  if (v5 < 1)
    v12 = a2 + 14;
  v6 = v12 >> 3;
  if (a2 <= 0)
    v8 = -(-a2 & 7);
  else
    v8 = a2 & 7;
  if (v6 <= v9)
    goto LABEL_36;
  v3 = (char *)a3;
  v7 = v6 - 1;
  v4 = v6 - 1 - v9;
  if (v6 - 1 != v9)
  {
    if (v6 - 1 <= v9)
      goto LABEL_40;
    if (v10 < -6)
      goto LABEL_41;
    v13 = *(_QWORD *)(a3 + 16);
    if (v6 - 2 >= v13 || v5 < 17 || v9 >= v13)
      goto LABEL_42;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      goto LABEL_43;
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  while (v8 < 0)
  {
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    v3 = sub_244B1F91C((uint64_t)v3);
LABEL_19:
    memset(&v3[v9 + 32], 255, v4);
  }
  v4 = 1;
  switch(v8)
  {
    case 0:
      v4 = 0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        goto LABEL_23;
      goto LABEL_31;
    case 1:
      goto LABEL_30;
    case 2:
      v4 = 3;
      goto LABEL_30;
    case 3:
      v4 = 7;
      goto LABEL_30;
    case 4:
      v4 = 15;
      goto LABEL_30;
    case 5:
      v4 = 31;
      goto LABEL_30;
    case 6:
      v4 = 63;
      goto LABEL_30;
    default:
      v4 = 127;
LABEL_30:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_23:
        v3 = sub_244B1F91C((uint64_t)v3);
LABEL_31:
      if (v5 < 9)
        goto LABEL_38;
      if (v6 > *((_QWORD *)v3 + 2))
        goto LABEL_39;
      v3[v7 + 32] |= v4;
      return v3;
  }
}

uint64_t BitArray.and(_:)(int8x16_t *a1, int8x16_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  size_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int8x16_t *v12;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int8x16_t *v17;
  int8x16_t *v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16_t v21;

  v4 = a2[1].u64[0];
  v5 = a1[1].u64[0];
  if (v5 >= v4)
    v6 = a2[1].i64[0];
  else
    v6 = a1[1].i64[0];
  if (v5 <= v4)
    v7 = a2[1].u64[0];
  else
    v7 = a1[1].u64[0];
  v8 = sub_244B1EFFC(0, v7);
  if (v6)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      goto LABEL_26;
    while (1)
    {
      v9 = *(_QWORD *)(v8 + 16);
      v10 = v6 - 1;
      if (v6 - 1 >= v9)
        v10 = *(_QWORD *)(v8 + 16);
      if (v10 >= 0x10)
      {
        v12 = (int8x16_t *)(v8 + 32);
        if ((unint64_t)(v8 - (_QWORD)a2) >= 0x10 && (unint64_t)(v8 - (_QWORD)a1) >= 0x10)
        {
          v14 = v10 + 1;
          v15 = v14 & 0xF;
          if ((v14 & 0xF) == 0)
            v15 = 16;
          v11 = v14 - v15;
          v16 = v11;
          v17 = a1 + 2;
          v18 = a2 + 2;
          do
          {
            v19 = *v18++;
            v20 = v19;
            v21 = *v17++;
            *v12++ = vandq_s8(v21, v20);
            v16 -= 16;
          }
          while (v16);
        }
        else
        {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
      while (v11 < v9)
      {
        *(_BYTE *)(v8 + v11 + 32) = a1[2].i8[v11] & a2[2].i8[v11];
        if (v6 == ++v11)
          return v8;
      }
      __break(1u);
LABEL_26:
      v8 = (uint64_t)sub_244B1F91C(v8);
    }
  }
  return v8;
}

Swift::Void __swiftcall BitArray.setBit(_:_:)(Swift::Int a1, Swift::Bool a2)
{
  char **v2;
  int v3;
  unint64_t v4;
  char *v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  int v9;

  if (a1 < 0)
    return;
  v5 = *v2;
  v6 = *((_QWORD *)*v2 + 2);
  if (v6 >> 60)
  {
    __break(1u);
    goto LABEL_17;
  }
  LOBYTE(v3) = a1;
  if (a1 >= 8 * v6)
    return;
  v4 = (unint64_t)a1 >> 3;
  v7 = (unint64_t)a1 >> 3 >= v6;
  if (!a2)
    goto LABEL_9;
  if ((unint64_t)a1 >> 3 >= v6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v3 = v5[v4 + 32] | (1 << (a1 & 7));
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_19;
  while (1)
  {
    v8 = *((_QWORD *)v5 + 2);
    v7 = v4 >= v8;
    if (v4 < v8)
      goto LABEL_14;
    __break(1u);
LABEL_9:
    if (!v7)
      break;
LABEL_18:
    __break(1u);
LABEL_19:
    v5 = sub_244B1F91C((uint64_t)v5);
  }
  v9 = v5[v4 + 32];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_244B1F91C((uint64_t)v5);
  if (v4 < *((_QWORD *)v5 + 2))
  {
    v3 = v9 & ~(1 << (v3 & 7));
LABEL_14:
    v5[v4 + 32] = v3;
    *v2 = v5;
    return;
  }
  __break(1u);
}

Swift::Bool __swiftcall BitArray.isBitSet(_:)(Swift::Int a1)
{
  uint64_t v1;
  unint64_t v2;

  if (a1 < 0)
    goto LABEL_6;
  v2 = *(_QWORD *)(v1 + 16);
  if (v2 >> 60)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (a1 >= 8 * v2)
  {
LABEL_6:
    LOBYTE(a1) = 0;
    return a1;
  }
  if ((unint64_t)a1 >> 3 >= v2)
  {
LABEL_8:
    __break(1u);
    return a1;
  }
  LODWORD(a1) = (*(unsigned __int8 *)(v1 + ((unint64_t)a1 >> 3) + 32) >> (a1 & 7)) & 1;
  return a1;
}

Swift::Void __swiftcall BitArray.xorBit(_:_:)(Swift::Int a1, Swift::Bool a2)
{
  char v2;
  char **v3;
  unint64_t v4;
  char v5;
  char *v6;
  unint64_t v7;

  if ((a1 & 0x8000000000000000) == 0)
  {
    v6 = *v3;
    v7 = *((_QWORD *)*v3 + 2);
    if (v7 >> 60)
    {
      __break(1u);
      goto LABEL_11;
    }
    v2 = a1;
    if (a1 < 8 * v7 && a2)
    {
      v4 = (unint64_t)a1 >> 3;
      if ((unint64_t)a1 >> 3 < v7)
      {
        v5 = v6[v4 + 32];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
          goto LABEL_7;
        goto LABEL_12;
      }
LABEL_11:
      __break(1u);
LABEL_12:
      v6 = sub_244B1F91C((uint64_t)v6);
LABEL_7:
      if (v4 >= *((_QWORD *)v6 + 2))
      {
        __break(1u);
      }
      else
      {
        v6[v4 + 32] = v5 ^ (1 << (v2 & 7));
        *v3 = v6;
      }
    }
  }
}

char *BitArray.xor(_:)(int8x16_t *a1, int8x16_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  int8x16_t *v4;
  char *v5;
  unint64_t v6;
  int8x16_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int8x16_t *v11;
  unint64_t v12;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int8x16_t *v18;
  int8x16_t v19;

  v2 = a2[1].u64[0];
  v3 = a1[1].u64[0];
  if (v3 >= v2)
    v4 = a2;
  else
    v4 = a1;
  if (v3 >= v2)
    v5 = (char *)a1;
  else
    v5 = (char *)a2;
  v6 = v4[1].u64[0];
  if (v6)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_36:
      v5 = sub_244B1F91C((uint64_t)v5);
    v7 = v4 + 2;
    v8 = *((_QWORD *)v5 + 2);
    v9 = v6 - 1;
    if (v8 >= v6 - 1)
      v10 = v6 - 1;
    else
      v10 = *((_QWORD *)v5 + 2);
    if (v10 <= 0xF)
      goto LABEL_25;
    v11 = (int8x16_t *)(v5 + 32);
    if (v8 < v9)
      v9 = *((_QWORD *)v5 + 2);
    v12 = v9 + 33;
    if (v11 >= (int8x16_t *)&v4->i8[v12] || v7 >= (int8x16_t *)&v5[v12])
    {
      v14 = v10 + 1;
      v15 = v14 & 0xF;
      if ((v14 & 0xF) == 0)
        v15 = 16;
      v16 = v14 - v15;
      v17 = v16;
      v18 = v4 + 2;
      do
      {
        v19 = *v18++;
        *v11 = veorq_s8(*v11, v19);
        ++v11;
        v17 -= 16;
      }
      while (v17);
    }
    else
    {
LABEL_25:
      v16 = 0;
    }
    do
    {
      if (v16 >= v8)
        goto LABEL_35;
      v5[v16 + 32] ^= v7->u8[v16];
      ++v16;
    }
    while (v6 != v16);
    if (v8 < v6)
    {
      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
  else
  {
    v8 = *((_QWORD *)v5 + 2);
    swift_bridgeObjectRetain();
  }
  if (v6 == v8)
    return v5;
  if (v6 >= v8)
  {
    __break(1u);
  }
  else if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
  {
    return v5;
  }
  return sub_244B1F91C((uint64_t)v5);
}

uint64_t static BitArray.== infix(_:_:)(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(result + 16);
  if (v2 >> 60)
  {
    __break(1u);
    goto LABEL_7;
  }
  v3 = *(_QWORD *)(a2 + 16);
  if (v3 >> 60)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  return v2 == v3 && sub_244B2B9D4(result, a2);
}

BOOL sub_244B2B9D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  uint64_t v5;
  _BOOL8 result;
  int v7;
  int v8;
  int v9;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32))
    return 0;
  v3 = (unsigned __int8 *)(a1 + 33);
  v4 = (unsigned __int8 *)(a2 + 33);
  v5 = v2 - 1;
  do
  {
    result = v5 == 0;
    if (!v5)
      break;
    v8 = *v3++;
    v7 = v8;
    v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

uint64_t sub_244B2BA40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  char *v22;
  char v23;
  char *v24;
  int v25;
  char v26;
  BOOL v28;
  uint64_t v30;

  v4 = type metadata accessor for TestDataBundle.SearchingData.Token(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v30 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (v11 && a1 != a2)
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      while (1)
      {
        sub_244B26C0C(a1 + v12, (uint64_t)v10, type metadata accessor for TestDataBundle.SearchingData.Token);
        sub_244B26C0C(a2 + v12, (uint64_t)v7, type metadata accessor for TestDataBundle.SearchingData.Token);
        v15 = *(int *)(v4 + 20);
        v16 = &v10[v15];
        v17 = *(_QWORD *)&v10[v15 + 8];
        v18 = &v7[v15];
        v19 = *((_QWORD *)v18 + 1);
        if (v17)
        {
          if (!v19)
            goto LABEL_27;
          v20 = *(_QWORD *)v16 == *(_QWORD *)v18 && v17 == v19;
          if (!v20 && (sub_244B45508() & 1) == 0)
            goto LABEL_27;
        }
        else if (v19)
        {
          goto LABEL_27;
        }
        v21 = *(int *)(v4 + 24);
        v22 = &v10[v21];
        v23 = v10[v21 + 4];
        v24 = &v7[v21];
        v25 = v7[v21 + 4];
        if ((v23 & 1) != 0)
        {
          if (!v25)
            goto LABEL_27;
        }
        else
        {
          if (*(_DWORD *)v22 != *(_DWORD *)v24)
            LOBYTE(v25) = 1;
          if ((v25 & 1) != 0)
          {
LABEL_27:
            sub_244B26C50((uint64_t)v7, type metadata accessor for TestDataBundle.SearchingData.Token);
            sub_244B26C50((uint64_t)v10, type metadata accessor for TestDataBundle.SearchingData.Token);
            goto LABEL_28;
          }
        }
        sub_244B44F80();
        sub_244B2C010();
        v26 = sub_244B45124();
        sub_244B26C50((uint64_t)v7, type metadata accessor for TestDataBundle.SearchingData.Token);
        sub_244B26C50((uint64_t)v10, type metadata accessor for TestDataBundle.SearchingData.Token);
        v28 = v14-- != 0;
        if ((v26 & 1) != 0)
        {
          v12 += v13;
          if (v28)
            continue;
        }
        return v26 & 1;
      }
    }
    v26 = 1;
  }
  else
  {
LABEL_28:
    v26 = 0;
  }
  return v26 & 1;
}

uint64_t sub_244B2BC30(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  BOOL v32;
  char v33;
  BOOL v35;
  uint64_t v37;

  v4 = (int *)type metadata accessor for TestDataBundle.IndexingData.Document(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v37 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (v11 && a1 != a2)
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      while (1)
      {
        sub_244B26C0C(a1 + v12, (uint64_t)v10, type metadata accessor for TestDataBundle.IndexingData.Document);
        sub_244B26C0C(a2 + v12, (uint64_t)v7, type metadata accessor for TestDataBundle.IndexingData.Document);
        v15 = v4[5];
        v16 = &v10[v15];
        v17 = *(_QWORD *)&v10[v15 + 8];
        v18 = &v7[v15];
        v19 = *((_QWORD *)v18 + 1);
        if (v17)
        {
          if (!v19
            || (*(_QWORD *)v16 == *(_QWORD *)v18 ? (v20 = v17 == v19) : (v20 = 0), !v20 && (sub_244B45508() & 1) == 0))
          {
LABEL_39:
            sub_244B26C50((uint64_t)v7, type metadata accessor for TestDataBundle.IndexingData.Document);
            sub_244B26C50((uint64_t)v10, type metadata accessor for TestDataBundle.IndexingData.Document);
            goto LABEL_40;
          }
        }
        else if (v19)
        {
          goto LABEL_39;
        }
        v21 = v4[6];
        v22 = &v10[v21];
        v23 = *(_QWORD *)&v10[v21 + 8];
        v24 = &v7[v21];
        v25 = *((_QWORD *)v24 + 1);
        if (v23)
        {
          if (!v25)
            goto LABEL_39;
          v26 = *(_QWORD *)v22 == *(_QWORD *)v24 && v23 == v25;
          if (!v26 && (sub_244B45508() & 1) == 0)
            goto LABEL_39;
        }
        else if (v25)
        {
          goto LABEL_39;
        }
        v27 = v4[7];
        v28 = &v10[v27];
        v29 = *(_QWORD *)&v10[v27 + 8];
        v30 = &v7[v27];
        v31 = *((_QWORD *)v30 + 1);
        if (v29)
        {
          if (!v31)
            goto LABEL_39;
          v32 = *(_QWORD *)v28 == *(_QWORD *)v30 && v29 == v31;
          if (!v32 && (sub_244B45508() & 1) == 0)
            goto LABEL_39;
        }
        else if (v31)
        {
          goto LABEL_39;
        }
        sub_244B44F80();
        sub_244B2C010();
        v33 = sub_244B45124();
        sub_244B26C50((uint64_t)v7, type metadata accessor for TestDataBundle.IndexingData.Document);
        sub_244B26C50((uint64_t)v10, type metadata accessor for TestDataBundle.IndexingData.Document);
        v35 = v14-- != 0;
        if ((v33 & 1) != 0)
        {
          v12 += v13;
          if (v35)
            continue;
        }
        return v33 & 1;
      }
    }
    v33 = 1;
  }
  else
  {
LABEL_40:
    v33 = 0;
  }
  return v33 & 1;
}

uint64_t sub_244B2BE74(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_244B45508(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_244B45508() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t BitArray.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_bridgeObjectRetain();
  v1 = _s17PrivateSearchCore8HexCodecV02toD0ySSSays5UInt8VGFZ_0(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_244B2BF7C(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  result = *a1;
  v3 = *(_QWORD *)(result + 16);
  if (v3 >> 60)
  {
    __break(1u);
    goto LABEL_7;
  }
  v4 = *a2;
  v5 = *(_QWORD *)(v4 + 16);
  if (v5 >> 60)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  return v3 == v5 && sub_244B2B9D4(result, v4);
}

uint64_t sub_244B2BFB8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_bridgeObjectRetain();
  v1 = _s17PrivateSearchCore8HexCodecV02toD0ySSSays5UInt8VGFZ_0(v0);
  swift_bridgeObjectRelease();
  return v1;
}

ValueMetadata *type metadata accessor for BitArray()
{
  return &type metadata for BitArray;
}

unint64_t sub_244B2C010()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573DC258;
  if (!qword_2573DC258)
  {
    v1 = sub_244B44F80();
    result = MEMORY[0x24951FF40](MEMORY[0x24BE5BF20], v1);
    atomic_store(result, (unint64_t *)&qword_2573DC258);
  }
  return result;
}

void *BloomFilter.kDefaultLevel0MaxTerms.unsafeMutableAddressor()
{
  return &static BloomFilter.kDefaultLevel0MaxTerms;
}

uint64_t static BloomFilter.kDefaultLevel0MaxTerms.getter()
{
  return 22;
}

uint64_t BloomFilter.init(bitArray:secret:numHashes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = sub_244B2C52C(a3, a2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t static BloomFilter.hash(token:seed:)()
{
  uint64_t v0;
  uint64_t result;

  sub_244B454F0();
  sub_244B451E4();
  sub_244B454F0();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  v0 = sub_244B2DFA8();
  result = swift_bridgeObjectRelease();
  if ((v0 & 0x8000000000000000) == 0)
    return v0;
  __break(1u);
  return result;
}

uint64_t static BloomFilter.hash(token:numHashes:secret:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_244B2C52C(a3, a4);
  v7 = _s17PrivateSearchCore11BloomFilterV4hash5tokenSays6UInt64VGSS_tF_0(a1, a2, v6);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t BloomFilter.bitArray.getter()
{
  return swift_bridgeObjectRetain();
}

Swift::Void __swiftcall BloomFilter.addAll(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *((_QWORD *)a1._rawValue + 2);
  if (v1)
  {
    v2 = swift_bridgeObjectRetain() + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_244B2C254();
      swift_bridgeObjectRelease();
      v2 += 16;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
}

void sub_244B2C254()
{
  _QWORD *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;

  v1 = *(_QWORD *)(*v0 + 16);
  if (!v1)
    return;
  v2 = (char *)v0[1];
  swift_bridgeObjectRetain();
  v9 = v0;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_17:
    v2 = sub_244B1F91C((uint64_t)v2);
  v3 = 0;
  while (1)
  {
    sub_244B454F0();
    sub_244B451E4();
    sub_244B454F0();
    sub_244B451E4();
    swift_bridgeObjectRelease();
    v4 = sub_244B2DFA8();
    swift_bridgeObjectRelease();
    if (v4 < 0)
    {
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    v5 = *((_QWORD *)v2 + 2);
    if (v5 >> 60)
      goto LABEL_15;
    v6 = 8 * v5;
    if (!(8 * v5))
      goto LABEL_16;
    if ((v6 & 0x8000000000000000) == 0)
      break;
LABEL_5:
    if (v1 == ++v3)
      goto LABEL_12;
  }
  v7 = v4 % v6;
  v8 = (unint64_t)(v4 % v6) >> 3;
  if (v8 < v5)
  {
    v2[v8 + 32] |= 1 << (v7 & 7);
    goto LABEL_5;
  }
  __break(1u);
LABEL_12:
  swift_bridgeObjectRelease();
  v9[1] = v2;
}

Swift::Bool __swiftcall BloomFilter.contains(_:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;

  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(v2 + 16);
    if (!(v4 >> 60))
    {
      v5 = 8 * v4;
      if (!(8 * v4))
      {
LABEL_18:
        __break(1u);
        return a1._countAndFlagsBits;
      }
      v6 = v2 + 32;
      swift_bridgeObjectRetain();
      v7 = 0;
      while (1)
      {
        sub_244B454F0();
        sub_244B451E4();
        sub_244B454F0();
        sub_244B451E4();
        swift_bridgeObjectRelease();
        v8 = sub_244B2DFA8();
        LOBYTE(a1._countAndFlagsBits) = swift_bridgeObjectRelease();
        if (v8 < 0)
          break;
        if (v5 < 0)
          goto LABEL_11;
        v9 = (unint64_t)(v8 % v5) >> 3;
        if (v9 >= v4)
          goto LABEL_16;
        if (((*(unsigned __int8 *)(v6 + v9) >> ((v8 % v5) & 7)) & 1) == 0)
        {
LABEL_11:
          v10 = 0;
          goto LABEL_12;
        }
        if (v3 == ++v7)
        {
          v10 = 1;
LABEL_12:
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
      }
      __break(1u);
LABEL_16:
      __break(1u);
    }
    __break(1u);
    goto LABEL_18;
  }
  v10 = 1;
LABEL_14:
  LOBYTE(a1._countAndFlagsBits) = v10;
  return a1._countAndFlagsBits;
}

uint64_t sub_244B2C52C(uint64_t a1, uint64_t a2)
{
  Swift::UInt32 v2;
  int64_t v3;
  unint64_t v4;
  _QWORD *inited;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  Swift::UInt32 v13;
  unint64_t v14;
  unint64_t v15;

  type metadata accessor for AESCounterRandomNumberGenerator();
  inited = (_QWORD *)swift_initStackObject();
  inited[2] = a2;
  inited[3] = 0;
  swift_bridgeObjectRetain();
  v8 = 16;
  v9 = (_QWORD *)sub_244B45274();
  v9[2] = 16;
  v9[4] = 0;
  v9[5] = 0;
  v10 = MEMORY[0x24BEE4AF8];
  inited[4] = v9;
  inited[5] = v10;
  if (a1 < 1)
  {
    __break(1u);
  }
  else
  {
    v2 = AESCounterRandomNumberGenerator.nextUInt32()();
    v8 = (uint64_t)sub_244B30BE4(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v4 = *(_QWORD *)(v8 + 16);
    v10 = *(_QWORD *)(v8 + 24);
    v3 = v4 + 1;
    if (v4 < v10 >> 1)
      goto LABEL_3;
  }
  v8 = (uint64_t)sub_244B30BE4((char *)(v10 > 1), v3, 1, (char *)v8);
LABEL_3:
  *(_QWORD *)(v8 + 16) = v3;
  *(_DWORD *)(v8 + 4 * v4 + 32) = v2;
  v11 = a1 - 1;
  if (a1 != 1)
  {
    do
    {
      v13 = AESCounterRandomNumberGenerator.nextUInt32()();
      v15 = *(_QWORD *)(v8 + 16);
      v14 = *(_QWORD *)(v8 + 24);
      if (v15 >= v14 >> 1)
        v8 = (uint64_t)sub_244B30BE4((char *)(v14 > 1), v15 + 1, 1, (char *)v8);
      *(_QWORD *)(v8 + 16) = v15 + 1;
      *(_DWORD *)(v8 + 4 * v15 + 32) = v13;
      --v11;
    }
    while (v11);
  }
  swift_release();
  return v8;
}

uint64_t _s17PrivateSearchCore11BloomFilterV4hash5tokenSays6UInt64VGSS_tF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;

  v3 = *(_QWORD *)(a3 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      sub_244B454F0();
      sub_244B451E4();
      sub_244B454F0();
      sub_244B451E4();
      swift_bridgeObjectRelease();
      v6 = sub_244B2DFA8();
      result = swift_bridgeObjectRelease();
      if (v6 < 0)
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = sub_244B30CF0(0, v5[2] + 1, 1, v5);
      v9 = v5[2];
      v8 = v5[3];
      if (v9 >= v8 >> 1)
        v5 = sub_244B30CF0((_QWORD *)(v8 > 1), v9 + 1, 1, v5);
      ++v4;
      v5[2] = v9 + 1;
      v5[v9 + 4] = v6;
      if (v3 == v4)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v5;
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t destroy for BloomFilter()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s17PrivateSearchCore11BloomFilterVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for BloomFilter(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for BloomFilter(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilter(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BloomFilter()
{
  return &type metadata for BloomFilter;
}

uint64_t CallContextImpl.clientContext.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_beginAccess();
  return sub_244B2C9DC(v1 + 16, a1);
}

uint64_t sub_244B2C9DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CallContextImpl.clientContext.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  sub_244B2CA74(a1, v1 + 16);
  return swift_endAccess();
}

uint64_t sub_244B2CA74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*CallContextImpl.clientContext.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CallContextImpl.__allocating_init(withClientContext:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  swift_beginAccess();
  sub_244B2CA74(a1, v2 + 16);
  swift_endAccess();
  return v2;
}

uint64_t CallContextImpl.init(withClientContext:)(uint64_t a1)
{
  uint64_t v1;

  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  swift_beginAccess();
  sub_244B2CA74(a1, v1 + 16);
  swift_endAccess();
  return v1;
}

uint64_t CallContextImpl.deinit()
{
  uint64_t v0;

  sub_244B2CBF8(v0 + 16);
  return v0;
}

uint64_t sub_244B2CBF8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC288);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t CallContextImpl.__deallocating_deinit()
{
  uint64_t v0;

  sub_244B2CBF8(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_244B2CC5C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;

  v3 = *v1 + 16;
  swift_beginAccess();
  return sub_244B2C9DC(v3, a1);
}

uint64_t type metadata accessor for CallContextImpl()
{
  return objc_opt_self();
}

void *CapacityAwareLevelStrategy.kDefaultLevel0BloomFilterSizeBits.unsafeMutableAddressor()
{
  return &static CapacityAwareLevelStrategy.kDefaultLevel0BloomFilterSizeBits;
}

uint64_t static CapacityAwareLevelStrategy.kDefaultLevel0BloomFilterSizeBits.getter()
{
  return 640;
}

void *CapacityAwareLevelStrategy.kDefaultLevel0MaxTerms.unsafeMutableAddressor()
{
  return &static CapacityAwareLevelStrategy.kDefaultLevel0MaxTerms;
}

uint64_t static CapacityAwareLevelStrategy.kDefaultLevel0MaxTerms.getter()
{
  return 22;
}

void *CapacityAwareLevelStrategy.kDefaultLevelCapacity.unsafeMutableAddressor()
{
  return &static CapacityAwareLevelStrategy.kDefaultLevelCapacity;
}

uint64_t static CapacityAwareLevelStrategy.kDefaultLevelCapacity.getter()
{
  return 4096;
}

__n128 sub_244B2CD04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  type metadata accessor for CapacityAwareLevelStrategy();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 56) = xmmword_244B46340;
  *(_QWORD *)(v0 + 72) = 4096;
  type metadata accessor for LevelCapacityUsageState();
  swift_allocObject();
  *(_QWORD *)(v0 + 80) = LevelCapacityUsageState.init(levelCapacity:)(4096);
  v1 = type metadata accessor for LogLevelStrategy();
  v2 = swift_allocObject();
  result = (__n128)xmmword_244B46340;
  *(_OWORD *)(v2 + 16) = xmmword_244B46340;
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = &protocol witness table for LogLevelStrategy;
  *(_QWORD *)(v0 + 16) = v2;
  qword_2573DC348 = v0;
  return result;
}

uint64_t static CapacityAwareLevelStrategy.getInstance()()
{
  if (qword_2573DBB68 != -1)
    swift_once();
  return swift_retain();
}

uint64_t CapacityAwareLevelStrategy.refreshState(searchIndexReader:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_244B2CE04()
{
  uint64_t *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (_QWORD *)v0[3];
  v0[4] = v1[10];
  v2 = v1[8];
  v3 = v1[9];
  swift_retain();
  v4 = (_QWORD *)swift_task_alloc();
  v0[5] = (uint64_t)v4;
  *v4 = v0;
  v4[1] = sub_244B2CE80;
  return LevelCapacityUsageState.refresh(searchIndexReader:level0BloomFilterSizeBits:levelCapacity:)(v0[2], v2, v3);
}

uint64_t sub_244B2CE80()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_244B2CEF4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::UInt64 __swiftcall CapacityAwareLevelStrategy.levelForTerms(_:)(Swift::UInt64 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::UInt64 result;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[16];
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v4 = sub_244B450DC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  sub_244B2D524(v2 + 16, (uint64_t)v15);
  v8 = v16;
  v9 = v17;
  __swift_project_boxed_opaque_existential_1(v15, v16);
  v10 = (*(uint64_t (**)(Swift::UInt64, uint64_t, uint64_t))(v9 + 8))(a1, v8, v9);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  if (v10 < 0)
  {
    __break(1u);
  }
  else
  {
    v12 = *(_QWORD *)(v2 + 80);
    v15[0] = 2 * v10;
    swift_retain();
    v13 = sub_244B450D0();
    MEMORY[0x24BDAC7A8](v13);
    *(_QWORD *)&v14[-32] = v12;
    *(_QWORD *)&v14[-24] = 2 * v10;
    *(_QWORD *)&v14[-16] = v15;
    sub_244B453B8();
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
    swift_release();
    return v15[0];
  }
  return result;
}

Swift::UInt64 __swiftcall CapacityAwareLevelStrategy.bloomFilterSizeForLevel(_:)(Swift::UInt64 a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  Swift::UInt64 result;
  Swift::UInt64 v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  swift_beginAccess();
  sub_244B2D524(v1 + 16, (uint64_t)v7);
  v3 = v8;
  v4 = v9;
  result = (Swift::UInt64)__swift_project_boxed_opaque_existential_1(v7, v8);
  if (a1 == -1)
  {
    __break(1u);
  }
  else
  {
    v6 = (*(uint64_t (**)(Swift::UInt64, uint64_t, uint64_t))(v4 + 16))((a1 + 1) >> 1, v3, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    return v6;
  }
  return result;
}

Swift::UInt64 __swiftcall CapacityAwareLevelStrategy.bloomFilterSizeForNumTerms(_:)(Swift::UInt64 a1)
{
  uint64_t v1;
  Swift::UInt64 v2;
  uint64_t v3;
  uint64_t v4;
  Swift::UInt64 result;
  Swift::UInt64 v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v2 = CapacityAwareLevelStrategy.levelForTerms(_:)(a1);
  swift_beginAccess();
  sub_244B2D524(v1 + 16, (uint64_t)v7);
  v3 = v8;
  v4 = v9;
  result = (Swift::UInt64)__swift_project_boxed_opaque_existential_1(v7, v8);
  if (v2 == -1)
  {
    __break(1u);
  }
  else
  {
    v6 = (*(uint64_t (**)(Swift::UInt64, uint64_t, uint64_t))(v4 + 16))((v2 + 1) >> 1, v3, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    return v6;
  }
  return result;
}

Swift::String __swiftcall CapacityAwareLevelStrategy.idForLevelStrategy()()
{
  void *v0;
  uint64_t v1;
  Swift::String result;

  v0 = (void *)0x8000000244B479E0;
  v1 = 0xD000000000000011;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

Swift::UInt64 __swiftcall CapacityAwareLevelStrategy.getLevel0BloomFilterSizeBits()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

Swift::Void __swiftcall CapacityAwareLevelStrategy.setLevel0BloomFilterSizeBits(level0BloomFilterSizeBits:)(Swift::UInt64 level0BloomFilterSizeBits)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6[2];
  __int128 v7;
  uint64_t v8;
  _UNKNOWN **v9;

  *(_QWORD *)(v1 + 64) = level0BloomFilterSizeBits;
  v3 = *(_QWORD *)(v1 + 56);
  v4 = type metadata accessor for LogLevelStrategy();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v3;
  *(_QWORD *)(v5 + 24) = level0BloomFilterSizeBits;
  v8 = v4;
  v9 = &protocol witness table for LogLevelStrategy;
  *(_QWORD *)&v7 = v5;
  sub_244B2D5C8(&v7, (uint64_t)v6);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v1 + 16);
  sub_244B2D5C8(v6, v1 + 16);
  swift_endAccess();
}

Swift::UInt64 __swiftcall CapacityAwareLevelStrategy.getLevel0MaxTerms()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

Swift::Void __swiftcall CapacityAwareLevelStrategy.setLevel0MaxTerms(level0MaxTerms:)(Swift::UInt64 level0MaxTerms)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6[2];
  __int128 v7;
  uint64_t v8;
  _UNKNOWN **v9;

  *(_QWORD *)(v1 + 56) = level0MaxTerms;
  v3 = *(_QWORD *)(v1 + 64);
  v4 = type metadata accessor for LogLevelStrategy();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = level0MaxTerms;
  *(_QWORD *)(v5 + 24) = v3;
  v8 = v4;
  v9 = &protocol witness table for LogLevelStrategy;
  *(_QWORD *)&v7 = v5;
  sub_244B2D5C8(&v7, (uint64_t)v6);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v1 + 16);
  sub_244B2D5C8(v6, v1 + 16);
  swift_endAccess();
}

Swift::UInt64 __swiftcall CapacityAwareLevelStrategy.getLevelCapacity()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

Swift::Void __swiftcall CapacityAwareLevelStrategy.setLevelCapacity(levelCapacity:)(Swift::UInt64 levelCapacity)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = levelCapacity;
}

uint64_t CapacityAwareLevelStrategy.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return v0;
}

uint64_t CapacityAwareLevelStrategy.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocClassInstance();
}

Swift::UInt64 sub_244B2D390(Swift::UInt64 a1)
{
  return CapacityAwareLevelStrategy.levelForTerms(_:)(a1);
}

_QWORD *sub_244B2D3B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_244B2D524(v3, (uint64_t)v8);
  v4 = v9;
  v5 = v10;
  result = __swift_project_boxed_opaque_existential_1(v8, v9);
  if (a1 == -1)
  {
    __break(1u);
  }
  else
  {
    v7 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v5 + 16))((unint64_t)(a1 + 1) >> 1, v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    return (_QWORD *)v7;
  }
  return result;
}

_QWORD *sub_244B2D448(Swift::UInt64 a1)
{
  uint64_t *v1;
  uint64_t v2;
  Swift::UInt64 v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v2 = *v1;
  v3 = CapacityAwareLevelStrategy.levelForTerms(_:)(a1);
  swift_beginAccess();
  sub_244B2D524(v2 + 16, (uint64_t)v8);
  v4 = v9;
  v5 = v10;
  result = __swift_project_boxed_opaque_existential_1(v8, v9);
  if (v3 == -1)
  {
    __break(1u);
  }
  else
  {
    v7 = (*(uint64_t (**)(Swift::UInt64, uint64_t, uint64_t))(v5 + 16))((v3 + 1) >> 1, v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    return (_QWORD *)v7;
  }
  return result;
}

unint64_t sub_244B2D4E4()
{
  return 0xD000000000000011;
}

uint64_t sub_244B2D500()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 64);
}

uint64_t sub_244B2D50C()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 56);
}

uint64_t sub_244B2D518()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 72);
}

uint64_t sub_244B2D524(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_244B2D5AC()
{
  uint64_t v0;

  return sub_244B37528(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 32));
}

uint64_t sub_244B2D5C8(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for CapacityAwareLevelStrategy()
{
  return objc_opt_self();
}

uint64_t CaseInsensitiveIndexer.__allocating_init(_:)(__int128 *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  sub_244B2D5C8(a1, v2 + 16);
  return v2;
}

uint64_t CaseInsensitiveIndexer.init(_:)(__int128 *a1)
{
  uint64_t v1;

  sub_244B2D5C8(a1, v1 + 16);
  return v1;
}

uint64_t CaseInsensitiveIndexer.index(key:tokens:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[12] = a6;
  v7[13] = v6;
  v7[10] = a4;
  v7[11] = a5;
  v7[8] = a2;
  v7[9] = a3;
  v7[7] = a1;
  return swift_task_switch();
}

uint64_t sub_244B2D680()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t (*v17)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v18;

  v1 = v0[11];
  sub_244B2D524(v0[13] + 16, (uint64_t)(v0 + 2));
  v2 = v0[5];
  v3 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v2);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v18 = MEMORY[0x24BEE4AF8];
    v6 = v0[11];
    sub_244B2DAC8(0, v4, 0);
    v5 = v18;
    v7 = v6 + 40;
    do
    {
      v8 = sub_244B45184();
      v10 = v9;
      v12 = *(_QWORD *)(v18 + 16);
      v11 = *(_QWORD *)(v18 + 24);
      if (v12 >= v11 >> 1)
        sub_244B2DAC8(v11 > 1, v12 + 1, 1);
      *(_QWORD *)(v18 + 16) = v12 + 1;
      v13 = v18 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v8;
      *(_QWORD *)(v13 + 40) = v10;
      v7 += 16;
      --v4;
    }
    while (v4);
  }
  v0[14] = v5;
  v14 = *(_QWORD *)(v3 + 16);
  v17 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(**(int **)(v14 + 8)
                                                                                                  + *(_QWORD *)(v14 + 8));
  v15 = (_QWORD *)swift_task_alloc();
  v0[15] = v15;
  *v15 = v0;
  v15[1] = sub_244B2D7E0;
  return v17(v0[7], v0[8], v0[9], v0[10], v5, v0[12], v2, v14);
}

uint64_t sub_244B2D7E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_244B2D84C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B2D880()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t CaseInsensitiveIndexer.search(token:context:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  v2 = sub_244B45184();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 + 8) + 8))(v2);
  return swift_bridgeObjectRelease();
}

uint64_t CaseInsensitiveIndexer.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t CaseInsensitiveIndexer.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_244B2D994()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v0 + 16), *(_QWORD *)(*(_QWORD *)v0 + 40));
  v2 = sub_244B45184();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 + 8) + 8))(v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_244B2DA2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v14;
  _QWORD *v15;

  v14 = *v6;
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_244B21254;
  v15[12] = a6;
  v15[13] = v14;
  v15[10] = a4;
  v15[11] = a5;
  v15[8] = a2;
  v15[9] = a3;
  v15[7] = a1;
  return swift_task_switch();
}

uint64_t sub_244B2DAC8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244B2DB3C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t type metadata accessor for CaseInsensitiveIndexer()
{
  return objc_opt_self();
}

uint64_t sub_244B2DB04(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244B2DCA4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244B2DB20(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244B2DDF0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244B2DB3C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD20);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244B454D8();
  __break(1u);
  return result;
}

uint64_t sub_244B2DCA4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC5A8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_244B454D8();
  __break(1u);
  return result;
}

uint64_t sub_244B2DDF0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC5B0);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244B454D8();
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall Double.toMillis()()
{
  double v0;
  double v1;
  Swift::Int64 result;

  v1 = v0 * 1000.0;
  if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 9.22337204e18)
    return (uint64_t)v1;
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_244B2DFA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int8x8_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  int8x8_t v8;
  int8x8_t *v9;
  uint64_t v10;
  int8x8_t v11;
  uint64_t v12;
  char v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  v0 = sub_244B3CBFC();
  v1 = sub_244B45274();
  v2 = v1;
  *(_QWORD *)(v1 + 16) = 8;
  *(_QWORD *)(v1 + 32) = 0;
  v3 = (int8x8_t *)(v1 + 32);
  v4 = *(_QWORD *)(v0 + 16);
  if (v4)
  {
    v5 = v0 + 32;
    if (v4 == 8 && (v5 >= v1 + 40 || (unint64_t)v3 >= v0 + 40))
    {
      v7 = 8;
      v8 = *v3;
      v9 = (int8x8_t *)(v0 + 32);
      v10 = -8;
      do
      {
        v11 = *v9++;
        v8 = veor_s8(v8, v11);
        v10 += 8;
      }
      while (v10);
      *v3 = v8;
      goto LABEL_13;
    }
    v7 = 0;
    do
    {
      v12 = v7 & 7;
      v13 = *(_BYTE *)(v5 + v7++);
      v3->i8[v12] ^= v13;
LABEL_13:
      ;
    }
    while (v4 != v7);
  }
  result = swift_bridgeObjectRelease();
  if (*(_QWORD *)(v2 + 16))
  {
    *(_BYTE *)(v2 + 32) &= 0x3Fu;
    swift_bridgeObjectRetain();
    Array<A>.parseUInt64BigEndian()();
    v16 = v15;
    swift_bridgeObjectRelease_n();
    return v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomHasher()
{
  return &type metadata for CustomHasher;
}

uint64_t Data.toUInt8Array()(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_244B2E2B4(a1, a2);
  sub_244B2E14C(a1, a2);
  v5 = v4;
  sub_244B2E2F8(a1, a2);
  return v5;
}

void sub_244B2E14C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = sub_244B44EC0();
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

_QWORD *sub_244B2E1C8()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;

  if (BYTE6(v0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD28);
    v4 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v4);
    v4[2] = BYTE6(v0);
    v4[3] = 2 * v6 - 64;
    sub_244B2E2B4(v2, v0);
    v7 = sub_244B44EA8();
    sub_244B2E2F8(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v7 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x244B2E29CLL);
    }
  }
  return v4;
}

uint64_t sub_244B2E2B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_244B2E2F8(uint64_t a1, unint64_t a2)
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

void *DocumentConstants.kDocSizeSplitThreshold.unsafeMutableAddressor()
{
  return &static DocumentConstants.kDocSizeSplitThreshold;
}

uint64_t static DocumentConstants.kDocSizeSplitThreshold.getter()
{
  return 5632;
}

ValueMetadata *type metadata accessor for DocumentConstants()
{
  return &type metadata for DocumentConstants;
}

uint64_t sub_244B2E360()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = type metadata accessor for Logger();
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (uint64_t *)((char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_allocate_value_buffer(v1, qword_2573DC5B8);
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_2573DC5B8);
  *v3 = 0xD000000000000016;
  v3[1] = 0x8000000244B47B20;
  sub_244B450B8();
  return sub_244B2ECE4((uint64_t)v3, v4);
}

Swift::String __swiftcall DocumentKey.toString()()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  Swift::String result;
  uint64_t v5;
  void *v6;

  v5 = v0;
  v6 = v1;
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  v2 = v5;
  v3 = v6;
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _s22PrivateSearchProtocols11DocumentKeyV0aB4CoreE16debugDescriptionSSvg_0()
{
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRelease();
}

uint64_t static DocumentKey.from(str:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  unint64_t v19;

  v4 = type metadata accessor for Logger();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1;
  v19 = a2;
  v17[0] = 2960685;
  v17[1] = 0xE300000000000000;
  sub_244B2E730();
  v7 = (_QWORD *)sub_244B45400();
  v8 = v7;
  if (v7[2] != 2)
  {
    swift_bridgeObjectRelease();
    if (qword_2573DBB70 == -1)
    {
LABEL_5:
      v15 = __swift_project_value_buffer(v4, (uint64_t)qword_2573DC5B8);
      sub_244B2E774(v15, (uint64_t)v6);
      v18 = 0;
      v19 = 0xE000000000000000;
      sub_244B45430();
      swift_bridgeObjectRelease();
      v18 = 0xD000000000000025;
      v19 = 0x8000000244B47AF0;
      sub_244B451E4();
      sub_244B451E4();
      sub_244B390F4(3, v18);
      swift_bridgeObjectRelease();
      sub_244B2EB40((uint64_t)v6);
      return 0;
    }
LABEL_8:
    swift_once();
    goto LABEL_5;
  }
  v10 = v7[4];
  v9 = v7[5];
  v18 = v10;
  v19 = v9;
  swift_bridgeObjectRetain();
  v11 = sub_244B45244();
  if (v8[2] < 2uLL)
  {
    __break(1u);
    goto LABEL_8;
  }
  v12 = v11;
  v14 = v8[6];
  v13 = v8[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = v14;
  v19 = v13;
  sub_244B45244();
  return v12;
}

unint64_t sub_244B2E730()
{
  unint64_t result;

  result = qword_2573DC5D0;
  if (!qword_2573DC5D0)
  {
    result = MEMORY[0x24951FF40](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2573DC5D0);
  }
  return result;
}

uint64_t sub_244B2E774(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t DocumentKey.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  sub_244B451B4();
  return swift_bridgeObjectRelease();
}

uint64_t DocumentKey.hashValue.getter()
{
  sub_244B45580();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  sub_244B451B4();
  swift_bridgeObjectRelease();
  return sub_244B45598();
}

uint64_t sub_244B2E8EC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_244B2E95C()
{
  sub_244B45580();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  sub_244B451B4();
  swift_bridgeObjectRelease();
  return sub_244B45598();
}

uint64_t sub_244B2EA00()
{
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  sub_244B451B4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244B2EA84()
{
  sub_244B45580();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  sub_244B451B4();
  swift_bridgeObjectRelease();
  return sub_244B45598();
}

uint64_t sub_244B2EB24(uint64_t *a1, uint64_t *a2)
{
  return _s22PrivateSearchProtocols11DocumentKeyV0aB4CoreE2eeoiySbAC_ACtFZ_0(*a1, a1[1], a1[2], a1[3], *a2, a2[1]);
}

uint64_t sub_244B2EB40(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s22PrivateSearchProtocols11DocumentKeyV0aB4CoreE2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v8;

  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  if (a1 == a5 && a2 == a6)
    v8 = 1;
  else
    v8 = sub_244B45508();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_244B2ECA0()
{
  unint64_t result;

  result = qword_2573DC5D8;
  if (!qword_2573DC5D8)
  {
    result = MEMORY[0x24951FF40](&protocol conformance descriptor for DocumentKey, MEMORY[0x24BE78FB8]);
    atomic_store(result, (unint64_t *)&qword_2573DC5D8);
  }
  return result;
}

uint64_t sub_244B2ECE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_244B2ED28()
{
  static DocumentProcessor.kDummyTokenHash = (uint64_t)&unk_2515B2320;
}

uint64_t *DocumentProcessor.kDummyTokenHash.unsafeMutableAddressor()
{
  if (qword_2573DBB78 != -1)
    swift_once();
  return &static DocumentProcessor.kDummyTokenHash;
}

uint64_t static DocumentProcessor.kDummyTokenHash.getter()
{
  if (qword_2573DBB78 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

_QWORD *static DocumentProcessor.deduplicateTokens(tokens:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_244B2EE04(v0);
  swift_bridgeObjectRelease();
  v2 = sub_244B1FA88(v1);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_244B2EE04(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_244B45364();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_244B30F28(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DocumentProcessor()
{
  return &type metadata for DocumentProcessor;
}

uint64_t EncryptedDocumentIndexer.__allocating_init(documentIndexWriter:levelStrategy:secret:)(__int128 *a1, __int128 *a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  sub_244B2D5C8(a1, v6 + 16);
  sub_244B2D5C8(a2, v6 + 56);
  *(_QWORD *)(v6 + 96) = a3;
  return v6;
}

uint64_t EncryptedDocumentIndexer.init(documentIndexWriter:levelStrategy:secret:)(__int128 *a1, __int128 *a2, uint64_t a3)
{
  uint64_t v3;

  sub_244B2D5C8(a1, v3 + 16);
  sub_244B2D5C8(a2, v3 + 56);
  *(_QWORD *)(v3 + 96) = a3;
  return v3;
}

uint64_t EncryptedDocumentIndexer.index(key:tokens:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[12] = a6;
  v7[13] = v6;
  v7[10] = a4;
  v7[11] = a5;
  v7[8] = a2;
  v7[9] = a3;
  v7[7] = a1;
  return swift_task_switch();
}

uint64_t sub_244B2EF70()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  int8x16_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int8x16_t *v22;
  char *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;

  v1 = (_QWORD *)v0[13];
  v2 = swift_bridgeObjectRetain();
  v3 = sub_244B2EE04(v2);
  swift_bridgeObjectRelease();
  v4 = sub_244B1FA88(v3);
  swift_bridgeObjectRelease();
  v5 = v1 + 7;
  v6 = v1[10];
  v7 = v1[11];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v7 + 24))(v4[2], v6, v7);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (__OFADD__(result, 8))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v9 = v0[13];
  v10 = (int8x16_t *)sub_244B1EFFC(0, (unint64_t)(result + 7) >> 3);
  v11 = *(_QWORD *)(v9 + 96);
  swift_bridgeObjectRetain();
  sub_244B2C52C(16, v11);
  swift_bridgeObjectRelease();
  v12 = v4[2];
  if (v12)
  {
    swift_bridgeObjectRetain();
    v13 = v4 + 5;
    do
    {
      swift_bridgeObjectRetain();
      sub_244B2C254();
      swift_bridgeObjectRelease();
      v13 += 2;
      --v12;
    }
    while (v12);
    swift_release_n();
  }
  else
  {
    swift_release();
  }
  result = sub_244B2D524((uint64_t)v5, (uint64_t)(v0 + 2));
  v14 = v10[1].u64[0];
  if (v14 >> 60)
    goto LABEL_13;
  v15 = (_QWORD *)v0[13];
  v17 = v0[9];
  v16 = v0[10];
  v18 = 8 * v14;
  v20 = v0[7];
  v19 = v0[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21 = _s17PrivateSearchCore26MaskedBloomFilterAlgorithmV6secret11documentKey13levelStrategy05bloomF7NumBitsAcA16HashedUserSecretV_0aB9Protocols08DocumentJ0VAA05LevelL0_pSitcfC_0(v11, v20, v19, v17, v16, v0 + 2);
  swift_bridgeObjectRetain();
  v22 = (int8x16_t *)sub_244B3A58C(v18, v21);
  v23 = BitArray.xor(_:)(v10, v22);
  v0[14] = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v24 = v15 + 2;
  v26 = v15[5];
  v25 = v15[6];
  result = (uint64_t)__swift_project_boxed_opaque_existential_1(v24, v26);
  if (!(*((_QWORD *)v23 + 2) >> 60))
  {
    v28 = **(int **)(v25 + 8) + *(_QWORD *)(v25 + 8);
    v27 = (_QWORD *)swift_task_alloc();
    v0[15] = v27;
    *v27 = v0;
    v27[1] = sub_244B2F200;
    __asm { BR              X8 }
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_244B2F200()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 128) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_244B2F274()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t EncryptedDocumentIndexer.createBloomFilter(tokens:size:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (__OFADD__(a2, 8))
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v3 = result;
  sub_244B1EFFC(0, (unint64_t)(a2 + 7) >> 3);
  v4 = *(_QWORD *)(v2 + 96);
  swift_bridgeObjectRetain();
  v5 = sub_244B2C52C(16, v4);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v3 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    v7 = v3 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_244B2C254();
      swift_bridgeObjectRelease();
      v7 += 16;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t EncryptedDocumentIndexer.mask(bloomFilter:documentKey:)(uint64_t a1, int8x16_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int8x16_t *v17;
  char *v18;
  _QWORD v19[5];

  v12 = *(_QWORD *)(v6 + 96);
  result = sub_244B2D524(v6 + 56, (uint64_t)v19);
  v14 = a2[1].u64[0];
  if (v14 >> 60)
  {
    __break(1u);
  }
  else
  {
    v15 = 8 * v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16 = _s17PrivateSearchCore26MaskedBloomFilterAlgorithmV6secret11documentKey13levelStrategy05bloomF7NumBitsAcA16HashedUserSecretV_0aB9Protocols08DocumentJ0VAA05LevelL0_pSitcfC_0(v12, a3, a4, a5, a6, v19);
    swift_bridgeObjectRetain();
    v17 = (int8x16_t *)sub_244B3A58C(v15, v16);
    v18 = BitArray.xor(_:)(a2, v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v18;
  }
  return result;
}

uint64_t EncryptedDocumentIndexer.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t EncryptedDocumentIndexer.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_244B2F4D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v14;
  _QWORD *v15;

  v14 = *v6;
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_244B21254;
  v15[12] = a6;
  v15[13] = v14;
  v15[10] = a4;
  v15[11] = a5;
  v15[8] = a2;
  v15[9] = a3;
  v15[7] = a1;
  return swift_task_switch();
}

uint64_t type metadata accessor for EncryptedDocumentIndexer()
{
  return objc_opt_self();
}

uint64_t EncryptedDocumentIndexerSearcher.__allocating_init(reader:writer:levelStrategy:secret:)(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  EncryptedDocumentIndexerSearcher.init(reader:writer:levelStrategy:secret:)(a1, a2, a3, a4);
  return v8;
}

uint64_t EncryptedDocumentIndexerSearcher.init(reader:writer:levelStrategy:secret:)(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  __int128 v12[2];

  sub_244B2D524((uint64_t)a3, (uint64_t)v12);
  type metadata accessor for EncryptedDocumentSearcher();
  v9 = swift_allocObject();
  sub_244B2D5C8(v12, v9 + 16);
  *(_QWORD *)(v9 + 96) = a4;
  sub_244B2D5C8(a1, v9 + 56);
  *(_QWORD *)(v4 + 24) = v9;
  type metadata accessor for EncryptedDocumentIndexer();
  v10 = swift_allocObject();
  sub_244B2D5C8(a2, v10 + 16);
  sub_244B2D5C8(a3, v10 + 56);
  *(_QWORD *)(v10 + 96) = a4;
  *(_QWORD *)(v4 + 16) = v10;
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t EncryptedDocumentIndexerSearcher.index(key:tokens:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  return swift_task_switch();
}

uint64_t sub_244B2F6E0()
{
  uint64_t *v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  v0[9] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_244B2F740;
  return EncryptedDocumentIndexer.index(key:tokens:context:)(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7]);
}

uint64_t sub_244B2F740()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t EncryptedDocumentIndexerSearcher.search(token:context:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return EncryptedDocumentSearcher.search(token:context:)(a1, a2, a3, a4);
}

uint64_t EncryptedDocumentIndexerSearcher.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t EncryptedDocumentIndexerSearcher.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_244B2F7F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return EncryptedDocumentSearcher.search(token:context:)(a1, a2, a3, a4);
}

uint64_t sub_244B2F81C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;

  v7[6] = a5;
  v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  v7[2] = a1;
  v7[3] = a2;
  v7[8] = *v6;
  return swift_task_switch();
}

uint64_t type metadata accessor for EncryptedDocumentIndexerSearcher()
{
  return objc_opt_self();
}

uint64_t EncryptedDocumentSearcher.__allocating_init(searchIndexReader:levelStrategy:secret:)(__int128 *a1, __int128 *a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  sub_244B2D5C8(a2, v6 + 16);
  *(_QWORD *)(v6 + 96) = a3;
  sub_244B2D5C8(a1, v6 + 56);
  return v6;
}

uint64_t EncryptedDocumentSearcher.init(searchIndexReader:levelStrategy:secret:)(__int128 *a1, __int128 *a2, uint64_t a3)
{
  uint64_t v3;

  sub_244B2D5C8(a2, v3 + 16);
  *(_QWORD *)(v3 + 96) = a3;
  sub_244B2D5C8(a1, v3 + 56);
  return v3;
}

uint64_t EncryptedDocumentSearcher.search(token:context:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = v4;
  v26 = a4;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC780);
  v10 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788);
  v24 = *(_QWORD *)(v13 - 8);
  v25 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_244B2C52C(16, v6[12]);
  v17 = _s17PrivateSearchCore11BloomFilterV4hash5tokenSays6UInt64VGSS_tF_0(a1, a2, v16);
  swift_bridgeObjectRelease();
  v18 = v6[10];
  v19 = v6[11];
  __swift_project_boxed_opaque_existential_1(v6 + 7, v18);
  v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 8))(v17, a3, v18, v19);
  if (v5)
    return swift_bridgeObjectRelease();
  MEMORY[0x24BDAC7A8](v20);
  *(&v22 - 4) = (uint64_t)v15;
  *(&v22 - 3) = (uint64_t)v6;
  *(&v22 - 2) = v17;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BEE6CA0], v23);
  sub_244B45340();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v15, v25);
}

uint64_t EncryptedDocumentSearcher.processResults(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC780);
  MEMORY[0x24BDAC7A8](v5);
  v10 = a1;
  v11 = v2;
  v12 = a2;
  (*(void (**)(_BYTE *, _QWORD))(v7 + 104))(&v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], *MEMORY[0x24BEE6CA0]);
  return sub_244B45340();
}

uint64_t sub_244B2FB9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v26 = a3;
  v27 = a4;
  v25 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868);
  v6 = *(_QWORD *)(v5 - 8);
  v23 = v5;
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v24 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788);
  v9 = *(_QWORD *)(v8 - 8);
  v22 = v8;
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD40);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_244B452BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v25, v5);
  v16 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = (v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF8;
  v19 = (*(unsigned __int8 *)(v6 + 80) + v18 + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = 0;
  *(_QWORD *)(v20 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v20 + v16, v11, v22);
  *(_QWORD *)(v20 + v17) = v26;
  *(_QWORD *)(v20 + v18) = v27;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v20 + v19, v24, v23);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_244B30794((uint64_t)v14, (uint64_t)&unk_2573DC878, v20);
  return swift_release();
}

uint64_t sub_244B2FD9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7[38] = a6;
  v7[39] = a7;
  v7[36] = a4;
  v7[37] = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC880);
  v7[40] = v8;
  v7[41] = *(_QWORD *)(v8 - 8);
  v7[42] = swift_task_alloc();
  v7[43] = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC888);
  v7[44] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788);
  v7[45] = v9;
  v7[46] = *(_QWORD *)(v9 - 8);
  v7[47] = swift_task_alloc();
  v7[48] = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC890);
  v7[49] = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC898);
  v7[50] = v10;
  v7[51] = *(_QWORD *)(v10 - 8);
  v7[52] = swift_task_alloc();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC8A0);
  v7[53] = v11;
  v7[54] = *(_QWORD *)(v11 - 8);
  v7[55] = swift_task_alloc();
  v7[56] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B2FEE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = v0[52];
  v8 = v0[51];
  v2 = v0[50];
  v4 = v0[37];
  v3 = v0[38];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[46] + 16))(v0[47], v0[36], v0[45]);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  sub_244B32E70(&qword_2573DC8B8, &qword_2573DC788, MEMORY[0x24BEE6D38]);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_244B454E4();
  sub_244B32E70(&qword_2573DC8C8, &qword_2573DC890, MEMORY[0x24BEE6F58]);
  sub_244B4549C();
  sub_244B45460();
  sub_244B452C8();
  sub_244B45478();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v2);
  sub_244B45484();
  v0[35] = MEMORY[0x24BEE4B08];
  v0[57] = sub_244B4546C();
  sub_244B32E70(&qword_2573DC8D0, &qword_2573DC888, MEMORY[0x24BEE6F40]);
  v6 = (_QWORD *)swift_task_alloc();
  v0[58] = v6;
  *v6 = v0;
  v6[1] = sub_244B30114;
  return sub_244B452A4();
}

uint64_t sub_244B30114()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 472) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(uint64_t, _QWORD))(v2 + 456))(v2 + 144, 0);
  return swift_task_switch();
}

uint64_t sub_244B30188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 72);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 440);
    v2 = *(_QWORD *)(v0 + 448);
    v4 = *(_QWORD *)(v0 + 424);
    v5 = *(_QWORD *)(v0 + 432);
    v6 = *(_QWORD *)(v0 + 104);
    v7 = *(_QWORD *)(v0 + 80);
    *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 64);
    *(_QWORD *)(v0 + 24) = v1;
    *(_QWORD *)(v0 + 32) = v7;
    *(_OWORD *)(v0 + 40) = *(_OWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 56) = v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v2, v4);
    v8 = (int *)sub_244B45478();
    *(_QWORD *)(v0 + 480) = v9;
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    v15 = (uint64_t (*)(uint64_t, uint64_t))((char *)v8 + *v8);
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 488) = v10;
    *v10 = v0;
    v10[1] = sub_244B304E4;
    return v15(v0 + 208, v0 + 16);
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 448);
    v13 = *(_QWORD *)(v0 + 424);
    v14 = *(_QWORD *)(v0 + 432);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 256) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868);
    sub_244B452F8();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_244B30330()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 472);
  v2 = *(_QWORD *)(v0 + 448);
  v3 = *(_QWORD *)(v0 + 432);
  v4 = *(_QWORD *)(v0 + 424);
  (*(void (**)(uint64_t, uint64_t))(v0 + 456))(v0 + 144, 1);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 272) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868);
  sub_244B452F8();
  sub_244B45430();
  *(_QWORD *)(v0 + 240) = 0;
  *(_QWORD *)(v0 + 248) = 0xE000000000000000;
  sub_244B451E4();
  *(_QWORD *)(v0 + 264) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD38);
  sub_244B45454();
  sub_244B451E4();
  v5 = *(_QWORD *)(v0 + 240);
  v6 = *(_QWORD *)(v0 + 248);
  sub_244B32EB0();
  swift_allocError();
  *(_QWORD *)v7 = v5;
  *(_QWORD *)(v7 + 8) = v6;
  *(_BYTE *)(v7 + 16) = 3;
  swift_willThrow();
  MEMORY[0x24951FEEC](v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B304E4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc();
  swift_release();
  *(_QWORD *)(v1 + 496) = *(_QWORD *)(v1 + 208);
  *(_OWORD *)(v1 + 504) = *(_OWORD *)(v1 + 216);
  *(_QWORD *)(v1 + 520) = *(_QWORD *)(v1 + 232);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_244B30570()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;

  v1 = v0[65];
  v3 = v0[63];
  v2 = v0[64];
  v4 = v0[62];
  v5 = v0[41];
  v6 = v0[42];
  v9 = v0[40];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_244B310D4(v0 + 22, v4, v3, v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0[14] = v4;
  v0[15] = v3;
  v0[16] = v2;
  v0[17] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868);
  sub_244B452EC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v9);
  v0[57] = sub_244B4546C();
  sub_244B32E70(&qword_2573DC8D0, &qword_2573DC888, MEMORY[0x24BEE6F40]);
  v7 = (_QWORD *)swift_task_alloc();
  v0[58] = v7;
  *v7 = v0;
  v7[1] = sub_244B30114;
  return sub_244B452A4();
}

uint64_t sub_244B306C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_244B306E0()
{
  uint64_t v0;
  char v1;

  v1 = sub_244B308C0(*(uint64_t **)(v0 + 16), *(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v1 & 1);
}

uint64_t sub_244B30718(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a2;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  *(_OWORD *)(v2 + 32) = *(_OWORD *)(a2 + 1);
  *(_QWORD *)(v2 + 48) = a2[3];
  return swift_task_switch();
}

uint64_t sub_244B30744()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v1 = v0[5];
  v2 = v0[6];
  v3 = v0[4];
  v4 = (_QWORD *)v0[2];
  *v4 = v0[3];
  v4[1] = v3;
  v4[2] = v1;
  v4[3] = v2;
  v6 = (uint64_t (*)(void))v0[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6();
}

uint64_t sub_244B30794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_244B452BC();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_244B452B0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_244B32D4C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_244B45298();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_244B308C0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  _QWORD v21[5];

  v5 = *a1;
  v6 = a1[1];
  v7 = a1[2];
  v8 = a1[3];
  sub_244B2D524(v2 + 16, (uint64_t)v21);
  v9 = a1[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = swift_bridgeObjectRetain();
  result = _s17PrivateSearchCore26MaskedBloomFilterAlgorithmV6secret11documentKey13levelStrategy05bloomF7NumBitsAcA16HashedUserSecretV_0aB9Protocols08DocumentJ0VAA05LevelL0_pSitcfC_0(v10, v5, v6, v7, v8, v21);
  v12 = result;
  v13 = *(_QWORD *)(a2 + 16);
  if (v13)
  {
    if (v9)
    {
      result = swift_bridgeObjectRetain();
      v14 = 0;
      v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
      while (1)
      {
        v16 = *(_QWORD *)(a2 + 8 * v14 + 32);
        if (v16 < 0)
          break;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_244B30E20(0, v15[2] + 1, 1, v15, &qword_2573DC858);
          v15 = (_QWORD *)result;
        }
        v18 = v15[2];
        v17 = v15[3];
        if (v18 >= v17 >> 1)
        {
          result = (uint64_t)sub_244B30E20((_QWORD *)(v17 > 1), v18 + 1, 1, v15, &qword_2573DC858);
          v15 = (_QWORD *)result;
        }
        ++v14;
        v15[2] = v18 + 1;
        v15[v18 + 4] = v16 % v9;
        if (v13 == v14)
        {
          swift_bridgeObjectRelease();
          goto LABEL_12;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_12:
    v19 = swift_bridgeObjectRetain();
    v20 = MaskedBloomFilterAlgorithm.match(maskedBitArray:selectedIndexes:)(v19, (uint64_t)v15, v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v20 & 1;
  }
  return result;
}

uint64_t EncryptedDocumentSearcher.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t EncryptedDocumentSearcher.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_244B30ACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return EncryptedDocumentSearcher.search(token:context:)(a1, a2, a3, a4);
}

char *sub_244B30AEC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD28);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_244B3279C(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_244B30BE4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC8F8);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_244B32974(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244B30CF0(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_244B30E20(a1, a2, a3, a4, &qword_2573DC8F0);
}

_QWORD *sub_244B30CFC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC860);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_244B32880(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244B30E20(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    v8 = a2;
    goto LABEL_8;
  }
  v7 = a4[3];
  v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2)
    goto LABEL_8;
  if (v8 + 0x4000000000000000 >= 0)
  {
    v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v8 = a2;
LABEL_8:
    v9 = a4[2];
    if (v8 <= v9)
      v10 = a4[2];
    else
      v10 = v8;
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v11 = (_QWORD *)swift_allocObject();
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 25;
      v11[2] = v9;
      v11[3] = 2 * (v13 >> 3);
      v14 = v11 + 4;
      if ((v6 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v14 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[v9 + 4])
          memmove(v14, a4 + 4, 8 * v9);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244B32A88(0, v9, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_244B30F28(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_244B45580();
  swift_bridgeObjectRetain();
  sub_244B451B4();
  v8 = sub_244B45598();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_244B45508() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_244B45508() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_244B31A0C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_244B310D4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  char v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v6;
  sub_244B45580();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  v26 = a4;
  sub_244B451E4();
  swift_bridgeObjectRelease();
  sub_244B451B4();
  swift_bridgeObjectRelease();
  v13 = sub_244B45598();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  v15 = v13 & ~v14;
  v24 = v6;
  if (((*(_QWORD *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
  {
    v25 = ~v14;
    while (1)
    {
      v16 = (uint64_t *)(*(_QWORD *)(v12 + 48) + 32 * v15);
      v27 = *v16;
      v29 = v16[1];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRelease();
      if (v27 == a2 && v29 == a3)
        break;
      v17 = sub_244B45508();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v17 & 1) != 0)
        goto LABEL_9;
      v15 = (v15 + 1) & v25;
      if (((*(_QWORD *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
        goto LABEL_7;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_9:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v20 = (uint64_t *)(*(_QWORD *)(*v24 + 48) + 32 * v15);
    v21 = v20[1];
    v22 = v20[2];
    v23 = v20[3];
    *a1 = *v20;
    a1[1] = v21;
    a1[2] = v22;
    a1[3] = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_7:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v24;
    *v24 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_244B31BA4(a2, a3, v26, a5, v15, isUniquelyReferenced_nonNull_native);
    *v24 = v28;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    result = 1;
    a1[2] = v26;
    a1[3] = a5;
  }
  return result;
}

uint64_t sub_244B313DC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC8E8);
  v3 = sub_244B45424();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_244B45580();
      sub_244B451B4();
      result = sub_244B45598();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_244B316B8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC8E0);
  v3 = sub_244B45424();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v33 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v32 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v14 = v13 | (v10 << 6);
      }
      else
      {
        v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v32)
          goto LABEL_33;
        v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          v10 = v15 + 1;
          if (v15 + 1 >= v32)
            goto LABEL_33;
          v16 = v33[v10];
          if (!v16)
          {
            v10 = v15 + 2;
            if (v15 + 2 >= v32)
              goto LABEL_33;
            v16 = v33[v10];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v31 = 1 << *(_BYTE *)(v2 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  v10 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v10 >= v32)
                    goto LABEL_33;
                  v16 = v33[v10];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v10 = v17;
            }
          }
        }
LABEL_23:
        v7 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      v18 = v2;
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 32 * v14);
      v20 = *v19;
      v21 = v19[1];
      v22 = v19[2];
      v23 = v19[3];
      sub_244B45580();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRelease();
      sub_244B451B4();
      swift_bridgeObjectRelease();
      result = sub_244B45598();
      v24 = -1 << *(_BYTE *)(v4 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v8 + 8 * v26);
        }
        while (v30 == -1);
        v11 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 32 * v11);
      *v12 = v20;
      v12[1] = v21;
      v12[2] = v22;
      v12[3] = v23;
      ++*(_QWORD *)(v4 + 16);
      v2 = v18;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_244B31A0C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_244B313DC();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_244B31E64();
      goto LABEL_22;
    }
    sub_244B321D4();
  }
  v11 = *v4;
  sub_244B45580();
  sub_244B451B4();
  result = sub_244B45598();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_244B45508(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_244B45520();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_244B45508();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_244B31BA4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t *v6;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;

  v25 = result;
  v10 = *(_QWORD *)(*v6 + 16);
  v11 = *(_QWORD *)(*v6 + 24);
  if (v11 > v10 && (a6 & 1) != 0)
    goto LABEL_14;
  if ((a6 & 1) != 0)
  {
    sub_244B316B8();
  }
  else
  {
    if (v11 > v10)
    {
      result = (uint64_t)sub_244B32014();
      goto LABEL_14;
    }
    sub_244B32480();
  }
  v12 = *v6;
  sub_244B45580();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  sub_244B451B4();
  swift_bridgeObjectRelease();
  result = sub_244B45598();
  v13 = -1 << *(_BYTE *)(v12 + 32);
  a5 = result & ~v13;
  v24 = v12;
  v14 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a5 >> 3) & 0xFFFFFFFFFFFFF8)) >> a5) & 1) != 0)
  {
    v15 = ~v13;
    do
    {
      v16 = (uint64_t *)(*(_QWORD *)(v24 + 48) + 32 * a5);
      v27 = *v16;
      v28 = v16[1];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRelease();
      if (v27 == v25 && v28 == a2)
        goto LABEL_17;
      v17 = sub_244B45508();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v17 & 1) != 0)
        goto LABEL_18;
      a5 = (a5 + 1) & v15;
    }
    while (((*(_QWORD *)(v14 + ((a5 >> 3) & 0xFFFFFFFFFFFFF8)) >> a5) & 1) != 0);
  }
LABEL_14:
  v18 = *v23;
  *(_QWORD *)(*v23 + 8 * (a5 >> 6) + 56) |= 1 << a5;
  v19 = (uint64_t *)(*(_QWORD *)(v18 + 48) + 32 * a5);
  *v19 = v25;
  v19[1] = a2;
  v19[2] = a3;
  v19[3] = a4;
  v20 = *(_QWORD *)(v18 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (!v21)
  {
    *(_QWORD *)(v18 + 16) = v22;
    return result;
  }
  __break(1u);
LABEL_17:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
LABEL_18:
  result = sub_244B45520();
  __break(1u);
  return result;
}

void *sub_244B31E64()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC8E8);
  v2 = *v0;
  v3 = sub_244B45418();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_244B32014()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC8E0);
  v2 = *v0;
  v3 = sub_244B45418();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_28;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_28;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
      {
        v9 = v22 + 2;
        if (v22 + 2 >= v13)
          goto LABEL_28;
        v23 = *(_QWORD *)(v6 + 8 * v9);
        if (!v23)
          break;
      }
    }
LABEL_27:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 32 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = v17[2];
    v20 = v17[3];
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    v21[2] = v19;
    v21[3] = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 3;
  if (v24 >= v13)
    goto LABEL_28;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_244B321D4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC8E8);
  v3 = sub_244B45424();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_244B45580();
    swift_bridgeObjectRetain();
    sub_244B451B4();
    result = sub_244B45598();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_244B32480()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC8E0);
  v3 = sub_244B45424();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v30 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v31 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v31)
      goto LABEL_33;
    v16 = *(_QWORD *)(v30 + 8 * v15);
    ++v10;
    if (!v16)
    {
      v10 = v15 + 1;
      if (v15 + 1 >= v31)
        goto LABEL_33;
      v16 = *(_QWORD *)(v30 + 8 * v10);
      if (!v16)
      {
        v10 = v15 + 2;
        if (v15 + 2 >= v31)
          goto LABEL_33;
        v16 = *(_QWORD *)(v30 + 8 * v10);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v7 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 32 * v14);
    v20 = *v18;
    v19 = v18[1];
    v21 = v18[2];
    v22 = v18[3];
    sub_244B45580();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_244B451E4();
    swift_bridgeObjectRetain();
    sub_244B451E4();
    swift_bridgeObjectRelease();
    sub_244B451B4();
    swift_bridgeObjectRelease();
    result = sub_244B45598();
    v23 = -1 << *(_BYTE *)(v4 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v8 + 8 * (v24 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v8 + 8 * v25);
      }
      while (v29 == -1);
      v11 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 32 * v11);
    *v12 = v20;
    v12[1] = v19;
    v12[2] = v21;
    v12[3] = v22;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v31)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v30 + 8 * v17);
  if (v16)
  {
    v10 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v10 >= v31)
      goto LABEL_33;
    v16 = *(_QWORD *)(v30 + 8 * v10);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_244B3279C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_244B454D8();
  __break(1u);
  return result;
}

uint64_t sub_244B32880(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244B454D8();
  __break(1u);
  return result;
}

char *sub_244B32974(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_244B454D8();
  __break(1u);
  return result;
}

uint64_t sub_244B32A5C(uint64_t a1)
{
  uint64_t *v1;

  return sub_244B2FB9C(a1, v1[2], v1[3], v1[4]);
}

uint64_t type metadata accessor for EncryptedDocumentSearcher()
{
  return objc_opt_self();
}

char *sub_244B32A88(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_244B454D8();
  __break(1u);
  return result;
}

uint64_t sub_244B32B70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + v4 + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_244B32C64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868) - 8) + 80);
  v9 = v8 + v7 + 8;
  v10 = *(_QWORD *)(v1 + 16);
  v11 = *(_QWORD *)(v1 + 24);
  v12 = *(_QWORD *)(v1 + v6);
  v13 = v1 + v5;
  v14 = *(_QWORD *)(v1 + v7);
  v15 = v1 + (v9 & ~v8);
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v16;
  *v16 = v2;
  v16[1] = sub_244B21254;
  return sub_244B2FD9C(a1, v10, v11, v13, v12, v14, v15);
}

uint64_t sub_244B32D4C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244B32D8C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_244B32DB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_244B32E20;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_244B32E20(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_244B32E70(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24951FF40](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_244B32EB0()
{
  unint64_t result;

  result = qword_2573DC8D8;
  if (!qword_2573DC8D8)
  {
    result = MEMORY[0x24951FF40](&protocol conformance descriptor for ValidationError, &type metadata for ValidationError);
    atomic_store(result, (unint64_t *)&qword_2573DC8D8);
  }
  return result;
}

uint64_t HashedUserSecret.init(secret:)()
{
  uint64_t v0;
  uint64_t v1;

  v0 = String.toUtf8Bytes()();
  swift_bridgeObjectRelease();
  v1 = _s17PrivateSearchCore6Sha256V4hashySays5UInt8VGAGFZ_0(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t HashedUserSecret.init(secret:)(uint64_t a1)
{
  uint64_t v1;

  v1 = _s17PrivateSearchCore6Sha256V4hashySays5UInt8VGAGFZ_0(a1);
  swift_bridgeObjectRelease();
  return v1;
}

ValueMetadata *type metadata accessor for HashedUserSecret()
{
  return &type metadata for HashedUserSecret;
}

uint64_t sub_244B32F88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_244B451F0();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      v6 = sub_244B451F0();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = sub_244B45508();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v2 = sub_244B451F0();
      v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_244B451F0();
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_244B330EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  sub_244B34340();
  swift_bridgeObjectRetain();
  v7 = sub_244B45244();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_244B33480();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)sub_244B45448();
  }
LABEL_7:
  v13 = (unsigned __int16)sub_244B331D8(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13 & 0x1FF;
}

unsigned __int8 *sub_244B331D8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned __int8 v12;
  int v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned int v24;
  unsigned int v25;
  char v26;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v14 = a2 - 1;
      if (a2 != 1)
      {
        v15 = a3 + 87;
        if (a3 > 10)
        {
          v16 = a3 + 55;
        }
        else
        {
          v15 = 97;
          v16 = 65;
        }
        if (a3 <= 10)
          v17 = a3 + 48;
        else
          v17 = 58;
        if (result)
        {
          LOBYTE(v8) = 0;
          v18 = result + 1;
          do
          {
            v19 = *v18;
            if (v19 < 0x30 || v19 >= v17)
            {
              if (v19 < 0x41 || v19 >= v16)
              {
                v12 = 0;
                v13 = 1;
                if (v19 < 0x61 || v19 >= v15)
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                v20 = -87;
              }
              else
              {
                v20 = -55;
              }
            }
            else
            {
              v20 = -48;
            }
            if (((v8 * (unsigned __int16)a3) & 0xFF00) != 0)
              goto LABEL_72;
            v8 = (v8 * a3) + (v19 + v20);
            if (((v8 >> 8) & 1) != 0)
              goto LABEL_72;
            ++v18;
            --v14;
          }
          while (v14);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 8));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v21 = a3 + 87;
        if (a3 > 10)
        {
          v22 = a3 + 55;
        }
        else
        {
          v21 = 97;
          v22 = 65;
        }
        if (a3 <= 10)
          v23 = a3 + 48;
        else
          v23 = 58;
        if (result)
        {
          LOBYTE(v24) = 0;
          do
          {
            v25 = *result;
            if (v25 < 0x30 || v25 >= v23)
            {
              if (v25 < 0x41 || v25 >= v22)
              {
                v12 = 0;
                v13 = 1;
                if (v25 < 0x61 || v25 >= v21)
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                v26 = -87;
              }
              else
              {
                v26 = -55;
              }
            }
            else
            {
              v26 = -48;
            }
            if (((v24 * (unsigned __int16)a3) & 0xFF00) != 0)
              goto LABEL_72;
            v24 = (v24 * a3) + (v25 + v26);
            if (((v24 >> 8) & 1) != 0)
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v24;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          LOBYTE(v8) = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            if (((v8 * (unsigned __int16)a3) & 0xFF00) != 0)
              goto LABEL_72;
            v8 = (v8 * a3) - (v10 + v11);
            if ((v8 & 0xFFFFFF00) != 0)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 8));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_244B33480()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_244B45250();
  v4 = sub_244B334FC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_244B334FC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_244B33640(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_244B39F58(v9, 0);
      v12 = sub_244B3372C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x24951F8C8](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x24951F8C8);
LABEL_9:
      sub_244B45448();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24951F8C8]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_244B33640(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_244B39FBC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_244B39FBC(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_244B45220();
  }
  __break(1u);
  return result;
}

unint64_t sub_244B3372C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_244B39FBC(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_244B4522C();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_244B45448();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_244B39FBC(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_244B45208();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_244B3393C(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_244B451CC();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_244B45250();
  }
  __break(1u);
  return result;
}

uint64_t sub_244B339D8(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned int v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  unsigned __int8 v29;
  int v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 *v34;
  uint64_t v35;
  unsigned int v36;
  char v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned int v41;
  unsigned int v42;
  char v43;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_244B39FBC(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_104;
  result = sub_244B45220();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_244B39FBC(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_244B39FBC(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_100;
  if (v17 < a3 >> 16)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  result = sub_244B45220();
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_99;
  }
  if (v18 < v15)
  {
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v31 = a6 + 87;
        if (a6 > 10)
        {
          v32 = a6 + 55;
        }
        else
        {
          v31 = 97;
          v32 = 65;
        }
        if (a6 <= 10)
          v33 = a6 + 48;
        else
          v33 = 58;
        if (v19)
        {
          LOBYTE(v24) = 0;
          v34 = v19 + 1;
          v35 = result - 1;
          do
          {
            v36 = *v34;
            if (v36 < 0x30 || v36 >= v33)
            {
              if (v36 < 0x41 || v36 >= v32)
              {
                v29 = 0;
                v30 = 1;
                if (v36 < 0x61 || v36 >= v31)
                  return v29 | (v30 << 8);
                v37 = -87;
              }
              else
              {
                v37 = -55;
              }
            }
            else
            {
              v37 = -48;
            }
            if (((v24 * (unsigned __int16)a6) & 0xFF00) != 0)
              goto LABEL_96;
            v24 = (v24 * a6) + (v36 + v37);
            if (((v24 >> 8) & 1) != 0)
              goto LABEL_96;
            ++v34;
            --v35;
          }
          while (v35);
LABEL_72:
          v30 = 0;
          v29 = v24;
          return v29 | (v30 << 8);
        }
        goto LABEL_95;
      }
LABEL_96:
      v29 = 0;
      v30 = 1;
      return v29 | (v30 << 8);
    }
    goto LABEL_103;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v38 = a6 + 87;
      if (a6 > 10)
      {
        v39 = a6 + 55;
      }
      else
      {
        v38 = 97;
        v39 = 65;
      }
      if (a6 <= 10)
        v40 = a6 + 48;
      else
        v40 = 58;
      if (v19)
      {
        LOBYTE(v41) = 0;
        do
        {
          v42 = *v19;
          if (v42 < 0x30 || v42 >= v40)
          {
            if (v42 < 0x41 || v42 >= v39)
            {
              v29 = 0;
              v30 = 1;
              if (v42 < 0x61 || v42 >= v38)
                return v29 | (v30 << 8);
              v43 = -87;
            }
            else
            {
              v43 = -55;
            }
          }
          else
          {
            v43 = -48;
          }
          if (((v41 * (unsigned __int16)a6) & 0xFF00) != 0)
            goto LABEL_96;
          v41 = (v41 * a6) + (v42 + v43);
          if (((v41 >> 8) & 1) != 0)
            goto LABEL_96;
          ++v19;
          --result;
        }
        while (result);
        v30 = 0;
        v29 = v41;
        return v29 | (v30 << 8);
      }
      goto LABEL_95;
    }
    goto LABEL_96;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 87;
      if (a6 > 10)
      {
        v22 = a6 + 55;
      }
      else
      {
        v21 = 97;
        v22 = 65;
      }
      if (a6 <= 10)
        v23 = a6 + 48;
      else
        v23 = 58;
      if (v19)
      {
        LOBYTE(v24) = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              v30 = 1;
              if (v27 < 0x61 || v27 >= v21)
                return v29 | (v30 << 8);
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          if (((v24 * (unsigned __int16)a6) & 0xFF00) != 0)
            goto LABEL_96;
          v24 = (v24 * a6) - (v27 + v28);
          if ((v24 & 0xFFFFFF00) != 0)
            goto LABEL_96;
          ++v25;
          if (!--v26)
            goto LABEL_72;
        }
      }
LABEL_95:
      v29 = 0;
      v30 = 0;
      return v29 | (v30 << 8);
    }
    goto LABEL_96;
  }
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
  return result;
}

unint64_t _s17PrivateSearchCore8HexCodecV04fromD0ySays5UInt8VGSSFZ_0()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  char v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t result;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  unsigned int v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD v38[2];
  char v39;

  if ((sub_244B451C0() & 0x8000000000000001) == 1)
    return MEMORY[0x24BEE4AF8];
  v0 = sub_244B45184();
  v2 = v1;
  swift_bridgeObjectRetain();
  v3 = sub_244B32F88();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    v4 = sub_244B451C0();
    v5 = sub_244B3393C(v4, v0, v2);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    swift_bridgeObjectRelease();
    MEMORY[0x24951F8BC](v5, v7, v9, v11);
    swift_bridgeObjectRelease();
  }
  v12 = sub_244B451C0();
  v13 = v12;
  if (v12 >= 0)
    v14 = v12;
  else
    v14 = v12 + 1;
  v15 = v14 >> 1;
  if (v12 >= 2)
    v16 = v14 >> 1;
  else
    v16 = 0;
  result = (unint64_t)sub_244B30AEC(0, v16, 0, MEMORY[0x24BEE4AF8]);
  if (v13 >= -1)
  {
    v18 = result;
    if ((unint64_t)(v13 + 1) < 3)
    {
LABEL_34:
      swift_bridgeObjectRelease();
      return v18;
    }
    v19 = sub_244B451D8();
    v20 = sub_244B45250();
    v24 = v23;
    if ((v20 ^ v21) >= 0x4000)
    {
      v25 = v20;
      v26 = v21;
      v27 = v22;
      v28 = v15 - 1;
      if (v15 <= 1)
        v15 = 1;
      while (1)
      {
        if ((v24 & 0x1000000000000000) != 0)
        {
          LOWORD(v27) = sub_244B330EC(v25, v26, v27, v24, 16);
          result = swift_bridgeObjectRelease();
          if ((v27 & 0x100) != 0)
            goto LABEL_31;
        }
        else
        {
          if ((v24 & 0x2000000000000000) != 0)
          {
            v38[0] = v27;
            v38[1] = v24 & 0xFFFFFFFFFFFFFFLL;
            v29 = v38;
          }
          else if ((v27 & 0x1000000000000000) != 0)
          {
            v29 = (_QWORD *)((v24 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else
          {
            v29 = (_QWORD *)sub_244B45448();
          }
          v30 = sub_244B339D8((uint64_t)v29, v25, v26, v27, v24, 16);
          LOBYTE(v27) = v30;
          v39 = BYTE1(v30) & 1;
          v31 = (v30 >> 8) & 1;
          result = swift_bridgeObjectRelease();
          if ((v31 & 1) != 0)
          {
LABEL_31:
            swift_bridgeObjectRelease();
            goto LABEL_32;
          }
        }
        v33 = *(_QWORD *)(v18 + 16);
        v32 = *(_QWORD *)(v18 + 24);
        if (v33 >= v32 >> 1)
        {
          result = (unint64_t)sub_244B30AEC((char *)(v32 > 1), v33 + 1, 1, (char *)v18);
          v18 = result;
        }
        *(_QWORD *)(v18 + 16) = v33 + 1;
        *(_BYTE *)(v18 + v33 + 32) = v27;
        if (!v28)
          goto LABEL_34;
        if (!--v15)
          break;
        result = sub_244B451D8();
        if (result >> 14 < v19 >> 14)
          goto LABEL_38;
        v34 = result;
        --v28;
        v25 = sub_244B45250();
        v26 = v35;
        v27 = v36;
        v24 = v37;
        v19 = v34;
        if (!((v25 ^ v35) >> 14))
          goto LABEL_36;
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
LABEL_36:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_32:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t _s17PrivateSearchCore8HexCodecV02toD0ySSSays5UInt8VGFZ_0(uint64_t a1)
{
  int64_t v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_244B2DAC8(0, v1, 0);
    v3 = (char *)(a1 + 32);
    v4 = MEMORY[0x24BEE4260];
    v5 = MEMORY[0x24BEE42B0];
    do
    {
      v6 = *v3++;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC900);
      v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_244B46690;
      *(_QWORD *)(v7 + 56) = v4;
      *(_QWORD *)(v7 + 64) = v5;
      *(_BYTE *)(v7 + 32) = v6;
      v8 = sub_244B45154();
      v10 = v9;
      v12 = *(_QWORD *)(v16 + 16);
      v11 = *(_QWORD *)(v16 + 24);
      if (v12 >= v11 >> 1)
        sub_244B2DAC8(v11 > 1, v12 + 1, 1);
      *(_QWORD *)(v16 + 16) = v12 + 1;
      v13 = v16 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v8;
      *(_QWORD *)(v13 + 40) = v10;
      --v1;
    }
    while (v1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC908);
  sub_244B342F4();
  sub_244B45118();
  swift_bridgeObjectRelease();
  v14 = sub_244B45184();
  swift_bridgeObjectRelease();
  return v14;
}

ValueMetadata *type metadata accessor for HexCodec()
{
  return &type metadata for HexCodec;
}

unint64_t sub_244B342F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573DC910;
  if (!qword_2573DC910)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573DC908);
    result = MEMORY[0x24951FF40](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2573DC910);
  }
  return result;
}

unint64_t sub_244B34340()
{
  unint64_t result;

  result = qword_2573DC918;
  if (!qword_2573DC918)
  {
    result = MEMORY[0x24951FF40](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_2573DC918);
  }
  return result;
}

uint64_t InMemoryStore.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_244B453AC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_244B450F4();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_244B453A0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = swift_allocObject();
  sub_244B1FE10();
  sub_244B45394();
  sub_244B450E8();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  *(_QWORD *)(v6 + 16) = sub_244B453D0();
  sub_244B34680();
  *(_QWORD *)(v6 + 24) = sub_244B45100();
  return v6;
}

uint64_t InMemoryStore.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v1 = v0;
  v2 = sub_244B453AC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_244B450F4();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_244B453A0();
  MEMORY[0x24BDAC7A8](v7);
  sub_244B1FE10();
  sub_244B45394();
  sub_244B450E8();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5750], v2);
  *(_QWORD *)(v1 + 16) = sub_244B453D0();
  sub_244B34680();
  *(_QWORD *)(v1 + 24) = sub_244B45100();
  return v1;
}

unint64_t sub_244B34680()
{
  unint64_t result;

  result = qword_2573DC920;
  if (!qword_2573DC920)
  {
    result = MEMORY[0x24951FF40](&protocol conformance descriptor for DocumentKey, MEMORY[0x24BE78FB8]);
    atomic_store(result, (unint64_t *)&qword_2573DC920);
  }
  return result;
}

uint64_t InMemoryStore.reset()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = v0;
  return swift_task_switch();
}

uint64_t sub_244B346DC()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v1 = v0[8];
  v2 = *(NSObject **)(v1 + 16);
  v3 = swift_allocObject();
  v0[2] = MEMORY[0x24BDAC760];
  *(_QWORD *)(v3 + 16) = sub_244B347F8;
  *(_QWORD *)(v3 + 24) = v1;
  v0[6] = sub_244B34848;
  v0[7] = v3;
  v0[3] = 1107296256;
  v0[4] = sub_244B34868;
  v0[5] = &block_descriptor;
  v4 = _Block_copy(v0 + 2);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v2, v4);
  _Block_release(v4);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v2 & 1) == 0)
    return ((uint64_t (*)(void))v0[1])();
  __break(1u);
  return result;
}

uint64_t sub_244B347F8()
{
  uint64_t v0;

  swift_beginAccess();
  *(_QWORD *)(v0 + 24) = MEMORY[0x24BEE4B00];
  return swift_bridgeObjectRelease();
}

uint64_t sub_244B34838()
{
  return swift_deallocObject();
}

uint64_t sub_244B34848()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_244B34868(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t InMemoryStore.documentCount()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_244B348B8()
{
  uint64_t v0;

  sub_244B453C4();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_244B34910@<X0>(_QWORD *a1@<X8>)
{
  return sub_244B36A58(a1);
}

uint64_t InMemoryStore.isIndexed(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_244B34944()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  v6 = *(_OWORD *)(v0 + 16);
  v4 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v1;
  *(_OWORD *)(v4 + 24) = v6;
  *(_QWORD *)(v4 + 40) = v3;
  *(_QWORD *)(v4 + 48) = v2;
  sub_244B453C4();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 56));
}

uint64_t sub_244B349E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _BYTE *a6@<X8>)
{
  uint64_t result;
  char v13;
  char v14;

  result = swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16))
  {
    swift_bridgeObjectRetain();
    sub_244B35EF8(a2, a3, a4, a5);
    v14 = v13;
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  *a6 = v14 & 1;
  return result;
}

uint64_t sub_244B34A9C@<X0>(_BYTE *a1@<X8>)
{
  return sub_244B36A38(a1);
}

uint64_t InMemoryStore.write(key:index:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  return swift_task_switch();
}

uint64_t sub_244B34AD4()
{
  uint64_t v0;

  InMemoryStore.setIndex(_:_:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t InMemoryStore.read(tokenHashes:context:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788);
  return sub_244B453C4();
}

uint64_t sub_244B34B78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[16];
  uint64_t v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCAA8);
  MEMORY[0x24BDAC7A8](v4);
  v9 = a1;
  v10 = a2;
  (*(void (**)(_BYTE *, _QWORD))(v6 + 104))(&v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], *MEMORY[0x24BEE6CA0]);
  return sub_244B45340();
}

uint64_t sub_244B34C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  char *v39;
  uint64_t result;
  uint64_t v41;
  int64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  int64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCAB0);
  v44 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v43 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(v7 + 64);
  v41 = v7 + 64;
  v9 = 1 << *(_BYTE *)(v7 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & v8;
  v42 = (unint64_t)(v9 + 63) >> 6;
  swift_bridgeObjectRetain();
  v12 = 0;
  if (!v11)
    goto LABEL_5;
LABEL_4:
  v13 = __clz(__rbit64(v11));
  v14 = (v11 - 1) & v11;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v17)) + (v12 << 6))
  {
    v19 = *(_QWORD *)(a3 + 16);
    if (__OFADD__(v19, 8))
      goto LABEL_49;
    v48 = v14;
    v49 = v12;
    v20 = *(_QWORD *)(v7 + 56);
    v21 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 32 * i);
    v22 = v21[1];
    v23 = v21[2];
    v24 = v21[3];
    v45 = *v21;
    v46 = v23;
    v25 = *(_QWORD *)(v20 + 8 * i);
    v47 = v24;
    if ((unint64_t)(v19 + 7) <= 7)
      break;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26 = sub_244B45274();
    *(_QWORD *)(v26 + 16) = (unint64_t)(v19 + 7) >> 3;
    bzero((void *)(v26 + 32), (unint64_t)(v19 + 7) >> 3);
    if (v19)
      goto LABEL_24;
LABEL_41:
    v38 = *(_QWORD *)(v25 + 16);
    swift_bridgeObjectRelease();
    if (v38 >> 60)
      goto LABEL_50;
    v50 = v45;
    v51 = v22;
    v52 = v46;
    v53 = v47;
    v54 = v26;
    v55 = 8 * v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCAB8);
    v39 = v43;
    sub_244B452EC();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v39, v5);
    v11 = v48;
    v12 = v49;
    if (v48)
      goto LABEL_4;
LABEL_5:
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_53;
    if (v16 >= v42)
    {
LABEL_44:
      swift_release();
      v50 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCAB8);
      return sub_244B452F8();
    }
    v17 = *(_QWORD *)(v41 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v42)
        goto LABEL_44;
      v17 = *(_QWORD *)(v41 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v42)
          goto LABEL_44;
        v17 = *(_QWORD *)(v41 + 8 * v12);
        if (!v17)
        {
          v18 = v16 + 3;
          if (v18 >= v42)
            goto LABEL_44;
          v17 = *(_QWORD *)(v41 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v12 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_54;
              if (v12 >= v42)
                goto LABEL_44;
              v17 = *(_QWORD *)(v41 + 8 * v12);
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          v12 = v18;
        }
      }
    }
LABEL_18:
    v14 = (v17 - 1) & v17;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26 = MEMORY[0x24BEE4AF8];
  if (!v19)
    goto LABEL_41;
LABEL_24:
  v27 = *(_QWORD *)(v25 + 16);
  if (v27 >> 60)
    goto LABEL_51;
  v28 = 8 * v27;
  if (((8 * v27) & 0x8000000000000000) != 0)
    goto LABEL_55;
  if (!v28)
    goto LABEL_52;
  v29 = 0;
  v30 = *(_QWORD *)(a3 + 32);
  v31 = v26 + 32;
  v32 = v19 - 1;
  while (2)
  {
    v33 = v30 % v28;
    if ((uint64_t)v33 >= v28)
    {
      v34 = 0;
    }
    else
    {
      if (v33 >> 3 >= v27)
        goto LABEL_46;
      v34 = (*(unsigned __int8 *)(v25 + 32 + (v33 >> 3)) >> (v33 & 7)) & 1;
    }
    v35 = *(_QWORD *)(v26 + 16);
    if (!(v35 >> 60))
    {
      if (v29 >= 8 * v35)
        goto LABEL_37;
      v36 = v29 >> 3;
      v37 = v29 & 7;
      if (v34)
      {
        if (v29 >> 3 >= v35)
          goto LABEL_47;
        *(_BYTE *)(v31 + v36) |= 1 << v37;
LABEL_37:
        if (v32 == v29)
          goto LABEL_41;
      }
      else
      {
        if (v29 >> 3 >= v35)
          goto LABEL_48;
        *(_BYTE *)(v31 + v36) &= ~(1 << v37);
        if (v32 == v29)
          goto LABEL_41;
      }
      v30 = *(_QWORD *)(a3 + 40 + 8 * v29++);
      continue;
    }
    break;
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  result = sub_244B454A8();
  __break(1u);
  return result;
}

uint64_t InMemoryStore.removeIndex(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v9;
  unint64_t v10;
  char v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v15;

  v9 = (uint64_t *)(v4 + 24);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v10 = sub_244B35EF8(a1, a2, a3, a4);
  LOBYTE(a2) = v11;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v9;
    v15 = *v9;
    *v9 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_244B365FC();
      v13 = v15;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_244B35FBC(v10, v13);
    *v9 = v13;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t InMemoryStore.setIndex(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  uint64_t result;
  _QWORD v19[6];

  v7 = v6;
  v14 = *(NSObject **)(v6 + 16);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v7;
  v15[3] = a1;
  v15[4] = a2;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = a5;
  v15[8] = a6;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_244B36804;
  *(_QWORD *)(v16 + 24) = v15;
  v19[4] = sub_244B36AD4;
  v19[5] = v16;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 1107296256;
  v19[2] = sub_244B34868;
  v19[3] = &block_descriptor_10;
  v17 = _Block_copy(v19);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v14, v17);
  _Block_release(v17);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v14 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_244B3530C()
{
  uint64_t v0;

  return sub_244B34B78(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_244B35324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v14 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0x8000000000000000;
  sub_244B38608(a6, a2, a3, a4, a5, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(a1 + 24) = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t InMemoryStore.getIndex(_:)()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC948);
  sub_244B453C4();
  return v1;
}

uint64_t sub_244B3546C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;

  result = swift_beginAccess();
  v13 = *(_QWORD *)(a1 + 24);
  if (!*(_QWORD *)(v13 + 16))
    goto LABEL_6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = sub_244B35EF8(a2, a3, a4, a5);
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
LABEL_6:
    *a6 = 0;
    a6[1] = 0;
    return result;
  }
  v16 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(v16 + 16);
  if (v17 >> 60)
  {
    __break(1u);
  }
  else
  {
    *a6 = v16;
    a6[1] = 8 * v17;
  }
  return result;
}

uint64_t InMemoryStore.allIndices.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t InMemoryStore.totalIndices.getter()
{
  return sub_244B3572C();
}

Swift::Void __swiftcall InMemoryStore.reset()()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v1 = *(NSObject **)(v0 + 16);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = sub_244B36848;
  *(_QWORD *)(v2 + 24) = v0;
  v4[4] = sub_244B36AD4;
  v4[5] = v2;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 1107296256;
  v4[2] = sub_244B34868;
  v4[3] = &block_descriptor_17;
  v3 = _Block_copy(v4);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v3);
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v1 & 1) != 0)
    __break(1u);
}

uint64_t sub_244B356C4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_244B36F38(MEMORY[0x24BEE4AF8]);
  swift_beginAccess();
  *(_QWORD *)(a1 + 24) = v2;
  return swift_bridgeObjectRelease();
}

Swift::Int64 __swiftcall InMemoryStore.sizeBytes()()
{
  return sub_244B3572C();
}

uint64_t sub_244B3572C()
{
  uint64_t v1;

  sub_244B453C4();
  return v1;
}

uint64_t sub_244B35770@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t result;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;

  v37 = a2;
  v3 = type metadata accessor for Logger();
  MEMORY[0x24BDAC7A8](v3);
  v44 = (uint64_t)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_244B44EC0();
  v41 = *(_QWORD *)(v5 - 8);
  v42 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v40 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_244B4516C();
  v48 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v47 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(v9 + 64);
  v45 = v9 + 64;
  v11 = 1 << *(_BYTE *)(v9 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v10;
  v46 = (unint64_t)(v11 + 63) >> 6;
  v49 = v9;
  swift_bridgeObjectRetain();
  v14 = 0;
  v15 = 0;
  v43 = 0x8000000244B47D20;
  v38 = v7;
  v39 = v3;
  while (1)
  {
    v55 = v14;
    if (v13)
    {
      v51 = (v13 - 1) & v13;
      v52 = v15;
      v16 = __clz(__rbit64(v13)) | (v15 << 6);
      goto LABEL_20;
    }
    v17 = v15 + 1;
    if (__OFADD__(v15, 1))
      goto LABEL_32;
    if (v17 >= v46)
      goto LABEL_29;
    v18 = *(_QWORD *)(v45 + 8 * v17);
    v19 = v15 + 1;
    if (!v18)
    {
      v19 = v15 + 2;
      if (v15 + 2 >= v46)
        goto LABEL_29;
      v18 = *(_QWORD *)(v45 + 8 * v19);
      if (!v18)
      {
        v19 = v15 + 3;
        if (v15 + 3 >= v46)
          goto LABEL_29;
        v18 = *(_QWORD *)(v45 + 8 * v19);
        if (!v18)
          break;
      }
    }
LABEL_19:
    v51 = (v18 - 1) & v18;
    v52 = v19;
    v16 = __clz(__rbit64(v18)) + (v19 << 6);
LABEL_20:
    v21 = (uint64_t *)(*(_QWORD *)(v49 + 48) + 32 * v16);
    v22 = v21[1];
    v23 = *(_QWORD *)(*(_QWORD *)(v49 + 56) + 8 * v16);
    v53 = *v21;
    v54 = v22;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v50 = v23;
    swift_bridgeObjectRetain();
    sub_244B451E4();
    swift_bridgeObjectRetain();
    sub_244B451E4();
    swift_bridgeObjectRelease();
    v24 = v47;
    sub_244B45160();
    sub_244B45148();
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v24, v7);
    if (v26 >> 60 != 15)
      __asm { BR              X9 }
    if (qword_2573DBB88 != -1)
      swift_once();
    v27 = __swift_project_value_buffer(v3, (uint64_t)qword_2573DCF48);
    v28 = v44;
    sub_244B2E774(v27, v44);
    v53 = 0;
    v54 = 0xE000000000000000;
    sub_244B45430();
    swift_bridgeObjectRelease();
    v53 = 0x5B20676E69727453;
    v54 = 0xE800000000000000;
    sub_244B451E4();
    sub_244B451E4();
    sub_244B390F4(2, v53);
    swift_bridgeObjectRelease();
    sub_244B2EB40(v28);
    v29 = MEMORY[0x24BEE4AF8];
    v30 = v55;
    swift_bridgeObjectRelease();
    v31 = *(_QWORD *)(v29 + 16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = v30 + v31;
    if (__OFADD__(v30, v31))
    {
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
      JUMPOUT(0x244B35CC4);
    }
    v33 = *(_QWORD *)(v50 + 16);
    swift_bridgeObjectRelease();
    v34 = __OFADD__(v32, v33);
    v14 = v32 + v33;
    v13 = v51;
    v15 = v52;
    if (v34)
      goto LABEL_31;
  }
  v20 = v15 + 4;
  if (v15 + 4 >= v46)
    goto LABEL_29;
  v18 = *(_QWORD *)(v45 + 8 * v20);
  if (v18)
  {
    v19 = v15 + 4;
    goto LABEL_19;
  }
  while (1)
  {
    v19 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      JUMPOUT(0x244B35CD4);
    }
    if (v19 >= v46)
      break;
    v18 = *(_QWORD *)(v45 + 8 * v19);
    ++v20;
    if (v18)
      goto LABEL_19;
  }
LABEL_29:
  result = swift_release();
  *v37 = v14;
  return result;
}

uint64_t InMemoryStore.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InMemoryStore.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_244B35D34()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_244B21254;
  v3[8] = v2;
  return swift_task_switch();
}

uint64_t sub_244B35D94()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = *v0;
  return swift_task_switch();
}

uint64_t sub_244B35DB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;

  v5[4] = a3;
  v5[5] = a4;
  v5[2] = a1;
  v5[3] = a2;
  v5[6] = *v4;
  return swift_task_switch();
}

uint64_t sub_244B35DD4()
{
  uint64_t v0;
  uint64_t v2;

  sub_244B453C4();
  return sub_244B36A24(*(uint64_t (**)(uint64_t))(v0 + 8), v0, v2);
}

uint64_t sub_244B35E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;

  v7[6] = a5;
  v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  v7[2] = a1;
  v7[3] = a2;
  v7[8] = *v6;
  return swift_task_switch();
}

uint64_t sub_244B35E5C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788);
  return sub_244B453C4();
}

unint64_t sub_244B35EC0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_244B45574();
  return sub_244B361F0(a1, v2);
}

unint64_t sub_244B35EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  sub_244B45580();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRetain();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  sub_244B451B4();
  swift_bridgeObjectRelease();
  v8 = sub_244B45598();
  return sub_244B3628C(a1, a2, a3, a4, v8);
}

unint64_t sub_244B35FBC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  __int128 v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_244B4540C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_244B45580();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        sub_244B451E4();
        swift_bridgeObjectRetain();
        sub_244B451E4();
        swift_bridgeObjectRelease();
        sub_244B451B4();
        swift_bridgeObjectRelease();
        v9 = sub_244B45598();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 32 * v3);
          v13 = (_OWORD *)(v11 + 32 * v6);
          if (v3 != v6 || v12 >= v13 + 2)
          {
            v14 = v13[1];
            *v12 = *v13;
            v12[1] = v14;
          }
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_QWORD *)(v15 + 8 * v3);
          v17 = (_QWORD *)(v15 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
          {
            *v16 = *v17;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_244B361F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_244B3628C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t *v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v6 = -1 << *(_BYTE *)(v5 + 32);
  v7 = a5 & ~v6;
  v14 = v5 + 64;
  if (((*(_QWORD *)(v5 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v8 = v5;
    v13 = ~v6;
    while (1)
    {
      v10 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 32 * v7);
      v16 = *v10;
      v17 = v10[1];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRelease();
      if (v16 == a1 && v17 == a2)
        break;
      v11 = sub_244B45508();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        v7 = (v7 + 1) & v13;
        if (((*(_QWORD *)(v14 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
          continue;
      }
      return v7;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }
  return v7;
}

void *sub_244B3645C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCAC0);
  v2 = *v0;
  v3 = sub_244B454B4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244B365FC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCAA0);
  v2 = *v0;
  v3 = sub_244B454B4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      v9 = v24 + 1;
      if (v24 + 1 >= v13)
        goto LABEL_26;
      v25 = *(_QWORD *)(v6 + 8 * v9);
      if (!v25)
        break;
    }
LABEL_25:
    v12 = (v25 - 1) & v25;
    v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    v16 = 32 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 32 * v15);
    v18 = v17[1];
    v19 = v17[2];
    v20 = v17[3];
    v21 = 8 * v15;
    v22 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v21);
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = *v17;
    v23[1] = v18;
    v23[2] = v19;
    v23[3] = v20;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v21) = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v13)
    goto LABEL_26;
  v25 = *(_QWORD *)(v6 + 8 * v26);
  if (v25)
  {
    v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v9);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_244B367C8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_244B36804()
{
  uint64_t *v0;

  return sub_244B35324(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7]);
}

uint64_t sub_244B36818()
{
  return swift_deallocObject();
}

uint64_t sub_244B36828@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return sub_244B3546C(v1[2], v1[3], v1[4], v1[5], v1[6], a1);
}

uint64_t sub_244B36848()
{
  uint64_t v0;

  return sub_244B356C4(v0);
}

uint64_t sub_244B36850()
{
  return swift_deallocObject();
}

uint64_t sub_244B36860@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_244B35770(v1, a1);
}

uint64_t type metadata accessor for InMemoryStore()
{
  return objc_opt_self();
}

void *sub_244B36898()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCA98);
  v2 = *v0;
  v3 = sub_244B454B4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v12 = (v19 - 1) & v19;
    v15 = v21 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_244B36A24(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_244B36A38@<X0>(_BYTE *a1@<X8>)
{
  uint64_t *v1;

  return sub_244B349E8(v1[2], v1[3], v1[4], v1[5], v1[6], a1);
}

uint64_t sub_244B36A58@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *a1 = *(_QWORD *)(*(_QWORD *)(v1 + 24) + 16);
  return result;
}

uint64_t sub_244B36AA4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_244B2E2B4(a1, a2);
  return a1;
}

uint64_t sub_244B36AB8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_244B2E2F8(a1, a2);
  return a1;
}

uint64_t sub_244B36ACC(uint64_t a1)
{
  uint64_t v1;

  return sub_244B34C38(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_244B36AEC()
{
  return sub_244B3530C();
}

uint64_t sub_244B36B00()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[10] = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCC00);
  v1[11] = v2;
  v1[12] = *(_QWORD *)(v2 - 8);
  v1[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B36B64()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788);
  sub_244B45310();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  *v1 = v0;
  v1[1] = sub_244B36BF4;
  return sub_244B4531C();
}

uint64_t sub_244B36BF4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  else
    *(_QWORD *)(v2 + 120) = MEMORY[0x24BEE4AF8];
  return swift_task_switch();
}

uint64_t sub_244B36C6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  __int128 v12;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 32);
    v12 = *(_OWORD *)(v0 + 40);
    v4 = *(_QWORD *)(v0 + 56);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v6 = *(_QWORD **)(v0 + 120);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v6 = sub_244B30CFC(0, v6[2] + 1, 1, v6);
    v8 = v6[2];
    v7 = v6[3];
    if (v8 >= v7 >> 1)
      v6 = sub_244B30CFC((_QWORD *)(v7 > 1), v8 + 1, 1, v6);
    *(_QWORD *)(v0 + 128) = v6;
    v6[2] = v8 + 1;
    v9 = &v6[6 * v8];
    v9[4] = v2;
    v9[5] = v1;
    v9[6] = v3;
    *(_OWORD *)(v9 + 7) = v12;
    v9[9] = v4;
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v10;
    *v10 = v0;
    v10[1] = sub_244B36E8C;
    return sub_244B4531C();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 120));
  }
}

uint64_t sub_244B36DD4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 64);
  *(_QWORD *)(v0 + 72) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD38);
  if (sub_244B454FC())
  {
    MEMORY[0x24951FEEC](v1);
  }
  else
  {
    swift_allocError();
    *v2 = *(_QWORD *)(v0 + 72);
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B36E8C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  else
    *(_QWORD *)(v2 + 120) = *(_QWORD *)(v2 + 128);
  return swift_task_switch();
}

uint64_t LevelCapacityUsageState.__allocating_init(levelCapacity:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  LevelCapacityUsageState.init(levelCapacity:)(a1);
  return v2;
}

unint64_t sub_244B36F38(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCAA0);
  v2 = (_QWORD *)sub_244B454CC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 64);
  while (1)
  {
    v5 = *(v4 - 4);
    v6 = *(v4 - 3);
    v7 = *(v4 - 2);
    v8 = *(v4 - 1);
    v9 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_244B35EF8(v5, v6, v7, v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v2[6] + 32 * result);
    *v12 = v5;
    v12[1] = v6;
    v12[2] = v7;
    v12[3] = v8;
    *(_QWORD *)(v2[7] + 8 * result) = v9;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v2[2] = v15;
    v4 += 5;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

_QWORD *LevelCapacityUsageState.init(levelCapacity:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = v1;
  v4 = sub_244B453AC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_244B450F4();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_244B453A0();
  MEMORY[0x24BDAC7A8](v9);
  sub_244B1FE10();
  sub_244B45394();
  sub_244B450E8();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5750], v4);
  v2[2] = sub_244B453D0();
  v2[3] = 0;
  v2[4] = a1;
  v2[5] = sub_244B388C0(MEMORY[0x24BEE4AF8]);
  return v2;
}

Swift::Void __swiftcall LevelCapacityUsageState.setLevelCapacity(to:)(Swift::UInt64 to)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v7[16];
  uint64_t v8;
  Swift::UInt64 v9;

  v3 = sub_244B450DC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v7[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_244B450D0();
  v8 = v1;
  v9 = to;
  sub_244B453B8();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::UInt64 __swiftcall LevelCapacityUsageState.fetch(_:)(Swift::UInt64 a1)
{
  Swift::UInt64 v2;

  sub_244B453C4();
  return v2;
}

uint64_t sub_244B372E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  char v9;

  result = swift_beginAccess();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    result = sub_244B36AD8(a2);
    if ((v9 & 1) != 0)
      v8 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * result);
    else
      v8 = 0;
  }
  *a3 = v8;
  return result;
}

uint64_t sub_244B37360(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t result;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;

  v3 = (uint64_t *)(v1 + 40);
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 40);
  if (!*(_QWORD *)(v4 + 16) || (result = sub_244B36AD8(a1), (v6 & 1) == 0))
  {
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v3;
    *v3 = 0x8000000000000000;
    v10 = 1;
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * result);
  v8 = v7 + 1;
  if (v7 != -1)
  {
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v3;
    *v3 = 0x8000000000000000;
    v10 = v8;
LABEL_6:
    sub_244B38794(v10, a1, isUniquelyReferenced_nonNull_native);
    *v3 = v11;
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall LevelCapacityUsageState.requestAndUpdate(_:)(Swift::UInt64 a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];
  uint64_t v9;
  Swift::UInt64 v10;
  Swift::UInt64 *v11;
  Swift::UInt64 v12;

  v3 = sub_244B450DC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = a1;
  sub_244B450D0();
  v9 = v1;
  v10 = a1;
  v11 = &v12;
  sub_244B453B8();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  return v12;
}

uint64_t sub_244B37528(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t result;
  char v8;
  uint64_t v9;

  swift_beginAccess();
  v6 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v6 + 16) || (result = sub_244B36AD8(a2), (v8 & 1) == 0))
  {
    v9 = *a3;
    return sub_244B37360(v9);
  }
  if (*(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * result) < *(_QWORD *)(a1 + 32))
  {
    *a3 = a2;
    v9 = a2;
    return sub_244B37360(v9);
  }
  if (a2 == -1)
    __break(1u);
  else
    *a3 = a2 + 1;
  return result;
}

uint64_t LevelCapacityUsageState.refresh(searchIndexReader:level0BloomFilterSizeBits:levelCapacity:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[16] = a3;
  v4[17] = v3;
  v4[14] = a1;
  v4[15] = a2;
  v5 = sub_244B450DC();
  v4[18] = v5;
  v4[19] = *(_QWORD *)(v5 - 8);
  v4[20] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788);
  v4[21] = v6;
  v4[22] = *(_QWORD *)(v6 - 8);
  v4[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B37668()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t (*v10)(void);

  v9 = v0 + 16;
  v1 = *(_QWORD **)(v0 + 112);
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  if (qword_2573DBB78 != -1)
    swift_once();
  v4 = static DocumentProcessor.kDummyTokenHash;
  v5 = type metadata accessor for CallContextImpl();
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  swift_beginAccess();
  sub_244B2CA74(v0 + 56, v6 + 16);
  swift_endAccess();
  *(_QWORD *)(v0 + 40) = v5;
  *(_QWORD *)(v0 + 48) = &protocol witness table for CallContextImpl;
  *(_QWORD *)(v0 + 16) = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 8))(v4, v9, v2, v3);
  __swift_destroy_boxed_opaque_existential_1(v9);
  v10 = (uint64_t (*)(void))((char *)&dword_2573DCAD0 + dword_2573DCAD0);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 192) = v7;
  *v7 = v0;
  v7[1] = sub_244B377FC;
  return v10();
}

uint64_t sub_244B377FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 176);
  *(_QWORD *)(*(_QWORD *)v2 + 200) = v1;
  swift_task_dealloc();
  v6 = v4[23];
  v7 = v4[21];
  if (!v1)
    v4[26] = a1;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  return swift_task_switch();
}

uint64_t sub_244B3788C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 136);
  v9 = *(_QWORD *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 128);
  sub_244B450D0();
  v7 = (_QWORD *)swift_task_alloc();
  v7[2] = v4;
  v7[3] = v5;
  v7[4] = v1;
  v7[5] = v6;
  sub_244B453B8();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v9);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B37960()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B379A0(_QWORD *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int64_t v13;
  uint64_t v14;
  double v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  uint64_t result;
  double v24;
  _QWORD v25[2];
  uint64_t v26;

  v9 = sub_244B44EFC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  a1[5] = MEMORY[0x24BEE4B00];
  swift_bridgeObjectRelease();
  a1[4] = a2;
  v13 = *(_QWORD *)(a3 + 16);
  v14 = MEMORY[0x24BEE4AF8];
  if (v13)
  {
    v25[1] = v4;
    v26 = MEMORY[0x24BEE4AF8];
    sub_244B2DB20(0, v13, 0);
    v14 = v26;
    v15 = log2((double)a4);
    v16 = *(_QWORD *)(v14 + 16);
    v17 = (uint64_t *)(a3 + 72);
    do
    {
      v18 = *v17;
      v17 += 6;
      v19 = log2((double)v18);
      v26 = v14;
      v20 = *(_QWORD *)(v14 + 24);
      if (v16 >= v20 >> 1)
      {
        sub_244B2DB20(v20 > 1, v16 + 1, 1);
        v14 = v26;
      }
      *(_QWORD *)(v14 + 16) = v16 + 1;
      *(double *)(v14 + 8 * v16++ + 32) = v19 - v15;
      --v13;
    }
    while (v13);
  }
  swift_retain();
  sub_244B389F4(v14, (uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_244B44EF0();
  sub_244B44EE4();
  v22 = v21;
  result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v24 = v22 * 1000.0;
  if ((~COERCE__INT64(v22 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v24 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v24 < 9.22337204e18)
  {
    a1[3] = (uint64_t)v24;
    return result;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t LevelCapacityUsageState.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LevelCapacityUsageState.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_244B37C18(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCAC0);
  result = sub_244B454C0();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v31 = -1 << v10;
    v32 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33)
          goto LABEL_33;
        v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v33)
            goto LABEL_33;
          v22 = v9[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v32 >= 64)
                  bzero((void *)(v5 + 64), 8 * v33);
                else
                  *v9 = v31;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v8 >= v33)
                  goto LABEL_33;
                v22 = v9[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = 8 * v20;
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v28);
      v30 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v28);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      result = sub_244B45574();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = 8 * v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v29;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_244B37ECC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  uint64_t i;
  char v39;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCAA0);
  v39 = a2;
  v6 = sub_244B454C0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v37 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v36 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    for (i = v5; ; v5 = i)
    {
      if (v10)
      {
        v19 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v20 = v19 | (v13 << 6);
      }
      else
      {
        v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v36)
          goto LABEL_33;
        v22 = v37[v21];
        ++v13;
        if (!v22)
        {
          v13 = v21 + 1;
          if (v21 + 1 >= v36)
            goto LABEL_33;
          v22 = v37[v13];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v39 & 1) != 0)
              {
                v35 = 1 << *(_BYTE *)(v5 + 32);
                if (v35 >= 64)
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v37 = -1 << v35;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                v13 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_40;
                if (v13 >= v36)
                  goto LABEL_33;
                v22 = v37[v13];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v13 = v23;
          }
        }
LABEL_30:
        v10 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      v28 = *(_QWORD *)(v5 + 56);
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 32 * v20);
      v30 = *v29;
      v31 = v29[1];
      v33 = v29[2];
      v32 = v29[3];
      v34 = *(_QWORD *)(v28 + 8 * v20);
      if ((v39 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_244B45580();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRetain();
      sub_244B451E4();
      swift_bridgeObjectRelease();
      sub_244B451B4();
      swift_bridgeObjectRelease();
      result = sub_244B45598();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 32 * v17);
      *v18 = v30;
      v18[1] = v31;
      v18[2] = v33;
      v18[3] = v32;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v34;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_244B3822C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCA98);
  result = sub_244B454C0();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v35 = a2;
    v34 = v3;
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v32 = -1 << v10;
    v33 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v18 = v17 | (v8 << 6);
      }
      else
      {
        v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13)
          goto LABEL_31;
        v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          v8 = v19 + 1;
          if (v19 + 1 >= v13)
            goto LABEL_31;
          v20 = v9[v8];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                result = swift_release();
                v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64)
                bzero((void *)(v5 + 64), 8 * v13);
              else
                *v9 = v32;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                v8 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_40;
                if (v8 >= v13)
                  goto LABEL_31;
                v20 = v9[v8];
                ++v21;
                if (v20)
                  goto LABEL_21;
              }
            }
            v8 = v21;
          }
        }
LABEL_21:
        v12 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      v22 = 8 * v18;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v22);
      v24 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v22);
      result = sub_244B45574();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = 8 * v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v23;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v16) = v24;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_244B384D0(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_244B35EC0(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_244B3645C();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v19 = 8 * v10;
    *(_QWORD *)(v16[6] + v19) = a2;
    *(_QWORD *)(v16[7] + v19) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_244B37C18(result, a3 & 1);
  result = sub_244B35EC0(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_244B4552C();
  __break(1u);
  return result;
}

uint64_t sub_244B38608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t result;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;

  v7 = v6;
  v14 = *v6;
  v16 = sub_244B35EF8(a2, a3, a4, a5);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a6 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_244B365FC();
LABEL_7:
    v22 = (_QWORD *)*v7;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v23 + 8 * v16) = a1;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v27 = (uint64_t *)(v22[6] + 32 * v16);
    *v27 = a2;
    v27[1] = a3;
    v27[2] = a4;
    v27[3] = a5;
    *(_QWORD *)(v22[7] + 8 * v16) = a1;
    v28 = v22[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (!v29)
    {
      v22[2] = v30;
      swift_bridgeObjectRetain();
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_244B37ECC(v19, a6 & 1);
  v25 = sub_244B35EF8(a2, a3, a4, a5);
  if ((v20 & 1) == (v26 & 1))
  {
    v16 = v25;
    v22 = (_QWORD *)*v7;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_244B4552C();
  __break(1u);
  return result;
}

uint64_t sub_244B38794(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v4 = v3;
  v8 = *v3;
  v10 = sub_244B36AD8(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_244B36898();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v16[7] + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v18 = 8 * v10;
    *(_QWORD *)(v16[6] + v18) = a2;
    *(_QWORD *)(v16[7] + v18) = a1;
    v19 = v16[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_244B3822C(result, a3 & 1);
  result = sub_244B36AD8(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_244B4552C();
  __break(1u);
  return result;
}

unint64_t sub_244B388C0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCA98);
    v3 = (_QWORD *)sub_244B454CC();
    for (i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      v5 = *(i - 1);
      v6 = *i;
      result = sub_244B36AD8(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v9 = 8 * result;
      *(_QWORD *)(v3[6] + v9) = v5;
      *(_QWORD *)(v3[7] + v9) = v6;
      v10 = v3[2];
      v11 = __OFADD__(v10, 1);
      v12 = v10 + 1;
      if (v11)
        goto LABEL_10;
      v3[2] = v12;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

void sub_244B38994()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 32) = *(_QWORD *)(v0 + 24);
}

uint64_t sub_244B389A0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_244B372E4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_244B389B8()
{
  uint64_t v0;

  return sub_244B379A0(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t type metadata accessor for LevelCapacityUsageState()
{
  return objc_opt_self();
}

uint64_t sub_244B389F4(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  double *v6;
  uint64_t *v7;
  double v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  _QWORD *v26;
  char v27;
  _QWORD *v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t result;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v50 = MEMORY[0x24BEE4AF8];
  sub_244B2DB04(0, v2, 0);
  v3 = v50;
  v6 = (double *)(a1 + 32);
  v7 = (uint64_t *)(a2 + 40);
  swift_beginAccess();
  while (1)
  {
    v8 = *v6 + *v6;
    if ((~*(_QWORD *)&v8 & 0x7FF0000000000000) == 0)
      break;
    if (v8 <= -1.0)
      goto LABEL_37;
    if (v8 >= 1.84467441e19)
      goto LABEL_38;
    v9 = (unint64_t)v8;
    v10 = (_QWORD *)*v7;
    if (*(_QWORD *)(*v7 + 16) && (v11 = sub_244B36AD8((unint64_t)v8), (v12 & 1) != 0))
    {
      v13 = *(_QWORD *)(v10[7] + 8 * v11);
      v14 = __CFADD__(v13, 1);
      v15 = v13 + 1;
      if (v14)
        goto LABEL_41;
      v47 = v15;
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = (_QWORD *)*v7;
      v48 = (_QWORD *)*v7;
      *v7 = 0x8000000000000000;
      v19 = sub_244B36AD8(v9);
      v20 = v17[2];
      v21 = (v18 & 1) == 0;
      v22 = v20 + v21;
      if (__OFADD__(v20, v21))
        goto LABEL_42;
      v23 = v18;
      if (v17[3] >= v22)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v26 = v48;
          if ((v18 & 1) == 0)
            goto LABEL_30;
        }
        else
        {
          sub_244B36898();
          v26 = v48;
          if ((v23 & 1) == 0)
            goto LABEL_30;
        }
      }
      else
      {
        sub_244B3822C(v22, isUniquelyReferenced_nonNull_native);
        v24 = sub_244B36AD8(v9);
        if ((v23 & 1) != (v25 & 1))
          goto LABEL_44;
        v19 = v24;
        v26 = v48;
        if ((v23 & 1) == 0)
        {
LABEL_30:
          v26[(v19 >> 6) + 8] |= 1 << v19;
          v41 = 8 * v19;
          *(_QWORD *)(v26[6] + v41) = v9;
          *(_QWORD *)(v26[7] + v41) = v47;
          v42 = v26[2];
          v39 = __OFADD__(v42, 1);
          v40 = v42 + 1;
          if (v39)
            goto LABEL_43;
LABEL_31:
          v26[2] = v40;
          goto LABEL_32;
        }
      }
      *(_QWORD *)(v26[7] + 8 * v19) = v47;
    }
    else
    {
      swift_beginAccess();
      v27 = swift_isUniquelyReferenced_nonNull_native();
      v28 = (_QWORD *)*v7;
      v49 = (_QWORD *)*v7;
      *v7 = 0x8000000000000000;
      v30 = sub_244B36AD8(v9);
      v31 = v28[2];
      v32 = (v29 & 1) == 0;
      v33 = v31 + v32;
      if (__OFADD__(v31, v32))
        goto LABEL_39;
      v34 = v29;
      if (v28[3] >= v33)
      {
        if ((v27 & 1) != 0)
        {
          v26 = v49;
          if ((v29 & 1) == 0)
            goto LABEL_26;
        }
        else
        {
          sub_244B36898();
          v26 = v49;
          if ((v34 & 1) == 0)
            goto LABEL_26;
        }
      }
      else
      {
        sub_244B3822C(v33, v27);
        v35 = sub_244B36AD8(v9);
        if ((v34 & 1) != (v36 & 1))
          goto LABEL_44;
        v30 = v35;
        v26 = v49;
        if ((v34 & 1) == 0)
        {
LABEL_26:
          v26[(v30 >> 6) + 8] |= 1 << v30;
          v37 = 8 * v30;
          *(_QWORD *)(v26[6] + v37) = v9;
          *(_QWORD *)(v26[7] + v37) = 1;
          v38 = v26[2];
          v39 = __OFADD__(v38, 1);
          v40 = v38 + 1;
          if (v39)
            goto LABEL_40;
          goto LABEL_31;
        }
      }
      *(_QWORD *)(v26[7] + 8 * v30) = 1;
    }
LABEL_32:
    *v7 = (uint64_t)v26;
    swift_bridgeObjectRelease();
    swift_endAccess();
    v44 = *(_QWORD *)(v50 + 16);
    v43 = *(_QWORD *)(v50 + 24);
    v45 = v44 + 1;
    if (v44 >= v43 >> 1)
      sub_244B2DB04(v43 > 1, v44 + 1, 1);
    *(_QWORD *)(v50 + 16) = v45;
    ++v6;
    if (!--v2)
      return v3;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  result = sub_244B4552C();
  __break(1u);
  return result;
}

unint64_t sub_244B38D94(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCAC0);
  v3 = (_QWORD *)sub_244B454CC();
  v5 = a1[4];
  v4 = a1[5];
  result = sub_244B35EC0(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v8 = a1 + 7;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v3[6] + v9) = v5;
    *(_QWORD *)(v3[7] + v9) = v4;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v3[2] = v12;
    if (!--v1)
      goto LABEL_8;
    v13 = v8 + 2;
    v5 = *(v8 - 1);
    v14 = *v8;
    swift_bridgeObjectRetain();
    result = sub_244B35EC0(v5);
    v8 = v13;
    v4 = v14;
    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t Logger.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];

  v6 = sub_244B450C4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a2 - 8);
  v12 = MEMORY[0x24BDAC7A8](v8);
  v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v15((char *)v22 - v16, a1, a2);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v17 = v22[0];
    v18 = v22[1];
  }
  else
  {
    v15(v14, a1, a2);
    v17 = sub_244B45178();
    v18 = v19;
  }
  *a3 = v17;
  a3[1] = v18;
  swift_bridgeObjectRetain();
  sub_244B450B8();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, a2);
  v20 = type metadata accessor for Logger();
  return (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 32))((char *)a3 + *(int *)(v20 + 20), v10, v6);
}

uint64_t type metadata accessor for Logger()
{
  uint64_t result;

  result = qword_2573DCC70;
  if (!qword_2573DCC70)
    return swift_getSingletonMetadata();
  return result;
}

Swift::Void __swiftcall Logger.error(_:)(Swift::String a1)
{
  sub_244B390F4(3, a1._countAndFlagsBits);
}

void sub_244B3906C()
{
  id v0;
  void *v1;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  v1 = (void *)sub_244B45130();
  objc_msgSend(v0, sel_setDateFormat_, v1);

  qword_2573DCC08 = (uint64_t)v0;
}

Swift::Void __swiftcall Logger.debug(_:)(Swift::String a1)
{
  sub_244B390F4(0, a1._countAndFlagsBits);
}

void sub_244B390F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[4];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = a2;
  v4 = sub_244B44EFC();
  v11[3] = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v11[2] = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_244B450C4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(int *)(type metadata accessor for Logger() + 20);
  v12 = v2;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v2 + v10, v6);
  v13 = a1;
  __asm { BR              X10 }
}

uint64_t sub_244B391E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  NSObject *v7;
  _DWORD *v8;
  uint64_t result;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = sub_244B45388();
  swift_bridgeObjectRetain_n();
  v7 = sub_244B450AC();
  if (os_log_type_enabled(v7, v6))
  {
    *(_QWORD *)(v5 - 160) = v1;
    *(_QWORD *)(v5 - 152) = v2;
    v8 = (_DWORD *)swift_slowAlloc();
    *(_QWORD *)(v5 - 96) = swift_slowAlloc();
    *v8 = 136315394;
    __asm { BR              X10 }
  }

  swift_bridgeObjectRelease_n();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v4);
  if (byte_2573DCC10 == 1)
  {
    *(_QWORD *)(v5 - 96) = 91;
    *(_QWORD *)(v5 - 88) = 0xE100000000000000;
    if (qword_2573DBB80 != -1)
      swift_once();
    v10 = (void *)qword_2573DCC08;
    v11 = *(_QWORD *)(v5 - 144);
    sub_244B44EF0();
    v12 = (void *)sub_244B44ED8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 136) + 8))(v11, v1);
    v13 = objc_msgSend(v10, sel_stringFromDate_, v12);

    sub_244B4513C();
    sub_244B451E4();
    swift_bridgeObjectRelease();
    sub_244B451E4();
    __asm { BR              X10 }
  }
  return result;
}

Swift::Void __swiftcall Logger.info(_:)(Swift::String a1)
{
  sub_244B390F4(1, a1._countAndFlagsBits);
}

Swift::Void __swiftcall Logger.info(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *((_QWORD *)a1._rawValue + 2);
  if (v1)
  {
    v2 = swift_bridgeObjectRetain() + 40;
    do
    {
      v3 = *(_QWORD *)(v2 - 8);
      swift_bridgeObjectRetain();
      sub_244B390F4(1, v3);
      swift_bridgeObjectRelease();
      v2 += 16;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall Logger.warn(_:)(Swift::String a1)
{
  sub_244B390F4(2, a1._countAndFlagsBits);
}

uint64_t static Logger.setWriteToStdout(enabled:)(uint64_t result)
{
  byte_2573DCC10 = result;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Logger(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_244B450C4();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for Logger(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_244B450C4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for Logger(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_244B450C4();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *assignWithCopy for Logger(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244B450C4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for Logger(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_244B450C4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for Logger(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_244B450C4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for Logger()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B39958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_244B450C4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Logger()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B399E0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_244B450C4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_244B39A54()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244B450C4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_244B39AC8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_244B39B98(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_244B3A180((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_244B3A180((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_244B39B98(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_244B453F4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_244B39D50(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_244B45448();
  if (!v8)
  {
    sub_244B454A8();
    __break(1u);
LABEL_17:
    result = sub_244B454D8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_244B39D50(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_244B39DE4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_244B3A034(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_244B3A034(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_244B39DE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_244B39F58(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_244B4543C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_244B454A8();
      __break(1u);
LABEL_10:
      v2 = sub_244B451FC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_244B454D8();
    __break(1u);
LABEL_14:
    result = sub_244B454A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_244B39F58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD28);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_244B39FBC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_244B45238();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x24951F934](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_244B3A034(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD28);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_244B454D8();
  __break(1u);
  return result;
}

uint64_t sub_244B3A180(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t LogLevelStrategy.__allocating_init(level0MaxTerms:level0BloomFilterSizeBits:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

void *LogLevelStrategy.kDefaultLevel0BloomFilterSizeBits.unsafeMutableAddressor()
{
  return &static LogLevelStrategy.kDefaultLevel0BloomFilterSizeBits;
}

uint64_t static LogLevelStrategy.kDefaultLevel0BloomFilterSizeBits.getter()
{
  return 1024;
}

double LogLevelStrategy.__allocating_init()()
{
  uint64_t v0;
  double result;

  v0 = swift_allocObject();
  *(_QWORD *)&result = 22;
  *(_OWORD *)(v0 + 16) = xmmword_244B467C0;
  return result;
}

double LogLevelStrategy.init()()
{
  uint64_t v0;
  double result;

  *(_QWORD *)&result = 22;
  *(_OWORD *)(v0 + 16) = xmmword_244B467C0;
  return result;
}

uint64_t LogLevelStrategy.init(level0MaxTerms:level0BloomFilterSizeBits:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

Swift::UInt64 __swiftcall LogLevelStrategy.levelForTerms(_:)(Swift::UInt64 result)
{
  uint64_t v1;
  Swift::UInt64 v2;
  uint64_t i;
  Swift::UInt64 v4;

  v2 = *(_QWORD *)(v1 + 16);
  if (v2 >= result)
    return 0;
  for (i = 0; ; ++i)
  {
    v4 = i + 1;
    if (i == -1)
      break;
    v2 *= 2;
    if (v2 >= result)
      return v4;
  }
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall LogLevelStrategy.bloomFilterSizeForLevel(_:)(Swift::UInt64 a1)
{
  uint64_t v1;

  if (a1 >= 0x40)
    return 0;
  else
    return *(_QWORD *)(v1 + 24) << a1;
}

Swift::UInt64 __swiftcall LogLevelStrategy.bloomFilterSizeForNumTerms(_:)(Swift::UInt64 result)
{
  uint64_t v1;
  Swift::UInt64 v2;
  uint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD *)(v1 + 16);
  if (v2 >= result)
    return *(_QWORD *)(v1 + 24);
  v3 = 0;
  do
  {
    v4 = v3 + 1;
    if (v3 == -1)
    {
      __break(1u);
      return result;
    }
    v2 *= 2;
    ++v3;
  }
  while (v2 < result);
  if (v4 > 0x3F)
    return 0;
  else
    return *(_QWORD *)(v1 + 24) << v4;
}

Swift::String __swiftcall LogLevelStrategy.idForLevelStrategy()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = 0x6874697261676F6CLL;
  v1 = (void *)0xEE0030765F63696DLL;
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

Swift::UInt64 __swiftcall LogLevelStrategy.getLevel0BloomFilterSizeBits()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

Swift::UInt64 __swiftcall LogLevelStrategy.getLevel0MaxTerms()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

Swift::UInt64 __swiftcall LogLevelStrategy.getLevelCapacity()()
{
  return -1;
}

uint64_t LogLevelStrategy.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t LogLevelStrategy.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_244B3A34C(unint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t i;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  if (v2 >= result)
    return 0;
  for (i = 0; ; ++i)
  {
    v4 = i + 1;
    if (i == -1)
      break;
    v2 *= 2;
    if (v2 >= result)
      return v4;
  }
  __break(1u);
  return result;
}

Swift::UInt64 sub_244B3A38C(Swift::UInt64 a1)
{
  return LogLevelStrategy.bloomFilterSizeForLevel(_:)(a1);
}

Swift::UInt64 sub_244B3A3AC(Swift::UInt64 a1)
{
  return LogLevelStrategy.bloomFilterSizeForNumTerms(_:)(a1);
}

uint64_t sub_244B3A3CC()
{
  return 0x6874697261676F6CLL;
}

uint64_t sub_244B3A3F0()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 24);
}

uint64_t sub_244B3A3FC()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16);
}

uint64_t sub_244B3A408()
{
  return -1;
}

uint64_t type metadata accessor for LogLevelStrategy()
{
  return objc_opt_self();
}

void *MaskedBloomFilterAlgorithm.kDefaultNumHashes.unsafeMutableAddressor()
{
  return &static MaskedBloomFilterAlgorithm.kDefaultNumHashes;
}

int8x16_t *MaskedBloomFilterAlgorithm.mask(bitArray:)(int8x16_t *result, uint64_t a2)
{
  unint64_t v2;
  int8x16_t *v3;
  int8x16_t *v4;
  char *v5;

  v2 = result[1].u64[0];
  if (v2 >> 60)
  {
    __break(1u);
  }
  else
  {
    v3 = result;
    v4 = (int8x16_t *)sub_244B3A58C(8 * v2, a2);
    v5 = BitArray.xor(_:)(v3, v4);
    swift_bridgeObjectRelease();
    return (int8x16_t *)v5;
  }
  return result;
}

uint64_t MaskedBloomFilterAlgorithm.match(maskedBitArray:selectedIndexes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;

  result = sub_244B3A808(a2, a3);
  v6 = *(_QWORD *)(a2 + 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)(a1 + 16);
    while (!(v8 >> 60))
    {
      if (v7 >= 8 * v8)
      {
        v9 = 0;
      }
      else
      {
        if (v7 >> 3 >= v8)
          goto LABEL_18;
        v9 = (*(unsigned __int8 *)(a1 + 32 + (v7 >> 3)) >> (v7 & 7)) & 1;
      }
      v10 = *(_QWORD *)(result + 16);
      if (v10 >> 60)
        goto LABEL_17;
      if (v7 >= 8 * v10)
      {
        if ((v9 & 1) == 0)
          goto LABEL_14;
      }
      else
      {
        if (v7 >> 3 >= v10)
          goto LABEL_19;
        if (((v9 ^ (((*(unsigned __int8 *)(result + 32 + (v7 >> 3)) >> (v7 & 7)) & 1) == 0)) & 1) != 0)
        {
LABEL_14:
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      if (v6 == ++v7)
        goto LABEL_15;
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return 1;
  }
  return result;
}

uint64_t static MaskedBloomFilterAlgorithm.kDefaultNumHashes.getter()
{
  return 16;
}

uint64_t sub_244B3A58C(uint64_t a1, uint64_t a2)
{
  _QWORD *inited;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  size_t dataOutAvailable;
  size_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  size_t v22[11];

  v22[10] = *MEMORY[0x24BDAC8D0];
  type metadata accessor for AESCounterRandomNumberGenerator();
  inited = (_QWORD *)swift_initStackObject();
  inited[2] = a2;
  inited[3] = 0;
  v20 = a2;
  swift_bridgeObjectRetain();
  v5 = (_QWORD *)sub_244B45274();
  v5[2] = 16;
  v5[4] = 0;
  v5[5] = 0;
  inited[4] = v5;
  v21 = inited;
  inited[5] = MEMORY[0x24BEE4AF8];
  v6 = a1 + 8;
  if (__OFADD__(a1, 8))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v7 = a1 + 7;
  if (v6 < 1)
    v7 = a1 + 14;
  v8 = v7 >> 3;
  v9 = sub_244B1EFFC(0, v7 >> 3);
  v10 = (_QWORD *)sub_244B45274();
  v10[2] = 16;
  v10[4] = 0;
  v10[5] = 0;
  if (v6 < -6)
LABEL_19:
    __break(1u);
  v11 = v10;
  if ((unint64_t)(v6 + 6) >= 0xF)
  {
    swift_beginAccess();
    v13 = 0;
    v19 = v8;
    while (1)
    {
      v14 = v13 & 0xF;
      if ((v13 & 0xF) == 0)
      {
        swift_bridgeObjectRelease();
        AESCounterRandomNumberGenerator.incrementCounter()();
        v15 = v21[4];
        swift_bridgeObjectRetain();
        v11 = (_QWORD *)sub_244B45274();
        v11[2] = 16;
        v11[5] = 0;
        v11[4] = 0;
        v22[0] = 16;
        dataOutAvailable = *(_QWORD *)(v20 + 16);
        v17 = *(_QWORD *)(v15 + 16);
        swift_bridgeObjectRetain();
        CCCrypt(0, 0, 2u, (const void *)(v20 + 32), dataOutAvailable, 0, (const void *)(v15 + 32), v17, v11 + 4, dataOutAvailable, v22);
        swift_bridgeObjectRelease();
        v8 = v19;
        swift_bridgeObjectRelease();
      }
      if (v14 >= v11[2])
        break;
      v18 = *((_BYTE *)v11 + v14 + 32);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v9 = (uint64_t)sub_244B1F91C(v9);
      if (v13 >= *(_QWORD *)(v9 + 16))
        goto LABEL_17;
      *(_BYTE *)(v9 + v13++ + 32) = v18;
      if (v8 == v13)
        goto LABEL_6;
    }
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
LABEL_6:
  swift_release();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_244B3A808(uint64_t a1, uint64_t a2)
{
  _QWORD *inited;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  uint64_t v11;
  Swift::Int v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  size_t dataOutAvailable;
  unint64_t v22;
  size_t v23;
  size_t v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned int v33;
  uint64_t v34;
  size_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  Swift::Int v40;
  uint64_t v41;
  size_t v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  type metadata accessor for AESCounterRandomNumberGenerator();
  inited = (_QWORD *)swift_initStackObject();
  inited[2] = a2;
  inited[3] = 0;
  swift_bridgeObjectRetain();
  v5 = (_QWORD *)sub_244B45274();
  v5[2] = 16;
  v5[4] = 0;
  v5[5] = 0;
  v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  inited[4] = v5;
  inited[5] = v6;
  v7 = sub_244B38D94(v6);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = v8 + 8;
  if (__OFADD__(v8, 8))
    goto LABEL_26;
  v10 = v7;
  v36 = (unint64_t)(v8 + 7) >> 3;
  v11 = sub_244B1EFFC(0, v36);
  v43 = v11;
  if (v8)
  {
    v12 = 0;
    v37 = v8;
    v38 = a1 + 32;
    do
    {
      v40 = v12;
      v14 = *(_QWORD *)(v38 + 8 * v12);
      v15 = v14 + 127;
      v41 = v14;
      if (v14 >= 0)
        v15 = v14;
      v16 = v15 >> 7;
      if (!*(_QWORD *)(v10 + 16) || (sub_244B35EC0(v16), (v17 & 1) == 0))
      {
        v18 = sub_244B1FD68(v16 + 1);
        v39 = v16;
        v19 = (_QWORD *)sub_244B45274();
        v19[2] = 16;
        v19[5] = 0;
        v19[4] = 0;
        v42 = 16;
        v20 = inited[2];
        dataOutAvailable = *(_QWORD *)(v20 + 16);
        v22 = v9;
        v23 = *(_QWORD *)(v18 + 16);
        swift_bridgeObjectRetain();
        v24 = v23;
        v9 = v22;
        CCCrypt(0, 0, 2u, (const void *)(v20 + 32), dataOutAvailable, 0, (const void *)(v18 + 32), v24, v19 + 4, dataOutAvailable, &v42);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v42 = v10;
        v26 = (uint64_t)v19;
        v16 = v39;
        sub_244B384D0(v26, v39, isUniquelyReferenced_nonNull_native);
        v10 = v42;
        swift_bridgeObjectRelease();
      }
      if (*(_QWORD *)(v10 + 16) && (v27 = sub_244B35EC0(v16), (v28 & 1) != 0))
      {
        v29 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v27);
        swift_bridgeObjectRetain();
        v30 = v41;
      }
      else
      {
        v29 = MEMORY[0x24BEE4AF8];
        v30 = v41;
        if (v9 >= 9)
        {
          v29 = sub_244B45274();
          *(_QWORD *)(v29 + 16) = v36;
          bzero((void *)(v29 + 32), v36);
        }
      }
      v31 = v30 - (v16 << 7);
      if ((v31 & 0x8000000000000000) != 0)
        goto LABEL_4;
      v32 = *(_QWORD *)(v29 + 16);
      if (v32 >> 60)
      {
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
      }
      if (v31 >= 8 * v32)
      {
LABEL_4:
        swift_bridgeObjectRelease();
        LOBYTE(v13) = 0;
      }
      else
      {
        if (v31 >> 3 >= v32)
          goto LABEL_25;
        v33 = *(unsigned __int8 *)(v29 + (v31 >> 3) + 32);
        swift_bridgeObjectRelease();
        v13 = (v33 >> (v31 & 7)) & 1;
      }
      BitArray.setBit(_:_:)(v40, v13);
      v12 = v40 + 1;
    }
    while (v37 != v40 + 1);
    swift_release();
    v34 = v43;
  }
  else
  {
    v34 = v11;
    swift_release();
  }
  swift_bridgeObjectRelease();
  return v34;
}

uint64_t sub_244B3AB2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD v21[6];
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  CC_SHA256_CTX c;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = type metadata accessor for Logger();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_244B44EC0();
  v21[5] = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v21[4] = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_244B4516C();
  v24 = *(_QWORD *)(v8 - 8);
  v25 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(&c, 0, sizeof(c));
  swift_bridgeObjectRetain();
  CC_SHA256_Init(&c);
  v11 = *(_QWORD *)(a1 + 16);
  if (HIDWORD(v11))
  {
LABEL_13:
    sub_244B454A8();
    __break(1u);
    JUMPOUT(0x244B3AFDCLL);
  }
  CC_SHA256_Update(&c, (const void *)(a1 + 32), v11);
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 16);
  if (v12)
  {
    swift_bridgeObjectRetain();
    v21[1] = a2;
    v13 = a2 + 40;
    v23 = 0x8000000244B47D20;
    v21[3] = v4;
    v21[2] = v6;
    do
    {
      swift_bridgeObjectRetain();
      sub_244B45160();
      sub_244B45148();
      v15 = v14;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v25);
      if (v15 >> 60 != 15)
        __asm { BR              X9 }
      if (qword_2573DBB88 != -1)
        swift_once();
      v16 = __swift_project_value_buffer(v4, (uint64_t)qword_2573DCF48);
      sub_244B2E774(v16, (uint64_t)v6);
      v26 = 0;
      v27 = 0xE000000000000000;
      sub_244B45430();
      swift_bridgeObjectRelease();
      v26 = 0x5B20676E69727453;
      v27 = 0xE800000000000000;
      sub_244B451E4();
      sub_244B451E4();
      sub_244B390F4(2, v26);
      swift_bridgeObjectRelease();
      sub_244B2EB40((uint64_t)v6);
      v17 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRelease();
      v18 = *(_QWORD *)(v17 + 16);
      if (HIDWORD(v18))
        goto LABEL_13;
      v13 += 16;
      CC_SHA256_Update(&c, (const void *)(v17 + 32), v18);
      swift_bridgeObjectRelease();
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
  }
  v19 = sub_244B45274();
  *(_QWORD *)(v19 + 16) = 32;
  *(_OWORD *)(v19 + 48) = 0u;
  *(_OWORD *)(v19 + 32) = 0u;
  CC_SHA256_Final((unsigned __int8 *)(v19 + 32), &c);
  return v19;
}

uint64_t _s17PrivateSearchCore26MaskedBloomFilterAlgorithmV6secret11documentKey13levelStrategy05bloomF7NumBitsAcA16HashedUserSecretV_0aB9Protocols08DocumentJ0VAA05LevelL0_pSitcfC_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD20);
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 32) = a2;
  *(_OWORD *)(inited + 16) = xmmword_244B45A10;
  *(_QWORD *)(inited + 40) = a3;
  *(_QWORD *)(inited + 48) = a4;
  *(_QWORD *)(inited + 56) = a5;
  v13 = a6[3];
  v14 = a6[4];
  __swift_project_boxed_opaque_existential_1(a6, v13);
  v15 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19 = v15(v13, v14);
  v20 = v16;
  sub_244B451E4();
  sub_244B454F0();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 64) = v19;
  *(_QWORD *)(inited + 72) = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = sub_244B3AB2C(a1, inited);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_arrayDestroy();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a6);
  return v17;
}

ValueMetadata *type metadata accessor for MaskedBloomFilterAlgorithm()
{
  return &type metadata for MaskedBloomFilterAlgorithm;
}

uint64_t sub_244B3B160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v27 = a3;
  v28 = a4;
  v26 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868);
  v6 = *(_QWORD *)(v5 - 8);
  v24 = v5;
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v25 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD40);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_244B452BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v5);
  v16 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = (v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = (*(unsigned __int8 *)(v6 + 80) + v17 + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = 0;
  *(_QWORD *)(v19 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19 + v16, v11, v8);
  v20 = (_QWORD *)(v19 + v17);
  v21 = v28;
  *v20 = v27;
  v20[1] = v21;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v19 + v18, v25, v24);
  swift_retain();
  sub_244B3B958((uint64_t)v14, (uint64_t)&unk_2573DCE80, v19);
  return swift_release();
}

uint64_t sub_244B3B348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[28] = a6;
  v7[29] = a7;
  v7[26] = a4;
  v7[27] = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC880);
  v7[30] = v8;
  v7[31] = *(_QWORD *)(v8 - 8);
  v7[32] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCC00);
  v7[33] = v9;
  v7[34] = *(_QWORD *)(v9 - 8);
  v7[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B3B3DC()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788);
  sub_244B45310();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 288) = v1;
  *v1 = v0;
  v1[1] = sub_244B3B46C;
  return sub_244B4531C();
}

uint64_t sub_244B3B46C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B3B4D0()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 24);
  if (v1)
  {
    v2 = *(int **)(v0 + 216);
    v3 = *(_QWORD *)(v0 + 56);
    v4 = *(_QWORD *)(v0 + 32);
    *(_QWORD *)(v0 + 64) = *(_QWORD *)(v0 + 16);
    *(_QWORD *)(v0 + 72) = v1;
    *(_QWORD *)(v0 + 80) = v4;
    *(_OWORD *)(v0 + 88) = *(_OWORD *)(v0 + 40);
    *(_QWORD *)(v0 + 104) = v3;
    v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v2 + *v2);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 296) = v5;
    *v5 = v0;
    v5[1] = sub_244B3B6B0;
    return v7(v0 + 144, v0 + 64);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 8))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 264));
    *(_QWORD *)(v0 + 200) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868);
    sub_244B452F8();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_244B3B5CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 192);
  *(_QWORD *)(v0 + 184) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBD38);
  v2 = sub_244B454FC();
  if (v2)
  {
    v3 = v2;
    MEMORY[0x24951FEEC](v1);
  }
  else
  {
    v3 = swift_allocError();
    *v4 = *(_QWORD *)(v0 + 184);
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 8))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 264));
  *(_QWORD *)(v0 + 176) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868);
  sub_244B452F8();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B3B6B0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B3B714()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[19];
  if (v1)
  {
    v2 = v0[18];
    v0[14] = v2;
    v4 = v0[31];
    v3 = v0[32];
    v5 = v0[30];
    v6 = v0[20];
    v7 = v0[21];
    v0[15] = v1;
    v0[16] = v6;
    v0[17] = v7;
    sub_244B3C930(v2, v1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868);
    sub_244B452EC();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_244B3C960(v0[18], v0[19]);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)swift_task_alloc();
  v0[39] = v8;
  *v8 = v0;
  v8[1] = sub_244B3B8F4;
  return sub_244B4531C();
}

uint64_t sub_244B3B858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 272);
  v1 = *(_QWORD *)(v0 + 280);
  v3 = *(_QWORD *)(v0 + 264);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  *(_QWORD *)(v0 + 176) = *(_QWORD *)(v0 + 304);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868);
  sub_244B452F8();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B3B8F4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B3B958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_244B452BC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_244B452B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_244B32D4C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_244B45298();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t PlainBloomFilterIndexer.__allocating_init(reader:writer:secret:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = swift_allocObject();
  sub_244B2D524(a1, v6 + 16);
  sub_244B2D524(a2, v6 + 56);
  v7 = sub_244B45274();
  *(_QWORD *)(v7 + 16) = 0x2000;
  bzero((void *)(v7 + 32), 0x2000uLL);
  v8 = sub_244B2C52C(16, a3);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(_QWORD *)(v6 + 96) = v8;
  *(_QWORD *)(v6 + 104) = v7;
  return v6;
}

uint64_t PlainBloomFilterIndexer.init(reader:writer:secret:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;

  sub_244B2D524(a1, v3 + 16);
  sub_244B2D524(a2, v3 + 56);
  v7 = sub_244B45274();
  *(_QWORD *)(v7 + 16) = 0x2000;
  bzero((void *)(v7 + 32), 0x2000uLL);
  v8 = sub_244B2C52C(16, a3);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(_QWORD *)(v3 + 96) = v8;
  *(_QWORD *)(v3 + 104) = v7;
  return v3;
}

uint64_t PlainBloomFilterIndexer.search(token:context:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  _OWORD v32[2];
  _QWORD v33[7];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC780);
  v30 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v31 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = _s17PrivateSearchCore11BloomFilterV4hash5tokenSays6UInt64VGSS_tF_0(a1, a2, v3[12]);
  v14 = *(_QWORD *)(result + 16);
  if (__OFADD__(v14, 8))
  {
    __break(1u);
  }
  else
  {
    v15 = result;
    v26 = v7;
    v27 = v10;
    v28 = v9;
    v29 = a3;
    v16 = sub_244B1EFFC(0, (unint64_t)(v14 + 7) >> 3);
    v17 = BitArray.setRange(startBit:endBit:)(0, v14, v16);
    swift_bridgeObjectRelease();
    v18 = v3[5];
    v19 = v3[6];
    __swift_project_boxed_opaque_existential_1(v3 + 2, v18);
    v20 = type metadata accessor for CallContextImpl();
    memset(v32, 0, sizeof(v32));
    v21 = swift_allocObject();
    *(_OWORD *)(v21 + 32) = 0u;
    *(_OWORD *)(v21 + 16) = 0u;
    swift_beginAccess();
    sub_244B2CA74((uint64_t)v32, v21 + 16);
    swift_endAccess();
    v33[3] = v20;
    v33[4] = &protocol witness table for CallContextImpl;
    v33[0] = v21;
    v22 = v33[6];
    (*(void (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(v19 + 8))(v15, v33, v18, v19);
    if (v22)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
    }
    else
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
      v23 = swift_allocObject();
      *(_QWORD *)(v23 + 16) = v17;
      v24 = MEMORY[0x24BDAC7A8](v23);
      *(&v25 - 4) = (uint64_t)v12;
      *(&v25 - 3) = (uint64_t)&unk_2573DCDA0;
      *(&v25 - 2) = v24;
      (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v31, *MEMORY[0x24BEE6CA0], v26);
      sub_244B45340();
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v12, v28);
    }
  }
  return result;
}

uint64_t sub_244B3BEB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a3;
  *(_OWORD *)(v3 + 32) = *(_OWORD *)a2;
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(a2 + 24);
  return swift_task_switch();
}

uint64_t sub_244B3BEE4()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _OWORD *v9;

  result = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(result + 16);
  if (v2 >> 60)
  {
    __break(1u);
    goto LABEL_9;
  }
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4 >> 60)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  if (v2 == v4 && sub_244B2B9D4(result, v3))
  {
    v5 = *(_QWORD *)(v0 + 48);
    v6 = *(_QWORD *)(v0 + 56);
    v7 = *(_QWORD *)(v0 + 40);
    v8 = *(_QWORD **)(v0 + 16);
    *v8 = *(_QWORD *)(v0 + 32);
    v8[1] = v7;
    v8[2] = v5;
    v8[3] = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v9 = *(_OWORD **)(v0 + 16);
    *v9 = 0u;
    v9[1] = 0u;
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PlainBloomFilterIndexer.index(key:tokens:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[20] = a5;
  v6[21] = v5;
  v6[18] = a3;
  v6[19] = a4;
  v6[16] = a1;
  v6[17] = a2;
  return swift_task_switch();
}

uint64_t sub_244B3BF98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v1 + 104);
  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v1 + 96);
  v3 = *(_QWORD *)(v0 + 160);
  *(_QWORD *)(v0 + 120) = v2;
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v5 = v3 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_244B2C254();
      swift_bridgeObjectRelease();
      v5 += 16;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    v2 = *(_QWORD *)(v0 + 120);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  *(_QWORD *)(v0 + 176) = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v2 + 16);
  result = swift_bridgeObjectRelease();
  if (!(v6 >> 60))
  {
    v8 = *(_QWORD **)(v0 + 168);
    v9 = v8[11];
    __swift_project_boxed_opaque_existential_1(v8 + 7, v8[10]);
    v10 = type metadata accessor for CallContextImpl();
    *(_OWORD *)(v0 + 72) = 0u;
    *(_OWORD *)(v0 + 56) = 0u;
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 32) = 0u;
    *(_OWORD *)(v11 + 16) = 0u;
    swift_beginAccess();
    sub_244B2CA74(v0 + 56, v11 + 16);
    swift_endAccess();
    *(_QWORD *)(v0 + 40) = v10;
    *(_QWORD *)(v0 + 48) = &protocol witness table for CallContextImpl;
    *(_QWORD *)(v0 + 16) = v11;
    v13 = **(int **)(v9 + 8) + *(_QWORD *)(v9 + 8);
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v12;
    *v12 = v0;
    v12[1] = sub_244B3C180;
    __asm { BR              X8 }
  }
  __break(1u);
  return result;
}

uint64_t sub_244B3C180()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 192) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_244B3C1FC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B3C208()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PlainBloomFilterIndexer.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PlainBloomFilterIndexer.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_244B3C2BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return PlainBloomFilterIndexer.search(token:context:)(a1, a2, a3);
}

uint64_t sub_244B3C2DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v12;
  _QWORD *v13;

  v12 = *v5;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_244B21254;
  v13[20] = a5;
  v13[21] = v12;
  v13[18] = a3;
  v13[19] = a4;
  v13[16] = a1;
  v13[17] = a2;
  return swift_task_switch();
}

uint64_t sub_244B3C368(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_244B3C3CC;
  return v6(a1);
}

uint64_t sub_244B3C3CC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_244B3C418()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_244B3C43C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(v2 + 16);
  v7 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *(_QWORD *)v7 = v3;
  *(_QWORD *)(v7 + 8) = sub_244B21254;
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = v6;
  *(_OWORD *)(v7 + 32) = *(_OWORD *)a2;
  *(_QWORD *)(v7 + 48) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(v7 + 56) = *(_OWORD *)(a2 + 24);
  return swift_task_switch();
}

uint64_t sub_244B3C4C4(uint64_t a1)
{
  uint64_t *v1;

  return sub_244B3B160(a1, v1[2], v1[3], v1[4]);
}

uint64_t type metadata accessor for PlainBloomFilterIndexer()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for PlainBloomFilterIndexer.PlainBloomFilterError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PlainBloomFilterIndexer.PlainBloomFilterError()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for PlainBloomFilterIndexer.PlainBloomFilterError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for PlainBloomFilterIndexer.PlainBloomFilterError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for PlainBloomFilterIndexer.PlainBloomFilterError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PlainBloomFilterIndexer.PlainBloomFilterError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PlainBloomFilterIndexer.PlainBloomFilterError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_244B3C6C8()
{
  return 0;
}

ValueMetadata *type metadata accessor for PlainBloomFilterIndexer.PlainBloomFilterError()
{
  return &type metadata for PlainBloomFilterIndexer.PlainBloomFilterError;
}

uint64_t sub_244B3C6E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_244B3C7BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573DC788) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573DC868) - 8) + 80);
  v8 = (v6 + v7 + 16) & ~v7;
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v11 = v1 + v5;
  v12 = v1 + v6;
  v13 = *(_QWORD *)(v1 + v6);
  v14 = *(_QWORD *)(v12 + 8);
  v15 = v1 + v8;
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v16;
  *v16 = v2;
  v16[1] = sub_244B21254;
  return sub_244B3B348(a1, v9, v10, v11, v13, v14, v15);
}

uint64_t sub_244B3C89C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244B3C8C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_244B3C990;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2573DCE88 + dword_2573DCE88))(a1, v4);
}

uint64_t sub_244B3C930(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_244B3C960(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

ValueMetadata *type metadata accessor for RandomNumberGeneratorSeed()
{
  return &type metadata for RandomNumberGeneratorSeed;
}

uint64_t static SearchIndexStoreError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t SearchIndexStoreError.hash(into:)()
{
  return sub_244B4558C();
}

uint64_t SearchIndexStoreError.hashValue.getter()
{
  sub_244B45580();
  sub_244B4558C();
  return sub_244B45598();
}

uint64_t sub_244B3CA18()
{
  return 1;
}

uint64_t sub_244B3CA20()
{
  sub_244B45580();
  sub_244B4558C();
  return sub_244B45598();
}

uint64_t sub_244B3CA60()
{
  return sub_244B4558C();
}

uint64_t sub_244B3CA84()
{
  sub_244B45580();
  sub_244B4558C();
  return sub_244B45598();
}

unint64_t sub_244B3CAC4()
{
  unint64_t result;

  result = qword_2573DCE98;
  if (!qword_2573DCE98)
  {
    result = MEMORY[0x24951FF40](&protocol conformance descriptor for SearchIndexStoreError, &type metadata for SearchIndexStoreError);
    atomic_store(result, (unint64_t *)&qword_2573DCE98);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SearchIndexStoreError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for SearchIndexStoreError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_244B3CB9C + 4 * asc_244B46940[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_244B3CBBC + 4 * byte_244B46945[v4]))();
}

_BYTE *sub_244B3CB9C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_244B3CBBC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244B3CBC4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244B3CBCC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244B3CBD4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244B3CBDC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SearchIndexStoreError()
{
  return &type metadata for SearchIndexStoreError;
}

uint64_t sub_244B3CBFC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t result;

  v0 = sub_244B45274();
  *(_QWORD *)(v0 + 16) = 20;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_DWORD *)(v0 + 48) = 0;
  v1 = String.toUtf8Bytes()();
  v2 = sub_244B451C0();
  if ((v2 & 0x8000000000000000) != 0 || HIDWORD(v2))
  {
    result = sub_244B454A8();
    __break(1u);
  }
  else
  {
    CC_SHA1((const void *)(v1 + 32), v2, (unsigned __int8 *)(v0 + 32));
    swift_bridgeObjectRelease();
    return v0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Sha1()
{
  return &type metadata for Sha1;
}

const char *Sha256.kDigestsizeBytes.unsafeMutableAddressor()
{
  return " ";
}

uint64_t static Sha256.kDigestsizeBytes.getter()
{
  return 32;
}

uint64_t _s17PrivateSearchCore6Sha256V4hashySays5UInt8VGAGFZ_0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = sub_244B45274();
  *(_QWORD *)(v2 + 16) = 32;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  v3 = *(_QWORD *)(a1 + 16);
  if (HIDWORD(v3))
  {
    result = sub_244B454A8();
    __break(1u);
  }
  else
  {
    v4 = v2;
    CC_SHA256((const void *)(a1 + 32), v3, (unsigned __int8 *)(v2 + 32));
    return v4;
  }
  return result;
}

ValueMetadata *type metadata accessor for Sha256()
{
  return &type metadata for Sha256;
}

void *SizeOf.kUInt8.unsafeMutableAddressor()
{
  return &static SizeOf.kUInt8;
}

void *SizeOf.kUInt32.unsafeMutableAddressor()
{
  return &static SizeOf.kUInt32;
}

void *SizeOf.kUInt64.unsafeMutableAddressor()
{
  return &static SizeOf.kUInt64;
}

uint64_t static SizeOf.kUInt8.getter()
{
  return 1;
}

uint64_t static SizeOf.kUInt32.getter()
{
  return 4;
}

uint64_t static SizeOf.kUInt64.getter()
{
  return 8;
}

ValueMetadata *type metadata accessor for SizeOf()
{
  return &type metadata for SizeOf;
}

uint64_t static Stopwatch.start()()
{
  uint64_t v0;
  uint64_t v1;

  type metadata accessor for Stopwatch();
  v0 = swift_allocObject();
  _s17PrivateSearchCore9TimestampV3nowACyFZ_0();
  *(_QWORD *)(v0 + 16) = v1;
  return v0;
}

uint64_t type metadata accessor for Stopwatch()
{
  return objc_opt_self();
}

Swift::Int64 Stopwatch.elapsed()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  Swift::Int64 result;

  _s17PrivateSearchCore9TimestampV3nowACyFZ_0();
  v1 = *(_QWORD *)(v0 + 16);
  v3 = __OFSUB__(v2, v1);
  result = v2 - v1;
  if (!v3)
    return TimeUnit.from(millis:secs:mins:hours:days:weeks:)(result, 0, 0, 0, 0, 0);
  __break(1u);
  return result;
}

uint64_t Stopwatch.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Stopwatch.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t String.toUtf8Bytes()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;

  v0 = type metadata accessor for Logger();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_244B4516C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244B45160();
  v7 = sub_244B45148();
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v9 >> 60 == 15)
  {
    if (qword_2573DBB88 != -1)
      swift_once();
    v10 = __swift_project_value_buffer(v0, (uint64_t)qword_2573DCF48);
    sub_244B2E774(v10, (uint64_t)v2);
    v14 = 0;
    v15 = 0xE000000000000000;
    sub_244B45430();
    swift_bridgeObjectRelease();
    v14 = 0x5B20676E69727453;
    v15 = 0xE800000000000000;
    sub_244B451E4();
    sub_244B451E4();
    sub_244B390F4(2, v14);
    swift_bridgeObjectRelease();
    sub_244B2EB40((uint64_t)v2);
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    sub_244B2E2B4(v7, v9);
    sub_244B2E14C(v7, v9);
    v11 = v12;
    sub_244B36AB8(v7, v9);
    sub_244B36AB8(v7, v9);
  }
  return v11;
}

uint64_t sub_244B3D10C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];

  v0 = type metadata accessor for Logger();
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (_QWORD *)((char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_allocate_value_buffer(v1, qword_2573DCF48);
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_2573DCF48);
  v7[1] = MEMORY[0x24BEE0D00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DCFF8);
  *v3 = sub_244B45178();
  v3[1] = v5;
  swift_bridgeObjectRetain();
  sub_244B450B8();
  return sub_244B2ECE4((uint64_t)v3, v4);
}

uint64_t sub_244B3D208()
{
  return swift_deallocClassInstance();
}

uint64_t _s18ExtensionConstantsCMa()
{
  return objc_opt_self();
}

uint64_t TestDataBundle.indexingData.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD000);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TestDataBundle(0);
  sub_244B26C8C(v1 + *(int *)(v6 + 20), (uint64_t)v5, &qword_2573DD000);
  v7 = type metadata accessor for TestDataBundle.IndexingData(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    return sub_244B26BC8((uint64_t)v5, (uint64_t)a1, type metadata accessor for TestDataBundle.IndexingData);
  *a1 = MEMORY[0x24BEE4AF8];
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  return sub_244B2AE28((uint64_t)v5, &qword_2573DD000);
}

uint64_t TestDataBundle.IndexingData.init()@<X0>(_QWORD *a1@<X8>)
{
  return sub_244B3D70C((void (*)(_QWORD))type metadata accessor for TestDataBundle.IndexingData, a1);
}

uint64_t type metadata accessor for TestDataBundle(uint64_t a1)
{
  return sub_244B22F38(a1, (uint64_t *)&unk_2573DD108);
}

uint64_t type metadata accessor for TestDataBundle.IndexingData(uint64_t a1)
{
  return sub_244B22F38(a1, qword_2573DD1B0);
}

uint64_t TestDataBundle.indexingData.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TestDataBundle(0) + 20);
  sub_244B2AE28(v3, &qword_2573DD000);
  sub_244B26BC8(a1, v3, type metadata accessor for TestDataBundle.IndexingData);
  v4 = type metadata accessor for TestDataBundle.IndexingData(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 0, 1, v4);
}

void (*TestDataBundle.indexingData.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD000);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = type metadata accessor for TestDataBundle.IndexingData(0);
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for TestDataBundle(0) + 20);
  *((_DWORD *)v3 + 12) = v10;
  sub_244B26C8C(v1 + v10, (uint64_t)v5, &qword_2573DD000);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    *v9 = MEMORY[0x24BEE4AF8];
    _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    sub_244B2AE28((uint64_t)v5, &qword_2573DD000);
  }
  else
  {
    sub_244B26BC8((uint64_t)v5, (uint64_t)v9, type metadata accessor for TestDataBundle.IndexingData);
  }
  return sub_244B3D4F4;
}

void sub_244B3D4F4(uint64_t a1, char a2)
{
  sub_244B3D910(a1, a2, &qword_2573DD000, type metadata accessor for TestDataBundle.IndexingData);
}

BOOL TestDataBundle.hasIndexingData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD000);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TestDataBundle(0);
  sub_244B26C8C(v0 + *(int *)(v4 + 20), (uint64_t)v3, &qword_2573DD000);
  v5 = type metadata accessor for TestDataBundle.IndexingData(0);
  v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_244B2AE28((uint64_t)v3, &qword_2573DD000);
  return v6;
}

Swift::Void __swiftcall TestDataBundle.clearIndexingData()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for TestDataBundle(0) + 20);
  sub_244B2AE28(v1, &qword_2573DD000);
  v2 = type metadata accessor for TestDataBundle.IndexingData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t TestDataBundle.searchingData.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD008);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TestDataBundle(0);
  sub_244B26C8C(v1 + *(int *)(v6 + 24), (uint64_t)v5, &qword_2573DD008);
  v7 = type metadata accessor for TestDataBundle.SearchingData(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    return sub_244B26BC8((uint64_t)v5, (uint64_t)a1, type metadata accessor for TestDataBundle.SearchingData);
  *a1 = MEMORY[0x24BEE4AF8];
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  return sub_244B2AE28((uint64_t)v5, &qword_2573DD008);
}

uint64_t TestDataBundle.SearchingData.init()@<X0>(_QWORD *a1@<X8>)
{
  return sub_244B3D70C((void (*)(_QWORD))type metadata accessor for TestDataBundle.SearchingData, a1);
}

uint64_t sub_244B3D70C@<X0>(void (*a1)(_QWORD)@<X0>, _QWORD *a2@<X8>)
{
  *a2 = MEMORY[0x24BEE4AF8];
  a1(0);
  return _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t type metadata accessor for TestDataBundle.SearchingData(uint64_t a1)
{
  return sub_244B22F38(a1, qword_2573DD2D8);
}

uint64_t TestDataBundle.searchingData.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TestDataBundle(0) + 24);
  sub_244B2AE28(v3, &qword_2573DD008);
  sub_244B26BC8(a1, v3, type metadata accessor for TestDataBundle.SearchingData);
  v4 = type metadata accessor for TestDataBundle.SearchingData(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 0, 1, v4);
}

void (*TestDataBundle.searchingData.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD008);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = type metadata accessor for TestDataBundle.SearchingData(0);
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for TestDataBundle(0) + 24);
  *((_DWORD *)v3 + 12) = v10;
  sub_244B26C8C(v1 + v10, (uint64_t)v5, &qword_2573DD008);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    *v9 = MEMORY[0x24BEE4AF8];
    _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    sub_244B2AE28((uint64_t)v5, &qword_2573DD008);
  }
  else
  {
    sub_244B26BC8((uint64_t)v5, (uint64_t)v9, type metadata accessor for TestDataBundle.SearchingData);
  }
  return sub_244B3D8FC;
}

void sub_244B3D8FC(uint64_t a1, char a2)
{
  sub_244B3D910(a1, a2, &qword_2573DD008, type metadata accessor for TestDataBundle.SearchingData);
}

void sub_244B3D910(uint64_t a1, char a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v6 = *(void **)a1;
  v7 = *(int *)(*(_QWORD *)a1 + 48);
  v8 = *(void **)(*(_QWORD *)a1 + 32);
  v9 = *(void **)(*(_QWORD *)a1 + 40);
  v10 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v11 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v12 = *(void **)(*(_QWORD *)a1 + 8);
  v13 = **(_QWORD **)a1 + v7;
  if ((a2 & 1) != 0)
  {
    sub_244B26C0C(*(_QWORD *)(*(_QWORD *)a1 + 40), (uint64_t)v8, a4);
    sub_244B2AE28(v13, a3);
    sub_244B26BC8((uint64_t)v8, v13, a4);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
    sub_244B26C50((uint64_t)v9, a4);
  }
  else
  {
    sub_244B2AE28(**(_QWORD **)a1 + v7, a3);
    sub_244B26BC8((uint64_t)v9, v13, a4);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
  }
  free(v9);
  free(v8);
  free(v12);
  free(v6);
}

BOOL TestDataBundle.hasSearchingData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD008);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TestDataBundle(0);
  sub_244B26C8C(v0 + *(int *)(v4 + 24), (uint64_t)v3, &qword_2573DD008);
  v5 = type metadata accessor for TestDataBundle.SearchingData(0);
  v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_244B2AE28((uint64_t)v3, &qword_2573DD008);
  return v6;
}

Swift::Void __swiftcall TestDataBundle.clearSearchingData()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for TestDataBundle(0) + 24);
  sub_244B2AE28(v1, &qword_2573DD008);
  v2 = type metadata accessor for TestDataBundle.SearchingData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t (*TestDataBundle.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t TestDataBundle.IndexingData.documents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TestDataBundle.IndexingData.documents.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*TestDataBundle.IndexingData.documents.modify())()
{
  return nullsub_1;
}

uint64_t TestDataBundle.IndexingData.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B22CA4(type metadata accessor for TestDataBundle.IndexingData, a1);
}

uint64_t TestDataBundle.IndexingData.unknownFields.setter(uint64_t a1)
{
  return sub_244B22CFC(a1, type metadata accessor for TestDataBundle.IndexingData);
}

uint64_t (*TestDataBundle.IndexingData.unknownFields.modify())()
{
  type metadata accessor for TestDataBundle.IndexingData(0);
  return nullsub_1;
}

uint64_t TestDataBundle.IndexingData.Document.name.getter()
{
  return sub_244B3DFD8(type metadata accessor for TestDataBundle.IndexingData.Document);
}

uint64_t type metadata accessor for TestDataBundle.IndexingData.Document(uint64_t a1)
{
  return sub_244B22F38(a1, qword_2573DD240);
}

uint64_t TestDataBundle.IndexingData.Document.name.setter(uint64_t a1, uint64_t a2)
{
  return sub_244B3E04C(a1, a2, type metadata accessor for TestDataBundle.IndexingData.Document);
}

uint64_t (*TestDataBundle.IndexingData.Document.name.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_244B21758;
}

BOOL TestDataBundle.IndexingData.Document.hasName.getter()
{
  return sub_244B3E104(type metadata accessor for TestDataBundle.IndexingData.Document);
}

Swift::Void __swiftcall TestDataBundle.IndexingData.Document.clearName()()
{
  sub_244B3E140(type metadata accessor for TestDataBundle.IndexingData.Document);
}

uint64_t TestDataBundle.IndexingData.Document.body.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 24));
  if (v1[1])
    v2 = *v1;
  else
    v2 = 0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t TestDataBundle.IndexingData.Document.body.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 24));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TestDataBundle.IndexingData.Document.body.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_244B21758;
}

BOOL TestDataBundle.IndexingData.Document.hasBody.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 24) + 8) != 0;
}

Swift::Void __swiftcall TestDataBundle.IndexingData.Document.clearBody()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 24));
  swift_bridgeObjectRelease();
  *v1 = 0;
  v1[1] = 0;
}

uint64_t TestDataBundle.IndexingData.Document.path.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 28));
  if (v1[1])
    v2 = *v1;
  else
    v2 = 0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t TestDataBundle.IndexingData.Document.path.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 28));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TestDataBundle.IndexingData.Document.path.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 28);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_244B21758;
}

BOOL TestDataBundle.IndexingData.Document.hasPath.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 28) + 8) != 0;
}

Swift::Void __swiftcall TestDataBundle.IndexingData.Document.clearPath()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 28));
  swift_bridgeObjectRelease();
  *v1 = 0;
  v1[1] = 0;
}

uint64_t (*TestDataBundle.IndexingData.Document.unknownFields.modify())()
{
  return nullsub_1;
}

int *TestDataBundle.IndexingData.Document.init()@<X0>(uint64_t a1@<X8>)
{
  int *result;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;

  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  result = (int *)type metadata accessor for TestDataBundle.IndexingData.Document(0);
  v3 = (_QWORD *)(a1 + result[5]);
  *v3 = 0;
  v3[1] = 0;
  v4 = (_QWORD *)(a1 + result[6]);
  *v4 = 0;
  v4[1] = 0;
  v5 = (_QWORD *)(a1 + result[7]);
  *v5 = 0;
  v5[1] = 0;
  return result;
}

uint64_t (*TestDataBundle.SearchingData.tokens.modify())()
{
  return nullsub_1;
}

uint64_t TestDataBundle.SearchingData.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B22CA4(type metadata accessor for TestDataBundle.SearchingData, a1);
}

uint64_t TestDataBundle.SearchingData.unknownFields.setter(uint64_t a1)
{
  return sub_244B22CFC(a1, type metadata accessor for TestDataBundle.SearchingData);
}

uint64_t (*TestDataBundle.SearchingData.unknownFields.modify())()
{
  type metadata accessor for TestDataBundle.SearchingData(0);
  return nullsub_1;
}

uint64_t TestDataBundle.SearchingData.Token.token.getter()
{
  return sub_244B3DFD8(type metadata accessor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_244B3DFD8(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *(int *)(a1(0) + 20));
  if (v2[1])
    v3 = *v2;
  else
    v3 = 0;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t type metadata accessor for TestDataBundle.SearchingData.Token(uint64_t a1)
{
  return sub_244B22F38(a1, qword_2573DD368);
}

uint64_t TestDataBundle.SearchingData.Token.token.setter(uint64_t a1, uint64_t a2)
{
  return sub_244B3E04C(a1, a2, type metadata accessor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_244B3E04C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t result;

  v6 = (_QWORD *)(v3 + *(int *)(a3(0) + 20));
  result = swift_bridgeObjectRelease();
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*TestDataBundle.SearchingData.Token.token.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for TestDataBundle.SearchingData.Token(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_244B21758;
}

BOOL TestDataBundle.SearchingData.Token.hasToken.getter()
{
  return sub_244B3E104(type metadata accessor for TestDataBundle.SearchingData.Token);
}

BOOL sub_244B3E104(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1(0) + 20) + 8) != 0;
}

Swift::Void __swiftcall TestDataBundle.SearchingData.Token.clearToken()()
{
  sub_244B3E140(type metadata accessor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_244B3E140(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;

  v2 = (_QWORD *)(v1 + *(int *)(a1(0) + 20));
  result = swift_bridgeObjectRelease();
  *v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t TestDataBundle.SearchingData.Token.frequency.getter()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = (_BYTE *)(v0 + *(int *)(type metadata accessor for TestDataBundle.SearchingData.Token(0) + 24));
  if (v1[4])
    return 0;
  else
    return *(unsigned int *)v1;
}

uint64_t TestDataBundle.SearchingData.Token.frequency.setter(int a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for TestDataBundle.SearchingData.Token(0);
  v4 = v1 + *(int *)(result + 24);
  *(_DWORD *)v4 = a1;
  *(_BYTE *)(v4 + 4) = 0;
  return result;
}

uint64_t (*TestDataBundle.SearchingData.Token.frequency.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  int v4;

  *(_QWORD *)a1 = v1;
  v3 = *(int *)(type metadata accessor for TestDataBundle.SearchingData.Token(0) + 24);
  if (*(_BYTE *)(v1 + v3 + 4))
    v4 = 0;
  else
    v4 = *(_DWORD *)(v1 + v3);
  *(_DWORD *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 12) = v3;
  return sub_244B3E22C;
}

uint64_t sub_244B3E22C(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)result + *(int *)(result + 12);
  *(_DWORD *)v1 = *(_DWORD *)(result + 8);
  *(_BYTE *)(v1 + 4) = 0;
  return result;
}

BOOL TestDataBundle.SearchingData.Token.hasFrequency.getter()
{
  uint64_t v0;

  return (*(_BYTE *)(v0 + *(int *)(type metadata accessor for TestDataBundle.SearchingData.Token(0) + 24) + 4) & 1) == 0;
}

Swift::Void __swiftcall TestDataBundle.SearchingData.Token.clearFrequency()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(type metadata accessor for TestDataBundle.SearchingData.Token(0) + 24);
  *(_DWORD *)v1 = 0;
  *(_BYTE *)(v1 + 4) = 1;
}

uint64_t (*TestDataBundle.SearchingData.Token.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t TestDataBundle.SearchingData.Token.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;

  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  result = type metadata accessor for TestDataBundle.SearchingData.Token(0);
  v3 = (_QWORD *)(a1 + *(int *)(result + 20));
  *v3 = 0;
  v3[1] = 0;
  v4 = a1 + *(int *)(result + 24);
  *(_DWORD *)v4 = 0;
  *(_BYTE *)(v4 + 4) = 1;
  return result;
}

uint64_t TestDataBundle.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v2 = type metadata accessor for TestDataBundle(0);
  v3 = a1 + *(int *)(v2 + 20);
  v4 = type metadata accessor for TestDataBundle.IndexingData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = a1 + *(int *)(v2 + 24);
  v6 = type metadata accessor for TestDataBundle.SearchingData(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
}

const char *TestDataBundle.protoMessageName.unsafeMutableAddressor()
{
  return "TestDataBundle";
}

uint64_t static TestDataBundle.protoMessageName.getter()
{
  return 0x6174614474736554;
}

uint64_t sub_244B3E3B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_244B450A0();
  __swift_allocate_value_buffer(v0, static TestDataBundle._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static TestDataBundle._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC278);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC280);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_244B45A20;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "indexingData";
  *(_QWORD *)(v7 + 8) = 12;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_244B45088();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "searchingData";
  *((_QWORD *)v11 + 1) = 13;
  v11[16] = 2;
  v10();
  return sub_244B45094();
}

uint64_t TestDataBundle._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_244B266BC(&qword_2573DBB90, (uint64_t)static TestDataBundle._protobuf_nameMap);
}

uint64_t static TestDataBundle._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B26718(&qword_2573DBB90, (uint64_t)static TestDataBundle._protobuf_nameMap, a1);
}

uint64_t TestDataBundle.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_244B44FB0();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 2)
    {
      sub_244B3E664();
    }
    else if (result == 1)
    {
      sub_244B3E5D0();
    }
  }
  return result;
}

uint64_t sub_244B3E5D0()
{
  type metadata accessor for TestDataBundle(0);
  type metadata accessor for TestDataBundle.IndexingData(0);
  sub_244B28C74(&qword_2573DD068, type metadata accessor for TestDataBundle.IndexingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData);
  return sub_244B45004();
}

uint64_t sub_244B3E664()
{
  type metadata accessor for TestDataBundle(0);
  type metadata accessor for TestDataBundle.SearchingData(0);
  sub_244B28C74(&qword_2573DD090, type metadata accessor for TestDataBundle.SearchingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData);
  return sub_244B45004();
}

uint64_t TestDataBundle.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_244B3E764(v3, a1, a2, a3);
  if (!v4)
  {
    sub_244B3E8D8(v3, a1, a2, a3);
    return sub_244B44F68();
  }
  return result;
}

uint64_t sub_244B3E764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD000);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TestDataBundle.IndexingData(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TestDataBundle(0);
  sub_244B26C8C(a1 + *(int *)(v12 + 20), (uint64_t)v7, &qword_2573DD000);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_244B2AE28((uint64_t)v7, &qword_2573DD000);
  sub_244B26BC8((uint64_t)v7, (uint64_t)v11, type metadata accessor for TestDataBundle.IndexingData);
  sub_244B28C74(&qword_2573DD068, type metadata accessor for TestDataBundle.IndexingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData);
  sub_244B4507C();
  return sub_244B26C50((uint64_t)v11, type metadata accessor for TestDataBundle.IndexingData);
}

uint64_t sub_244B3E8D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD008);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TestDataBundle.SearchingData(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TestDataBundle(0);
  sub_244B26C8C(a1 + *(int *)(v12 + 24), (uint64_t)v7, &qword_2573DD008);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_244B2AE28((uint64_t)v7, &qword_2573DD008);
  sub_244B26BC8((uint64_t)v7, (uint64_t)v11, type metadata accessor for TestDataBundle.SearchingData);
  sub_244B28C74(&qword_2573DD090, type metadata accessor for TestDataBundle.SearchingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData);
  sub_244B4507C();
  return sub_244B26C50((uint64_t)v11, type metadata accessor for TestDataBundle.SearchingData);
}

uint64_t TestDataBundle.hashValue.getter()
{
  return sub_244B282C0(type metadata accessor for TestDataBundle, &qword_2573DD010, (uint64_t)&protocol conformance descriptor for TestDataBundle);
}

uint64_t sub_244B3EA6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v4 = a2 + *(int *)(a1 + 20);
  v5 = type metadata accessor for TestDataBundle.IndexingData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = a2 + *(int *)(a1 + 24);
  v7 = type metadata accessor for TestDataBundle.SearchingData(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
}

uint64_t sub_244B3EAEC()
{
  return 0x6174614474736554;
}

uint64_t sub_244B3EB10()
{
  return TestDataBundle.decodeMessage<A>(decoder:)();
}

uint64_t sub_244B3EB24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TestDataBundle.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_244B3EB38()
{
  sub_244B28C74(&qword_2573DD3C8, type metadata accessor for TestDataBundle, (uint64_t)&protocol conformance descriptor for TestDataBundle);
  return sub_244B44F98();
}

uint64_t sub_244B3EB88@<X0>(uint64_t a1@<X8>)
{
  return sub_244B28450(&qword_2573DBB90, (uint64_t)static TestDataBundle._protobuf_nameMap, a1);
}

uint64_t sub_244B3EBA4()
{
  sub_244B28C74(&qword_2573DD050, type metadata accessor for TestDataBundle, (uint64_t)&protocol conformance descriptor for TestDataBundle);
  return sub_244B4501C();
}

uint64_t sub_244B3EBE4()
{
  sub_244B28C74(&qword_2573DD050, type metadata accessor for TestDataBundle, (uint64_t)&protocol conformance descriptor for TestDataBundle);
  return sub_244B45028();
}

void *TestDataBundle.IndexingData.protoMessageName.unsafeMutableAddressor()
{
  return &static TestDataBundle.IndexingData.protoMessageName;
}

unint64_t static TestDataBundle.IndexingData.protoMessageName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_244B3EC60(uint64_t a1)
{
  return sub_244B3F59C(a1, static TestDataBundle.IndexingData._protobuf_nameMap, (uint64_t)"documents", 9);
}

uint64_t TestDataBundle.IndexingData._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_244B266BC(&qword_2573DBB98, (uint64_t)static TestDataBundle.IndexingData._protobuf_nameMap);
}

uint64_t static TestDataBundle.IndexingData._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B26718(&qword_2573DBB98, (uint64_t)static TestDataBundle.IndexingData._protobuf_nameMap, a1);
}

uint64_t TestDataBundle.IndexingData.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244B3F704(a1, a2, a3, type metadata accessor for TestDataBundle.IndexingData.Document, &qword_2573DD018, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData.Document);
}

uint64_t TestDataBundle.IndexingData.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244B3F800(a1, a2, a3, type metadata accessor for TestDataBundle.IndexingData.Document, &qword_2573DD018, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData.Document, (void (*)(_QWORD))type metadata accessor for TestDataBundle.IndexingData);
}

uint64_t static TestDataBundle.IndexingData.== infix(_:_:)(_QWORD *a1, char *a2)
{
  return sub_244B40A90(a1, a2, sub_244B2BC30, type metadata accessor for TestDataBundle.IndexingData) & 1;
}

uint64_t TestDataBundle.IndexingData.hashValue.getter()
{
  return sub_244B282C0(type metadata accessor for TestDataBundle.IndexingData, &qword_2573DD020, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData);
}

uint64_t sub_244B3ED54@<X0>(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
  return _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

unint64_t sub_244B3ED7C()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_244B3ED98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TestDataBundle.IndexingData.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_244B3EDAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TestDataBundle.IndexingData.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_244B3EDC0()
{
  sub_244B28C74(&qword_2573DD3C0, type metadata accessor for TestDataBundle.IndexingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData);
  return sub_244B44F98();
}

uint64_t sub_244B3EE10@<X0>(uint64_t a1@<X8>)
{
  return sub_244B28450(&qword_2573DBB98, (uint64_t)static TestDataBundle.IndexingData._protobuf_nameMap, a1);
}

uint64_t sub_244B3EE2C()
{
  sub_244B28C74(&qword_2573DD068, type metadata accessor for TestDataBundle.IndexingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData);
  return sub_244B4501C();
}

uint64_t sub_244B3EE6C()
{
  sub_244B28C74(&qword_2573DD068, type metadata accessor for TestDataBundle.IndexingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData);
  return sub_244B45028();
}

uint64_t sub_244B3EEBC(_QWORD *a1, char *a2)
{
  return sub_244B40A90(a1, a2, sub_244B2BC30, type metadata accessor for TestDataBundle.IndexingData) & 1;
}

uint64_t sub_244B3EEE4()
{
  uint64_t result;

  result = sub_244B451E4();
  static TestDataBundle.IndexingData.Document.protoMessageName = 0xD00000000000001BLL;
  *(_QWORD *)algn_2573DD4F8 = 0x8000000244B48170;
  return result;
}

uint64_t *TestDataBundle.IndexingData.Document.protoMessageName.unsafeMutableAddressor()
{
  if (qword_2573DBBA0 != -1)
    swift_once();
  return &static TestDataBundle.IndexingData.Document.protoMessageName;
}

uint64_t static TestDataBundle.IndexingData.Document.protoMessageName.getter()
{
  return sub_244B3FB68(&qword_2573DBBA0, &static TestDataBundle.IndexingData.Document.protoMessageName);
}

uint64_t sub_244B3EFB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_244B450A0();
  __swift_allocate_value_buffer(v0, static TestDataBundle.IndexingData.Document._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static TestDataBundle.IndexingData.Document._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC278);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC280);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_244B45A10;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "name";
  *(_QWORD *)(v7 + 8) = 4;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_244B45088();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "body";
  *((_QWORD *)v11 + 1) = 4;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "path";
  *(_QWORD *)(v12 + 8) = 4;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_244B45094();
}

uint64_t TestDataBundle.IndexingData.Document._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_244B266BC(&qword_2573DBBA8, (uint64_t)static TestDataBundle.IndexingData.Document._protobuf_nameMap);
}

uint64_t static TestDataBundle.IndexingData.Document._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B26718(&qword_2573DBBA8, (uint64_t)static TestDataBundle.IndexingData.Document._protobuf_nameMap, a1);
}

uint64_t TestDataBundle.IndexingData.Document.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_244B44FB0();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 3 || result == 2 || result == 1)
    {
      type metadata accessor for TestDataBundle.IndexingData.Document(0);
      sub_244B44FEC();
    }
    v0 = 0;
  }
  return result;
}

uint64_t TestDataBundle.IndexingData.Document.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_244B3FE80(v3, a1, a2, a3, type metadata accessor for TestDataBundle.IndexingData.Document);
  if (!v4)
  {
    sub_244B3F2C8(v3);
    sub_244B3F33C(v3);
    return sub_244B44F68();
  }
  return result;
}

uint64_t sub_244B3F2C8(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for TestDataBundle.IndexingData.Document(0);
  if (*(_QWORD *)(a1 + *(int *)(result + 24) + 8))
    return sub_244B45064();
  return result;
}

uint64_t sub_244B3F33C(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for TestDataBundle.IndexingData.Document(0);
  if (*(_QWORD *)(a1 + *(int *)(result + 28) + 8))
    return sub_244B45064();
  return result;
}

uint64_t TestDataBundle.IndexingData.Document.hashValue.getter()
{
  return sub_244B282C0(type metadata accessor for TestDataBundle.IndexingData.Document, &qword_2573DD028, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData.Document);
}

uint64_t sub_244B3F3D0@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;

  result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v5 = a1[6];
  v6 = (_QWORD *)(a2 + a1[5]);
  *v6 = 0;
  v6[1] = 0;
  v7 = (_QWORD *)(a2 + v5);
  *v7 = 0;
  v7[1] = 0;
  v8 = (_QWORD *)(a2 + a1[7]);
  *v8 = 0;
  v8[1] = 0;
  return result;
}

uint64_t sub_244B3F414(uint64_t a1, uint64_t a2)
{
  return sub_244B3FFE8(a1, a2, &qword_2573DBBA0, &static TestDataBundle.IndexingData.Document.protoMessageName);
}

uint64_t sub_244B3F434()
{
  return TestDataBundle.IndexingData.Document.decodeMessage<A>(decoder:)();
}

uint64_t sub_244B3F448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TestDataBundle.IndexingData.Document.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_244B3F45C()
{
  sub_244B28C74(&qword_2573DD3B8, type metadata accessor for TestDataBundle.IndexingData.Document, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData.Document);
  return sub_244B44F98();
}

uint64_t sub_244B3F4AC@<X0>(uint64_t a1@<X8>)
{
  return sub_244B28450(&qword_2573DBBA8, (uint64_t)static TestDataBundle.IndexingData.Document._protobuf_nameMap, a1);
}

uint64_t sub_244B3F4C8()
{
  sub_244B28C74(&qword_2573DD018, type metadata accessor for TestDataBundle.IndexingData.Document, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData.Document);
  return sub_244B4501C();
}

uint64_t sub_244B3F508()
{
  sub_244B28C74(&qword_2573DD018, type metadata accessor for TestDataBundle.IndexingData.Document, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData.Document);
  return sub_244B45028();
}

void *TestDataBundle.SearchingData.protoMessageName.unsafeMutableAddressor()
{
  return &static TestDataBundle.SearchingData.protoMessageName;
}

unint64_t static TestDataBundle.SearchingData.protoMessageName.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_244B3F584(uint64_t a1)
{
  return sub_244B3F59C(a1, static TestDataBundle.SearchingData._protobuf_nameMap, (uint64_t)"tokens", 6);
}

uint64_t sub_244B3F59C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = sub_244B450A0();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC278);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC280);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80);
  v10 = (v9 + 32) & ~v9;
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_244B46690;
  v12 = v11 + v10 + *(int *)(v8 + 48);
  *(_QWORD *)(v11 + v10) = 1;
  *(_QWORD *)v12 = a3;
  *(_QWORD *)(v12 + 8) = a4;
  *(_BYTE *)(v12 + 16) = 2;
  v13 = *MEMORY[0x24BE5C318];
  v14 = sub_244B45088();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v12, v13, v14);
  return sub_244B45094();
}

uint64_t TestDataBundle.SearchingData._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_244B266BC(&qword_2573DBBB0, (uint64_t)static TestDataBundle.SearchingData._protobuf_nameMap);
}

uint64_t static TestDataBundle.SearchingData._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B26718(&qword_2573DBBB0, (uint64_t)static TestDataBundle.SearchingData._protobuf_nameMap, a1);
}

uint64_t TestDataBundle.SearchingData.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244B3F704(a1, a2, a3, type metadata accessor for TestDataBundle.SearchingData.Token, &qword_2573DD030, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_244B3F704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), unint64_t *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t result;
  char v11;

  while (1)
  {
    result = sub_244B44FB0();
    if (v6 || (v11 & 1) != 0)
      break;
    if (result == 1)
    {
      a4(0);
      sub_244B28C74(a5, a4, a6);
      sub_244B44FF8();
    }
    v6 = 0;
  }
  return result;
}

uint64_t TestDataBundle.SearchingData.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244B3F800(a1, a2, a3, type metadata accessor for TestDataBundle.SearchingData.Token, &qword_2573DD030, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData.Token, (void (*)(_QWORD))type metadata accessor for TestDataBundle.SearchingData);
}

uint64_t sub_244B3F800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), unint64_t *a5, uint64_t a6, void (*a7)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  void (*v13)(_QWORD);

  if (!*(_QWORD *)(*(_QWORD *)v7 + 16)
    || (v13 = a7, a4(0), sub_244B28C74(a5, a4, a6), result = sub_244B45070(), a7 = v13, !v8))
  {
    a7(0);
    return sub_244B44F68();
  }
  return result;
}

uint64_t static TestDataBundle.SearchingData.== infix(_:_:)(_QWORD *a1, char *a2)
{
  return sub_244B40A90(a1, a2, sub_244B2BA40, type metadata accessor for TestDataBundle.SearchingData) & 1;
}

uint64_t TestDataBundle.SearchingData.hashValue.getter()
{
  return sub_244B282C0(type metadata accessor for TestDataBundle.SearchingData, &qword_2573DD038, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData);
}

unint64_t sub_244B3F93C()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_244B3F958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TestDataBundle.SearchingData.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_244B3F96C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TestDataBundle.SearchingData.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_244B3F980()
{
  sub_244B28C74(&qword_2573DD3B0, type metadata accessor for TestDataBundle.SearchingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData);
  return sub_244B44F98();
}

uint64_t sub_244B3F9D0@<X0>(uint64_t a1@<X8>)
{
  return sub_244B28450(&qword_2573DBBB0, (uint64_t)static TestDataBundle.SearchingData._protobuf_nameMap, a1);
}

uint64_t sub_244B3F9EC()
{
  sub_244B28C74(&qword_2573DD090, type metadata accessor for TestDataBundle.SearchingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData);
  return sub_244B4501C();
}

uint64_t sub_244B3FA2C()
{
  sub_244B28C74(&qword_2573DD090, type metadata accessor for TestDataBundle.SearchingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData);
  return sub_244B45028();
}

uint64_t sub_244B3FA7C(_QWORD *a1, char *a2)
{
  return sub_244B40A90(a1, a2, sub_244B2BA40, type metadata accessor for TestDataBundle.SearchingData) & 1;
}

uint64_t sub_244B3FAA4()
{
  uint64_t result;

  result = sub_244B451E4();
  static TestDataBundle.SearchingData.Token.protoMessageName = 0xD00000000000001CLL;
  *(_QWORD *)algn_2573DD538 = 0x8000000244B48190;
  return result;
}

uint64_t *TestDataBundle.SearchingData.Token.protoMessageName.unsafeMutableAddressor()
{
  if (qword_2573DBBB8 != -1)
    swift_once();
  return &static TestDataBundle.SearchingData.Token.protoMessageName;
}

uint64_t static TestDataBundle.SearchingData.Token.protoMessageName.getter()
{
  return sub_244B3FB68(&qword_2573DBBB8, &static TestDataBundle.SearchingData.Token.protoMessageName);
}

uint64_t sub_244B3FB68(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_244B3FBB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_244B450A0();
  __swift_allocate_value_buffer(v0, static TestDataBundle.SearchingData.Token._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static TestDataBundle.SearchingData.Token._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC278);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DC280);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_244B45A20;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "token";
  *(_QWORD *)(v7 + 8) = 5;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_244B45088();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "frequency";
  *((_QWORD *)v11 + 1) = 9;
  v11[16] = 2;
  v10();
  return sub_244B45094();
}

uint64_t TestDataBundle.SearchingData.Token._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_244B266BC(&qword_2573DBBC0, (uint64_t)static TestDataBundle.SearchingData.Token._protobuf_nameMap);
}

uint64_t static TestDataBundle.SearchingData.Token._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244B26718(&qword_2573DBBC0, (uint64_t)static TestDataBundle.SearchingData.Token._protobuf_nameMap, a1);
}

uint64_t TestDataBundle.SearchingData.Token.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_244B44FB0();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 2)
    {
      type metadata accessor for TestDataBundle.SearchingData.Token(0);
      sub_244B44FBC();
    }
    else if (result == 1)
    {
      type metadata accessor for TestDataBundle.SearchingData.Token(0);
      sub_244B44FEC();
    }
    v0 = 0;
  }
  return result;
}

uint64_t TestDataBundle.SearchingData.Token.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_244B3FE80(v3, a1, a2, a3, type metadata accessor for TestDataBundle.SearchingData.Token);
  if (!v4)
  {
    sub_244B3FEF4(v3);
    return sub_244B44F68();
  }
  return result;
}

uint64_t sub_244B3FE80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t result;

  result = a5(0);
  if (*(_QWORD *)(a1 + *(int *)(result + 20) + 8))
    return sub_244B45064();
  return result;
}

uint64_t sub_244B3FEF4(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for TestDataBundle.SearchingData.Token(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 24) + 4) & 1) == 0)
    return sub_244B45034();
  return result;
}

uint64_t TestDataBundle.SearchingData.Token.hashValue.getter()
{
  return sub_244B282C0(type metadata accessor for TestDataBundle.SearchingData.Token, &qword_2573DD040, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_244B3FF88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v5 = *(int *)(a1 + 24);
  v6 = (_QWORD *)(a2 + *(int *)(a1 + 20));
  *v6 = 0;
  v6[1] = 0;
  v7 = a2 + v5;
  *(_DWORD *)v7 = 0;
  *(_BYTE *)(v7 + 4) = 1;
  return result;
}

uint64_t sub_244B3FFC8(uint64_t a1, uint64_t a2)
{
  return sub_244B3FFE8(a1, a2, &qword_2573DBBB8, &static TestDataBundle.SearchingData.Token.protoMessageName);
}

uint64_t sub_244B3FFE8(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t v5;

  if (*a3 != -1)
    swift_once();
  v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_244B4003C()
{
  return TestDataBundle.SearchingData.Token.decodeMessage<A>(decoder:)();
}

uint64_t sub_244B40050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TestDataBundle.SearchingData.Token.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_244B40064()
{
  sub_244B28C74(&qword_2573DD3A8, type metadata accessor for TestDataBundle.SearchingData.Token, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData.Token);
  return sub_244B44F98();
}

uint64_t sub_244B400B4@<X0>(uint64_t a1@<X8>)
{
  return sub_244B28450(&qword_2573DBBC0, (uint64_t)static TestDataBundle.SearchingData.Token._protobuf_nameMap, a1);
}

uint64_t sub_244B400D0()
{
  sub_244B28C74(&qword_2573DD030, type metadata accessor for TestDataBundle.SearchingData.Token, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData.Token);
  return sub_244B4501C();
}

uint64_t sub_244B40110()
{
  sub_244B28C74(&qword_2573DD030, type metadata accessor for TestDataBundle.SearchingData.Token, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData.Token);
  return sub_244B45028();
}

uint64_t _s17PrivateSearchCore14TestDataBundleV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int (*v38)(uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t *v43;
  uint64_t *v44;
  char v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  char *v48;
  uint64_t v49;
  char *v50;
  char v51;
  void (*v52)(char *, uint64_t);
  uint64_t *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v66 = a1;
  v67 = a2;
  v59 = sub_244B44F80();
  v57 = *(_QWORD *)(v59 - 8);
  v2 = MEMORY[0x24BDAC7A8](v59);
  v56 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v55 = (char *)&v54 - v4;
  v64 = type metadata accessor for TestDataBundle.SearchingData(0);
  v61 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v54 = (uint64_t *)((char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD3D0);
  MEMORY[0x24BDAC7A8](v60);
  v65 = (uint64_t)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD008);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v58 = (uint64_t *)((char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = MEMORY[0x24BDAC7A8](v8);
  v62 = (uint64_t)&v54 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v63 = (uint64_t)&v54 - v12;
  v13 = type metadata accessor for TestDataBundle.IndexingData(0);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (uint64_t *)((char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD3D8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD000);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (uint64_t *)((char *)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v54 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v54 - v27;
  v29 = type metadata accessor for TestDataBundle(0);
  sub_244B26C8C(v66 + *(int *)(v29 + 20), (uint64_t)v28, &qword_2573DD000);
  sub_244B26C8C(v67 + *(int *)(v29 + 20), (uint64_t)v26, &qword_2573DD000);
  v30 = (uint64_t)&v19[*(int *)(v17 + 48)];
  sub_244B26C8C((uint64_t)v28, (uint64_t)v19, &qword_2573DD000);
  sub_244B26C8C((uint64_t)v26, v30, &qword_2573DD000);
  v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  if (v31((uint64_t)v19, 1, v13) == 1)
  {
    sub_244B2AE28((uint64_t)v26, &qword_2573DD000);
    sub_244B2AE28((uint64_t)v28, &qword_2573DD000);
    if (v31(v30, 1, v13) == 1)
    {
      sub_244B2AE28((uint64_t)v19, &qword_2573DD000);
      goto LABEL_4;
    }
LABEL_9:
    v40 = &qword_2573DD3D8;
    v41 = (uint64_t)v19;
    goto LABEL_21;
  }
  sub_244B26C8C((uint64_t)v19, (uint64_t)v23, &qword_2573DD000);
  if (v31(v30, 1, v13) == 1)
  {
    sub_244B2AE28((uint64_t)v26, &qword_2573DD000);
    sub_244B2AE28((uint64_t)v28, &qword_2573DD000);
    sub_244B26C50((uint64_t)v23, type metadata accessor for TestDataBundle.IndexingData);
    goto LABEL_9;
  }
  sub_244B26BC8(v30, (uint64_t)v16, type metadata accessor for TestDataBundle.IndexingData);
  if ((sub_244B2BC30(*v23, *v16) & 1) == 0)
  {
    sub_244B26C50((uint64_t)v16, type metadata accessor for TestDataBundle.IndexingData);
    sub_244B2AE28((uint64_t)v26, &qword_2573DD000);
    sub_244B2AE28((uint64_t)v28, &qword_2573DD000);
    sub_244B26C50((uint64_t)v23, type metadata accessor for TestDataBundle.IndexingData);
    v41 = (uint64_t)v19;
    v40 = &qword_2573DD000;
    goto LABEL_21;
  }
  sub_244B28C74((unint64_t *)&qword_2573DC258, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v42 = sub_244B45124();
  sub_244B26C50((uint64_t)v16, type metadata accessor for TestDataBundle.IndexingData);
  sub_244B2AE28((uint64_t)v26, &qword_2573DD000);
  sub_244B2AE28((uint64_t)v28, &qword_2573DD000);
  sub_244B26C50((uint64_t)v23, type metadata accessor for TestDataBundle.IndexingData);
  sub_244B2AE28((uint64_t)v19, &qword_2573DD000);
  if ((v42 & 1) == 0)
    goto LABEL_22;
LABEL_4:
  v32 = v66;
  v33 = v63;
  sub_244B26C8C(v66 + *(int *)(v29 + 24), v63, &qword_2573DD008);
  v34 = v67;
  v35 = v62;
  sub_244B26C8C(v67 + *(int *)(v29 + 24), v62, &qword_2573DD008);
  v36 = v65;
  v37 = v65 + *(int *)(v60 + 48);
  sub_244B26C8C(v33, v65, &qword_2573DD008);
  sub_244B26C8C(v35, v37, &qword_2573DD008);
  v38 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48);
  v39 = v64;
  if (v38(v36, 1, v64) != 1)
  {
    v43 = v58;
    sub_244B26C8C(v36, (uint64_t)v58, &qword_2573DD008);
    if (v38(v37, 1, v39) == 1)
    {
      sub_244B2AE28(v35, &qword_2573DD008);
      sub_244B2AE28(v33, &qword_2573DD008);
      sub_244B26C50((uint64_t)v43, type metadata accessor for TestDataBundle.SearchingData);
      goto LABEL_15;
    }
    v44 = v54;
    sub_244B26BC8(v37, (uint64_t)v54, type metadata accessor for TestDataBundle.SearchingData);
    if ((sub_244B2BA40(*v43, *v44) & 1) != 0)
    {
      sub_244B28C74((unint64_t *)&qword_2573DC258, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v45 = sub_244B45124();
      sub_244B26C50((uint64_t)v44, type metadata accessor for TestDataBundle.SearchingData);
      sub_244B2AE28(v35, &qword_2573DD008);
      sub_244B2AE28(v33, &qword_2573DD008);
      sub_244B26C50((uint64_t)v43, type metadata accessor for TestDataBundle.SearchingData);
      sub_244B2AE28(v36, &qword_2573DD008);
      if ((v45 & 1) != 0)
        goto LABEL_19;
LABEL_22:
      v51 = 0;
      return v51 & 1;
    }
    sub_244B26C50((uint64_t)v44, type metadata accessor for TestDataBundle.SearchingData);
    sub_244B2AE28(v35, &qword_2573DD008);
    sub_244B2AE28(v33, &qword_2573DD008);
    sub_244B26C50((uint64_t)v43, type metadata accessor for TestDataBundle.SearchingData);
    v41 = v36;
    v40 = &qword_2573DD008;
LABEL_21:
    sub_244B2AE28(v41, v40);
    goto LABEL_22;
  }
  sub_244B2AE28(v35, &qword_2573DD008);
  sub_244B2AE28(v33, &qword_2573DD008);
  if (v38(v37, 1, v39) != 1)
  {
LABEL_15:
    v40 = &qword_2573DD3D0;
    v41 = v36;
    goto LABEL_21;
  }
  sub_244B2AE28(v36, &qword_2573DD008);
LABEL_19:
  v46 = v57;
  v47 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 16);
  v48 = v55;
  v49 = v59;
  v47(v55, v32, v59);
  v50 = v56;
  v47(v56, v34, v49);
  sub_244B28C74((unint64_t *)&qword_2573DC258, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v51 = sub_244B45124();
  v52 = *(void (**)(char *, uint64_t))(v46 + 8);
  v52(v50, v49);
  v52(v48, v49);
  return v51 & 1;
}

uint64_t _s17PrivateSearchCore14TestDataBundleV09SearchingE0V5TokenV2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  _DWORD *v20;
  char v21;
  _DWORD *v22;
  int v23;
  void (*v24)(char *, uint64_t, uint64_t);
  void (*v25)(char *, uint64_t);
  uint64_t v27;

  v4 = sub_244B44F80();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v27 - v9;
  v11 = type metadata accessor for TestDataBundle.SearchingData.Token(0);
  v12 = *(int *)(v11 + 20);
  v13 = (_QWORD *)(a1 + v12);
  v14 = *(_QWORD *)(a1 + v12 + 8);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  if (!v14)
  {
    if (!v16)
      goto LABEL_10;
LABEL_12:
    v18 = 0;
    return v18 & 1;
  }
  if (!v16)
    goto LABEL_12;
  v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (v18 = 0, (sub_244B45508() & 1) != 0))
  {
LABEL_10:
    v19 = *(int *)(v11 + 24);
    v20 = (_DWORD *)(a1 + v19);
    v21 = *(_BYTE *)(a1 + v19 + 4);
    v22 = (_DWORD *)(a2 + v19);
    v23 = *(unsigned __int8 *)(a2 + v19 + 4);
    if ((v21 & 1) != 0)
    {
      if (!v23)
        goto LABEL_12;
    }
    else
    {
      if (*v20 != *v22)
        LOBYTE(v23) = 1;
      if ((v23 & 1) != 0)
        goto LABEL_12;
    }
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v24(v10, a1, v4);
    v24(v8, a2, v4);
    sub_244B28C74((unint64_t *)&qword_2573DC258, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v18 = sub_244B45124();
    v25 = *(void (**)(char *, uint64_t))(v5 + 8);
    v25(v8, v4);
    v25(v10, v4);
  }
  return v18 & 1;
}

uint64_t sub_244B40A90(_QWORD *a1, char *a2, uint64_t (*a3)(_QWORD, _QWORD), uint64_t (*a4)(_QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v21;

  v8 = sub_244B44F80();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21 - v13;
  if ((a3(*a1, *(_QWORD *)a2) & 1) != 0)
  {
    v15 = a4(0);
    v16 = (char *)a1 + *(int *)(v15 + 20);
    v17 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v17(v14, v16, v8);
    v17(v12, &a2[*(int *)(v15 + 20)], v8);
    sub_244B28C74((unint64_t *)&qword_2573DC258, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v18 = sub_244B45124();
    v19 = *(void (**)(char *, uint64_t))(v9 + 8);
    v19(v12, v8);
    v19(v14, v8);
  }
  else
  {
    v18 = 0;
  }
  return v18 & 1;
}

uint64_t _s17PrivateSearchCore14TestDataBundleV08IndexingE0V8DocumentV2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  void (*v32)(char *, uint64_t, uint64_t);
  void (*v33)(char *, uint64_t);
  uint64_t v34;

  v4 = sub_244B44F80();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v34 - v9;
  v11 = (int *)type metadata accessor for TestDataBundle.IndexingData.Document(0);
  v12 = v11[5];
  v13 = (_QWORD *)(a1 + v12);
  v14 = *(_QWORD *)(a1 + v12 + 8);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  if (!v14)
  {
    if (v16)
      goto LABEL_28;
    goto LABEL_10;
  }
  if (!v16)
    goto LABEL_28;
  v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (v18 = 0, (sub_244B45508() & 1) != 0))
  {
LABEL_10:
    v19 = v11[6];
    v20 = (_QWORD *)(a1 + v19);
    v21 = *(_QWORD *)(a1 + v19 + 8);
    v22 = (_QWORD *)(a2 + v19);
    v23 = v22[1];
    if (v21)
    {
      if (!v23)
        goto LABEL_28;
      if (*v20 != *v22 || v21 != v23)
      {
        v18 = 0;
        if ((sub_244B45508() & 1) == 0)
          return v18 & 1;
      }
    }
    else if (v23)
    {
      goto LABEL_28;
    }
    v25 = v11[7];
    v26 = (_QWORD *)(a1 + v25);
    v27 = *(_QWORD *)(a1 + v25 + 8);
    v28 = (_QWORD *)(a2 + v25);
    v29 = v28[1];
    if (v27)
    {
      if (v29)
      {
        if (*v26 != *v28 || v27 != v29)
        {
          v18 = 0;
          if ((sub_244B45508() & 1) == 0)
            return v18 & 1;
        }
LABEL_30:
        v32 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v32(v10, a1, v4);
        v32(v8, a2, v4);
        sub_244B28C74((unint64_t *)&qword_2573DC258, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
        v18 = sub_244B45124();
        v33 = *(void (**)(char *, uint64_t))(v5 + 8);
        v33(v8, v4);
        v33(v10, v4);
        return v18 & 1;
      }
    }
    else if (!v29)
    {
      goto LABEL_30;
    }
LABEL_28:
    v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_244B40DC0()
{
  return sub_244B28C74(&qword_2573DD048, type metadata accessor for TestDataBundle, (uint64_t)&protocol conformance descriptor for TestDataBundle);
}

uint64_t sub_244B40DEC()
{
  return sub_244B28C74(&qword_2573DD050, type metadata accessor for TestDataBundle, (uint64_t)&protocol conformance descriptor for TestDataBundle);
}

uint64_t sub_244B40E18()
{
  return sub_244B28C74(&qword_2573DD010, type metadata accessor for TestDataBundle, (uint64_t)&protocol conformance descriptor for TestDataBundle);
}

uint64_t sub_244B40E44()
{
  return sub_244B28C74(&qword_2573DD058, type metadata accessor for TestDataBundle, (uint64_t)&protocol conformance descriptor for TestDataBundle);
}

uint64_t sub_244B40E70()
{
  return sub_244B28C74(&qword_2573DD060, type metadata accessor for TestDataBundle.IndexingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData);
}

uint64_t sub_244B40E9C()
{
  return sub_244B28C74(&qword_2573DD068, type metadata accessor for TestDataBundle.IndexingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData);
}

uint64_t sub_244B40EC8()
{
  return sub_244B28C74(&qword_2573DD020, type metadata accessor for TestDataBundle.IndexingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData);
}

uint64_t sub_244B40EF4()
{
  return sub_244B28C74(&qword_2573DD070, type metadata accessor for TestDataBundle.IndexingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData);
}

uint64_t sub_244B40F20()
{
  return sub_244B28C74(&qword_2573DD078, type metadata accessor for TestDataBundle.IndexingData.Document, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData.Document);
}

uint64_t sub_244B40F4C()
{
  return sub_244B28C74(&qword_2573DD018, type metadata accessor for TestDataBundle.IndexingData.Document, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData.Document);
}

uint64_t sub_244B40F78()
{
  return sub_244B28C74(&qword_2573DD028, type metadata accessor for TestDataBundle.IndexingData.Document, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData.Document);
}

uint64_t sub_244B40FA4()
{
  return sub_244B28C74(&qword_2573DD080, type metadata accessor for TestDataBundle.IndexingData.Document, (uint64_t)&protocol conformance descriptor for TestDataBundle.IndexingData.Document);
}

uint64_t sub_244B40FD0()
{
  return sub_244B28C74(&qword_2573DD088, type metadata accessor for TestDataBundle.SearchingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData);
}

uint64_t sub_244B40FFC()
{
  return sub_244B28C74(&qword_2573DD090, type metadata accessor for TestDataBundle.SearchingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData);
}

uint64_t sub_244B41028()
{
  return sub_244B28C74(&qword_2573DD038, type metadata accessor for TestDataBundle.SearchingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData);
}

uint64_t sub_244B41054()
{
  return sub_244B28C74(&qword_2573DD098, type metadata accessor for TestDataBundle.SearchingData, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData);
}

uint64_t sub_244B41080()
{
  return sub_244B28C74(&qword_2573DD0A0, type metadata accessor for TestDataBundle.SearchingData.Token, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_244B410AC()
{
  return sub_244B28C74(&qword_2573DD030, type metadata accessor for TestDataBundle.SearchingData.Token, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_244B410D8()
{
  return sub_244B28C74(&qword_2573DD040, type metadata accessor for TestDataBundle.SearchingData.Token, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_244B41104()
{
  return sub_244B28C74(&qword_2573DD0A8, type metadata accessor for TestDataBundle.SearchingData.Token, (uint64_t)&protocol conformance descriptor for TestDataBundle.SearchingData.Token);
}

char *initializeBufferWithCopyOfBuffer for TestDataBundle(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_244B44F80();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, (char *)a2, v7);
    v9 = *(int *)(a3 + 20);
    v10 = &a1[v9];
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = type metadata accessor for TestDataBundle.IndexingData(0);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD000);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      *(_QWORD *)v10 = *v11;
      v16 = *(int *)(v12 + 20);
      v17 = &v10[v16];
      v18 = (char *)v11 + v16;
      swift_bridgeObjectRetain();
      v8(v17, v18, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v19 = *(int *)(a3 + 24);
    v20 = &a1[v19];
    v21 = (uint64_t *)((char *)a2 + v19);
    v22 = type metadata accessor for TestDataBundle.SearchingData(0);
    v23 = *(_QWORD *)(v22 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
    {
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD008);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      *(_QWORD *)v20 = *v21;
      v25 = *(int *)(v22 + 20);
      v26 = &v20[v25];
      v27 = (char *)v21 + v25;
      swift_bridgeObjectRetain();
      v8(v26, v27, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
    }
  }
  return a1;
}

uint64_t destroy for TestDataBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  void (*v10)(uint64_t, uint64_t);

  v4 = sub_244B44F80();
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v10(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for TestDataBundle.IndexingData(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 1, v6))
  {
    swift_bridgeObjectRelease();
    v10(v5 + *(int *)(v6 + 20), v4);
  }
  v7 = a1 + *(int *)(a2 + 24);
  v8 = type metadata accessor for TestDataBundle.SearchingData(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 1, v8);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v7 + *(int *)(v8 + 20), v4);
  }
  return result;
}

uint64_t initializeWithCopy for TestDataBundle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;

  v6 = sub_244B44F80();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = type metadata accessor for TestDataBundle.IndexingData(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD000);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    *v9 = *v10;
    v14 = *(int *)(v11 + 20);
    v15 = (char *)v9 + v14;
    v16 = (char *)v10 + v14;
    swift_bridgeObjectRetain();
    v7((uint64_t)v15, (uint64_t)v16, v6);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v17 = *(int *)(a3 + 24);
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  v20 = type metadata accessor for TestDataBundle.SearchingData(0);
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD008);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    *v18 = *v19;
    v23 = *(int *)(v20 + 20);
    v24 = (char *)v18 + v23;
    v25 = (char *)v19 + v23;
    swift_bridgeObjectRetain();
    v7((uint64_t)v24, (uint64_t)v25, v6);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  return a1;
}

uint64_t assignWithCopy for TestDataBundle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  char *v16;
  char *v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD *, uint64_t, uint64_t);
  int v26;
  int v27;
  uint64_t v28;
  char *v29;
  char *v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;

  v6 = sub_244B44F80();
  v35 = *(_QWORD *)(v6 - 8);
  v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 24);
  v34(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = type metadata accessor for TestDataBundle.IndexingData(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      *v8 = *v9;
      v15 = *(int *)(v10 + 20);
      v16 = (char *)v8 + v15;
      v17 = (char *)v9 + v15;
      v18 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
      swift_bridgeObjectRetain();
      v18(v16, v17, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_244B26C50((uint64_t)v8, type metadata accessor for TestDataBundle.IndexingData);
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD000);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  *v8 = *v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34((uint64_t)v8 + *(int *)(v10 + 20), (uint64_t)v9 + *(int *)(v10 + 20), v6);
LABEL_7:
  v20 = *(int *)(a3 + 24);
  v21 = (_QWORD *)(a1 + v20);
  v22 = (_QWORD *)(a2 + v20);
  v23 = type metadata accessor for TestDataBundle.SearchingData(0);
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v24 + 48);
  v26 = v25(v21, 1, v23);
  v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      *v21 = *v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v34((uint64_t)v21 + *(int *)(v23 + 20), (uint64_t)v22 + *(int *)(v23 + 20), v6);
      return a1;
    }
    sub_244B26C50((uint64_t)v21, type metadata accessor for TestDataBundle.SearchingData);
    goto LABEL_12;
  }
  if (v27)
  {
LABEL_12:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD008);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    return a1;
  }
  *v21 = *v22;
  v28 = *(int *)(v23 + 20);
  v29 = (char *)v21 + v28;
  v30 = (char *)v22 + v28;
  v31 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  swift_bridgeObjectRetain();
  v31(v29, v30, v6);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  return a1;
}

char *initializeWithTake for TestDataBundle(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(char *, char *, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_244B44F80();
  v7 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = type metadata accessor for TestDataBundle.IndexingData(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD000);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    *(_QWORD *)v9 = *(_QWORD *)v10;
    v7(&v9[*(int *)(v11 + 20)], &v10[*(int *)(v11 + 20)], v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v14 = *(int *)(a3 + 24);
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = type metadata accessor for TestDataBundle.SearchingData(0);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD008);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    *(_QWORD *)v15 = *(_QWORD *)v16;
    v7(&v15[*(int *)(v17 + 20)], &v16[*(int *)(v17 + 20)], v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

uint64_t assignWithTake for TestDataBundle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(_QWORD *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;

  v6 = sub_244B44F80();
  v27 = *(_QWORD *)(v6 - 8);
  v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 40);
  v26(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for TestDataBundle.IndexingData(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      *(_QWORD *)v8 = *(_QWORD *)v9;
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(&v8[*(int *)(v10 + 20)], &v9[*(int *)(v10 + 20)], v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_244B26C50((uint64_t)v8, type metadata accessor for TestDataBundle.IndexingData);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD000);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  *(_QWORD *)v8 = *(_QWORD *)v9;
  swift_bridgeObjectRelease();
  v26((uint64_t)&v8[*(int *)(v10 + 20)], (uint64_t)&v9[*(int *)(v10 + 20)], v6);
LABEL_7:
  v16 = *(int *)(a3 + 24);
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  v19 = type metadata accessor for TestDataBundle.SearchingData(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      *v17 = *v18;
      swift_bridgeObjectRelease();
      v26((uint64_t)v17 + *(int *)(v19 + 20), (uint64_t)v18 + *(int *)(v19 + 20), v6);
      return a1;
    }
    sub_244B26C50((uint64_t)v17, type metadata accessor for TestDataBundle.SearchingData);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD008);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  *v17 = *v18;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))((char *)v17 + *(int *)(v19 + 20), (char *)v18 + *(int *)(v19 + 20), v6);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for TestDataBundle()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B41BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_244B44F80();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD000);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD008);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for TestDataBundle()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B41CA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_244B44F80();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD000);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD008);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_244B41D50()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_244B44F80();
  if (v0 <= 0x3F)
  {
    sub_244B2AD98(319, &qword_2573DD118, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData);
    if (v1 <= 0x3F)
    {
      sub_244B2AD98(319, qword_2573DD120, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for TestDataBundle.IndexingData()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for TestDataBundle.IndexingData()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *initializeBufferWithCopyOfBuffer for TestDataBundle.IndexingData.Document(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_244B44F80();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = a3[7];
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TestDataBundle.IndexingData.Document(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TestDataBundle.IndexingData.Document(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = a3[7];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TestDataBundle.IndexingData.Document(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TestDataBundle.IndexingData.Document(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for TestDataBundle.IndexingData.Document(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  v17 = a3[7];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TestDataBundle.IndexingData.Document()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for TestDataBundle.IndexingData.Document()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B4221C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244B44F80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *_s17PrivateSearchCore14TestDataBundleV12IndexingDataVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_244B44F80();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

_QWORD *_s17PrivateSearchCore14TestDataBundleV12IndexingDataVwcp_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_244B44F80();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

_QWORD *_s17PrivateSearchCore14TestDataBundleV12IndexingDataVwca_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244B44F80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *_s17PrivateSearchCore14TestDataBundleV12IndexingDataVwtk_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_244B44F80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *_s17PrivateSearchCore14TestDataBundleV12IndexingDataVwta_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244B44F80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TestDataBundle.SearchingData()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for TestDataBundle.SearchingData()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B424F4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244B44F80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for TestDataBundle.SearchingData.Token(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_244B44F80();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (char *)a1 + v9;
    v14 = (char *)a2 + v9;
    v13[4] = v14[4];
    *(_DWORD *)v13 = *(_DWORD *)v14;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TestDataBundle.SearchingData.Token(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TestDataBundle.SearchingData.Token(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  *(_BYTE *)(v12 + 4) = *(_BYTE *)(v13 + 4);
  *(_DWORD *)v12 = *(_DWORD *)v13;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TestDataBundle.SearchingData.Token(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  int v13;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 24);
  v11 = a1 + v10;
  v12 = (int *)(a2 + v10);
  v13 = *v12;
  *(_BYTE *)(v11 + 4) = *((_BYTE *)v12 + 4);
  *(_DWORD *)v11 = v13;
  return a1;
}

uint64_t initializeWithTake for TestDataBundle.SearchingData.Token(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_BYTE *)(v8 + 4) = *(_BYTE *)(v9 + 4);
  *(_DWORD *)v8 = *(_DWORD *)v9;
  return a1;
}

uint64_t assignWithTake for TestDataBundle.SearchingData.Token(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_244B44F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 24);
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_DWORD *)v13 = *(_DWORD *)v14;
  *(_BYTE *)(v13 + 4) = *(_BYTE *)(v14 + 4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TestDataBundle.SearchingData.Token()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_index_3Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_244B44F80();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for TestDataBundle.SearchingData.Token()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_index_4Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_244B44F80();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  return result;
}

uint64_t sub_244B4299C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244B44F80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_244B42A24()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD14F8]), sel_init);
  objc_msgSend(v0, sel_setUnitsStyle_, 1);
  result = objc_msgSend(v0, sel_setZeroFormattingBehavior_, 14);
  qword_2573DD3E0 = (uint64_t)v0;
  return result;
}

Swift::Int64 TimeDelta.init(millis:secs:mins:hours:days:weeks:)(Swift::Int64 millis, Swift::Int64 secs, Swift::Int64 mins, Swift::Int64 hours, Swift::Int64 days, Swift::Int64 weeks)
{
  return TimeUnit.from(millis:secs:mins:hours:days:weeks:)(millis, secs, mins, hours, days, weeks);
}

Swift::Int64 __swiftcall TimeDelta.total(_:)(PrivateSearchCore::TimeUnit a1)
{
  uint64_t v1;

  return v1 / qword_244B47300[a1];
}

Swift::Double __swiftcall TimeDelta.toTimeInterval()()
{
  uint64_t v0;

  return (float)((float)v0 / 1000.0);
}

BOOL static TimeDelta.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 < a2;
}

BOOL static TimeDelta.<= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a2 >= a1;
}

BOOL static TimeDelta.> infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a2 < a1;
}

BOOL static TimeDelta.>= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 >= a2;
}

BOOL static TimeDelta.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t TimeDelta.prettyDescription.getter(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;

  if ((unint64_t)(a1 + 59999) < 0x1D4BF)
    goto LABEL_6;
  if (qword_2573DBBC8 != -1)
    swift_once();
  v2 = objc_msgSend((id)qword_2573DD3E0, sel_stringFromTimeInterval_, (double)(a1 / 1000));
  if (v2)
  {
    v3 = v2;
    v4 = sub_244B4513C();

  }
  else
  {
LABEL_6:
    sub_244B45358();
    sub_244B451E4();
    return 0;
  }
  return v4;
}

uint64_t TimeDelta.debugDescription.getter(uint64_t a1)
{
  TimeDelta.prettyDescription.getter(a1);
  sub_244B451E4();
  swift_bridgeObjectRelease();
  sub_244B451E4();
  return 0x28748688E2;
}

Swift::Void __swiftcall TimeDelta.sleep()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0;
  v2 = 1000 * v0;
  if ((unsigned __int128)(v1 * (__int128)1000) >> 64 == v2 >> 63)
  {
    if ((v2 & 0x8000000000000000) == 0 && !HIDWORD(v2))
    {
      usleep(v2);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  sub_244B454A8();
  __break(1u);
}

void TimeDelta.toDuration()(uint64_t a1)
{
  double v2;

  v2 = __exp10(12.0);
  if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v2 >= 9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((unsigned __int128)(a1 % 1000 * (__int128)(uint64_t)v2) >> 64 == (a1 % 1000 * (uint64_t)v2) >> 63)
  {
    sub_244B455A4();
    return;
  }
LABEL_9:
  __break(1u);
}

unint64_t sub_244B42DD4()
{
  unint64_t result;

  result = qword_2573DD3E8;
  if (!qword_2573DD3E8)
  {
    result = MEMORY[0x24951FF40](&protocol conformance descriptor for TimeDelta, &type metadata for TimeDelta);
    atomic_store(result, (unint64_t *)&qword_2573DD3E8);
  }
  return result;
}

BOOL sub_244B42E18(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL sub_244B42E2C(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1;
}

BOOL sub_244B42E40(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2;
}

BOOL sub_244B42E54(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1;
}

uint64_t sub_244B42E68()
{
  uint64_t *v0;

  TimeDelta.prettyDescription.getter(*v0);
  sub_244B451E4();
  swift_bridgeObjectRelease();
  sub_244B451E4();
  return 0x28748688E2;
}

ValueMetadata *type metadata accessor for TimeDelta()
{
  return &type metadata for TimeDelta;
}

Swift::Int64 static Timestamp.- infix(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  Swift::Int64 result;

  v2 = __OFSUB__(a1, a2);
  result = a1 - a2;
  if (!v2)
    return TimeUnit.from(millis:secs:mins:hours:days:weeks:)(result, 0, 0, 0, 0, 0);
  __break(1u);
  return result;
}

uint64_t sub_244B42F08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  double v4;
  double v5;
  uint64_t result;
  double v7;
  uint64_t v8;

  v0 = sub_244B44EFC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244B44ECC();
  sub_244B44EE4();
  v5 = v4;
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7 = v5 * 1000.0;
  if ((~COERCE__INT64(v5 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v7 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v7 < 9.22337204e18)
  {
    qword_2573DD3F0 = (uint64_t)v7;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_244B42FEC()
{
  id v0;
  void *v1;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  v1 = (void *)sub_244B45130();
  objc_msgSend(v0, sel_setDateFormat_, v1);

  qword_2573DD3F8 = (uint64_t)v0;
}

uint64_t static Timestamp.fromCFAbsoluteTime(_:)(double a1)
{
  uint64_t v1;
  double v2;
  uint64_t result;

  v2 = a1 * 1000.0;
  if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v2 < 9.22337204e18)
  {
    v1 = (uint64_t)v2;
    if (qword_2573DBBD0 == -1)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  __break(1u);
LABEL_10:
  swift_once();
LABEL_5:
  result = v1 + qword_2573DD3F0;
  if (__OFADD__(v1, qword_2573DD3F0))
    __break(1u);
  return result;
}

BOOL static Timestamp.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 < a2;
}

BOOL static Timestamp.<= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a2 >= a1;
}

BOOL static Timestamp.> infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a2 < a1;
}

BOOL static Timestamp.>= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 >= a2;
}

BOOL static Timestamp.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t static Timestamp.+ infix(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  uint64_t result;

  v2 = __OFADD__(a1, a2);
  result = a1 + a2;
  if (v2)
    __break(1u);
  return result;
}

uint64_t static Timestamp.- infix(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  uint64_t result;

  v2 = __OFSUB__(a1, a2);
  result = a1 - a2;
  if (v2)
    __break(1u);
  return result;
}

Swift::Double __swiftcall Timestamp.toCFAbsoluteTime()()
{
  uint64_t v0;
  uint64_t v1;
  Swift::Double result;

  v1 = v0;
  if (qword_2573DBBD0 != -1)
    swift_once();
  if (!__OFSUB__(v1, qword_2573DD3F0))
    return (double)(v1 - qword_2573DD3F0) / 1000.0;
  __break(1u);
  return result;
}

NSNumber __swiftcall Timestamp.toNSNumber()()
{
  NSNumber result;
  Class isa;

  isa = result.super.super.isa;
  if (qword_2573DBBD0 != -1)
    result.super.super.isa = (Class)swift_once();
  if (!__OFSUB__(isa, qword_2573DD3F0))
    return (NSNumber)sub_244B4534C();
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall Timestamp.toUnixSecs()()
{
  uint64_t v0;

  return v0 / 1000;
}

uint64_t Timestamp.toDate()(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (qword_2573DBBD0 != -1)
    result = swift_once();
  if (!__OFSUB__(v1, qword_2573DD3F0))
    return sub_244B44ECC();
  __break(1u);
  return result;
}

uint64_t Timestamp.hourOfDay(withTimezone:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = a2;
  v26 = a1;
  v2 = sub_244B44F20();
  v29 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD400);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_244B44F5C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v26 - v13;
  v15 = sub_244B44F38();
  v27 = *(_QWORD *)(v15 - 8);
  v28 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_244B44EFC();
  v19 = *(_QWORD *)(v18 - 8);
  result = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2573DBBD0 != -1)
    result = swift_once();
  if (__OFSUB__(v31, qword_2573DD3F0))
  {
    __break(1u);
  }
  else
  {
    sub_244B44ECC();
    sub_244B44F08();
    sub_244B43DB0(v26, (uint64_t)v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_244B43DF8((uint64_t)v7);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
      sub_244B44F14();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
    v24 = v29;
    v23 = v30;
    (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v4, *MEMORY[0x24BDCF230], v30);
    v25 = sub_244B44F2C();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v23);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v17, v28);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
    return v25;
  }
  return result;
}

uint64_t Timestamp.dayOfWeek(withTimezone:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = a2;
  v26 = a1;
  v2 = sub_244B44F20();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD400);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244B44F5C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v26 - v14;
  v16 = sub_244B44F38();
  v29 = *(_QWORD *)(v16 - 8);
  v30 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_244B44EFC();
  v27 = *(_QWORD *)(v19 - 8);
  v28 = v19;
  result = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2573DBBD0 != -1)
    result = swift_once();
  if (__OFSUB__(v31, qword_2573DD3F0))
  {
    __break(1u);
  }
  else
  {
    sub_244B44ECC();
    sub_244B44F08();
    sub_244B43DB0(v26, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      sub_244B43DF8((uint64_t)v8);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
      sub_244B44F14();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    }
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDCF278], v2);
    v23 = sub_244B44F2C();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    _s17PrivateSearchCore9TimestampV18dayOfWeekFormatterySSSiFZ_0(v23);
    v25 = v24;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v18, v30);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v28);
    return v25;
  }
  return result;
}

Swift::Int64 Timestamp.subtract(millis:secs:mins:hours:days:weeks:)(Swift::Int64 a1, Swift::Int64 a2, Swift::Int64 a3, Swift::Int64 a4, Swift::Int64 a5, Swift::Int64 a6, uint64_t a7)
{
  Swift::Int64 v8;
  BOOL v9;
  Swift::Int64 result;

  v8 = TimeUnit.from(millis:secs:mins:hours:days:weeks:)(a1, a2, a3, a4, a5, a6);
  v9 = __OFSUB__(a7, v8);
  result = a7 - v8;
  if (v9)
    __break(1u);
  return result;
}

Swift::Int64 Timestamp.add(millis:secs:mins:hours:days:weeks:)(Swift::Int64 a1, Swift::Int64 a2, Swift::Int64 a3, Swift::Int64 a4, Swift::Int64 a5, Swift::Int64 a6, uint64_t a7)
{
  Swift::Int64 v8;
  BOOL v9;
  Swift::Int64 result;

  v8 = TimeUnit.from(millis:secs:mins:hours:days:weeks:)(a1, a2, a3, a4, a5, a6);
  v9 = __OFADD__(a7, v8);
  result = a7 + v8;
  if (v9)
    __break(1u);
  return result;
}

unint64_t Timestamp.debugDescription.getter()
{
  sub_244B45430();
  swift_bridgeObjectRelease();
  sub_244B454F0();
  sub_244B451E4();
  swift_bridgeObjectRelease();
  sub_244B451E4();
  return 0xD00000000000001ALL;
}

Swift::String __swiftcall Timestamp.toHumanReadable()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  Swift::String result;
  uint64_t v22;

  v1 = v0;
  v2 = sub_244B44EFC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD400);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2573DBBD8 != -1)
    swift_once();
  v9 = (void *)qword_2573DD3F8;
  sub_244B44F44();
  v10 = sub_244B44F5C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    v12 = (void *)sub_244B44F50();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  objc_msgSend(v9, sel_setTimeZone_, v12);

  v15 = (void *)qword_2573DD3F8;
  if (qword_2573DBBD0 != -1)
    v13 = swift_once();
  if (__OFSUB__(v1, qword_2573DD3F0))
  {
    __break(1u);
  }
  else
  {
    sub_244B44ECC();
    v16 = (void *)sub_244B44ED8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v17 = objc_msgSend(v15, sel_stringFromDate_, v16);

    v18 = sub_244B4513C();
    v20 = v19;

    v13 = v18;
    v14 = v20;
  }
  result._object = v14;
  result._countAndFlagsBits = v13;
  return result;
}

Swift::Int64 Timestamp.toDateIntervalSince(days:weeks:)(Swift::Int64 a1, Swift::Int64 a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  Swift::Int64 result;
  Swift::Int64 v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_244B44EFC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v17 - v12;
  result = TimeUnit.from(millis:secs:mins:hours:days:weeks:)(0, 0, 0, 0, a1, a2);
  v15 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
  }
  else if (qword_2573DBBD0 == -1)
  {
    goto LABEL_3;
  }
  result = swift_once();
LABEL_3:
  v16 = qword_2573DD3F0;
  if (__OFSUB__(v15, qword_2573DD3F0))
  {
    __break(1u);
  }
  else
  {
    sub_244B44ECC();
    result = (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 16))(v11, v13, v6);
    if (!__OFSUB__(a3, v16))
    {
      sub_244B44ECC();
      sub_244B44E60();
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_244B43D04()
{
  return Timestamp.debugDescription.getter();
}

void _s17PrivateSearchCore9TimestampV3nowACyFZ_0()
{
  id v0;
  double v1;
  double v2;
  double v3;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE60]), sel_init);
  objc_msgSend(v0, sel_timeIntervalSince1970);
  v2 = v1;

  v3 = v2 * 1000.0;
  if ((~COERCE__INT64(v2 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v3 >= 9.22337204e18)
LABEL_7:
    __break(1u);
}

uint64_t sub_244B43DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_244B43DF8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD400);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void _s17PrivateSearchCore9TimestampV18dayOfWeekFormatterySSSiFZ_0(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;

  if ((unint64_t)(a1 - 8) >= 0xFFFFFFFFFFFFFFF9)
  {
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
    v3 = (void *)sub_244B45130();
    objc_msgSend(v2, sel_setDateFormat_, v3);

    v4 = objc_msgSend(v2, sel_weekdaySymbols);
    if (v4)
    {
      v5 = v4;
      v6 = a1 - 1;
      v7 = sub_244B4525C();

      if (v6 < *(_QWORD *)(v7 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_244B45190();
        swift_bridgeObjectRelease();

        return;
      }
      __break(1u);
    }
    __break(1u);
  }
}

unint64_t sub_244B43F60()
{
  unint64_t result;

  result = qword_2573DD408;
  if (!qword_2573DD408)
  {
    result = MEMORY[0x24951FF40](&protocol conformance descriptor for Timestamp, &type metadata for Timestamp);
    atomic_store(result, (unint64_t *)&qword_2573DD408);
  }
  return result;
}

ValueMetadata *type metadata accessor for Timestamp()
{
  return &type metadata for Timestamp;
}

Swift::Int64 __swiftcall TimeUnit.toMillis(_:)(Swift::Int64 a1)
{
  char v1;
  uint64_t v3;
  Swift::Int64 result;

  v3 = qword_244B474A0[v1];
  result = a1 * v3;
  if ((unsigned __int128)(a1 * (__int128)v3) >> 64 != result >> 63)
    __break(1u);
  return result;
}

Swift::Int64 __swiftcall TimeUnit.from(millis:secs:mins:hours:days:weeks:)(Swift::Int64 millis, Swift::Int64 secs, Swift::Int64 mins, Swift::Int64 hours, Swift::Int64 days, Swift::Int64 weeks)
{
  char v6;
  uint64_t v7;
  Swift::Int64 v8;
  BOOL v9;
  Swift::Int64 v10;
  Swift::Int64 v11;
  Swift::Int64 v12;
  Swift::Int64 v13;
  Swift::Int64 v14;
  Swift::Int64 v15;
  Swift::Int64 v16;
  Swift::Int64 v17;

  if ((unsigned __int128)(secs * (__int128)1000) >> 64 != (1000 * secs) >> 63)
  {
    __break(1u);
    goto LABEL_13;
  }
  v7 = qword_244B474A0[v6];
  v8 = 1000 * secs / v7;
  v9 = __OFADD__(millis / v7, v8);
  v10 = millis / v7 + v8;
  if (v9)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if ((unsigned __int128)(mins * (__int128)60000) >> 64 != (60000 * mins) >> 63)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v11 = 60000 * mins / v7;
  v9 = __OFADD__(v10, v11);
  v12 = v10 + v11;
  if (v9)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((unsigned __int128)(hours * (__int128)3600000) >> 64 != (3600000 * hours) >> 63)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v13 = 3600000 * hours / v7;
  v9 = __OFADD__(v12, v13);
  v14 = v12 + v13;
  if (v9)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if ((unsigned __int128)(days * (__int128)86400000) >> 64 != (86400000 * days) >> 63)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v15 = 86400000 * days / v7;
  v9 = __OFADD__(v14, v15);
  v16 = v14 + v15;
  if (v9)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if ((unsigned __int128)(weeks * (__int128)604800000) >> 64 != (604800000 * weeks) >> 63)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v17 = 604800000 * weeks / v7;
  millis = v16 + v17;
  if (__OFADD__(v16, v17))
LABEL_21:
    __break(1u);
  return millis;
}

uint64_t static TimeUnit.convert(from:in:to:)(uint64_t result, char a2, char a3)
{
  uint64_t v3;

  v3 = qword_244B474A0[a2];
  if ((unsigned __int128)(result * (__int128)v3) >> 64 == (result * v3) >> 63)
    return result * v3 / qword_244B474A0[a3];
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall TimeUnit.toSecs(_:)(Swift::Int64 result)
{
  char v1;
  uint64_t v2;

  v2 = qword_244B474A0[v1];
  if ((unsigned __int128)(result * (__int128)v2) >> 64 == (result * v2) >> 63)
    return result * v2 / 1000;
  __break(1u);
  return result;
}

BOOL static TimeUnit.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t TimeUnit.hash(into:)()
{
  return sub_244B4558C();
}

void *static TimeUnit.allCases.getter()
{
  return &unk_2515B2348;
}

uint64_t TimeUnit.hashValue.getter()
{
  sub_244B45580();
  sub_244B4558C();
  return sub_244B45598();
}

BOOL sub_244B441C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_244B441DC()
{
  sub_244B45580();
  sub_244B4558C();
  return sub_244B45598();
}

uint64_t sub_244B44220()
{
  return sub_244B4558C();
}

uint64_t sub_244B44248()
{
  sub_244B45580();
  sub_244B4558C();
  return sub_244B45598();
}

void sub_244B44288(_QWORD *a1@<X8>)
{
  *a1 = &unk_2515B2348;
}

Swift::Int64 __swiftcall TimeUnit.toMinutes(_:)(Swift::Int64 result)
{
  char v1;
  uint64_t v2;

  v2 = qword_244B474A0[v1];
  if ((unsigned __int128)(result * (__int128)v2) >> 64 == (result * v2) >> 63)
    return result * v2 / 60000;
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall TimeUnit.toHours(_:)(Swift::Int64 result)
{
  char v1;
  uint64_t v2;

  v2 = qword_244B474A0[v1];
  if ((unsigned __int128)(result * (__int128)v2) >> 64 == (result * v2) >> 63)
    return result * v2 / 3600000;
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall TimeUnit.toDays(_:)(Swift::Int64 result)
{
  char v1;
  uint64_t v2;

  v2 = qword_244B474A0[v1];
  if ((unsigned __int128)(result * (__int128)v2) >> 64 == (result * v2) >> 63)
    return result * v2 / 86400000;
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall TimeUnit.toWeeks(_:)(Swift::Int64 result)
{
  char v1;
  uint64_t v2;

  v2 = qword_244B474A0[v1];
  if ((unsigned __int128)(result * (__int128)v2) >> 64 == (result * v2) >> 63)
    return result * v2 / 604800000;
  __break(1u);
  return result;
}

unint64_t sub_244B443AC()
{
  unint64_t result;

  result = qword_2573DD410;
  if (!qword_2573DD410)
  {
    result = MEMORY[0x24951FF40](&protocol conformance descriptor for TimeUnit, &type metadata for TimeUnit);
    atomic_store(result, (unint64_t *)&qword_2573DD410);
  }
  return result;
}

unint64_t sub_244B443F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573DD418;
  if (!qword_2573DD418)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573DD420);
    result = MEMORY[0x24951FF40](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2573DD418);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TimeUnit(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TimeUnit(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_244B44528 + 4 * byte_244B473E5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_244B4455C + 4 * asc_244B473E0[v4]))();
}

uint64_t sub_244B4455C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244B44564(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244B4456CLL);
  return result;
}

uint64_t sub_244B44578(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244B44580);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_244B44584(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244B4458C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244B44598(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_244B445A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TimeUnit()
{
  return &type metadata for TimeUnit;
}

void Array<A>.parseUInt32BigEndian()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = swift_bridgeObjectRetain();
  sub_244B44B98(v0);
  v2 = v1;
  swift_bridgeObjectRelease();
  __asm { BR              X10 }
}

uint64_t sub_244B44608()
{
  uint64_t v0;
  unint64_t v1;

  sub_244B2E2F8(v0, v1);
  return bswap32(v0);
}

void Array<A>.parseUInt64BigEndian()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = swift_bridgeObjectRetain();
  sub_244B44B98(v0);
  v2 = v1;
  swift_bridgeObjectRelease();
  __asm { BR              X10 }
}

void Array<A>.parseUInt32LittleEndian()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = swift_bridgeObjectRetain();
  sub_244B44B98(v0);
  v2 = v1;
  swift_bridgeObjectRelease();
  __asm { BR              X10 }
}

uint64_t sub_244B44854()
{
  uint64_t v0;
  unint64_t v1;

  sub_244B2E2F8(v0, v1);
  return v0;
}

uint64_t Array<A>.toData()()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_244B44B98(v0);
  swift_bridgeObjectRelease();
  return v1;
}

_BYTE *sub_244B4496C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_244B449E0(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_244B44AA0((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_244B44B18((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_244B449E0(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_244B44AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_244B44E9C();
  swift_allocObject();
  result = sub_244B44E6C();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_244B44EB4();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_244B44B18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_244B44E9C();
  swift_allocObject();
  result = sub_244B44E6C();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_244B44B98(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  unint64_t v10;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DD428);
  v10 = sub_244B44C30();
  v8[0] = a1;
  v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  v3 = (_BYTE *)(*v2 + 32);
  v4 = &v3[*(_QWORD *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_244B4496C(v3, v4, &v7);
  v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

unint64_t sub_244B44C30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573DD430;
  if (!qword_2573DD430)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573DD428);
    result = MEMORY[0x24951FF40](MEMORY[0x24BDCFBE0], v1);
    atomic_store(result, (unint64_t *)&qword_2573DD430);
  }
  return result;
}

uint64_t sub_244B44C80(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for ValidationError(uint64_t a1)
{
  return sub_244B44CA8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_244B44CA8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s17PrivateSearchCore15ValidationErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_244B44C80(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ValidationError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_244B44C80(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_244B44CA8(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ValidationError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_244B44CA8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ValidationError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ValidationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_244B44E40(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_244B44E48(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ValidationError()
{
  return &type metadata for ValidationError;
}

uint64_t sub_244B44E60()
{
  return MEMORY[0x24BDCB838]();
}

uint64_t sub_244B44E6C()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_244B44E78()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_244B44E84()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_244B44E90()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_244B44E9C()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_244B44EA8()
{
  return MEMORY[0x24BDCDBF8]();
}

uint64_t sub_244B44EB4()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_244B44EC0()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_244B44ECC()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_244B44ED8()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_244B44EE4()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_244B44EF0()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_244B44EFC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_244B44F08()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_244B44F14()
{
  return MEMORY[0x24BDCF1D0]();
}

uint64_t sub_244B44F20()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_244B44F2C()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t sub_244B44F38()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_244B44F44()
{
  return MEMORY[0x24BDCF4B0]();
}

uint64_t sub_244B44F50()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_244B44F5C()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_244B44F68()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_244B44F80()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_244B44F8C()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_244B44F98()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_244B44FA4()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_244B44FB0()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_244B44FBC()
{
  return MEMORY[0x24BE5C0C0]();
}

uint64_t sub_244B44FC8()
{
  return MEMORY[0x24BE5C0D0]();
}

uint64_t sub_244B44FD4()
{
  return MEMORY[0x24BE5C0E8]();
}

uint64_t sub_244B44FE0()
{
  return MEMORY[0x24BE5C100]();
}

uint64_t sub_244B44FEC()
{
  return MEMORY[0x24BE5C118]();
}

uint64_t sub_244B44FF8()
{
  return MEMORY[0x24BE5C148]();
}

uint64_t sub_244B45004()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_244B45010()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_244B4501C()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_244B45028()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_244B45034()
{
  return MEMORY[0x24BE5C2A8]();
}

uint64_t sub_244B45040()
{
  return MEMORY[0x24BE5C2B0]();
}

uint64_t sub_244B4504C()
{
  return MEMORY[0x24BE5C2C0]();
}

uint64_t sub_244B45058()
{
  return MEMORY[0x24BE5C2D8]();
}

uint64_t sub_244B45064()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t sub_244B45070()
{
  return MEMORY[0x24BE5C300]();
}

uint64_t sub_244B4507C()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_244B45088()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_244B45094()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_244B450A0()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_244B450AC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_244B450B8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_244B450C4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_244B450D0()
{
  return MEMORY[0x24BEE5450]();
}

uint64_t sub_244B450DC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_244B450E8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_244B450F4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_244B45100()
{
  return MEMORY[0x24BEE0290]();
}

uint64_t sub_244B4510C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_244B45118()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_244B45124()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_244B45130()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_244B4513C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_244B45148()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_244B45154()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_244B45160()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_244B4516C()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_244B45178()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_244B45184()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_244B45190()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_244B4519C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_244B451A8()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_244B451B4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_244B451C0()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_244B451CC()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_244B451D8()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_244B451E4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_244B451F0()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_244B451FC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_244B45208()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_244B45214()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_244B45220()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_244B4522C()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_244B45238()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_244B45244()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_244B45250()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_244B4525C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_244B45268()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_244B45274()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_244B45280()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_244B4528C()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_244B45298()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_244B452A4()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_244B452B0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_244B452BC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_244B452C8()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_244B452D4()
{
  return MEMORY[0x24BEE6C80]();
}

uint64_t sub_244B452E0()
{
  return MEMORY[0x24BEE6CA8]();
}

uint64_t sub_244B452EC()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_244B452F8()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_244B45304()
{
  return MEMORY[0x24BEE6CD0]();
}

uint64_t sub_244B45310()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t sub_244B4531C()
{
  return MEMORY[0x24BEE6CE8]();
}

uint64_t sub_244B45328()
{
  return MEMORY[0x24BEE6D08]();
}

uint64_t sub_244B45334()
{
  return MEMORY[0x24BEE6D28]();
}

uint64_t sub_244B45340()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t sub_244B4534C()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_244B45358()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_244B45364()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_244B45370()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_244B4537C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_244B45388()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_244B45394()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_244B453A0()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_244B453AC()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_244B453B8()
{
  return MEMORY[0x24BEE5778]();
}

uint64_t sub_244B453C4()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_244B453D0()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_244B453DC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_244B453E8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_244B453F4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_244B45400()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_244B4540C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_244B45418()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_244B45424()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_244B45430()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_244B4543C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_244B45448()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_244B45454()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_244B45460()
{
  return MEMORY[0x24BEE6EB0]();
}

uint64_t sub_244B4546C()
{
  return MEMORY[0x24BEE6EB8]();
}

uint64_t sub_244B45478()
{
  return MEMORY[0x24BEE6EC0]();
}

uint64_t sub_244B45484()
{
  return MEMORY[0x24BEE6ED8]();
}

uint64_t sub_244B45490()
{
  return MEMORY[0x24BEE6EE8]();
}

uint64_t sub_244B4549C()
{
  return MEMORY[0x24BEE6F00]();
}

uint64_t sub_244B454A8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_244B454B4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_244B454C0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_244B454CC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_244B454D8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_244B454E4()
{
  return MEMORY[0x24BEE6F50]();
}

uint64_t sub_244B454F0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_244B454FC()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_244B45508()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_244B45514()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_244B45520()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_244B4552C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_244B45538()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_244B45544()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_244B45550()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_244B4555C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_244B45568()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_244B45574()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_244B45580()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_244B4558C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_244B45598()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_244B455A4()
{
  return MEMORY[0x24BEE4848]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC0E8](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

