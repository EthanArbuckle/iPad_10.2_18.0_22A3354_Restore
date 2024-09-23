@implementation TSTTableTileRowInfo

- (TSTTableTileRowInfo)initWithOwner:(id)a3 tileRowIndex:(unsigned __int16)a4
{
  TSTTableTileRowInfo *result;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTTableTileRowInfo;
  result = -[TSPContainedObject initWithOwner:](&v7, sel_initWithOwner_, a3);
  if (result)
  {
    result->mTileRowIndex = a4;
    result->mStorageBuffer = 0;
    result->mBufferSize = 0;
    result->mCellCount = 0;
    result->mMaxTileColumnIndex = -1;
    result->mMaxTileColumnIndexValid = 1;
    *(_QWORD *)&v6 = -1;
    *((_QWORD *)&v6 + 1) = -1;
    *(_OWORD *)&result->mStorageOffsets[247] = v6;
    *(_OWORD *)&result->mStorageOffsets[232] = v6;
    *(_OWORD *)&result->mStorageOffsets[240] = v6;
    *(_OWORD *)&result->mStorageOffsets[216] = v6;
    *(_OWORD *)&result->mStorageOffsets[224] = v6;
    *(_OWORD *)&result->mStorageOffsets[200] = v6;
    *(_OWORD *)&result->mStorageOffsets[208] = v6;
    *(_OWORD *)&result->mStorageOffsets[184] = v6;
    *(_OWORD *)&result->mStorageOffsets[192] = v6;
    *(_OWORD *)&result->mStorageOffsets[168] = v6;
    *(_OWORD *)&result->mStorageOffsets[176] = v6;
    *(_OWORD *)&result->mStorageOffsets[152] = v6;
    *(_OWORD *)&result->mStorageOffsets[160] = v6;
    *(_OWORD *)&result->mStorageOffsets[136] = v6;
    *(_OWORD *)&result->mStorageOffsets[144] = v6;
    *(_OWORD *)&result->mStorageOffsets[120] = v6;
    *(_OWORD *)&result->mStorageOffsets[128] = v6;
    *(_OWORD *)&result->mStorageOffsets[104] = v6;
    *(_OWORD *)&result->mStorageOffsets[112] = v6;
    *(_OWORD *)&result->mStorageOffsets[88] = v6;
    *(_OWORD *)&result->mStorageOffsets[96] = v6;
    *(_OWORD *)&result->mStorageOffsets[72] = v6;
    *(_OWORD *)&result->mStorageOffsets[80] = v6;
    *(_OWORD *)&result->mStorageOffsets[56] = v6;
    *(_OWORD *)&result->mStorageOffsets[64] = v6;
    *(_OWORD *)&result->mStorageOffsets[40] = v6;
    *(_OWORD *)&result->mStorageOffsets[48] = v6;
    *(_OWORD *)&result->mStorageOffsets[24] = v6;
    *(_OWORD *)&result->mStorageOffsets[32] = v6;
    *(_OWORD *)&result->mStorageOffsets[8] = v6;
    *(_OWORD *)&result->mStorageOffsets[16] = v6;
    *(_OWORD *)result->mStorageOffsets = v6;
    result->mStorageVersion = 3;
  }
  return result;
}

- (void)dealloc
{
  __CFData *mStorageBuffer;
  objc_super v4;

  mStorageBuffer = self->mStorageBuffer;
  if (mStorageBuffer)
    CFRelease(mStorageBuffer);
  v4.receiver = self;
  v4.super_class = (Class)TSTTableTileRowInfo;
  -[TSTTableTileRowInfo dealloc](&v4, sel_dealloc);
}

- (id)p_debugDumpCompact
{
  void *v3;
  void *v4;
  uint64_t i;
  uint64_t v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("idx: |"));
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("off: |"));
  for (i = 0; i != 255; ++i)
  {
    v6 = self->mStorageOffsets[i];
    if ((_DWORD)v6 != 0xFFFF)
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("%3hu|"), i);
      objc_msgSend(v4, "appendFormat:", CFSTR("%3hu|"), v6);
    }
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v4);
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p tileRowIndex %hu cellCount %hu>"), NSStringFromClass(v4), self, self->mTileRowIndex, self->mCellCount);
}

- (unsigned)tileRowIndex
{
  return self->mTileRowIndex;
}

- (void)setTileRowIndex:(unsigned __int16)a3
{
  self->mTileRowIndex = a3;
}

- (unsigned)cellCount
{
  return self->mCellCount;
}

- (void)i_upgradeWithDataStore:(id)a3
{
  TSTTableTileRowInfo *v5;
  void *v6;
  uint64_t v7;
  TSTCell *v8;
  UInt8 *MutableBytePtr;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __CFData *mStorageBuffer;
  void *v14;
  uint64_t v15;

  v5 = -[TSTTableTileRowInfo initWithOwner:tileRowIndex:]([TSTTableTileRowInfo alloc], "initWithOwner:tileRowIndex:", 0, -[TSTTableTileRowInfo tileRowIndex](self, "tileRowIndex"));
  if (!v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableTileRowInfo(Internal) i_upgradeWithDataStore:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableTileRowInfo.mm"), 669, CFSTR("failed to allocate memory in tile upgrade, the world will end now"));
  }
  v8 = objc_alloc_init(TSTCell);
  MutableBytePtr = CFDataGetMutableBytePtr(self->mStorageBuffer);
  v10 = 0;
  v11 = 0;
  do
  {
    if (self->mCellCount == v11)
      break;
    v12 = self->mStorageOffsets[v10];
    if (v12 != 0xFFFF)
    {
      TSTCellInflateFromStorageRef((uint64_t)v8, &MutableBytePtr[v12], (id *)a3);
      TSTTableTileRowInfoSetCell(v5, v10, v8);
      ++v11;
    }
    ++v10;
  }
  while (v10 != 255);
  if (v11)
  {
    mStorageBuffer = v5->mStorageBuffer;
    if (!mStorageBuffer)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableTileRowInfo(Internal) i_upgradeWithDataStore:]");
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableTileRowInfo.mm"), 719, CFSTR("NULL storage buffer"));
      mStorageBuffer = v5->mStorageBuffer;
    }
    CFRetain(mStorageBuffer);
    CFRelease(self->mStorageBuffer);
    self->mStorageBuffer = v5->mStorageBuffer;
    memcpy(self->mStorageOffsets, v5->mStorageOffsets, 0x200uLL);
  }
  self->mStorageVersion = 3;

}

@end
