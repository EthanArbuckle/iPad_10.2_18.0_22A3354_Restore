@implementation TSTLayoutCellIterator

- (TSTLayoutCellIterator)initWithLayout:(id)a3
{
  return -[TSTLayoutCellIterator initWithMasterLayout:](self, "initWithMasterLayout:", objc_msgSend(a3, "masterLayout"));
}

- (TSTLayoutCellIterator)initWithMasterLayout:(id)a3
{
  return -[TSTLayoutCellIterator initWithMasterLayout:range:](self, "initWithMasterLayout:range:", a3, TSTMasterLayoutGetRange((uint64_t)a3));
}

- (TSTLayoutCellIterator)initWithLayout:(id)a3 range:(id)a4
{
  return -[TSTLayoutCellIterator initWithMasterLayout:range:](self, "initWithMasterLayout:range:", objc_msgSend(a3, "masterLayout"), a4);
}

- (TSTLayoutCellIterator)initWithMasterLayout:(id)a3 range:(id)a4
{
  return -[TSTLayoutCellIterator initWithMasterLayout:range:flags:](self, "initWithMasterLayout:range:flags:", a3, a4, 0);
}

- (TSTLayoutCellIterator)initWithLayout:(id)a3 range:(id)a4 flags:(unint64_t)a5
{
  return -[TSTLayoutCellIterator initWithMasterLayout:range:flags:](self, "initWithMasterLayout:range:flags:", objc_msgSend(a3, "masterLayout"), a4, a5);
}

- (TSTLayoutCellIterator)initWithMasterLayout:(id)a3 range:(id)a4 flags:(unint64_t)a5
{
  unint64_t Range;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int var1;
  uint64_t var0;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unsigned __int16 v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  unsigned __int16 v34;
  unsigned int v35;
  uint64_t v36;
  unsigned __int8 v37;
  __int16 v39;
  TSTLayoutCellIterator *v40;

  Range = TSTMasterLayoutGetRange((uint64_t)a3);
  v10 = 0;
  v11 = 16711680;
  v12 = 0xFFFFLL;
  if ((_WORD)Range == 0xFFFF)
    goto LABEL_23;
  v13 = 0;
  if ((Range & 0xFF0000) == 0xFF0000)
    goto LABEL_24;
  v10 = 0;
  v11 = 16711680;
  v12 = 0xFFFFLL;
  if (!HIWORD(Range))
    goto LABEL_23;
  v13 = 0;
  if ((Range & 0xFFFF00000000) == 0)
    goto LABEL_24;
  v10 = 0;
  v11 = 16711680;
  v12 = 0xFFFFLL;
  if (a4.var0.var0 == 0xFFFF)
    goto LABEL_23;
  v13 = 0;
  if ((*(_QWORD *)&a4 & 0xFF0000) == 0xFF0000)
    goto LABEL_24;
  v10 = 0;
  v11 = 16711680;
  v12 = 0xFFFFLL;
  if (!HIWORD(*(unint64_t *)&a4))
  {
LABEL_23:
    v13 = 0;
  }
  else
  {
    v13 = 0;
    if ((*(_QWORD *)&a4 & 0xFFFF00000000) != 0)
    {
      v12 = 0;
      if (BYTE2(Range) <= a4.var0.var1)
        var1 = a4.var0.var1;
      else
        var1 = BYTE2(Range);
      if ((unsigned __int16)Range <= a4.var0.var0)
        var0 = a4.var0.var0;
      else
        var0 = (unsigned __int16)Range;
      if ((BYTE4(Range) + BYTE2(Range) - 1) >= (LOBYTE(a4.var1.var0)
                                                                                               + a4.var0.var1
                                                                                               - 1))
        v16 = (LOBYTE(a4.var1.var0) + a4.var0.var1 - 1);
      else
        v16 = (BYTE4(Range) + BYTE2(Range) - 1);
      v17 = (unsigned __int16)(a4.var0.var0 + a4.var1.var1 - 1);
      if ((unsigned __int16)(Range + HIWORD(Range) - 1) < v17)
        v17 = (unsigned __int16)(Range + HIWORD(Range) - 1);
      v11 = 0;
      v10 = 0;
      v13 = 0;
      if (var0 <= v17 && var1 <= v16)
      {
        v13 = ((unint64_t)(v17 - var0) << 48) + 0x1000000000000;
        v10 = (unint64_t)(unsigned __int16)(v16 - var1 + 1) << 32;
        v11 = var1 << 16;
        v12 = var0;
      }
    }
  }
LABEL_24:
  v18 = v11 | v13 | v12 | v10;
  v40 = self;
  self->mNumberOfLayoutColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)a3);
  v19 = objc_msgSend((id)objc_msgSend(a3, "tableModel"), "range");
  LOBYTE(v20) = 0;
  LOBYTE(v21) = -1;
  v22 = -1;
  v23 = 0xFFFFFFLL;
  if ((_WORD)v18 == 0xFFFF)
  {
    LOWORD(v24) = 0;
    v25 = 0;
    v26 = a5;
    goto LABEL_49;
  }
  LOWORD(v24) = 0;
  v25 = 0;
  v26 = a5;
  if ((v18 & 0xFF0000) != 0xFF0000)
  {
    LOBYTE(v20) = 0;
    LOBYTE(v21) = -1;
    v23 = 0xFFFFFFLL;
    LOWORD(v24) = 0;
    v25 = 0;
    if (HIWORD(v18))
    {
      if ((v18 & 0xFFFF00000000) != 0)
      {
        v27 = 0;
        v28 = 16711680;
        v29 = 0xFFFFLL;
        v24 = HIDWORD(v18);
        v25 = HIWORD(v13);
        if ((_WORD)v19 != 0xFFFF)
        {
          v30 = 0;
          if ((v19 & 0xFF0000) == 0xFF0000)
          {
LABEL_48:
            v23 = v28 | v30 | v29 | v27;
            v21 = v18 >> 16;
            v20 = v18 >> 24;
            v22 = v18;
            goto LABEL_49;
          }
          v27 = 0;
          v28 = 16711680;
          v29 = 0xFFFFLL;
          if (HIWORD(v19))
          {
            v30 = 0;
            if ((v19 & 0xFFFF00000000) != 0)
            {
              v29 = 0;
              if (BYTE2(v18) <= BYTE2(v19))
                v31 = BYTE2(v19);
              else
                v31 = BYTE2(v18);
              if ((unsigned __int16)v18 <= (unsigned __int16)v19)
                v32 = (unsigned __int16)v19;
              else
                v32 = (unsigned __int16)v18;
              if ((BYTE4(v18) + BYTE2(v18) - 1) >= (BYTE4(v19) + BYTE2(v19) - 1))
                v33 = (BYTE4(v19) + BYTE2(v19) - 1);
              else
                v33 = (BYTE4(v18) + BYTE2(v18) - 1);
              v34 = v19 + HIWORD(v19) - 1;
              v35 = v34;
              if ((unsigned __int16)(v18 + HIWORD(v13) - 1) < v34)
                v35 = (unsigned __int16)(v18 + HIWORD(v13) - 1);
              v28 = 0;
              v27 = 0;
              v30 = 0;
              if (v32 <= v35 && v31 <= v33)
              {
                v30 = ((unint64_t)(v35 - v32) << 48) + 0x1000000000000;
                v27 = (unint64_t)(unsigned __int16)(v33 - v31 + 1) << 32;
                v28 = v31 << 16;
                v29 = v32;
              }
            }
            goto LABEL_48;
          }
        }
        v30 = 0;
        goto LABEL_48;
      }
    }
  }
