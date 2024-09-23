@implementation ESDDibFileBlipContext

- (BOOL)loadDelayedNode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unsigned int *v7;
  uint64_t mByteCount;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  BOOL v13;
  unsigned int UInt16;
  int v15;
  int SInt32;
  int v18;
  int v19;
  unsigned int v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ESDDibFileBlipContext;
  -[ESDBlipContext loadDelayedNode:](&v21, sel_loadDelayedNode_, v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 0);
  objc_msgSend(v4, "data");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (unsigned int *)objc_msgSend(v6, "bytes");
  mByteCount = self->super.mByteCount;
  v20 = mByteCount + 14;
  if ((unint64_t)objc_msgSend(v6, "length") >= 4
    && ((v9 = CsLeReadSInt32(v7), v10 = v9, v9 != 12) ? (v11 = 14) : (v11 = 10),
        v9 == 12 ? (v12 = 3) : (v12 = 4),
        objc_msgSend(v6, "length") >= (unint64_t)(v11 + 2)))
  {
    UInt16 = CsLeReadUInt16((unsigned __int16 *)((char *)v7 + v11));
    v15 = 1 << UInt16;
    if (UInt16 >= 9)
      v15 = 0;
    v19 = v10 + v15 * v12 + 14;
    objc_msgSend(v5, "appendBytes:length:", "BM", 2);
    v18 = CsLeReadSInt32(&v20);
    objc_msgSend(v5, "appendBytes:length:", &v18, 4);
    objc_msgSend(v5, "appendBytes:length:", &unk_22A4BE700, 4);
    SInt32 = CsLeReadSInt32((unsigned int *)&v19);
    objc_msgSend(v5, "appendBytes:length:", &SInt32, 4);
    objc_msgSend(v5, "appendBytes:length:", v7, mByteCount);
    objc_msgSend(v4, "setData:", v5);
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
