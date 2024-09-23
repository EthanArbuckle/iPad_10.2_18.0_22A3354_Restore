@implementation VFXMemorySerialization

+ (id)readString:(void *)a3
{
  void *v3;

  sub_1B222871C();
  v3 = (void *)sub_1B2228728();
  swift_bridgeObjectRelease();
  return v3;
}

+ (void)writeString:(id)a3 to:(void *)a4
{
  sub_1B222874C();
  _s3VFX22VFXMemorySerializationC11writeString_2toySS_SvtFZ_0();
  swift_bridgeObjectRelease();
}

+ (id)readKeyframeAnimation:(void *)a3
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2798]), sel_initWithSerializedVFXBindingDataPointer_, a3);
}

+ (void)writeKeyframeAnimation:(id)a3 to:(void *)a4
{
  id v4;

  v4 = a3;
  _s3VFX22VFXMemorySerializationC22writeKeyframeAnimation_2toySo010CAKeyframeF0C_SvtFZ_0(v4);

}

- (VFXMemorySerialization)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VFXMemorySerialization();
  return -[VFXMemorySerialization init](&v3, sel_init);
}

+ (BOOL)readBool:(void *)a3
{
  return *(_BYTE *)a3 & 1;
}

+ (void)writeBool:(BOOL)a3 to:(void *)a4
{
  *(_BYTE *)a4 = a3;
}

+ (unsigned)readUInt8:(void *)a3
{
  return *(_BYTE *)a3;
}

+ (void)writeUInt8:(unsigned __int8)a3 to:(void *)a4
{
  *(_BYTE *)a4 = a3;
}

+ (unsigned)readUInt16:(void *)a3
{
  return *(_WORD *)a3;
}

+ (void)writeUInt16:(unsigned __int16)a3 to:(void *)a4
{
  *(_WORD *)a4 = a3;
}

+ (unsigned)readUInt32:(void *)a3
{
  return *(_DWORD *)a3;
}

+ (unint64_t)readUInt64:(void *)a3
{
  return *(_QWORD *)a3;
}

+ (char)readInt8:(void *)a3
{
  return *(_BYTE *)a3;
}

+ (void)writeInt8:(char)a3 to:(void *)a4
{
  *(_BYTE *)a4 = a3;
}

+ (signed)readInt16:(void *)a3
{
  return *(_WORD *)a3;
}

+ (void)writeInt16:(signed __int16)a3 to:(void *)a4
{
  *(_WORD *)a4 = a3;
}

+ (void)writeInt32:(int)a3 to:(void *)a4
{
  *(_DWORD *)a4 = a3;
}

+ (void)writeInt64:(int64_t)a3 to:(void *)a4
{
  *(_QWORD *)a4 = a3;
}

+ (double)readDouble:(void *)a3
{
  return *(double *)a3;
}

+ (void)writeDouble:(double)a3 to:(void *)a4
{
  *(double *)a4 = a3;
}

+ (float)readFloat:(void *)a3
{
  return *(float *)a3;
}

+ (void)writeFloat:(float)a3 to:(void *)a4
{
  *(float *)a4 = a3;
}

+ (double)readSIMD2F:(uint64_t)a3
{
  return *(double *)a3;
}

+ (void)writeSIMD2F:(void *)a3 to:
{
  uint64_t v3;

  *(_QWORD *)a3 = v3;
}

+ (__n128)readSIMD3F:(uint64_t)a3
{
  return *(__n128 *)a3;
}

+ (void)writeSIMD3F:(void *)a3 to:
{
  __int128 v3;

  *(_OWORD *)a3 = v3;
}

+ (__n128)readSIMD4F:(uint64_t)a3
{
  return *(__n128 *)a3;
}

+ (void)writeSIMD4F:(void *)a3 to:
{
  __int128 v3;

  *(_OWORD *)a3 = v3;
}

+ (__n128)readSIMD3x3F:(uint64_t)a3
{
  return *(__n128 *)a3;
}

+ (void)writeSIMD3x3F:(__n128)a3 to:(uint64_t)a4
{
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
}

+ (__n128)readSIMD4x4F:(uint64_t)a3
{
  return *(__n128 *)a3;
}

+ (void)writeSIMD4x4F:(__n128)a3 to:(__n128)a4
{
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
}

+ (__n128)readSIMD2D:(uint64_t)a3
{
  return *(__n128 *)a3;
}

