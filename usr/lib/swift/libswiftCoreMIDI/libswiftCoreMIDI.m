uint64_t UnsafeMutableMIDIEventPacketPointer.count.getter()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)v0 + 8);
}

uint64_t key path getter for UnsafeMutableMIDIEventPacketPointer.count : UnsafeMutableMIDIEventPacketPointer@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(unsigned int *)(*(_QWORD *)result + 8);
  return result;
}

unint64_t *key path setter for UnsafeMutableMIDIEventPacketPointer.count : UnsafeMutableMIDIEventPacketPointer(unint64_t *result, uint64_t a2)
{
  unint64_t v2;

  v2 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(v2))
  {
    *(_DWORD *)(*(_QWORD *)a2 + 8) = v2;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t UnsafeMutableMIDIEventPacketPointer.count.setter(unint64_t result)
{
  uint64_t v1;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(result))
  {
    *(_DWORD *)(*(_QWORD *)v1 + 8) = result;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *(*UnsafeMutableMIDIEventPacketPointer.count.modify(_QWORD *a1))(unint64_t *result, char a2)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  a1[1] = *v1;
  *a1 = *(unsigned int *)(v2 + 8);
  return UnsafeMutableMIDIEventPacketPointer.count.modify;
}

unint64_t *UnsafeMutableMIDIEventPacketPointer.count.modify(unint64_t *result, char a2)
{
  unint64_t v2;

  v2 = *result;
  if ((a2 & 1) != 0)
  {
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (!HIDWORD(v2))
    {
LABEL_7:
      *(_DWORD *)(result[1] + 8) = v2;
      return result;
    }
    __break(1u);
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (!HIDWORD(v2))
    goto LABEL_7;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t (*UnsafeMutableMIDIEventPacketPointer.timeStamp.modify(uint64_t (*result)()))()
{
  uint64_t **v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = *v1;
  *((_QWORD *)result + 1) = *v1;
  v3 = *v2;
  if (v3 < 0)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)result = v3;
    return UnsafeMutableMIDIEventPacketPointer.timeStamp.modify;
  }
  return result;
}

uint64_t UnsafeMutableMIDIEventPacketPointer.startIndex.getter()
{
  return 0;
}

uint64_t key path getter for UnsafeMutableMIDIEventPacketPointer.subscript(_:) : UnsafeMutableMIDIEventPacketPointer@<X0>(uint64_t result@<X0>, unint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  unint64_t v3;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(_QWORD *)result + 8))
  {
    *a3 = *(_DWORD *)(*(_QWORD *)result + 4 * v3 + 12);
    return result;
  }
  __break(1u);
  return result;
}

_DWORD *key path setter for UnsafeMutableMIDIEventPacketPointer.subscript(_:) : UnsafeMutableMIDIEventPacketPointer(_DWORD *result, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;

  v3 = *a3;
  if ((*a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(_QWORD *)a2 + 8))
  {
    *(_DWORD *)(*(_QWORD *)a2 + 4 * v3 + 12) = *result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t UnsafeMutableMIDIEventPacketPointer.subscript.setter(uint64_t result, unint64_t a2)
{
  uint64_t v2;

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)(*(_QWORD *)v2 + 8) > a2)
  {
    *(_DWORD *)(*(_QWORD *)v2 + 4 * a2 + 12) = result;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *(*UnsafeMutableMIDIEventPacketPointer.subscript.modify(unint64_t *(*result)(unint64_t *result, char a2), unint64_t a2))(unint64_t *result, char a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)result = a2;
  *((_QWORD *)result + 1) = v3;
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)(v3 + 8) > a2)
  {
    *((_DWORD *)result + 4) = *(_DWORD *)(v3 + 4 * a2 + 12);
    return UnsafeMutableMIDIEventPacketPointer.subscript.modify;
  }
  __break(1u);
  return result;
}

unint64_t *UnsafeMutableMIDIEventPacketPointer.subscript.modify(unint64_t *result, char a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;

  v3 = *result;
  v2 = result[1];
  v4 = *(unsigned int *)(v2 + 8);
  v5 = *result >= v4;
  if ((a2 & 1) != 0)
  {
    if (*result < v4)
    {
LABEL_5:
      *(_DWORD *)(v2 + 4 * v3 + 12) = *((_DWORD *)result + 4);
      return result;
    }
    __break(1u);
  }
  if (!v5)
    goto LABEL_5;
  __break(1u);
  return result;
}

_DWORD *protocol witness for MutableCollection.subscript.setter in conformance UnsafeMutableMIDIEventPacketPointer(_DWORD *result, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(_QWORD *)v2 + 8))
  {
    *(_DWORD *)(*(_QWORD *)v2 + 4 * v3 + 12) = *result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer(unint64_t *(**a1)(unint64_t *result, char a2), unint64_t *a2))()
{
  unint64_t *(*v4)(unint64_t *, char);

  v4 = (unint64_t *(*)(unint64_t *, char))malloc(0x28uLL);
  *a1 = v4;
  *((_QWORD *)v4 + 4) = UnsafeMutableMIDIEventPacketPointer.subscript.modify(v4, *a2);
  return protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer;
}

uint64_t *protocol witness for MutableCollection.subscript.setter in conformance UnsafeMutableMIDIEventPacketPointer(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;

  return specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v2, *a2, a2[1], *a1, a1[1], a1[2]);
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer(void (***a1)(uint64_t a1, uint64_t a2), uint64_t *a2))()
{
  void (**v4)(uint64_t, uint64_t);

  v4 = (void (**)(uint64_t, uint64_t))malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer;
}

void (*specialized MutableCollection<>.subscript.modify(void (**a1)(uint64_t a1, uint64_t a2), uint64_t a2, uint64_t a3))(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  void (*result)(uint64_t, uint64_t);
  uint64_t v8;

  result = (void (*)(uint64_t, uint64_t))malloc(0x30uLL);
  *a1 = result;
  *((_QWORD *)result + 4) = a3;
  *((_QWORD *)result + 5) = v3;
  *((_QWORD *)result + 3) = a2;
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v8 = *v3;
    if (*(unsigned int *)(*v3 + 8) >= a3)
    {
      *((_QWORD *)result + 1) = a3;
      *((_QWORD *)result + 2) = v8;
      *(_QWORD *)result = a2;
      return MutableCollection<>.subscript.modifyspecialized ;
    }
  }
  __break(1u);
  return result;
}

{
  uint64_t *v3;
  void (*result)(uint64_t, uint64_t);
  uint64_t v8;

  result = (void (*)(uint64_t, uint64_t))malloc(0x30uLL);
  *a1 = result;
  *((_QWORD *)result + 4) = a3;
  *((_QWORD *)result + 5) = v3;
  *((_QWORD *)result + 3) = a2;
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v8 = *v3;
    if (*(unsigned __int16 *)(*v3 + 8) >= a3)
    {
      *((_QWORD *)result + 1) = a3;
      *((_QWORD *)result + 2) = v8;
      *(_QWORD *)result = a2;
      return MutableCollection<>.subscript.modifyspecialized ;
    }
  }
  __break(1u);
  return result;
}

void MutableCollection<>.subscript.modifyspecialized (uint64_t a1, uint64_t a2)
{
  MutableCollection<>.subscript.modifyspecialized (a1, a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))specialized _writeBackMutableSlice<A, B>(_:bounds:slice:));
}

{
  MutableCollection<>.subscript.modifyspecialized (a1, a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))specialized _writeBackMutableSlice<A, B>(_:bounds:slice:));
}

void MutableCollection<>.subscript.modifyspecialized (uint64_t a1, uint64_t a2, void (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v3;

  v3 = *(_QWORD **)a1;
  a3(*(_QWORD *)(*(_QWORD *)a1 + 40), v3[3], *(_QWORD *)(*(_QWORD *)a1 + 32), *v3, v3[1], v3[2]);
  free(v3);
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(unint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;

  result = specialized MutableCollection<>._partitionImpl(by:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance UnsafeMutableMIDIEventPacketPointer(unint64_t *a1, unint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

unint64_t specialized MutableCollection.swapAt(_:_:)(unint64_t result, unint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;

  if (result != a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v3 = *v2;
      v4 = *(unsigned __int16 *)(*v2 + 8);
      if (v4 > result)
      {
        if ((a2 & 0x8000000000000000) == 0)
        {
          if (v4 > a2)
          {
            v5 = v3 + 10;
            v6 = *(_BYTE *)(v3 + 10 + result);
            *(_BYTE *)(v5 + result) = *(_BYTE *)(v5 + a2);
            if (*(unsigned __int16 *)(*v2 + 8) > a2)
            {
              *(_BYTE *)(*v2 + a2 + 10) = v6;
              return result;
            }
LABEL_13:
            __break(1u);
            return result;
          }
LABEL_12:
          __break(1u);
          goto LABEL_13;
        }
LABEL_11:
        __break(1u);
        goto LABEL_12;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;

  if (result != a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v3 = *v2;
      v4 = *(unsigned int *)(*v2 + 8);
      if (v4 > result)
      {
        if ((a2 & 0x8000000000000000) == 0)
        {
          if (v4 > a2)
          {
            v5 = v3 + 12;
            v6 = *(_DWORD *)(v3 + 12 + 4 * result);
            *(_DWORD *)(v5 + 4 * result) = *(_DWORD *)(v5 + 4 * a2);
            if (*(unsigned int *)(*v2 + 8) > a2)
            {
              *(_DWORD *)(*v2 + 4 * a2 + 12) = v6;
              return result;
            }
LABEL_13:
            __break(1u);
            return result;
          }
LABEL_12:
          __break(1u);
          goto LABEL_13;
        }
LABEL_11:
        __break(1u);
        goto LABEL_12;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

uint64_t protocol witness for MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:) in conformance UnsafeMutableMIDIEventPacketPointer()
{
  return MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)();
}

uint64_t protocol witness for MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:) in conformance UnsafeMutableMIDIEventPacketPointer()
{
  return MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)();
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  return protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance UnsafeMutableMIDIEventPacketPointer(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))specialized RandomAccessCollection.index(_:offsetBy:limitedBy:), a4);
}

unint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  BOOL v7;

  v4 = *(unsigned int *)(a4 + 8);
  if (v4 < result || v4 < a3)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = a3 - result;
  if (a2 >= 1)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2)
      goto LABEL_13;
    return 0;
  }
  if (v6 <= 0 && v6 > a2)
    return 0;
LABEL_13:
  v7 = __OFADD__(result, a2);
  result += a2;
  if (v7)
    goto LABEL_16;
  if (result > v4)
LABEL_17:
    __break(1u);
  return result;
}

{
  unint64_t v4;
  uint64_t v6;
  BOOL v7;

  v4 = *(unsigned __int16 *)(a4 + 8);
  if (v4 < result || v4 < a3)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = a3 - result;
  if (a2 >= 1)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2)
      goto LABEL_13;
    return 0;
  }
  if (v6 <= 0 && v6 > a2)
    return 0;
LABEL_13:
  v7 = __OFADD__(result, a2);
  result += a2;
  if (v7)
    goto LABEL_16;
  if (result > v4)
LABEL_17:
    __break(1u);
  return result;
}

void protocol witness for Collection.startIndex.getter in conformance UnsafeMutableMIDIEventPacketPointer(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void protocol witness for Collection.endIndex.getter in conformance UnsafeMutableMIDIEventPacketPointer(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(unsigned int *)(*(_QWORD *)v1 + 8);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance UnsafeMutableMIDIEventPacketPointer(uint64_t (*result)(), unint64_t *a2))()
{
  uint64_t v2;
  unint64_t v3;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(_QWORD *)v2 + 8))
  {
    *(_DWORD *)result = *(_DWORD *)(*(_QWORD *)v2 + 4 * v3 + 12);
    return protocol witness for Collection.subscript.read in conformance UnsafeMutableMIDIEventPacketPointer;
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance UnsafeMutableMIDIEventPacketPointer(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned int *)(*(_QWORD *)v1 + 8);
  *a1 = 0;
  a1[1] = v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance UnsafeMutableMIDIEventPacketPointer()
{
  uint64_t v0;

  return *(_DWORD *)(*(_QWORD *)v0 + 8) == 0;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t (*a4)(_QWORD, uint64_t, _QWORD, _QWORD)@<X5>, uint64_t a5@<X8>)
{
  _QWORD *v5;
  uint64_t result;
  char v8;

  result = a4(*a1, a2, *a3, *v5);
  *(_QWORD *)a5 = result;
  *(_BYTE *)(a5 + 8) = v8 & 1;
  return result;
}

uint64_t MIDIEventPacket.WordSequence.Iterator.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *(unsigned int *)(*(_QWORD *)result + 8);
  *a2 = *(_QWORD *)result + 12;
  a2[1] = 0;
  a2[2] = v2;
  return result;
}

