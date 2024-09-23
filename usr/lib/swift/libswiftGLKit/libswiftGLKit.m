uint64_t _indexHomogeneousValue<A, B>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a4 - 8) + 72);
  result = a2 * v4;
  if ((unsigned __int128)(a2 * (__int128)v4) >> 64 == (a2 * v4) >> 63)
    return UnsafeRawPointer.load<A>(fromByteOffset:as:)();
  __break(1u);
  return result;
}

float _GLKMatrix2.subscript.getter(unint64_t a1, float a2, float a3, float a4, float a5)
{
  _DWORD v6[4];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a1 > 3)
    __break(1u);
  *(float *)v6 = a2;
  *(float *)&v6[1] = a3;
  *(float *)&v6[2] = a4;
  *(float *)&v6[3] = a5;
  return *(float *)&v6[a1];
}

float _GLKVector2.subscript.getter(unint64_t a1, float a2, float a3)
{
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (a1 > 1)
    __break(1u);
  *(float *)v4 = a2;
  *(float *)&v4[1] = a3;
  return *(float *)&v4[a1];
}

float _GLKMatrix3.subscript.getter(unint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  _OWORD v4[2];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a1 > 8)
    __break(1u);
  v2 = *(_OWORD *)(v1 + 16);
  v4[0] = *(_OWORD *)v1;
  v4[1] = v2;
  v5 = *(_DWORD *)(v1 + 32);
  return *((float *)v4 + a1);
}

float _GLKVector3.subscript.getter(unint64_t a1, float a2, float a3, float a4)
{
  _DWORD v5[3];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a1 > 2)
    __break(1u);
  *(float *)v5 = a2;
  *(float *)&v5[1] = a3;
  *(float *)&v5[2] = a4;
  return *(float *)&v5[a1];
}

float _GLKMatrix4.subscript.getter(unint64_t a1)
{
  _OWORD *v1;
  __int128 v2;
  __int128 v3;
  _OWORD v5[4];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a1 > 0xF)
    __break(1u);
  v2 = v1[1];
  v5[0] = *v1;
  v5[1] = v2;
  v3 = v1[3];
  v5[2] = v1[2];
  v5[3] = v3;
  return *((float *)v5 + a1);
}

float _GLKVector4.subscript.getter(unint64_t a1, float a2, float a3, float a4, float a5)
{
  return _GLKVector4.subscript.getter(a1, a2, a3, a4, a5);
}

{
  _DWORD v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a1 > 3)
    __break(1u);
  *(float *)v6 = a2;
  *(float *)&v6[1] = a3;
  *(float *)&v6[2] = a4;
  *(float *)&v6[3] = a5;
  return *(float *)&v6[a1];
}

float _GLKQuaternion.subscript.getter(unint64_t a1, float a2, float a3, float a4, float a5)
{
  return _GLKVector4.subscript.getter(a1, a2, a3, a4, a5);
}