+ (void)writeSIMD2D:(void *)a3 to:
{
  __int128 v3;

  *(_OWORD *)a3 = v3;
}

+ (__n128)readSIMD3D:(uint64_t)a1@<X2>
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

+ (void)writeSIMD3D:(void *)a3 to:
{
  _OWORD *v3;
  __int128 v4;

  v4 = *((_OWORD *)a3 + 1);
  *v3 = *(_OWORD *)a3;
  v3[1] = v4;
}

+ (__n128)readSIMD3x3D:(uint64_t)a1@<X2>
{
  __n128 result;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 80);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  a2[2] = v4;
  a2[3] = v5;
  a2[4] = v6;
  a2[5] = v7;
  return result;
}

+ (__n128)writeSIMD3x3D:(uint64_t)a3 to:(uint64_t)a4
{
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  result = *(__n128 *)(a3 + 16);
  v6 = *(_OWORD *)(a3 + 32);
  v5 = *(_OWORD *)(a3 + 48);
  v8 = *(_OWORD *)(a3 + 64);
  v7 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)a4 = *(_OWORD *)a3;
  *(__n128 *)(a4 + 16) = result;
  *(_OWORD *)(a4 + 32) = v6;
  *(_OWORD *)(a4 + 48) = v5;
  *(_OWORD *)(a4 + 64) = v8;
  *(_OWORD *)(a4 + 80) = v7;
  return result;
}

+ (__n128)readSIMD4x4D:(uint64_t)a1@<X2>
{
  __n128 result;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 80);
  v8 = *(_OWORD *)(a1 + 96);
  v9 = *(_OWORD *)(a1 + 112);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  a2[2] = v4;
  a2[3] = v5;
  a2[4] = v6;
  a2[5] = v7;
  a2[6] = v8;
  a2[7] = v9;
  return result;
}

+ (__n128)writeSIMD4x4D:(uint64_t)a3 to:(uint64_t)a4
{
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  result = *(__n128 *)(a3 + 16);
  v6 = *(_OWORD *)(a3 + 32);
  v5 = *(_OWORD *)(a3 + 48);
  v8 = *(_OWORD *)(a3 + 64);
  v7 = *(_OWORD *)(a3 + 80);
  v10 = *(_OWORD *)(a3 + 96);
  v9 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)a4 = *(_OWORD *)a3;
  *(__n128 *)(a4 + 16) = result;
  *(_OWORD *)(a4 + 32) = v6;
  *(_OWORD *)(a4 + 48) = v5;
  *(_OWORD *)(a4 + 64) = v8;
  *(_OWORD *)(a4 + 80) = v7;
  *(_OWORD *)(a4 + 96) = v10;
  *(_OWORD *)(a4 + 112) = v9;
  return result;
}

+ (int)VFXSerializedBufferSize:(void *)a3 type:(int64_t)a4
{
  swift_getObjCClassMetadata();
  return static VFXMemorySerialization.VFXSerializedBufferSize(_:type:)(a3, a4);
}

+ (void)writeSIMD4D:(void *)a3 to:
{
  +[VFXMemorySerialization writeSIMD3D:to:](a1, a2, a3);
}

+ (void)writeInt:(int64_t)a3 to:(void *)a4
{
  +[VFXMemorySerialization writeInt64:to:](a1, a2, a3, a4);
}

+ (void)writeUInt32:(unsigned int)a3 to:(void *)a4
{
  +[VFXMemorySerialization writeInt32:to:](a1, a2, a3, a4);
}

+ (void)writeUInt64:(unint64_t)a3 to:(void *)a4
{
  +[VFXMemorySerialization writeInt64:to:](a1, a2, a3, a4);
}

+ (double)readSIMD4D:(uint64_t)a1@<X2>
{
  double result;

  *(_QWORD *)&result = +[VFXMemorySerialization readSIMD3D:](a1, a2).n128_u64[0];
  return result;
}

+ (int64_t)readInt:(void *)a3
{
  return +[VFXMemorySerialization readUInt64:](a1, a2, a3);
}

+ (int)readInt32:(void *)a3
{
  return +[VFXMemorySerialization readUInt32:](a1, a2, a3);
}

+ (int64_t)readInt64:(void *)a3
{
  return +[VFXMemorySerialization readUInt64:](a1, a2, a3);
}

@end