Swift::UInt32_optional __swiftcall MIDIEventPacket.WordSequence.Iterator.next()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[1];
  v2 = v0[2];
  if (v1 < v2)
  {
    v3 = *(unsigned int *)(*v0 + 4 * v1);
    v0[1] = v1 + 1;
  }
  else
  {
    v3 = 0;
  }
  return (Swift::UInt32_optional)(v3 | ((unint64_t)(v1 >= v2) << 32));
}

void protocol witness for IteratorProtocol.next() in conformance MIDIEventPacket.WordSequence.Iterator(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  v2 = v1[1];
  v3 = v1[2];
  if (v2 < v3)
  {
    v4 = *(_DWORD *)(*v1 + 4 * v2);
    v1[1] = v2 + 1;
  }
  else
  {
    v4 = 0;
  }
  *(_DWORD *)a1 = v4;
  *(_BYTE *)(a1 + 4) = v2 >= v3;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance MIDIEventPacket.WordSequence()
{
  return 0;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance MIDIEventPacket.WordSequence()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance MIDIEventPacket.WordSequence()
{
  uint64_t *v0;

  return specialized _copySequenceToContiguousArray<A>(_:)(*v0);
}

_QWORD *specialized Sequence._copyContents(initializing:)(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = a7 + 8;
  v8 = *(unsigned int *)(a7 + 4);
  if (!a2)
  {
LABEL_8:
    a3 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
LABEL_9:
    *result = v7;
    result[1] = a3;
    result[2] = v8;
    return (_QWORD *)a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if ((_DWORD)v8)
    {
      *a2 = v7;
      if (a3 != 1)
      {
        if ((_DWORD)v8 == 1)
        {
          a3 = 1;
        }
        else
        {
          v9 = 0;
          while (1)
          {
            v7 += 4 * *(unsigned int *)(v7 + 8) + 12;
            a2[v9 + 1] = v7;
            if (a3 - 2 == v9)
              break;
            if (v8 - 1 == ++v9)
            {
              a3 = v9 + 1;
              goto LABEL_9;
            }
          }
        }
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

unint64_t *specialized Sequence._copyContents(initializing:)(unint64_t *result, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6)
{
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;

  v8 = *a6;
  v6 = (unint64_t)(a6 + 1);
  v7 = v8;
  if (!a2)
  {
LABEL_8:
    a3 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
LABEL_9:
    *result = v6;
    result[1] = a3;
    result[2] = v7;
    return (unint64_t *)a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if ((_DWORD)v7)
    {
      *a2 = v6;
      if (a3 != 1)
      {
        if ((_DWORD)v7 == 1)
        {
          a3 = 1;
        }
        else
        {
          v9 = 0;
          while (1)
          {
            v6 = (v6 + *(unsigned __int16 *)(v6 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
            a2[v9 + 1] = v6;
            if (a3 - 2 == v9)
              break;
            if (v7 - 1 == ++v9)
            {
              a3 = v9 + 1;
              goto LABEL_9;
            }
          }
        }
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

_QWORD *specialized Sequence._copyContents(initializing:)(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a4 + 8;
  v5 = *(unsigned int *)(a4 + 4);
  if (!a2)
  {
LABEL_8:
    a3 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
LABEL_9:
    *result = v4;
    result[1] = a3;
    result[2] = v5;
    return (_QWORD *)a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if ((_DWORD)v5)
    {
      *a2 = v4;
      if (a3 != 1)
      {
        if ((_DWORD)v5 == 1)
        {
          a3 = 1;
        }
        else
        {
          v6 = 0;
          while (1)
          {
            v4 += 4 * *(unsigned int *)(v4 + 8) + 12;
            a2[v6 + 1] = v4;
            if (a3 - 2 == v6)
              break;
            if (v5 - 1 == ++v6)
            {
              a3 = v6 + 1;
              goto LABEL_9;
            }
          }
        }
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

unint64_t *specialized Sequence._copyContents(initializing:)(unint64_t *result, unint64_t *a2, uint64_t a3, unsigned int *a4)
{
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v6 = *a4;
  v4 = (unint64_t)(a4 + 1);
  v5 = v6;
  if (!a2)
  {
LABEL_8:
    a3 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
LABEL_9:
    *result = v4;
    result[1] = a3;
    result[2] = v5;
    return (unint64_t *)a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if ((_DWORD)v5)
    {
      *a2 = v4;
      if (a3 != 1)
      {
        if ((_DWORD)v5 == 1)
        {
          a3 = 1;
        }
        else
        {
          v7 = 0;
          while (1)
          {
            v4 = (v4 + *(unsigned __int16 *)(v4 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
            a2[v7 + 1] = v4;
            if (a3 - 2 == v7)
              break;
            if (v5 - 1 == ++v7)
            {
              a3 = v7 + 1;
              goto LABEL_9;
            }
          }
        }
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance MIDIEventPacket.WordSequence()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t MIDIEventPacket.WordCollection.startIndex.getter()
{
  return 0;
}

unint64_t UnsafeMutableMIDIEventPacketPointer.subscript.getter(unint64_t result)
{
  uint64_t v1;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)(*(_QWORD *)v1 + 8) > result)
  {
    return *(unsigned int *)(*(_QWORD *)v1 + 4 * result + 12);
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(_QWORD *result@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;

  v3 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(_QWORD *)v2 + 8))
  {
    *a2 = v3;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance UnsafeMutableMIDIEventPacketPointer(unint64_t *result)
{
  uint64_t v1;
  unint64_t v2;

  v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v2 < *(unsigned int *)(*(_QWORD *)v1 + 8))
  {
    *result = v2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.subscript.getter in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  if (*result < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = result[1];
    v5 = *v2;
    if (v4 <= *(unsigned int *)(*v2 + 8))
    {
      a2[1] = v4;
      a2[2] = v5;
      *a2 = v3;
      return result;
    }
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v4;

  v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 <= *(unsigned int *)(*(_QWORD *)v3 + 8))
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance UnsafeMutableMIDIEventPacketPointer(unint64_t *result, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = *(unsigned int *)(*(_QWORD *)v2 + 8);
  if (*result <= v4 && v3 <= v4)
    return (unint64_t *)(v3 - *result);
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.index(after:) in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v3 = *result;
  if (*result >= (unint64_t)*(unsigned int *)(*(_QWORD *)v2 + 8))
  {
    __break(1u);
  }
  else
  {
    v4 = __OFADD__(v3, 1);
    v5 = v3 + 1;
    if (!v4)
    {
      *a2 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.formIndex(after:) in conformance UnsafeMutableMIDIEventPacketPointer(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v2 = *result;
  if (*result >= (unint64_t)*(unsigned int *)(*(_QWORD *)v1 + 8))
  {
    __break(1u);
  }
  else
  {
    v3 = __OFADD__(v2, 1);
    v4 = v2 + 1;
    if (!v3)
    {
      *result = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance MIDIEventPacket.WordCollection()
{
  uint64_t *v0;

  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance MIDIEventPacket.WordCollection(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

void MIDIEventPacket.WordSequence.makeIterator()(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned int *)(*(_QWORD *)v1 + 8);
  *a1 = *(_QWORD *)v1 + 12;
  a1[1] = 0;
  a1[2] = v2;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance UnsafeMutableMIDIEventPacketPointer()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)v0 + 8);
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance UnsafeMutableMIDIEventPacketPointer()
{
  uint64_t *v0;

  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance UnsafeMutableMIDIEventPacketPointer(_QWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

size_t MIDIEventPacket.Builder.__allocating_init(maximumNumberMIDIWords:)(uint64_t a1)
{
  size_t result;
  size_t v3;

  result = swift_allocObject();
  *(_QWORD *)(result + 24) = 0;
  if (a1 < 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  if ((unint64_t)(a1 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v3 = result;
  result = 4 * a1 + 12;
  if (__OFADD__(4 * a1, 12))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  result = (size_t)calloc(result, 1uLL);
  if (result)
  {
    *(_QWORD *)(v3 + 16) = result;
    swift_beginAccess();
    *(_QWORD *)(v3 + 24) = a1;
    return v3;
  }
LABEL_9:
  __break(1u);
  return result;
}

int64_t MIDIEventPacket.Builder.init(maximumNumberMIDIWords:)(int64_t result)
{
  uint64_t v1;
  int64_t v2;

  *(_QWORD *)(v1 + 24) = 0;
  if (result < 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  v2 = result;
  if ((unint64_t)(result - 0x2000000000000000) >> 62 != 3)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  result = 4 * result + 12;
  if (__OFADD__(4 * v2, 12))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  result = (int64_t)calloc(result, 1uLL);
  if (result)
  {
    *(_QWORD *)(v1 + 16) = result;
    swift_beginAccess();
    *(_QWORD *)(v1 + 24) = v2;
    return v1;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t MIDIEventPacket.Builder.count.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned int *)(*(_QWORD *)(v0 + 16) + 8);
}

uint64_t (*MIDIEventPacket.Builder.timeStamp.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*result)();
  uint64_t v5;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  result = (uint64_t (*)())swift_beginAccess();
  v5 = **(_QWORD **)(v1 + 16);
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    v3[3] = v5;
    return MIDIEventPacket.Builder.timeStamp.modify;
  }
  return result;
}

uint64_t MIDIEventPacket.Builder.append(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  int v10;

  result = swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(unsigned int *)(v4 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = v5 + v6;
  if (__OFADD__(v5, v6))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  result = swift_beginAccess();
  if (*(_QWORD *)(v1 + 24) < v7)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (v6)
  {
    v8 = (int *)(a1 + 32);
    v9 = *(unsigned int *)(v4 + 8);
    while ((_DWORD)v9 != -1)
    {
      v10 = *v8++;
      *(_DWORD *)(v4 + 12 + 4 * v9++) = v10;
      *(_DWORD *)(v4 + 8) = v9;
      if (!--v6)
        return result;
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

uint64_t static MIDIEventList.sizeInBytes(pktList:)(uint64_t a1)
{
  uint64_t v1;
  int i;

  v1 = a1 + 8;
  for (i = *(_DWORD *)(a1 + 4); i; --i)
    v1 += 4 * *(unsigned int *)(v1 + 8) + 12;
  return v1 - a1;
}

uint64_t MIDIEventPacketNext(uint64_t a1)
{
  return a1 + 4 * *(unsigned int *)(a1 + 8) + 12;
}

MIDIEventList *UnsafeMutableMIDIEventListPointer.init(_:wordSize:inProtocol:)@<X0>(MIDIProtocolID protocol@<W2>, MIDIEventList *result@<X0>, uint64_t a3@<X1>, uint64_t a4@<X8>)
{
  MIDIEventList *v6;
  uint64_t v7;

  if ((unint64_t)(a3 - 0x2000000000000000) >> 62 == 3)
  {
    v6 = result;
    v7 = 4 * a3;
    result = (MIDIEventList *)MIDIEventListInit(result, protocol);
    *(_QWORD *)a4 = v7;
    *(_QWORD *)(a4 + 8) = result;
    *(_DWORD *)(a4 + 16) = protocol;
    *(_QWORD *)(a4 + 24) = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void MIDIEventList.UnsafeSequence.makeIterator()(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned int *)(*(_QWORD *)v1 + 4);
  *a1 = *(_QWORD *)v1 + 8;
  a1[1] = 0;
  a1[2] = v2;
}

uint64_t MIDIEventList.UnsafeSequence.Iterator.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *(unsigned int *)(*(_QWORD *)result + 4);
  *a2 = *(_QWORD *)result + 8;
  a2[1] = 0;
  a2[2] = v2;
  return result;
}

uint64_t MIDIEventList.UnsafeSequence.count.getter()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)v0 + 4);
}

uint64_t MIDIEventList.UnsafeSequence.Iterator.next()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;

  v1 = v0[1];
  if (v1 >= v0[2])
    return 0;
  result = *v0;
  if (v1 >= 1)
  {
    result += 4 * *(unsigned int *)(result + 8) + 12;
    *v0 = result;
  }
  v0[1] = v1 + 1;
  return result;
}

uint64_t protocol witness for IteratorProtocol.next() in conformance MIDIEventList.UnsafeSequence.Iterator@<X0>(uint64_t *a1@<X8>)
{
  return protocol witness for IteratorProtocol.next() in conformance MIDIEventList.UnsafeSequence.Iterator(MIDIEventPacketNext, a1);
}

void protocol witness for Sequence.makeIterator() in conformance MIDIEventList.UnsafeSequence(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned int *)(*(_QWORD *)v1 + 4);
  *a1 = *(_QWORD *)v1 + 8;
  a1[1] = 0;
  a1[2] = v2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance MIDIEventList.UnsafeSequence()
{
  uint64_t *v0;

  return specialized _copySequenceToContiguousArray<A>(_:)(*v0);
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance MIDIEventList.UnsafeSequence(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t UnsafeMutableMIDIEventListPointer.listSizeInBytes.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t UnsafeMutableMIDIEventListPointer.lastPacket.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t UnsafeMutableMIDIEventListPointer.midiProtocol.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 16);
}

double UnsafeMutableMIDIEventListPointer.init(_:wordSize:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  double result;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 && (UnsafeMutableMIDIEventListPointer.init(_:wordSize:)(&v6), (v3 = v8) != 0))
  {
    v4 = v7;
    result = *(double *)&v6;
    *(_OWORD *)a2 = v6;
    *(_QWORD *)(a2 + 16) = v4;
    *(_QWORD *)(a2 + 24) = v3;
  }
  else
  {
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t UnsafeMutableMIDIEventListPointer.count.getter()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)(v0 + 24) + 4);
}

Swift::Void __swiftcall UnsafeMutableMIDIEventListPointer.clear()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 8) = MIDIEventListInit(*(MIDIEventList **)(v0 + 24), (MIDIProtocolID)*(_DWORD *)(v0 + 16));
}

MIDIEventPacket *UnsafeMutableMIDIEventListPointer.append(timestamp:words:)(MIDITimeStamp time, uint64_t a2)
{
  uint64_t v2;
  MIDIEventPacket *v3;
  MIDIEventPacket *result;

  v3 = *(MIDIEventPacket **)(v2 + 8);
  if (!v3)
    return 0;
  result = MIDIEventListAdd(*(MIDIEventList **)(v2 + 24), *(_QWORD *)v2, v3, time, *(_QWORD *)(a2 + 16), (const UInt32 *)(a2 + 32));
  *(_QWORD *)(v2 + 8) = result;
  return result;
}

void UnsafeMutableMIDIEventListPointer.makeIterator()(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = v2 + 8;
  v4 = *(unsigned int *)(v2 + 4);
  *a1 = v3;
  a1[1] = 0;
  a1[2] = v4;
}

void protocol witness for Sequence.makeIterator() in conformance UnsafeMutableMIDIEventListPointer(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = v2 + 8;
  v4 = *(unsigned int *)(v2 + 4);
  *a1 = v3;
  a1[1] = 0;
  a1[2] = v4;
}

void protocol witness for Sequence._copyToContiguousArray() in conformance UnsafeMutableMIDIEventListPointer()
{
  uint64_t v0;

  specialized _copySequenceToContiguousArray<A>(_:)(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(unsigned int *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance UnsafeMutableMIDIEventListPointer(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;

  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *(_QWORD *)v3, *(_QWORD *)(v3 + 8), *(unsigned int *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

MIDIEventList *MIDIEventList.Builder.__allocating_init(inProtocol:wordSize:)(MIDIProtocolID a1, uint64_t a2)
{
  MIDIEventList *result;
  MIDIEventList *v5;
  size_t v6;
  MIDIEventList *v7;
  MIDIEventPacket *v8;

  result = (MIDIEventList *)swift_allocObject();
  if (a2 < 69)
  {
    __break(1u);
    goto LABEL_6;
  }
  if ((unint64_t)(a2 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v5 = result;
  v6 = 4 * a2;
  result = (MIDIEventList *)calloc(v6, 1uLL);
  if (result)
  {
    v7 = result;
    v8 = MIDIEventListInit(result, a1);
    *(_QWORD *)&v5->packet[0].wordCount = v6;
    *(_QWORD *)&v5->packet[0].words[1] = v8;
    v5->packet[0].words[3] = a1;
    *(_QWORD *)&v5->packet[0].words[5] = v7;
    return v5;
  }
LABEL_7:
  __break(1u);
  return result;
}

MIDIEventList *MIDIEventList.Builder.init(inProtocol:wordSize:)(MIDIEventList *result, uint64_t a2)
{
  uint64_t v2;
  MIDIProtocolID v3;
  uint64_t v4;
  MIDIEventList *v5;
  MIDIEventPacket *v6;

  if (a2 < 69)
  {
    __break(1u);
    goto LABEL_6;
  }
  if ((unint64_t)(a2 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v3 = (int)result;
  v4 = 4 * a2;
  result = (MIDIEventList *)calloc(4 * a2, 1uLL);
  if (result)
  {
    v5 = result;
    v6 = MIDIEventListInit(result, v3);
    *(_QWORD *)(v2 + 16) = v4;
    *(_QWORD *)(v2 + 24) = v6;
    *(_DWORD *)(v2 + 32) = v3;
    *(_QWORD *)(v2 + 40) = v5;
    return (MIDIEventList *)v2;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t MIDIEventList.Builder.deinit()
{
  uint64_t v0;

  swift_beginAccess();
  free(*(void **)(v0 + 40));
  return v0;
}

uint64_t MIDIEventList.Builder.__deallocating_deinit()
{
  uint64_t v0;

  swift_beginAccess();
  free(*(void **)(v0 + 40));
  return swift_deallocClassInstance();
}

MIDIEventPacket *MIDIEventList.Builder.append(timestamp:words:)(MIDITimeStamp a1, uint64_t a2)
{
  uint64_t v2;
  MIDIEventPacket *v5;
  MIDIEventPacket *v6;

  swift_beginAccess();
  v5 = *(MIDIEventPacket **)(v2 + 24);
  if (v5)
  {
    v6 = MIDIEventListAdd(*(MIDIEventList **)(v2 + 40), *(_QWORD *)(v2 + 16), v5, a1, *(_QWORD *)(a2 + 16), (const UInt32 *)(a2 + 32));
    *(_QWORD *)(v2 + 24) = v6;
  }
  else
  {
    v6 = 0;
  }
  swift_endAccess();
  return v6;
}

Swift::Void __swiftcall MIDIEventList.Builder.clear()()
{
  uint64_t v0;

  swift_beginAccess();
  *(_QWORD *)(v0 + 24) = MIDIEventListInit(*(MIDIEventList **)(v0 + 40), (MIDIProtocolID)*(_DWORD *)(v0 + 32));
  swift_endAccess();
}

uint64_t MIDIEventList.Builder.count.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned int *)(*(_QWORD *)(v0 + 40) + 4);
}

uint64_t MIDIEventList.Builder.withUnsafePointer<A>(_:)(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  swift_beginAccess();
  return a1(*(_QWORD *)(v1 + 40));
}

uint64_t MIDIEventList.Builder.withUnsafeMutableMIDIEventListPointer<A>(_:)(void (*a1)(uint64_t))
{
  uint64_t v1;

  swift_beginAccess();
  a1(v1 + 16);
  return swift_endAccess();
}

uint64_t UnsafeMutableMIDIPacketPointer.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

{
  *a2 = result;
  return result;
}

uint64_t UnsafeMutableMIDIPacketPointer.count.getter()
{
  uint64_t v0;

  return *(unsigned __int16 *)(*(_QWORD *)v0 + 8);
}

uint64_t key path getter for UnsafeMutableMIDIPacketPointer.count : UnsafeMutableMIDIPacketPointer@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(unsigned __int16 *)(*(_QWORD *)result + 8);
  return result;
}

unint64_t *key path setter for UnsafeMutableMIDIPacketPointer.count : UnsafeMutableMIDIPacketPointer(unint64_t *result, uint64_t a2)
{
  unint64_t v2;

  v2 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!(v2 >> 16))
  {
    *(_WORD *)(*(_QWORD *)a2 + 8) = v2;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t UnsafeMutableMIDIPacketPointer.count.setter(unint64_t result)
{
  uint64_t v1;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!(result >> 16))
  {
    *(_WORD *)(*(_QWORD *)v1 + 8) = result;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *(*UnsafeMutableMIDIPacketPointer.count.modify(_QWORD *a1))(unint64_t *result, char a2)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  a1[1] = *v1;
  *a1 = *(unsigned __int16 *)(v2 + 8);
  return UnsafeMutableMIDIPacketPointer.count.modify;
}

unint64_t *UnsafeMutableMIDIPacketPointer.count.modify(unint64_t *result, char a2)
{
  unint64_t v2;

  v2 = *result;
  if ((a2 & 1) != 0)
  {
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (!(v2 >> 16))
    {
LABEL_7:
      *(_WORD *)(result[1] + 8) = v2;
      return result;
    }
    __break(1u);
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (!(v2 >> 16))
    goto LABEL_7;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t UnsafeMutableMIDIPacketPointer.timeStamp.getter()
{
  uint64_t **v0;
  uint64_t result;

  result = **v0;
  if (result < 0)
    __break(1u);
  return result;
}

uint64_t **key path getter for UnsafeMutableMIDIPacketPointer.timeStamp : UnsafeMutableMIDIPacketPointer@<X0>(uint64_t **result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = **result;
  if (v2 < 0)
    __break(1u);
  else
    *a2 = v2;
  return result;
}

_QWORD *key path setter for UnsafeMutableMIDIPacketPointer.timeStamp : UnsafeMutableMIDIPacketPointer(_QWORD *result, _QWORD **a2)
{
  if ((*result & 0x8000000000000000) != 0)
    __break(1u);
  else
    **a2 = *result;
  return result;
}

uint64_t UnsafeMutableMIDIPacketPointer.timeStamp.setter(uint64_t result)
{
  _QWORD **v1;

  if (result < 0)
    __break(1u);
  else
    **v1 = result;
  return result;
}

uint64_t (*UnsafeMutableMIDIPacketPointer.timeStamp.modify(uint64_t (*result)()))()
{
  uint64_t **v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = *v1;
  *((_QWORD *)result + 1) = *v1;
  v3 = *v2;
  if (v3 < 0)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)result = v3;
    return UnsafeMutableMIDIEventPacketPointer.timeStamp.modify;
  }
  return result;
}

uint64_t *UnsafeMutableMIDIEventPacketPointer.timeStamp.modify(uint64_t *result, char a2)
{
  uint64_t v2;

  v2 = *result;
  if ((a2 & 1) != 0)
  {
    if ((v2 & 0x8000000000000000) == 0)
    {
LABEL_5:
      *(_QWORD *)result[1] = v2;
      return result;
    }
    __break(1u);
  }
  if ((v2 & 0x8000000000000000) == 0)
    goto LABEL_5;
  __break(1u);
  return result;
}

uint64_t UnsafeMutableMIDIPacketPointer.startIndex.getter()
{
  return 0;
}

uint64_t key path getter for UnsafeMutableMIDIPacketPointer.subscript(_:) : UnsafeMutableMIDIPacketPointer@<X0>(uint64_t result@<X0>, unint64_t *a2@<X1>, _BYTE *a3@<X8>)
{
  unint64_t v3;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned __int16 *)(*(_QWORD *)result + 8))
  {
    *a3 = *(_BYTE *)(*(_QWORD *)result + v3 + 10);
    return result;
  }
  __break(1u);
  return result;
}

_BYTE *key path setter for UnsafeMutableMIDIPacketPointer.subscript(_:) : UnsafeMutableMIDIPacketPointer(_BYTE *result, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;

  v3 = *a3;
  if ((*a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned __int16 *)(*(_QWORD *)a2 + 8))
  {
    *(_BYTE *)(*(_QWORD *)a2 + v3 + 10) = *result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t UnsafeMutableMIDIPacketPointer.subscript.setter(uint64_t result, unint64_t a2)
{
  uint64_t v2;

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned __int16 *)(*(_QWORD *)v2 + 8) > a2)
  {
    *(_BYTE *)(*(_QWORD *)v2 + a2 + 10) = result;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *(*UnsafeMutableMIDIPacketPointer.subscript.modify(unint64_t *(*result)(unint64_t *result, char a2), unint64_t a2))(unint64_t *result, char a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)result = a2;
  *((_QWORD *)result + 1) = v3;
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned __int16 *)(v3 + 8) > a2)
  {
    *((_BYTE *)result + 16) = *(_BYTE *)(v3 + a2 + 10);
    return UnsafeMutableMIDIPacketPointer.subscript.modify;
  }
  __break(1u);
  return result;
}

unint64_t *UnsafeMutableMIDIPacketPointer.subscript.modify(unint64_t *result, char a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;

  v3 = *result;
  v2 = result[1];
  v4 = *(unsigned __int16 *)(v2 + 8);
  v5 = *result >= v4;
  if ((a2 & 1) != 0)
  {
    if (*result < v4)
    {
LABEL_5:
      *(_BYTE *)(v2 + v3 + 10) = *((_BYTE *)result + 16);
      return result;
    }
    __break(1u);
  }
  if (!v5)
    goto LABEL_5;
  __break(1u);
  return result;
}

_BYTE *protocol witness for MutableCollection.subscript.setter in conformance UnsafeMutableMIDIPacketPointer(_BYTE *result, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned __int16 *)(*(_QWORD *)v2 + 8))
  {
    *(_BYTE *)(*(_QWORD *)v2 + v3 + 10) = *result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIPacketPointer(unint64_t *(**a1)(unint64_t *result, char a2), unint64_t *a2))()
{
  unint64_t *(*v4)(unint64_t *, char);

  v4 = (unint64_t *(*)(unint64_t *, char))malloc(0x28uLL);
  *a1 = v4;
  *((_QWORD *)v4 + 4) = UnsafeMutableMIDIPacketPointer.subscript.modify(v4, *a2);
  return protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer;
}

uint64_t *protocol witness for MutableCollection.subscript.setter in conformance UnsafeMutableMIDIPacketPointer(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;

  return specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v2, *a2, a2[1], *a1, a1[1], a1[2]);
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIPacketPointer(void (***a1)(uint64_t a1, uint64_t a2), uint64_t *a2))()
{
  void (**v4)(uint64_t, uint64_t);

  v4 = (void (**)(uint64_t, uint64_t))malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer;
}

void protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance UnsafeMutableMIDIPacketPointer@<X0>(unint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;

  result = specialized MutableCollection<>._partitionImpl(by:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance UnsafeMutableMIDIPacketPointer(unint64_t *a1, unint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance UnsafeMutableMIDIPacketPointer@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  return protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance UnsafeMutableMIDIEventPacketPointer(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))specialized RandomAccessCollection.index(_:offsetBy:limitedBy:), a4);
}

void protocol witness for Collection.endIndex.getter in conformance UnsafeMutableMIDIPacketPointer(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(unsigned __int16 *)(*(_QWORD *)v1 + 8);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance UnsafeMutableMIDIPacketPointer(uint64_t (*result)(), unint64_t *a2))()
{
  uint64_t v2;
  unint64_t v3;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned __int16 *)(*(_QWORD *)v2 + 8))
  {
    *(_BYTE *)result = *(_BYTE *)(*(_QWORD *)v2 + v3 + 10);
    return protocol witness for Collection.subscript.read in conformance UnsafeMutableMIDIEventPacketPointer;
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance UnsafeMutableMIDIPacketPointer(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int16 *)(*(_QWORD *)v1 + 8);
  *a1 = 0;
  a1[1] = v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance UnsafeMutableMIDIPacketPointer()
{
  uint64_t v0;

  return *(_WORD *)(*(_QWORD *)v0 + 8) == 0;
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance UnsafeMutableMIDIPacketPointer(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t MIDIPacket.ByteSequence.Iterator.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *(unsigned __int16 *)(*(_QWORD *)result + 8);
  *a2 = *(_QWORD *)result + 10;
  a2[1] = 0;
  a2[2] = v2;
  return result;
}

Swift::UInt8_optional __swiftcall MIDIPacket.ByteSequence.Iterator.next()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  __int16 v3;

  v1 = v0[1];
  v2 = v0[2];
  if (v1 < v2)
  {
    v3 = *(unsigned __int8 *)(*v0 + v1);
    v0[1] = v1 + 1;
  }
  else
  {
    v3 = 0;
  }
  return (Swift::UInt8_optional)(v3 | ((v1 >= v2) << 8));
}

void protocol witness for IteratorProtocol.next() in conformance MIDIPacket.ByteSequence.Iterator(_BYTE *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = v1[1];
  v3 = v1[2];
  if (v2 < v3)
  {
    v4 = *(_BYTE *)(*v1 + v2);
    v1[1] = v2 + 1;
  }
  else
  {
    v4 = 0;
  }
  *a1 = v4;
  a1[1] = v2 >= v3;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance MIDIPacket.ByteSequence()
{
  uint64_t *v0;

  return specialized _copySequenceToContiguousArray<A>(_:)(*v0);
}

uint64_t MIDIPacket.ByteCollection.startIndex.getter()
{
  return 0;
}

unint64_t UnsafeMutableMIDIPacketPointer.subscript.getter(unint64_t result)
{
  uint64_t v1;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned __int16 *)(*(_QWORD *)v1 + 8) > result)
  {
    return *(unsigned __int8 *)(*(_QWORD *)v1 + result + 10);
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance UnsafeMutableMIDIPacketPointer@<X0>(_QWORD *result@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;

  v3 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v3 < *(unsigned __int16 *)(*(_QWORD *)v2 + 8))
  {
    *a2 = v3;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance UnsafeMutableMIDIPacketPointer(unint64_t *result)
{
  uint64_t v1;
  unint64_t v2;

  v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v2 < *(unsigned __int16 *)(*(_QWORD *)v1 + 8))
  {
    *result = v2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.subscript.getter in conformance UnsafeMutableMIDIPacketPointer@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  if (*result < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = result[1];
    v5 = *v2;
    if (v4 <= *(unsigned __int16 *)(*v2 + 8))
    {
      a2[1] = v4;
      a2[2] = v5;
      *a2 = v3;
      return result;
    }
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance UnsafeMutableMIDIPacketPointer@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v4;

  v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 <= *(unsigned __int16 *)(*(_QWORD *)v3 + 8))
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance UnsafeMutableMIDIPacketPointer(unint64_t *result, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = *(unsigned __int16 *)(*(_QWORD *)v2 + 8);
  if (*result <= v4 && v3 <= v4)
    return (unint64_t *)(v3 - *result);
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance UnsafeMutableMIDIEventPacketPointer(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  v2 = *result;
  v3 = a2[1];
  if (*result >= *a2)
  {
    v5 = __OFSUB__(v2, v3);
    v4 = v2 - v3 < 0;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  if (v4 == v5)
    __break(1u);
  return result;
}

_QWORD *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance UnsafeMutableMIDIEventPacketPointer(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < *result)
    __break(1u);
  return result;
}

{
  if (*result < *a2 || a2[1] < result[1])
    __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.index(after:) in conformance UnsafeMutableMIDIPacketPointer@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v3 = *result;
  if (*result >= (unint64_t)*(unsigned __int16 *)(*(_QWORD *)v2 + 8))
  {
    __break(1u);
  }
  else
  {
    v4 = __OFADD__(v3, 1);
    v5 = v3 + 1;
    if (!v4)
    {
      *a2 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.formIndex(after:) in conformance UnsafeMutableMIDIPacketPointer(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v2 = *result;
  if (*result >= (unint64_t)*(unsigned __int16 *)(*(_QWORD *)v1 + 8))
  {
    __break(1u);
  }
  else
  {
    v3 = __OFADD__(v2, 1);
    v4 = v2 + 1;
    if (!v3)
    {
      *result = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance MIDIPacket.ByteCollection(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance MIDIPacket.ByteCollection()
{
  uint64_t *v0;

  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance MIDIPacket.ByteCollection(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

void MIDIPacket.ByteSequence.makeIterator()(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int16 *)(*(_QWORD *)v1 + 8);
  *a1 = *(_QWORD *)v1 + 10;
  a1[1] = 0;
  a1[2] = v2;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance UnsafeMutableMIDIPacketPointer()
{
  uint64_t v0;

  return *(unsigned __int16 *)(*(_QWORD *)v0 + 8);
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance UnsafeMutableMIDIPacketPointer()
{
  uint64_t *v0;

  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance UnsafeMutableMIDIPacketPointer(_QWORD *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t UnsafePointer<A>.bytes()@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t key path getter for MIDIPacket.Builder.capacity : MIDIPacket.Builder@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 24);
  return result;
}

uint64_t key path setter for MIDIPacket.Builder.capacity : MIDIPacket.Builder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_QWORD *)(v3 + 24) = v2;
  return result;
}

uint64_t MIDIPacket.Builder.capacity.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 24);
}

size_t MIDIPacket.Builder.__allocating_init(maximumNumberMIDIBytes:)(uint64_t a1)
{
  size_t result;
  size_t v3;

  result = swift_allocObject();
  *(_QWORD *)(result + 24) = 0;
  if (a1 < 1)
  {
    __break(1u);
    goto LABEL_6;
  }
  v3 = result;
  result = a1 + 10;
  if (__OFADD__(a1, 10))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  result = (size_t)calloc(result, 1uLL);
  if (result)
  {
    *(_QWORD *)(v3 + 16) = result;
    swift_beginAccess();
    *(_QWORD *)(v3 + 24) = a1;
    return v3;
  }
LABEL_7:
  __break(1u);
  return result;
}

int64_t MIDIPacket.Builder.init(maximumNumberMIDIBytes:)(int64_t result)
{
  uint64_t v1;
  int64_t v2;
  BOOL v3;

  *(_QWORD *)(v1 + 24) = 0;
  if (result < 1)
  {
    __break(1u);
    goto LABEL_6;
  }
  v2 = result;
  v3 = __OFADD__(result, 10);
  result += 10;
  if (v3)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  result = (int64_t)calloc(result, 1uLL);
  if (result)
  {
    *(_QWORD *)(v1 + 16) = result;
    swift_beginAccess();
    *(_QWORD *)(v1 + 24) = v2;
    return v1;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t MIDIEventPacket.Builder.deinit()
{
  uint64_t v0;

  swift_beginAccess();
  free(*(void **)(v0 + 16));
  return v0;
}

uint64_t MIDIEventPacket.Builder.__deallocating_deinit()
{
  uint64_t v0;

  swift_beginAccess();
  free(*(void **)(v0 + 16));
  return swift_deallocClassInstance();
}

uint64_t MIDIPacket.Builder.count.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int16 *)(*(_QWORD *)(v0 + 16) + 8);
}

uint64_t key path getter for MIDIEventPacket.Builder.timeStamp : MIDIEventPacket.Builder@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1;
  result = swift_beginAccess();
  v5 = **(_QWORD **)(v3 + 16);
  if (v5 < 0)
    __break(1u);
  else
    *a2 = v5;
  return result;
}

uint64_t key path setter for MIDIEventPacket.Builder.timeStamp : MIDIEventPacket.Builder(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD **v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD **)(*a2 + 16);
  result = swift_beginAccess();
  if (v2 < 0)
    __break(1u);
  else
    **v3 = v2;
  return result;
}

uint64_t MIDIEventPacket.Builder.timeStamp.getter()
{
  uint64_t v0;
  uint64_t result;

  swift_beginAccess();
  result = **(_QWORD **)(v0 + 16);
  if (result < 0)
    __break(1u);
  return result;
}

uint64_t MIDIEventPacket.Builder.timeStamp.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD **v3;
  uint64_t result;

  v3 = (_QWORD **)(v1 + 16);
  result = swift_beginAccess();
  if (a1 < 0)
    __break(1u);
  else
    **v3 = a1;
  return result;
}

void MIDIEventPacket.Builder.timeStamp.modify(_QWORD **a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *a1;
  v3 = v2[3];
  if ((a2 & 1) != 0)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
LABEL_5:
      **(_QWORD **)(v2[4] + 16) = v3;
      free(v2);
      return;
    }
    __break(1u);
  }
  if ((v3 & 0x8000000000000000) == 0)
    goto LABEL_5;
  __break(1u);
}

uint64_t MIDIPacket.Builder.append(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  char v10;

  result = swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(unsigned __int16 *)(v4 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = v5 + v6;
  if (__OFADD__(v5, v6))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  result = swift_beginAccess();
  if (*(_QWORD *)(v1 + 24) < v7)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (v6)
  {
    v8 = (char *)(a1 + 32);
    v9 = *(unsigned __int16 *)(v4 + 8);
    while (v9 != 0xFFFF)
    {
      v10 = *v8++;
      *(_BYTE *)(v4 + 10 + v9++) = v10;
      *(_WORD *)(v4 + 8) = v9;
      if (!--v6)
        return result;
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

uint64_t MIDIEventPacket.Builder.withUnsafePointer<A>(_:)(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  swift_beginAccess();
  return a1(*(_QWORD *)(v1 + 16));
}

unint64_t static MIDIPacketList.sizeInBytes(pktList:)(int *a1)
{
  unint64_t v1;
  int i;

  v1 = (unint64_t)(a1 + 1);
  for (i = *a1; i; --i)
    v1 = (v1 + *(unsigned __int16 *)(v1 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
  return v1 - (_QWORD)a1;
}

unint64_t MIDIPacketNext(uint64_t a1)
{
  return (a1 + *(unsigned __int16 *)(a1 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
}

MIDIPacket *UnsafeMutableMIDIPacketListPointer.init(_:byteSize:)@<X0>(MIDIPacketList *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  MIDIPacket *result;

  result = MIDIPacketListInit(a1);
  *a3 = a2;
  a3[1] = result;
  a3[2] = a1;
  return result;
}

void MIDIPacketList.UnsafeSequence.makeIterator()(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = *(unsigned int *)*v1;
  *a1 = *v1 + 4;
  a1[1] = 0;
  a1[2] = v2;
}

_QWORD *MIDIPacketList.UnsafeSequence.Iterator.init(_:)@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *(unsigned int *)*result;
  *a2 = *result + 4;
  a2[1] = 0;
  a2[2] = v2;
  return result;
}

uint64_t MIDIPacketList.UnsafeSequence.count.getter()
{
  unsigned int **v0;

  return **v0;
}

unint64_t MIDIPacketList.UnsafeSequence.Iterator.next()()
{
  unint64_t *v0;
  uint64_t v1;
  unint64_t result;

  v1 = v0[1];
  if (v1 >= (uint64_t)v0[2])
    return 0;
  result = *v0;
  if (v1 >= 1)
  {
    result = (result + *(unsigned __int16 *)(result + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
    *v0 = result;
  }
  v0[1] = v1 + 1;
  return result;
}

uint64_t protocol witness for IteratorProtocol.next() in conformance MIDIPacketList.UnsafeSequence.Iterator@<X0>(uint64_t *a1@<X8>)
{
  return protocol witness for IteratorProtocol.next() in conformance MIDIEventList.UnsafeSequence.Iterator((uint64_t (*)(uint64_t))MIDIPacketNext, a1);
}

uint64_t protocol witness for IteratorProtocol.next() in conformance MIDIEventList.UnsafeSequence.Iterator@<X0>(uint64_t (*a1)(uint64_t)@<X2>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t result;

  v4 = v2[1];
  if (v4 >= v2[2])
  {
    result = 0;
  }
  else
  {
    result = *v2;
    if (v4 >= 1)
    {
      result = a1(result);
      *v2 = result;
    }
    v2[1] = v4 + 1;
  }
  *a2 = result;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance MIDIPacketList.UnsafeSequence(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = *(unsigned int *)*v1;
  *a1 = *v1 + 4;
  a1[1] = 0;
  a1[2] = v2;
}

unsigned int *protocol witness for Sequence._copyToContiguousArray() in conformance MIDIPacketList.UnsafeSequence()
{
  unsigned int **v0;

  return specialized _copySequenceToContiguousArray<A>(_:)(*v0);
}

unint64_t *protocol witness for Sequence._copyContents(initializing:) in conformance MIDIPacketList.UnsafeSequence(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  unsigned int **v3;

  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t UnsafeMutableMIDIPacketListPointer.listSizeInBytes.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t UnsafeMutableMIDIPacketListPointer.lastPacket.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

MIDIPacket *UnsafeMutableMIDIPacketListPointer.init(_:byteSize:)@<X0>(MIDIPacket *pktlist@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  MIDIPacket *v3;

  v3 = pktlist;
  if (pktlist)
    pktlist = MIDIPacketListInit((MIDIPacketList *)pktlist);
  else
    a2 = 0;
  *a3 = a2;
  a3[1] = pktlist;
  a3[2] = v3;
  return pktlist;
}

uint64_t UnsafeMutableMIDIPacketListPointer.count.getter()
{
  uint64_t v0;

  return **(unsigned int **)(v0 + 16);
}

Swift::Void __swiftcall UnsafeMutableMIDIPacketListPointer.clear()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 8) = MIDIPacketListInit(*(MIDIPacketList **)(v0 + 16));
}

MIDIPacket *UnsafeMutableMIDIPacketListPointer.append(timestamp:data:)(MIDITimeStamp time, uint64_t a2)
{
  uint64_t v2;
  MIDIPacket *v3;
  MIDIPacket *result;

  v3 = *(MIDIPacket **)(v2 + 8);
  if (!v3)
    return 0;
  result = MIDIPacketListAdd(*(MIDIPacketList **)(v2 + 16), *(_QWORD *)v2, v3, time, *(_QWORD *)(a2 + 16), (const Byte *)(a2 + 32));
  *(_QWORD *)(v2 + 8) = result;
  return result;
}

void UnsafeMutableMIDIPacketListPointer.makeIterator()(_QWORD *a1@<X8>)
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t v3;

  v2 = *(unsigned int **)(v1 + 16);
  v3 = *v2;
  *a1 = v2 + 1;
  a1[1] = 0;
  a1[2] = v3;
}

void protocol witness for Sequence.makeIterator() in conformance UnsafeMutableMIDIPacketListPointer(_QWORD *a1@<X8>)
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t v3;

  v2 = *(unsigned int **)(v1 + 16);
  v3 = *v2;
  *a1 = v2 + 1;
  a1[1] = 0;
  a1[2] = v3;
}

void protocol witness for Sequence._copyToContiguousArray() in conformance UnsafeMutableMIDIPacketListPointer()
{
  uint64_t v0;

  specialized _copySequenceToContiguousArray<A>(_:)(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(unsigned int **)(v0 + 16));
}

unint64_t *protocol witness for Sequence._copyContents(initializing:) in conformance UnsafeMutableMIDIPacketListPointer(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v3;

  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *(_QWORD *)v3, *(_QWORD *)(v3 + 8), *(unsigned int **)(v3 + 16));
}

MIDIPacketList *MIDIPacketList.Builder.__allocating_init(byteSize:)(int64_t a1)
{
  MIDIPacketList *result;
  MIDIPacketList *v3;
  MIDIPacketList *v4;
  MIDIPacket *v5;

  result = (MIDIPacketList *)swift_allocObject();
  if (a1 < 272)
  {
    __break(1u);
  }
  else
  {
    v3 = result;
    result = (MIDIPacketList *)calloc(a1, 1uLL);
    if (result)
    {
      v4 = result;
      v5 = MIDIPacketListInit(result);
      *(_QWORD *)&v3->packet[0].data[2] = a1;
      *(_QWORD *)&v3->packet[0].data[10] = v5;
      *(_QWORD *)&v3->packet[0].data[18] = v4;
      return v3;
    }
  }
  __break(1u);
  return result;
}

int64_t MIDIPacketList.Builder.init(byteSize:)(int64_t result)
{
  _QWORD *v1;
  int64_t v2;
  int64_t v3;
  MIDIPacket *v4;

  if (result < 272)
  {
    __break(1u);
  }
  else
  {
    v2 = result;
    result = (int64_t)calloc(result, 1uLL);
    if (result)
    {
      v3 = result;
      v4 = MIDIPacketListInit((MIDIPacketList *)result);
      v1[2] = v2;
      v1[3] = v4;
      v1[4] = v3;
      return (int64_t)v1;
    }
  }
  __break(1u);
  return result;
}

uint64_t MIDIPacketList.Builder.deinit()
{
  uint64_t v0;

  swift_beginAccess();
  free(*(void **)(v0 + 32));
  return v0;
}

uint64_t MIDIPacketList.Builder.__deallocating_deinit()
{
  uint64_t v0;

  swift_beginAccess();
  free(*(void **)(v0 + 32));
  return swift_deallocClassInstance();
}

MIDIPacket *MIDIPacketList.Builder.append(timestamp:data:)(MIDITimeStamp a1, uint64_t a2)
{
  uint64_t v2;
  MIDIPacket *v5;
  MIDIPacket *v6;

  swift_beginAccess();
  v5 = *(MIDIPacket **)(v2 + 24);
  if (v5)
  {
    v6 = MIDIPacketListAdd(*(MIDIPacketList **)(v2 + 32), *(_QWORD *)(v2 + 16), v5, a1, *(_QWORD *)(a2 + 16), (const Byte *)(a2 + 32));
    *(_QWORD *)(v2 + 24) = v6;
  }
  else
  {
    v6 = 0;
  }
  swift_endAccess();
  return v6;
}

Swift::Void __swiftcall MIDIPacketList.Builder.clear()()
{
  uint64_t v0;

  swift_beginAccess();
  *(_QWORD *)(v0 + 24) = MIDIPacketListInit(*(MIDIPacketList **)(v0 + 32));
  swift_endAccess();
}

uint64_t MIDIPacketList.Builder.count.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return **(unsigned int **)(v0 + 32);
}

uint64_t MIDIPacketList.Builder.withUnsafePointer<A>(_:)(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  swift_beginAccess();
  return a1(*(_QWORD *)(v1 + 32));
}

unint64_t lazy protocol witness table accessor for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for UnsafeMutableMIDIEventPacketPointer, &type metadata for UnsafeMutableMIDIEventPacketPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for UnsafeMutableMIDIEventPacketPointer, &type metadata for UnsafeMutableMIDIEventPacketPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for UnsafeMutableMIDIEventPacketPointer, &type metadata for UnsafeMutableMIDIEventPacketPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for UnsafeMutableMIDIEventPacketPointer, &type metadata for UnsafeMutableMIDIEventPacketPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for UnsafeMutableMIDIEventPacketPointer, &type metadata for UnsafeMutableMIDIEventPacketPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIEventPacketPointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer, MEMORY[0x24BEE4220]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD04A00](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BD0]);
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x20BD04A0C](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIEventPacketPointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer, MEMORY[0x24BEE4230]);
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in UnsafeMutableMIDIEventPacketPointer()
{
  return MEMORY[0x24BEE1780];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BD8]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIEventPacketPointer>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BA8]);
}

uint64_t lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<Int>);
    v6 = lazy protocol witness table accessor for type Int and conformance Int();
    v7[0] = MEMORY[0x24BEE17A8];
    v7[1] = v6;
    result = MEMORY[0x20BD04A0C](a2, v5, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIEventPacketPointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer, MEMORY[0x24BEE4218]);
}

unint64_t lazy protocol witness table accessor for type MIDIEventPacket.WordSequence.Iterator and conformance MIDIEventPacket.WordSequence.Iterator()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MIDIEventPacket.WordSequence.Iterator and conformance MIDIEventPacket.WordSequence.Iterator;
  if (!lazy protocol witness table cache variable for type MIDIEventPacket.WordSequence.Iterator and conformance MIDIEventPacket.WordSequence.Iterator)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for MIDIEventPacket.WordSequence.Iterator, &type metadata for MIDIEventPacket.WordSequence.Iterator);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIEventPacket.WordSequence.Iterator and conformance MIDIEventPacket.WordSequence.Iterator);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection;
  if (!lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for MIDIEventPacket.WordCollection, &type metadata for MIDIEventPacket.WordCollection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection;
  if (!lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for MIDIEventPacket.WordCollection, &type metadata for MIDIEventPacket.WordCollection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection;
  if (!lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for MIDIEventPacket.WordCollection, &type metadata for MIDIEventPacket.WordCollection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection;
  if (!lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for MIDIEventPacket.WordCollection, &type metadata for MIDIEventPacket.WordCollection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in MIDIEventPacket.WordCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<MIDIEventPacket.WordCollection> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<MIDIEventPacket.WordCollection>, (uint64_t (*)(void))lazy protocol witness table accessor for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection, MEMORY[0x24BEE4230]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in MIDIEventPacket.WordCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<MIDIEventPacket.WordCollection> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<MIDIEventPacket.WordCollection>, (uint64_t (*)(void))lazy protocol witness table accessor for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection, MEMORY[0x24BEE4218]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in MIDIEventPacket.WordCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<MIDIEventPacket.WordCollection> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<MIDIEventPacket.WordCollection>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in MIDIEventPacket.WordCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<MIDIEventPacket.WordCollection> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<MIDIEventPacket.WordCollection>, MEMORY[0x24BEE2C18]);
}

unint64_t lazy protocol witness table accessor for type MIDIEventList.UnsafeSequence.Iterator and conformance MIDIEventList.UnsafeSequence.Iterator()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MIDIEventList.UnsafeSequence.Iterator and conformance MIDIEventList.UnsafeSequence.Iterator;
  if (!lazy protocol witness table cache variable for type MIDIEventList.UnsafeSequence.Iterator and conformance MIDIEventList.UnsafeSequence.Iterator)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for MIDIEventList.UnsafeSequence.Iterator, &type metadata for MIDIEventList.UnsafeSequence.Iterator);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIEventList.UnsafeSequence.Iterator and conformance MIDIEventList.UnsafeSequence.Iterator);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for UnsafeMutableMIDIPacketPointer, &type metadata for UnsafeMutableMIDIPacketPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for UnsafeMutableMIDIPacketPointer, &type metadata for UnsafeMutableMIDIPacketPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for UnsafeMutableMIDIPacketPointer, &type metadata for UnsafeMutableMIDIPacketPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for UnsafeMutableMIDIPacketPointer, &type metadata for UnsafeMutableMIDIPacketPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for UnsafeMutableMIDIPacketPointer, &type metadata for UnsafeMutableMIDIPacketPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in UnsafeMutableMIDIPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIPacketPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIPacketPointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer, MEMORY[0x24BEE4220]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in UnsafeMutableMIDIPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIPacketPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIPacketPointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer, MEMORY[0x24BEE4230]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in UnsafeMutableMIDIPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIPacketPointer> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIPacketPointer>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in UnsafeMutableMIDIPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIPacketPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIPacketPointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer, MEMORY[0x24BEE4218]);
}

unint64_t lazy protocol witness table accessor for type MIDIPacket.ByteSequence.Iterator and conformance MIDIPacket.ByteSequence.Iterator()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MIDIPacket.ByteSequence.Iterator and conformance MIDIPacket.ByteSequence.Iterator;
  if (!lazy protocol witness table cache variable for type MIDIPacket.ByteSequence.Iterator and conformance MIDIPacket.ByteSequence.Iterator)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for MIDIPacket.ByteSequence.Iterator, &type metadata for MIDIPacket.ByteSequence.Iterator);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIPacket.ByteSequence.Iterator and conformance MIDIPacket.ByteSequence.Iterator);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection;
  if (!lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for MIDIPacket.ByteCollection, &type metadata for MIDIPacket.ByteCollection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection;
  if (!lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for MIDIPacket.ByteCollection, &type metadata for MIDIPacket.ByteCollection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection;
  if (!lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for MIDIPacket.ByteCollection, &type metadata for MIDIPacket.ByteCollection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection;
  if (!lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for MIDIPacket.ByteCollection, &type metadata for MIDIPacket.ByteCollection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in MIDIPacket.ByteCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<MIDIPacket.ByteCollection> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<MIDIPacket.ByteCollection>, (uint64_t (*)(void))lazy protocol witness table accessor for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection, MEMORY[0x24BEE4230]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in MIDIPacket.ByteCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<MIDIPacket.ByteCollection> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<MIDIPacket.ByteCollection>, (uint64_t (*)(void))lazy protocol witness table accessor for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection, MEMORY[0x24BEE4218]);
}

uint64_t lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x20BD04A0C](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in MIDIPacket.ByteCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<MIDIPacket.ByteCollection> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<MIDIPacket.ByteCollection>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in MIDIPacket.ByteCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<MIDIPacket.ByteCollection> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<MIDIPacket.ByteCollection>, MEMORY[0x24BEE2C18]);
}

uint64_t lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x20BD04A0C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MIDIPacketList.UnsafeSequence.Iterator and conformance MIDIPacketList.UnsafeSequence.Iterator()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MIDIPacketList.UnsafeSequence.Iterator and conformance MIDIPacketList.UnsafeSequence.Iterator;
  if (!lazy protocol witness table cache variable for type MIDIPacketList.UnsafeSequence.Iterator and conformance MIDIPacketList.UnsafeSequence.Iterator)
  {
    result = MEMORY[0x20BD04A0C](&protocol conformance descriptor for MIDIPacketList.UnsafeSequence.Iterator, &type metadata for MIDIPacketList.UnsafeSequence.Iterator);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIPacketList.UnsafeSequence.Iterator and conformance MIDIPacketList.UnsafeSequence.Iterator);
  }
  return result;
}

uint64_t sub_208337C34()
{
  return 0;
}

uint64_t sub_208337C44()
{
  return 0;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for UnsafeMutableMIDIEventPacketPointer()
{
  return &type metadata for UnsafeMutableMIDIEventPacketPointer;
}

ValueMetadata *type metadata accessor for MIDIEventPacket.WordSequence()
{
  return &type metadata for MIDIEventPacket.WordSequence;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for MIDIEventPacket.WordSequence.Iterator()
{
  return &type metadata for MIDIEventPacket.WordSequence.Iterator;
}

ValueMetadata *type metadata accessor for MIDIEventPacket.WordCollection()
{
  return &type metadata for MIDIEventPacket.WordCollection;
}

uint64_t type metadata accessor for MIDIEventPacket.Builder()
{
  return objc_opt_self();
}

uint64_t method lookup function for MIDIEventPacket.Builder()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for MIDIEventList.UnsafeSequence()
{
  return &type metadata for MIDIEventList.UnsafeSequence;
}

ValueMetadata *type metadata accessor for MIDIEventList.UnsafeSequence.Iterator()
{
  return &type metadata for MIDIEventList.UnsafeSequence.Iterator;
}

uint64_t initializeBufferWithCopyOfBuffer for UnsafeMutableMIDIEventListPointer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t getEnumTagSinglePayload for UnsafeMutableMIDIEventListPointer(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)(a1 + 24))
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for UnsafeMutableMIDIEventListPointer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 2)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for UnsafeMutableMIDIEventListPointer()
{
  return &type metadata for UnsafeMutableMIDIEventListPointer;
}

uint64_t type metadata accessor for MIDIEventList.Builder()
{
  return objc_opt_self();
}

uint64_t method lookup function for MIDIEventList.Builder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MIDIEventList.Builder.__allocating_init(inProtocol:wordSize:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of MIDIEventList.Builder.append(timestamp:words:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of MIDIEventList.Builder.clear()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of MIDIEventList.Builder.count.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of MIDIEventList.Builder.withUnsafePointer<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of MIDIEventList.Builder.withUnsafeMutableMIDIEventListPointer<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

ValueMetadata *type metadata accessor for UnsafeMutableMIDIPacketPointer()
{
  return &type metadata for UnsafeMutableMIDIPacketPointer;
}

ValueMetadata *type metadata accessor for MIDIPacket.ByteSequence()
{
  return &type metadata for MIDIPacket.ByteSequence;
}

ValueMetadata *type metadata accessor for MIDIPacket.ByteSequence.Iterator()
{
  return &type metadata for MIDIPacket.ByteSequence.Iterator;
}

ValueMetadata *type metadata accessor for MIDIPacket.ByteCollection()
{
  return &type metadata for MIDIPacket.ByteCollection;
}

uint64_t type metadata accessor for MIDIPacket.Builder()
{
  return objc_opt_self();
}

uint64_t method lookup function for MIDIPacket.Builder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MIDIPacket.Builder.capacity.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.__allocating_init(maximumNumberMIDIBytes:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.count.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.timeStamp.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.timeStamp.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.timeStamp.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.append(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.withUnsafePointer<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.withUnsafeMutableMIDIPacketPointer<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t getEnumTagSinglePayload for UnsafeMutableMIDIEventPacketPointer(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for UnsafeMutableMIDIEventPacketPointer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MIDIPacketList.UnsafeSequence()
{
  return &type metadata for MIDIPacketList.UnsafeSequence;
}

uint64_t getEnumTagSinglePayload for MIDIEventPacket.WordSequence.Iterator(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for MIDIEventPacket.WordSequence.Iterator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MIDIPacketList.UnsafeSequence.Iterator()
{
  return &type metadata for MIDIPacketList.UnsafeSequence.Iterator;
}

uint64_t getEnumTagSinglePayload for UnsafeMutableMIDIPacketListPointer(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)(a1 + 16))
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for UnsafeMutableMIDIPacketListPointer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for UnsafeMutableMIDIPacketListPointer()
{
  return &type metadata for UnsafeMutableMIDIPacketListPointer;
}

uint64_t type metadata accessor for MIDIPacketList.Builder()
{
  return objc_opt_self();
}

uint64_t method lookup function for MIDIPacketList.Builder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MIDIPacketList.Builder.__allocating_init(byteSize:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void type metadata accessor for MIDIProtocolID(uint64_t a1)
{
  type metadata accessor for MIDIProtocolID(a1, &lazy cache variable for type metadata for MIDIProtocolID);
}

void *__swift_memcpy272_4(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x110uLL);
}

uint64_t getEnumTagSinglePayload for MIDIPacketList(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 272))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MIDIPacketList(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 264) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 272) = v3;
  return result;
}

void type metadata accessor for MIDIPacketList(uint64_t a1)
{
  type metadata accessor for MIDIProtocolID(a1, &lazy cache variable for type metadata for MIDIPacketList);
}

void *__swift_memcpy268_4(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x10CuLL);
}

uint64_t getEnumTagSinglePayload for MIDIPacket(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 268))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MIDIPacket(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 264) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 268) = v3;
  return result;
}

void type metadata accessor for MIDIPacket(uint64_t a1)
{
  type metadata accessor for MIDIProtocolID(a1, &lazy cache variable for type metadata for MIDIPacket);
}

void *__swift_memcpy276_4(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x114uLL);
}

uint64_t getEnumTagSinglePayload for MIDIEventList(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 276))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MIDIEventList(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 264) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 272) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 276) = v3;
  return result;
}

void type metadata accessor for MIDIEventList(uint64_t a1)
{
  type metadata accessor for MIDIProtocolID(a1, &lazy cache variable for type metadata for MIDIEventList);
}

void type metadata accessor for MIDIEventPacket(uint64_t a1)
{
  type metadata accessor for MIDIProtocolID(a1, &lazy cache variable for type metadata for MIDIEventPacket);
}

void type metadata accessor for MIDIProtocolID(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t *specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  if (a2 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v6 = *result;
  v7 = *(unsigned int *)(*result + 8);
  if ((uint64_t)v7 < a3)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (a2 >= a3)
    {
LABEL_29:
      __break(1u);
      return result;
    }
    v8 = 0;
    while (1)
    {
      v9 = a4 + v8;
      if (a4 + v8 >= a5)
        break;
      if (a4 < 0)
        goto LABEL_20;
      if (v9 >= *(unsigned int *)(a6 + 8))
        goto LABEL_21;
      if (a2 + v8 >= v7)
        goto LABEL_22;
      *(_DWORD *)(v6 + 4 * a2 + 12 + 4 * v8) = *(_DWORD *)(a6 + 4 * a4 + 12 + 4 * v8);
      v6 = *result;
      v7 = *(unsigned int *)(*result + 8);
      if (a2 + v8 >= v7)
        goto LABEL_23;
      if (v9 >= *(unsigned int *)(a6 + 8))
        goto LABEL_24;
      if (~a2 + a3 == v8)
        goto LABEL_16;
      ++v8;
      if (!(a4 - a5 + v8))
      {
        __break(1u);
LABEL_16:
        a4 += v8 + 1;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_17:
  if (a4 != a5)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  return result;
}

{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  if (a2 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v6 = *result;
  v7 = *(unsigned __int16 *)(*result + 8);
  if ((uint64_t)v7 < a3)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (a2 >= a3)
    {
LABEL_29:
      __break(1u);
      return result;
    }
    v8 = 0;
    while (1)
    {
      v9 = a4 + v8;
      if (a4 + v8 >= a5)
        break;
      if (a4 < 0)
        goto LABEL_20;
      if (v9 >= *(unsigned __int16 *)(a6 + 8))
        goto LABEL_21;
      if (a2 + v8 >= v7)
        goto LABEL_22;
      *(_BYTE *)(v6 + a2 + v8 + 10) = *(_BYTE *)(a4 + a6 + 10 + v8);
      v6 = *result;
      v7 = *(unsigned __int16 *)(*result + 8);
      if (a2 + v8 >= v7)
        goto LABEL_23;
      if (v9 >= *(unsigned __int16 *)(a6 + 8))
        goto LABEL_24;
      if (~a2 + a3 == v8)
        goto LABEL_16;
      ++v8;
      if (!(a4 - a5 + v8))
      {
        __break(1u);
LABEL_16:
        a4 += v8 + 1;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_17:
  if (a4 != a5)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  return result;
}

unint64_t specialized MutableCollection<>._partitionImpl(by:)(unint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t (*v5)(int *);
  unint64_t v6;
  int64_t v7;
  int64_t i;
  int64_t v9;
  int v10;
  int v11;

  v3 = *v1;
  v4 = *(unsigned int *)(*v1 + 8);
  if ((_DWORD)v4)
  {
    v5 = (uint64_t (*)(int *))result;
    v6 = 0;
    while (v6 < *(unsigned int *)(v3 + 8))
    {
      v11 = *(_DWORD *)(v3 + 4 * v6 + 12);
      result = v5(&v11);
      if (v2)
        return v6;
      v3 = *v1;
      v7 = *(unsigned int *)(*v1 + 8);
      if ((result & 1) != 0)
      {
        if (v4 > v7)
          goto LABEL_25;
        if ((uint64_t)v6 >= v4 - 1)
          return v6;
        for (i = v4 + 2; ; --i)
        {
          v4 = i - 3;
          if (i - 3 >= v7)
          {
            __break(1u);
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
          v10 = *(_DWORD *)(v3 + 4 * i);
          result = v5(&v10);
          if ((result & 1) == 0)
            break;
          v3 = *v1;
          v7 = *(unsigned int *)(*v1 + 8);
          if (v4 > v7)
            goto LABEL_23;
          v9 = i - 4;
          if ((uint64_t)v6 >= v9)
            return v6;
        }
        result = specialized MutableCollection.swapAt(_:_:)(v6, i - 3);
        v3 = *v1;
        if (v6 >= *(unsigned int *)(*v1 + 8))
          goto LABEL_27;
      }
      else if (v6 >= v7)
      {
        goto LABEL_26;
      }
      if ((uint64_t)++v6 >= v4)
        return v6;
    }
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t (*v5)(char *);
  unint64_t v6;
  int64_t v7;
  int64_t i;
  int64_t v9;
  char v10;
  char v11;

  v3 = *v1;
  v4 = *(unsigned __int16 *)(*v1 + 8);
  if (*(_WORD *)(*v1 + 8))
  {
    v5 = (uint64_t (*)(char *))result;
    v6 = 0;
    while (v6 < *(unsigned __int16 *)(v3 + 8))
    {
      v11 = *(_BYTE *)(v3 + v6 + 10);
      result = v5(&v11);
      if (v2)
        return v6;
      v3 = *v1;
      v7 = *(unsigned __int16 *)(*v1 + 8);
      if ((result & 1) != 0)
      {
        if (v4 > v7)
          goto LABEL_25;
        if ((uint64_t)v6 >= v4 - 1)
          return v6;
        for (i = v4 + 9; ; --i)
        {
          v4 = i - 10;
          if (i - 10 >= v7)
          {
            __break(1u);
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
          v10 = *(_BYTE *)(v3 + i);
          result = v5(&v10);
          if ((result & 1) == 0)
            break;
          v3 = *v1;
          v7 = *(unsigned __int16 *)(*v1 + 8);
          if (v4 > v7)
            goto LABEL_23;
          v9 = i - 11;
          if ((uint64_t)v6 >= v9)
            return v6;
        }
        result = specialized MutableCollection.swapAt(_:_:)(v6, i - 10);
        v3 = *v1;
        if (v6 >= *(unsigned __int16 *)(*v1 + 8))
          goto LABEL_27;
      }
      else if (v6 >= v7)
      {
        goto LABEL_26;
      }
      if ((uint64_t)++v6 >= v4)
        return v6;
    }
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t specialized _copySequenceToContiguousArray<A>(_:)(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  int *v4;
  _DWORD *v5;
  int v6;
  int v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;

  v1 = *(unsigned int *)(result + 8);
  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = 0;
  if ((_DWORD)v1)
  {
    v4 = (int *)(result + 12);
    v5 = (_DWORD *)(MEMORY[0x24BEE4AF8] + 32);
    while (1)
    {
      v7 = *v4++;
      v6 = v7;
      if (!v3)
      {
        v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_26;
        v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        if (v9 <= 1)
          v10 = 1;
        else
          v10 = v9;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt32>);
        v11 = (_QWORD *)swift_allocObject();
        v12 = _swift_stdlib_malloc_size(v11);
        v13 = v12 - 32;
        if (v12 < 32)
          v13 = v12 - 29;
        v14 = v13 >> 2;
        v11[2] = v10;
        v11[3] = 2 * (v13 >> 2);
        v15 = (unint64_t)(v11 + 4);
        v16 = v2[3] >> 1;
        if (v2[2])
        {
          if (v11 != v2 || v15 >= (unint64_t)v2 + 4 * v16 + 32)
            memmove(v11 + 4, v2 + 4, 4 * v16);
          v2[2] = 0;
        }
        v5 = (_DWORD *)(v15 + 4 * v16);
        v3 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - v16;
        result = swift_release();
        v2 = v11;
      }
      v18 = __OFSUB__(v3--, 1);
      if (v18)
        break;
      *v5++ = v6;
      if (!--v1)
        goto LABEL_21;
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
LABEL_21:
  v19 = v2[3];
  if (v19 < 2)
    return (uint64_t)v2;
  v20 = v19 >> 1;
  v18 = __OFSUB__(v20, v3);
  v21 = v20 - v3;
  if (!v18)
  {
    v2[2] = v21;
    return (uint64_t)v2;
  }
LABEL_27:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  BOOL v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  _QWORD *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  const void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;

  v1 = *(unsigned int *)(result + 4);
  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if ((_DWORD)v1)
  {
    v3 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 24);
    if ((uint64_t)((v3 >> 1) + 0x4000000000000000) < 0)
      goto LABEL_42;
    v4 = result + 8;
    v5 = v3 & 0xFFFFFFFFFFFFFFFELL;
    if (v5 <= 1)
      v6 = 1;
    else
      v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIEventPacket>>);
    v7 = (_QWORD *)swift_allocObject();
    v8 = _swift_stdlib_malloc_size(v7);
    v9 = v8 - 32;
    if (v8 < 32)
      v9 = v8 - 25;
    v10 = v9 >> 3;
    v7[2] = v6;
    v7[3] = 2 * v10;
    v11 = v7 + 4;
    v12 = v2[3] >> 1;
    v13 = &v7[v12 + 4];
    v14 = v10 & 0x7FFFFFFFFFFFFFFFLL;
    if (v2[2])
    {
      if (v7 != v2 || v11 >= &v2[v12 + 4])
        memcpy(v11, v2 + 4, 8 * v12);
      v2[2] = 0;
    }
    result = swift_release();
    v16 = v14 + ~v12;
    *v13 = v4;
    if ((_DWORD)v1 != 1)
    {
      for (i = v1 - 1; i; --i)
      {
        v18 = *(unsigned int *)(v4 + 8);
        if (v16)
        {
          ++v13;
          v19 = __OFSUB__(v16--, 1);
          if (v19)
            goto LABEL_41;
        }
        else
        {
          v20 = v7[3];
          if ((uint64_t)((v20 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_42;
          v21 = v20 & 0xFFFFFFFFFFFFFFFELL;
          if (v21 <= 1)
            v22 = 1;
          else
            v22 = v21;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIEventPacket>>);
          v23 = (_QWORD *)swift_allocObject();
          v24 = _swift_stdlib_malloc_size(v23);
          v25 = v24 - 32;
          if (v24 < 32)
            v25 = v24 - 25;
          v26 = v25 >> 3;
          v23[2] = v22;
          v23[3] = 2 * (v25 >> 3);
          v27 = (unint64_t)(v23 + 4);
          v28 = v7[3] >> 1;
          if (v7[2])
          {
            v29 = v7 + 4;
            if (v23 != v7 || v27 >= (unint64_t)v29 + 8 * v28)
              memmove(v23 + 4, v29, 8 * v28);
            v7[2] = 0;
          }
          v13 = (uint64_t *)(v27 + 8 * v28);
          v30 = (v26 & 0x7FFFFFFFFFFFFFFFLL) - v28;
          result = swift_release();
          v7 = v23;
          v19 = __OFSUB__(v30, 1);
          v16 = v30 - 1;
          if (v19)
          {
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
            return result;
          }
        }
        v4 += 4 * v18 + 12;
        *v13 = v4;
      }
    }
  }
  else
  {
    v16 = 0;
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v31 = v7[3];
  if (v31 >= 2)
  {
    v32 = v31 >> 1;
    v19 = __OFSUB__(v32, v16);
    v33 = v32 - v16;
    if (v19)
      goto LABEL_43;
    v7[2] = v33;
  }
  return (uint64_t)v7;
}

{
  uint64_t v1;
  _QWORD *v2;
  size_t v3;
  char *v4;
  _BYTE *v5;
  char v6;
  char v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
  unint64_t v13;
  size_t v14;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v1 = *(unsigned __int16 *)(result + 8);
  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = 0;
  if (*(_WORD *)(result + 8))
  {
    v4 = (char *)(result + 10);
    v5 = (_BYTE *)(MEMORY[0x24BEE4AF8] + 32);
    while (1)
    {
      v7 = *v4++;
      v6 = v7;
      if (!v3)
      {
        v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_24;
        v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        if (v9 <= 1)
          v10 = 1;
        else
          v10 = v9;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
        v11 = (_QWORD *)swift_allocObject();
        v12 = 2 * _swift_stdlib_malloc_size(v11) - 64;
        v11[2] = v10;
        v11[3] = v12;
        v13 = (unint64_t)(v11 + 4);
        v14 = v2[3] >> 1;
        if (v2[2])
        {
          if (v11 != v2 || v13 >= (unint64_t)v2 + v14 + 32)
            memmove(v11 + 4, v2 + 4, v14);
          v2[2] = 0;
        }
        v5 = (_BYTE *)(v13 + v14);
        v3 = (v12 >> 1) - v14;
        result = swift_release();
        v2 = v11;
      }
      v16 = __OFSUB__(v3--, 1);
      if (v16)
        break;
      *v5++ = v6;
      if (!--v1)
        goto LABEL_19;
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  v17 = v2[3];
  if (v17 < 2)
    return (uint64_t)v2;
  v18 = v17 >> 1;
  v16 = __OFSUB__(v18, v3);
  v19 = v18 - v3;
  if (!v16)
  {
    v2[2] = v19;
    return (uint64_t)v2;
  }
LABEL_25:
  __break(1u);
  return result;
}

void specialized _copySequenceToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  BOOL v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;

  v4 = *(unsigned int *)(a4 + 4);
  v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if ((_DWORD)v4)
  {
    v6 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 24);
    if ((uint64_t)((v6 >> 1) + 0x4000000000000000) < 0)
      goto LABEL_42;
    v7 = a4 + 8;
    v8 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if (v8 <= 1)
      v9 = 1;
    else
      v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIEventPacket>>);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v13 = v12 >> 3;
    v10[2] = v9;
    v10[3] = 2 * v13;
    v14 = v10 + 4;
    v15 = v5[3] >> 1;
    v16 = &v10[v15 + 4];
    v17 = v13 & 0x7FFFFFFFFFFFFFFFLL;
    if (v5[2])
    {
      if (v10 != v5 || v14 >= &v5[v15 + 4])
        memcpy(v14, v5 + 4, 8 * v15);
      v5[2] = 0;
    }
    swift_release();
    v19 = v17 + ~v15;
    *v16 = v7;
    if ((_DWORD)v4 != 1)
    {
      for (i = v4 - 1; i; --i)
      {
        v21 = *(unsigned int *)(v7 + 8);
        if (v19)
        {
          ++v16;
          v22 = __OFSUB__(v19--, 1);
          if (v22)
            goto LABEL_41;
        }
        else
        {
          v23 = v10[3];
          if ((uint64_t)((v23 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_42;
          v24 = v23 & 0xFFFFFFFFFFFFFFFELL;
          if (v24 <= 1)
            v25 = 1;
          else
            v25 = v24;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIEventPacket>>);
          v26 = (_QWORD *)swift_allocObject();
          v27 = _swift_stdlib_malloc_size(v26);
          v28 = v27 - 32;
          if (v27 < 32)
            v28 = v27 - 25;
          v29 = v28 >> 3;
          v26[2] = v25;
          v26[3] = 2 * (v28 >> 3);
          v30 = (unint64_t)(v26 + 4);
          v31 = v10[3] >> 1;
          if (v10[2])
          {
            v32 = v10 + 4;
            if (v26 != v10 || v30 >= (unint64_t)v32 + 8 * v31)
              memmove(v26 + 4, v32, 8 * v31);
            v10[2] = 0;
          }
          v16 = (_QWORD *)(v30 + 8 * v31);
          v33 = (v29 & 0x7FFFFFFFFFFFFFFFLL) - v31;
          swift_release();
          v10 = v26;
          v22 = __OFSUB__(v33, 1);
          v19 = v33 - 1;
          if (v22)
          {
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
            return;
          }
        }
        v7 += 4 * v21 + 12;
        *v16 = v7;
      }
    }
  }
  else
  {
    v19 = 0;
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v34 = v10[3];
  if (v34 >= 2)
  {
    v35 = v34 >> 1;
    v22 = __OFSUB__(v35, v19);
    v36 = v35 - v19;
    if (v22)
      goto LABEL_43;
    v10[2] = v36;
  }
}

unsigned int *specialized _copySequenceToContiguousArray<A>(_:)(unsigned int *result)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  int64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  BOOL v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  _QWORD *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  const void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;

  v1 = (unint64_t)(result + 1);
  v2 = *result;
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if ((_DWORD)v2)
  {
    v4 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 24);
    if ((uint64_t)((v4 >> 1) + 0x4000000000000000) < 0)
      goto LABEL_42;
    v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
    if (v5 <= 1)
      v6 = 1;
    else
      v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIPacket>>);
    v7 = (_QWORD *)swift_allocObject();
    v8 = _swift_stdlib_malloc_size(v7);
    v9 = v8 - 32;
    if (v8 < 32)
      v9 = v8 - 25;
    v10 = v9 >> 3;
    v7[2] = v6;
    v7[3] = 2 * v10;
    v11 = v7 + 4;
    v12 = v3[3] >> 1;
    v13 = &v7[v12 + 4];
    v14 = v10 & 0x7FFFFFFFFFFFFFFFLL;
    if (v3[2])
    {
      if (v7 != v3 || v11 >= &v3[v12 + 4])
        memcpy(v11, v3 + 4, 8 * v12);
      v3[2] = 0;
    }
    result = (unsigned int *)swift_release();
    v16 = v14 + ~v12;
    *v13 = v1;
    if ((_DWORD)v2 != 1)
    {
      for (i = v2 - 1; i; --i)
      {
        v18 = *(unsigned __int16 *)(v1 + 8);
        if (v16)
        {
          ++v13;
          v19 = __OFSUB__(v16--, 1);
          if (v19)
            goto LABEL_41;
        }
        else
        {
          v20 = v7[3];
          if ((uint64_t)((v20 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_42;
          v21 = v20 & 0xFFFFFFFFFFFFFFFELL;
          if (v21 <= 1)
            v22 = 1;
          else
            v22 = v21;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIPacket>>);
          v23 = (_QWORD *)swift_allocObject();
          v24 = _swift_stdlib_malloc_size(v23);
          v25 = v24 - 32;
          if (v24 < 32)
            v25 = v24 - 25;
          v26 = v25 >> 3;
          v23[2] = v22;
          v23[3] = 2 * (v25 >> 3);
          v27 = (unint64_t)(v23 + 4);
          v28 = v7[3] >> 1;
          if (v7[2])
          {
            v29 = v7 + 4;
            if (v23 != v7 || v27 >= (unint64_t)v29 + 8 * v28)
              memmove(v23 + 4, v29, 8 * v28);
            v7[2] = 0;
          }
          v13 = (unint64_t *)(v27 + 8 * v28);
          v30 = (v26 & 0x7FFFFFFFFFFFFFFFLL) - v28;
          result = (unsigned int *)swift_release();
          v7 = v23;
          v19 = __OFSUB__(v30, 1);
          v16 = v30 - 1;
          if (v19)
          {
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
            return result;
          }
        }
        v1 = (v1 + v18 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        *v13 = v1;
      }
    }
  }
  else
  {
    v16 = 0;
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v31 = v7[3];
  if (v31 >= 2)
  {
    v32 = v31 >> 1;
    v19 = __OFSUB__(v32, v16);
    v33 = v32 - v16;
    if (v19)
      goto LABEL_43;
    v7[2] = v33;
  }
  return (unsigned int *)v7;
}

void specialized _copySequenceToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  _QWORD *v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  const void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;

  v3 = (unint64_t)(a3 + 1);
  v4 = *a3;
  v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if ((_DWORD)v4)
  {
    v6 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 24);
    if ((uint64_t)((v6 >> 1) + 0x4000000000000000) < 0)
      goto LABEL_42;
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIPacket>>);
    v9 = (_QWORD *)swift_allocObject();
    v10 = _swift_stdlib_malloc_size(v9);
    v11 = v10 - 32;
    if (v10 < 32)
      v11 = v10 - 25;
    v12 = v11 >> 3;
    v9[2] = v8;
    v9[3] = 2 * v12;
    v13 = v9 + 4;
    v14 = v5[3] >> 1;
    v15 = &v9[v14 + 4];
    v16 = v12 & 0x7FFFFFFFFFFFFFFFLL;
    if (v5[2])
    {
      if (v9 != v5 || v13 >= &v5[v14 + 4])
        memcpy(v13, v5 + 4, 8 * v14);
      v5[2] = 0;
    }
    swift_release();
    v18 = v16 + ~v14;
    *v15 = v3;
    if ((_DWORD)v4 != 1)
    {
      for (i = v4 - 1; i; --i)
      {
        v20 = *(unsigned __int16 *)(v3 + 8);
        if (v18)
        {
          ++v15;
          v21 = __OFSUB__(v18--, 1);
          if (v21)
            goto LABEL_41;
        }
        else
        {
          v22 = v9[3];
          if ((uint64_t)((v22 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_42;
          v23 = v22 & 0xFFFFFFFFFFFFFFFELL;
          if (v23 <= 1)
            v24 = 1;
          else
            v24 = v23;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIPacket>>);
          v25 = (_QWORD *)swift_allocObject();
          v26 = _swift_stdlib_malloc_size(v25);
          v27 = v26 - 32;
          if (v26 < 32)
            v27 = v26 - 25;
          v28 = v27 >> 3;
          v25[2] = v24;
          v25[3] = 2 * (v27 >> 3);
          v29 = (unint64_t)(v25 + 4);
          v30 = v9[3] >> 1;
          if (v9[2])
          {
            v31 = v9 + 4;
            if (v25 != v9 || v29 >= (unint64_t)v31 + 8 * v30)
              memmove(v25 + 4, v31, 8 * v30);
            v9[2] = 0;
          }
          v15 = (unint64_t *)(v29 + 8 * v30);
          v32 = (v28 & 0x7FFFFFFFFFFFFFFFLL) - v30;
          swift_release();
          v9 = v25;
          v21 = __OFSUB__(v32, 1);
          v18 = v32 - 1;
          if (v21)
          {
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
            return;
          }
        }
        v3 = (v3 + v20 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        *v15 = v3;
      }
    }
  }
  else
  {
    v18 = 0;
    v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v33 = v9[3];
  if (v33 >= 2)
  {
    v34 = v33 >> 1;
    v21 = __OFSUB__(v34, v18);
    v35 = v34 - v18;
    if (v21)
      goto LABEL_43;
    v9[2] = v35;
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD049F4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  unint64_t v13;
  __int128 *v14;
  _OWORD *v15;
  __int128 v16;
  _DWORD *v17;

  v4 = *(unsigned int *)(a4 + 8);
  v5 = (_DWORD *)(a4 + 12);
  if (!a2)
  {
    v6 = 0;
    goto LABEL_23;
  }
  if (!a3)
  {
LABEL_22:
    v6 = a3;
    goto LABEL_23;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v6 = *(unsigned int *)(a4 + 8);
    if ((_DWORD)v4)
    {
      *a2 = *v5;
      v7 = a3 - 1;
      if (a3 != 1)
      {
        v8 = a3 - 2;
        if (a3 - 2 >= (unint64_t)(v4 - 1))
          v8 = v4 - 1;
        if (v8 < v7)
          v7 = v8;
        v9 = v7 + 1;
        if (v9 > 8 && (unint64_t)a2 - a4 - 12 >= 0x20)
        {
          v12 = v9 & 7;
          if ((v9 & 7) == 0)
            v12 = 8;
          v13 = v9 - v12;
          v10 = v9 - v12 + 1;
          v11 = &a2[v13];
          v14 = (__int128 *)(a4 + 32);
          v15 = a2 + 5;
          do
          {
            v16 = *v14;
            *(v15 - 1) = *(v14 - 1);
            *v15 = v16;
            v14 += 2;
            v15 += 2;
            v13 -= 8;
          }
          while (v13);
        }
        else
        {
          v10 = 1;
          v11 = a2;
        }
        v17 = v11 + 1;
        while (a3 != v10)
        {
          if (v4 == v10)
          {
            v6 = v4;
            goto LABEL_23;
          }
          *v17++ = v5[v10];
          if (a3 == ++v10)
            goto LABEL_22;
        }
        __break(1u);
        goto LABEL_26;
      }
      goto LABEL_22;
    }
LABEL_23:
    *result = v5;
    result[1] = v6;
    result[2] = v4;
    return (_QWORD *)v6;
  }
LABEL_26:
  __break(1u);
  return result;
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  unint64_t v13;
  _OWORD *v14;
  __int128 *v15;
  __int128 v16;
  _BYTE *v17;

  v4 = (_BYTE *)(a4 + 10);
  v5 = *(unsigned __int16 *)(a4 + 8);
  if (!a2)
  {
    v6 = 0;
    goto LABEL_23;
  }
  if (!a3)
  {
LABEL_22:
    v6 = a3;
    goto LABEL_23;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v6 = *(unsigned __int16 *)(a4 + 8);
    if (*(_WORD *)(a4 + 8))
    {
      *a2 = *v4;
      v7 = a3 - 1;
      if (a3 != 1)
      {
        v8 = a3 - 2;
        if (a3 - 2 >= (unint64_t)(v5 - 1))
          v8 = v5 - 1;
        if (v8 < v7)
          v7 = v8;
        v9 = v7 + 1;
        if (v9 > 0x10 && (unint64_t)&a2[-a4 - 10] >= 0x10)
        {
          v12 = v9 & 0xF;
          if ((v9 & 0xF) == 0)
            v12 = 16;
          v13 = v9 - v12;
          v10 = v9 - v12 + 1;
          v11 = &a2[v13];
          v14 = a2 + 1;
          v15 = (__int128 *)(a4 + 11);
          do
          {
            v16 = *v15++;
            *v14++ = v16;
            v13 -= 16;
          }
          while (v13);
        }
        else
        {
          v10 = 1;
          v11 = a2;
        }
        v17 = v11 + 1;
        while (a3 != v10)
        {
          if (v5 == v10)
          {
            v6 = v5;
            goto LABEL_23;
          }
          *v17++ = v4[v10];
          if (a3 == ++v10)
            goto LABEL_22;
        }
        __break(1u);
        goto LABEL_26;
      }
      goto LABEL_22;
    }
LABEL_23:
    *result = v4;
    result[1] = v6;
    result[2] = v5;
    return (_QWORD *)v6;
  }
LABEL_26:
  __break(1u);
  return result;
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if (!a2)
  {
LABEL_10:
    v4 = 0;
    goto LABEL_11;
  }
  if (!a3)
  {
LABEL_12:
    v4 = a3;
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v4 = *(unsigned __int16 *)(a4 + 8);
    if (*(_WORD *)(a4 + 8))
    {
      v5 = 0;
      while (1)
      {
        *(_BYTE *)(a2 + v5) = *(_BYTE *)(a4 + 10 + v5);
        if (a3 - 1 == v5)
          goto LABEL_12;
        v6 = v5 + 1;
        if (v5 + 1 == v4)
        {
          a3 = v5 + 1;
          goto LABEL_14;
        }
        v4 = *(unsigned __int16 *)(a4 + 8);
        ++v5;
        if (v6 >= v4)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
LABEL_11:
    a3 = 0;
LABEL_14:
    *result = a4;
    result[1] = v4;
    return (_QWORD *)a3;
  }
  __break(1u);
  return result;
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  BOOL v6;

  if (!a2)
  {
LABEL_11:
    a3 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    *result = a4;
    result[1] = a3;
    return (_QWORD *)a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (*(_DWORD *)(a4 + 8))
    {
      v4 = 0;
      while (1)
      {
        *(_DWORD *)(a2 + 4 * v4) = *(_DWORD *)(a4 + 12 + 4 * v4);
        if (a3 - 1 == v4)
          goto LABEL_12;
        v5 = *(unsigned int *)(a4 + 8);
        v6 = v4 + 1 >= v5;
        if (v4 + 1 == v5)
        {
          a3 = v4 + 1;
          goto LABEL_12;
        }
        ++v4;
        if (v6)
        {
          __break(1u);
          goto LABEL_11;
        }
      }
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(unsigned int *)(a1 + 8);
  if (!(_DWORD)v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt32>);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 29;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 2);
  if (specialized Sequence._copySequenceContents(initializing:)(&v7, (uint64_t)(v3 + 4), v1, a1) != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

{
  unint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v6;

  v1 = *(unsigned __int16 *)(a1 + 8);
  if (!*(_WORD *)(a1 + 8))
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * v4 - 64;
  if (specialized Sequence._copySequenceContents(initializing:)(&v6, (uint64_t)(v3 + 4), v1, a1) != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  _QWORD v7[3];

  v1 = *(unsigned int *)(a1 + 8);
  if (!(_DWORD)v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt32>);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 29;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * (v5 >> 2);
  if (specialized Sequence._copySequenceContents(initializing:)(v7, (_DWORD *)(v3 + 32), v1, a1) != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  _QWORD v6[3];

  v1 = *(unsigned __int16 *)(a1 + 8);
  if (!*(_WORD *)(a1 + 8))
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * v4 - 64;
  if (specialized Sequence._copySequenceContents(initializing:)(v6, (_BYTE *)(v3 + 32), v1, a1) != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE0830]();
}

uint64_t MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)()
{
  return MEMORY[0x24BEE0838]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE0E70]();
}

MIDIEventPacket *__cdecl MIDIEventListAdd(MIDIEventList *evtlist, ByteCount listSize, MIDIEventPacket *curPacket, MIDITimeStamp time, ByteCount wordCount, const UInt32 *words)
{
  return (MIDIEventPacket *)MEMORY[0x24BDBFB90](evtlist, listSize, curPacket, time, wordCount, words);
}

MIDIEventPacket *__cdecl MIDIEventListInit(MIDIEventList *evtlist, MIDIProtocolID protocol)
{
  return (MIDIEventPacket *)MEMORY[0x24BDBFB98](evtlist, *(_QWORD *)&protocol);
}

MIDIPacket *__cdecl MIDIPacketListAdd(MIDIPacketList *pktlist, ByteCount listSize, MIDIPacket *curPacket, MIDITimeStamp time, ByteCount nData, const Byte *data)
{
  return (MIDIPacket *)MEMORY[0x24BDBFBD0](pktlist, listSize, curPacket, time, nData, data);
}

MIDIPacket *__cdecl MIDIPacketListInit(MIDIPacketList *pktlist)
{
  return (MIDIPacket *)MEMORY[0x24BDBFBD8](pktlist);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