LABEL_49:
  v36 = -[TSTCellIterator initWithTableModel:region:flags:](v40, "initWithTableModel:region:flags:", objc_msgSend(a3, "tableModel", v25), +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", v23), v26 | 0x48);
  if (v36)
  {
    *(_QWORD *)(v36 + 112) = a3;
    *(_WORD *)(v36 + 120) = v22;
    *(_BYTE *)(v36 + 122) = v21;
    *(_BYTE *)(v36 + 123) = v20;
    *(_WORD *)(v36 + 124) = v24;
    *(_WORD *)(v36 + 126) = v39;
    v37 = v21 + v24 - 1;
    if ((v26 & 4) == 0)
      v37 = v21;
    *(_DWORD *)(v36 + 128) = v22 | (v37 << 16);
    *(_DWORD *)(v36 + 148) = 0xFFFFFF;
    *(_QWORD *)(v36 + 136) = objc_alloc_init(TSTCell);
    *(_WORD *)(v36 + 190) = objc_msgSend((id)objc_msgSend(a3, "tableModel"), "numberOfRows");
    *(_WORD *)(v36 + 188) = objc_msgSend((id)objc_msgSend(a3, "tableModel"), "numberOfColumns");
  }
  return (TSTLayoutCellIterator *)v36;
}

- (void)dealloc
{
  objc_super v3;

  self->mLayoutCell = 0;
  self->mMasterLayout = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTLayoutCellIterator;
  -[TSTCellIterator dealloc](&v3, sel_dealloc);
}

- (TSTTableModel)tableModel
{
  return self->super.mTableModel;
}

- (TSTMasterLayout)masterLayout
{
  return self->mMasterLayout;
}

@end
