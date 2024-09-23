@implementation TSTMergeRegionMap

+ (id)mergeRegionMapFromMap:(id)a3 intersectingRange:(id)a4
{
  return -[TSTMergeRegionMap initRegionMapFromMap:intersectingRange:]([TSTMergeRegionMap alloc], "initRegionMapFromMap:intersectingRange:", a3, a4);
}

- (id)initRegionMapFromMap:(id)a3 rowRemapping:(id)a4
{
  void *v7;
  uint64_t v8;
  TSTMergeRegionMap *v9;
  TSTMergeRegionMap *v10;
  TSTMergeRegionMapIterator *v11;
  uint64_t v12;

  if ((objc_msgSend(a4, "isVertical") & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMergeRegionMap initRegionMapFromMap:rowRemapping:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 26, CFSTR("remapping must be vertical."));
  }
  v9 = -[TSTMergeRegionMap initWithContext:](self, "initWithContext:", objc_msgSend(a3, "context"));
  v10 = v9;
  if (a3 && v9)
  {
    v11 = -[TSTMergeRegionMapIterator initWithMergeRegionMap:]([TSTMergeRegionMapIterator alloc], "initWithMergeRegionMap:", a3);
    if (-[TSTMergeRegionMapIterator hasNextMergeRegion](v11, "hasNextMergeRegion"))
    {
      do
      {
        v12 = -[TSTMergeRegionMapIterator nextMergeRegion](v11, "nextMergeRegion");
        -[TSTMergeRegionMap insert:](v10, "insert:", v12 & 0xFFFFFFFFFFFF0000 | objc_msgSend(a4, "mapIndex:", (unsigned __int16)v12));
      }
      while (-[TSTMergeRegionMapIterator hasNextMergeRegion](v11, "hasNextMergeRegion"));
    }

  }
  return v10;
}

- (id)initRegionMapFromMap:(id)a3 intersectingRange:(id)a4
{
  TSTMergeRegionMap *v6;
  TSTMergeRegionMap *v7;
  unint64_t v8;
  unsigned __int16 v9;
  unsigned __int16 v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  BOOL v15;
  TSTMergeRegionMapIterator *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unsigned int var1;
  uint64_t var0;
  unsigned int v24;
  unsigned int v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  BOOL v29;

  v6 = -[TSTMergeRegionMap initWithContext:](self, "initWithContext:", objc_msgSend(a3, "context"));
  v7 = v6;
  if (!a3
    || !v6
    || a4.var0.var0 == 0xFFFF
    || (*(_QWORD *)&a4 & 0xFF0000) == 0xFF0000
    || !HIWORD(*(unint64_t *)&a4)
    || (*(_QWORD *)&a4 & 0xFFFF00000000) == 0)
  {
    return v7;
  }
  v8 = HIDWORD(*(unint64_t *)&a4);
  if (a4.var1.var0 * *(unsigned int *)&a4.var1.var1 >= *((_DWORD *)a3 + 28))
  {
    v16 = -[TSTMergeRegionMapIterator initWithMergeRegionMap:]([TSTMergeRegionMapIterator alloc], "initWithMergeRegionMap:", a3);
    if (!-[TSTMergeRegionMapIterator hasNextMergeRegion](v16, "hasNextMergeRegion"))
    {
LABEL_55:

      return v7;
    }
    while (1)
    {
      v17 = -[TSTMergeRegionMapIterator nextMergeRegion](v16, "nextMergeRegion");
      v18 = 0;
      if ((_WORD)v17 != 0xFFFF)
      {
        v19 = 0xFFFFLL;
        v20 = 16711680;
        v21 = 0;
        if ((v17 & 0xFF0000) == 0xFF0000)
          goto LABEL_45;
        v18 = 0;
        if (HIWORD(v17))
        {
          v19 = 0xFFFFLL;
          v20 = 16711680;
          v21 = 0;
          if ((v17 & 0xFFFF00000000) != 0)
          {
            v19 = 0;
            var1 = BYTE2(v17);
            if (BYTE2(v17) <= a4.var0.var1)
              var1 = a4.var0.var1;
            if ((unsigned __int16)v17 <= a4.var0.var0)
              var0 = a4.var0.var0;
            else
              var0 = (unsigned __int16)v17;
            if ((BYTE4(v17) + BYTE2(v17) - 1) >= (LOBYTE(a4.var1.var0)
                                                                                                 + a4.var0.var1
                                                                                                 - 1))
              v24 = (LOBYTE(a4.var1.var0) + a4.var0.var1 - 1);
            else
              v24 = (BYTE4(v17) + BYTE2(v17) - 1);
            if ((unsigned __int16)(v17 + HIWORD(v17) - 1) >= (unsigned __int16)(a4.var0.var0
                                                                                             + a4.var1.var1
                                                                                             - 1))
              v25 = (unsigned __int16)(a4.var0.var0 + a4.var1.var1 - 1);
            else
              v25 = (unsigned __int16)(v17 + HIWORD(v17) - 1);
            v20 = 0;
            v18 = 0;
            v21 = 0;
            if (var0 <= v25 && var1 <= v24)
            {
              v21 = ((unint64_t)(v25 - var0) << 48) + 0x1000000000000;
              v18 = (unint64_t)(unsigned __int16)(v24 - var1 + 1) << 32;
              v20 = var1 << 16;
              v19 = var0;
            }
          }
          goto LABEL_45;
        }
      }
      v19 = 0xFFFFLL;
      v20 = 16711680;
      v21 = 0;
LABEL_45:
      v26 = v20 | v21 | v19 | v18;
      if ((_WORD)v26 != 0xFFFF)
      {
        v14 = (v26 & 0xFF0000) == 16711680;
        v27 = v26 & 0xFFFF00000000;
        v28 = HIWORD(v26);
        v29 = v14 || v28 == 0;
        if (!v29 && v27 != 0)
          -[TSTMergeRegionMap insert:](v7, "insert:");
      }
      if (!-[TSTMergeRegionMapIterator hasNextMergeRegion](v16, "hasNextMergeRegion"))
        goto LABEL_55;
    }
  }
  v9 = a4.var0.var0 + a4.var1.var1 - 1;
  if (v9 >= a4.var0.var0)
  {
    v10 = a4.var0.var0;
    do
    {
      if (a4.var0.var1 <= (LOBYTE(a4.var1.var0) + a4.var0.var1 - 1))
      {
        v11 = *(unint64_t *)&a4 >> 16;
        do
        {
          v8 = v10 | ((unint64_t)v11 << 16) | v8 & 0xFFFFFFFF00000000;
          v12 = objc_msgSend(a3, "mergedRangeForCellID:", v8);
          v13 = v12;
          if ((_WORD)v12 != 0xFFFF)
          {
            v14 = (v12 & 0xFF0000) == 0xFF0000 || HIWORD(v12) == 0;
            v15 = v14 || (v12 & 0xFFFF00000000) == 0;
            if (!v15 && !-[TSTMergeRegionMap find:](v7, "find:", v12))
              -[TSTMergeRegionMap insert:](v7, "insert:", v13);
          }
          LOBYTE(v11) = v11 + 1;
        }
        while (v11 <= (LOBYTE(a4.var1.var0) + a4.var0.var1 - 1));
      }
      ++v10;
    }
    while (v10 <= v9);
  }
  return v7;
}

- (TSTMergeRegionMap)initWithContext:(id)a3
{
  TSTMergeRegionMap *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTMergeRegionMap;
  result = -[TSPObject initWithContext:](&v4, sel_initWithContext_, a3);
  if (result)
    result->mUnionedMergeRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  return result;
}

- (id)iterator
{
  return -[TSTMergeRegionMapIterator initWithMergeRegionMap:]([TSTMergeRegionMapIterator alloc], "initWithMergeRegionMap:", self);
}

- (unint64_t)count
{
  return self->mMergeRegionTopLeftToMergeRegionSize.__table_.__p2_.__value_;
}

- (id)description
{
  void *v3;
  TSTMergeRegionMapIterator *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("TSTMergeRegionMap %p: "), self);
  v4 = -[TSTMergeRegionMapIterator initWithMergeRegionMap:]([TSTMergeRegionMapIterator alloc], "initWithMergeRegionMap:", self);
  if (-[TSTMergeRegionMapIterator hasNextMergeRegion](v4, "hasNextMergeRegion"))
  {
    do
    {
      v5 = -[TSTMergeRegionMapIterator nextMergeRegion](v4, "nextMergeRegion");
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), BYTE2(v5), (unsigned __int16)v5);
      objc_msgSend(v3, "appendString:", objc_msgSend(v6, "stringWithFormat:", CFSTR("(%@, %@)"), v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hux%hu"), WORD2(v5), HIWORD(v5))));
      if (-[TSTMergeRegionMapIterator hasNextMergeRegion](v4, "hasNextMergeRegion"))
        objc_msgSend(v3, "appendString:", CFSTR(", "));
    }
    while (-[TSTMergeRegionMapIterator hasNextMergeRegion](v4, "hasNextMergeRegion"));
  }

  return v3;
}

- (BOOL)insert:(id)a3
{
  __int16 v5;
  void *v6;
  uint64_t v7;
  unsigned __int16 v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  unsigned __int16 var0;
  unint64_t v14;
  uint64_t v15;
  unsigned __int16 v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  int *v23;

  v5 = ~a3.var0.var0;
  v22 = (unint64_t)a3;
  -[TSPObject willModify](self, "willModify");
  if (!v5
    || (*(_QWORD *)&a3 & 0xFF0000) == 0xFF0000
    || !HIWORD(*(unint64_t *)&a3)
    || (*(_QWORD *)&a3 & 0xFFFF00000000) == 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMergeRegionMap insert:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 172, CFSTR("can't insert an invalid merge range"));
  }
  v8 = a3.var0.var0 + a3.var1.var1 - 1;
  if (v8 >= a3.var0.var0)
  {
    var0 = a3.var0.var0;
    while (a3.var0.var1 > (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1))
    {
LABEL_15:
      if (++var0 > v8)
      {
        v16 = a3.var0.var0;
        do
        {
          if (a3.var0.var1 <= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1))
          {
            v17 = *(unint64_t *)&a3 >> 16;
            do
            {
              v21 = v16 | (v17 << 16);
              v23 = &v21;
              *((_DWORD *)std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::__emplace_unique_key_args<TSUColumnRowCoordinate,std::piecewise_construct_t const&,std::tuple<TSUColumnRowCoordinate const&>,std::tuple<>>((uint64_t)&self->mCellIDToMergeRegionTopLeft, &v21, (uint64_t)&std::piecewise_construct, &v23)+ 5) = a3.var0;
              LODWORD(v17) = v17 + 1;
            }
            while (v17 <= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1));
          }
          ++v16;
        }
        while (v16 <= v8);
        goto LABEL_7;
      }
    }
    v14 = *(unint64_t *)&a3 >> 16;
    while (1)
    {
      v15 = v14;
      LODWORD(v23) = var0 | (v14 << 16);
      if (std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&self->mCellIDToMergeRegionTopLeft.__table_.__bucket_list_.__ptr_.__value_, (int *)&v23))
      {
        break;
      }
      LOBYTE(v14) = v15 + 1;
      if ((v15 + 1) > (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1))
        goto LABEL_15;
    }
    v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMergeRegionMap insert:]");
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v20, 186, CFSTR("can't merge an already-merged cell: %@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), v15, var0));
    return 0;
  }
  else
  {
LABEL_7:
    if (std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&self->mMergeRegionTopLeftToMergeRegionSize.__table_.__bucket_list_.__ptr_.__value_, (int *)&v22))
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMergeRegionMap insert:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 204, CFSTR("merge region to be inserted already exists!"));
    }
    v23 = (int *)&v22;
    v11 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::__emplace_unique_key_args<TSUColumnRowCoordinate,std::piecewise_construct_t const&,std::tuple<TSUColumnRowCoordinate const&>,std::tuple<>>((uint64_t)&self->mMergeRegionTopLeftToMergeRegionSize, &v22, (uint64_t)&std::piecewise_construct, &v23);
    *((_DWORD *)v11 + 5) = HIDWORD(v22);
    self->mUnionedMergeRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)TSTCellRangeUnionCellRange(*(_QWORD *)&self->mUnionedMergeRange, v22);
    return 1;
  }
}

- (BOOL)remove:(id)a3
{
  __int16 v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned __int16 var0;
  unordered_map<TSUColumnRowCoordinate, TSUColumnRowCoordinate, TSTCellIDHasher, std::equal_to<TSUColumnRowCoordinate>, std::allocator<std::pair<const TSUColumnRowCoordinate, TSUColumnRowCoordinate>>> *p_mCellIDToMergeRegionTopLeft;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD *next;
  uint64_t v17;
  unsigned __int16 v20;
  $CA3468F20078D5D2DB35E78E73CA60DA v21;
  int v22;
  $CA3468F20078D5D2DB35E78E73CA60DA v23;

  v4 = ~a3.var0.var0;
  v23 = a3;
  -[TSPObject willModify](self, "willModify");
  v21 = a3;
  v5 = HIWORD(*(unint64_t *)&a3);
  if (!v4 || (*(_DWORD *)&v21.var0 & 0xFF0000) == 0xFF0000 || !v5 || (*(_QWORD *)&v21 & 0xFFFF00000000) == 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMergeRegionMap remove:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 217, CFSTR("can't remove an invalid merge range"));
  }
  v20 = v21.var0.var0 + v5 - 1;
  if (v20 >= v21.var0.var0)
  {
    var0 = v21.var0.var0;
    do
    {
      if (v21.var0.var1 <= (LOBYTE(v21.var1.var0) + v21.var0.var1 - 1))
      {
        p_mCellIDToMergeRegionTopLeft = &self->mCellIDToMergeRegionTopLeft;
        v10 = *(unint64_t *)&v21 >> 16;
        do
        {
          v22 = var0 | (v10 << 16);
          if (!std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(p_mCellIDToMergeRegionTopLeft, &v22))
          {
            v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMergeRegionMap remove:]");
            v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm");
            objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 222, CFSTR("can't unmerge an already-unmerged cell: %@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), BYTE2(v22), (unsigned __int16)v22));
          }
          std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::__erase_unique<TSUColumnRowCoordinate>(p_mCellIDToMergeRegionTopLeft, &v22);
          LOBYTE(v10) = v10 + 1;
        }
        while (v10 <= (LOBYTE(v21.var1.var0) + v21.var0.var1 - 1));
      }
      ++var0;
    }
    while (var0 <= v20);
  }
  if (!std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&self->mMergeRegionTopLeftToMergeRegionSize.__table_.__bucket_list_.__ptr_.__value_, (int *)&v23))
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMergeRegionMap remove:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 228, CFSTR("merge region to be deleted doesn't exist!"));
  }
  std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::__erase_unique<TSUColumnRowCoordinate>(&self->mMergeRegionTopLeftToMergeRegionSize.__table_.__bucket_list_.__ptr_.__value_, (int *)&v23);
  self->mUnionedMergeRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  next = self->mMergeRegionTopLeftToMergeRegionSize.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v17 = 0xFFFFFFLL;
    do
    {
      v17 = TSTCellRangeUnionCellRange(v17, next[2]);
      self->mUnionedMergeRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)v17;
      next = (_QWORD *)*next;
    }
    while (next);
  }
  return 1;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)mergedRangeForCellID:(id)a3
{
  uint64_t **v4;
  uint64_t **v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  $CA3468F20078D5D2DB35E78E73CA60DA v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  unsigned int v14;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v15;

  v15 = a3;
  v4 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&self->mCellIDToMergeRegionTopLeft.__table_.__bucket_list_.__ptr_.__value_, (int *)&v15);
  if (v4)
  {
    v14 = *((_DWORD *)v4 + 5);
    v5 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&self->mMergeRegionTopLeftToMergeRegionSize.__table_.__bucket_list_.__ptr_.__value_, (int *)&v14);
    if (!v5)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMergeRegionMap mergedRangeForCellID:]");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 267, CFSTR("merge region map inconsistency found"));
    }
    v8 = *((unsigned int *)v5 + 5);
    v9 = ($CA3468F20078D5D2DB35E78E73CA60DA)(v14 | (unint64_t)(v8 << 32));
    if ((_WORD)v14 == 0xFFFF
      || (v14 & 0xFF0000) == 0xFF0000
      || ((_WORD)v8 ? (v10 = HIWORD(*(unint64_t *)&v9) == 0) : (v10 = 1), v10))
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMergeRegionMap mergedRangeForCellID:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 269, CFSTR("merge region map inconsistency found"));
    }
  }
  else
  {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  }
  return v9;
}

- (BOOL)partiallyIntersectsCellRange:(id)a3
{
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0;
  BOOL v4;
  unsigned __int16 var1;
  unordered_map<TSUColumnRowCoordinate, TSUColumnRowSize, TSTCellIDHasher, std::equal_to<TSUColumnRowCoordinate>, std::allocator<std::pair<const TSUColumnRowCoordinate, TSUColumnRowSize>>> *p_mMergeRegionTopLeftToMergeRegionSize;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 v7;
  TSTMergeRegionMapIterator *v8;
  int v9;
  unsigned __int16 v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unordered_map<TSUColumnRowCoordinate, TSUColumnRowCoordinate, TSTCellIDHasher, std::equal_to<TSUColumnRowCoordinate>, std::allocator<std::pair<const TSUColumnRowCoordinate, TSUColumnRowCoordinate>>> *p_mCellIDToMergeRegionTopLeft;
  uint64_t v24;
  unsigned __int8 v25;
  uint64_t **v26;
  uint64_t **v27;
  uint64_t v28;
  uint64_t v29;
  unordered_map<TSUColumnRowCoordinate, TSUColumnRowCoordinate, TSTCellIDHasher, std::equal_to<TSUColumnRowCoordinate>, std::allocator<std::pair<const TSUColumnRowCoordinate, TSUColumnRowCoordinate>>> *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unsigned int v42;
  uint64_t v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unint64_t v49;
  unsigned __int16 v50;
  unsigned int v51;
  int v52;

  var0 = a3.var0;
  v4 = 0;
  if (a3.var0.var0 == 0xFFFF)
    return v4;
  if ((*(_QWORD *)&a3 & 0xFF0000) == 0xFF0000)
    return v4;
  v4 = 0;
  var1 = a3.var1.var1;
  if (!a3.var1.var1 || (*(_QWORD *)&a3 & 0xFFFF00000000) == 0)
    return v4;
  p_mMergeRegionTopLeftToMergeRegionSize = &self->mMergeRegionTopLeftToMergeRegionSize;
  v7 = a3.var1;
  if (self->mMergeRegionTopLeftToMergeRegionSize.__table_.__p2_.__value_ >= a3.var1.var0
                                                                           * (unint64_t)a3.var1.var1)
  {
    v21 = *(_DWORD *)&a3.var0 + a3.var1.var1 - 1;
    if ((unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1) < a3.var0.var0)
      return 0;
    v49 = *(unint64_t *)&a3 >> 16;
    v22 = *(_DWORD *)&a3.var1 + *(unsigned __int16 *)&a3.var0.var1 + 255;
    v50 = a3.var0.var0;
    while (var0.var1 > v22)
    {
LABEL_61:
      v4 = 0;
      if (++v50 > (unsigned __int16)v21)
        return v4;
    }
    p_mCellIDToMergeRegionTopLeft = &self->mCellIDToMergeRegionTopLeft;
    v24 = v50;
    v25 = v49;
    while (1)
    {
      v52 = v24 & 0xFF00FFFF | (v25 << 16);
      v26 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(p_mCellIDToMergeRegionTopLeft, &v52);
      if (v26)
        break;
LABEL_60:
      if (++v25 > v22)
        goto LABEL_61;
    }
    v51 = *((_DWORD *)v26 + 5);
    v27 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(p_mMergeRegionTopLeftToMergeRegionSize, (int *)&v51);
    if (!v27)
    {
      v28 = v22;
      v29 = v24;
      v30 = p_mCellIDToMergeRegionTopLeft;
      v31 = v21;
      v32 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v33 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMergeRegionMap partiallyIntersectsCellRange:]");
      v34 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm");
      v35 = (void *)v32;
      v21 = v31;
      p_mCellIDToMergeRegionTopLeft = v30;
      v24 = v29;
      v22 = v28;
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v33, v34, 320, CFSTR("merge region map inconsistency found"));
    }
    v36 = 0;
    v37 = *((unsigned int *)v27 + 5);
    v38 = v51 | (unint64_t)(v37 << 32);
    if ((_WORD)v51 == 0xFFFF)
      goto LABEL_58;
    v39 = 0xFFFFLL;
    v40 = 16711680;
    v41 = 0;
    if ((v51 & 0xFF0000) == 0xFF0000)
      goto LABEL_59;
    v36 = 0;
    if (!(unsigned __int16)*((_DWORD *)v27 + 5))
    {
LABEL_58:
      v39 = 0xFFFFLL;
      v40 = 16711680;
      v41 = 0;
    }
    else
    {
      v39 = 0xFFFFLL;
      v40 = 16711680;
      v41 = 0;
      if (HIWORD(v38))
      {
        v39 = 0;
        v42 = BYTE2(v51);
        if (BYTE2(v51) <= v49)
          v42 = v49;
        if ((unsigned __int16)v51 <= var0.var0)
          v43 = var0.var0;
        else
          v43 = (unsigned __int16)v51;
        if ((v37 + BYTE2(v51) - 1) >= v22)
          v44 = v22;
        else
          v44 = (v37 + BYTE2(v51) - 1);
        v45 = (unsigned __int16)(v51 + WORD1(v37) - 1);
        v46 = (unsigned __int16)v21;
        if (v45 < (unsigned __int16)v21)
          v46 = v45;
        v40 = 0;
        v36 = 0;
        v41 = 0;
        if (v43 <= v46 && v42 <= v44)
        {
          v41 = ((unint64_t)(v46 - v43) << 48) + 0x1000000000000;
          v36 = (unint64_t)(unsigned __int16)(v44 - v42 + 1) << 32;
          v40 = v42 << 16;
          v39 = v43;
        }
      }
    }
LABEL_59:
    if ((((v40 | v41 | v39 | v36) ^ v38) & 0xFFFFFFFF00FFFFFFLL) != 0)
      return 1;
    goto LABEL_60;
  }
  v8 = -[TSTMergeRegionMapIterator initWithMergeRegionMap:]([TSTMergeRegionMapIterator alloc], "initWithMergeRegionMap:", self);
  if (!-[TSTMergeRegionMapIterator hasNextMergeRegion](v8, "hasNextMergeRegion"))
  {
LABEL_31:
    v4 = 0;
    goto LABEL_32;
  }
  v9 = *(_DWORD *)&v7 + HIWORD(*(unsigned int *)&var0) + 255;
  v10 = var0.var0 + var1 - 1;
  while (1)
  {
    v11 = -[TSTMergeRegionMapIterator nextMergeRegion](v8, "nextMergeRegion");
    v12 = 0;
    if ((_WORD)v11 == 0xFFFF)
    {
LABEL_26:
      v13 = 0xFFFFLL;
      v14 = 16711680;
      v15 = 0;
      goto LABEL_27;
    }
    v13 = 0xFFFFLL;
    v14 = 16711680;
    v15 = 0;
    if ((v11 & 0xFF0000) != 0xFF0000)
    {
      v12 = 0;
      if (!HIWORD(v11))
        goto LABEL_26;
      v13 = 0xFFFFLL;
      v14 = 16711680;
      v15 = 0;
      if ((v11 & 0xFFFF00000000) != 0)
      {
        v13 = 0;
        v16 = var0.var1;
        if (BYTE2(v11) > var0.var1)
          v16 = BYTE2(v11);
        if ((unsigned __int16)v11 <= var0.var0)
          v17 = var0.var0;
        else
          v17 = (unsigned __int16)v11;
        if ((BYTE4(v11) + BYTE2(v11) - 1) >= v9)
          v18 = v9;
        else
          v18 = (BYTE4(v11) + BYTE2(v11) - 1);
        if ((unsigned __int16)(v11 + HIWORD(v11) - 1) >= v10)
          v19 = v10;
        else
          v19 = (unsigned __int16)(v11 + HIWORD(v11) - 1);
        v14 = 0;
        v12 = 0;
        v15 = 0;
        if (v17 <= v19 && v16 <= v18)
        {
          v15 = ((unint64_t)(v19 - v17) << 48) + 0x1000000000000;
          v12 = (unint64_t)(unsigned __int16)(v18 - v16 + 1) << 32;
          v14 = v16 << 16;
          v13 = v17;
        }
      }
    }
LABEL_27:
    if (HIWORD(v15))
    {
      v20 = v14 | v15 | v13 | v12;
      if ((v20 & 0xFFFF00000000) != 0 && ((v20 ^ v11) & 0xFFFFFFFF00FFFFFFLL) != 0)
        break;
    }
    if (!-[TSTMergeRegionMapIterator hasNextMergeRegion](v8, "hasNextMergeRegion"))
      goto LABEL_31;
  }
  v4 = 1;
LABEL_32:

  return v4;
}

- (BOOL)partiallyIntersectsCellRegion:(id)a3
{
  unordered_map<TSUColumnRowCoordinate, TSUColumnRowSize, TSTCellIDHasher, std::equal_to<TSUColumnRowCoordinate>, std::allocator<std::pair<const TSUColumnRowCoordinate, TSUColumnRowSize>>> *p_mMergeRegionTopLeftToMergeRegionSize;
  unint64_t value;
  TSTMergeRegionMapIterator *v7;
  int v9;
  unordered_map<TSUColumnRowCoordinate, TSUColumnRowCoordinate, TSTCellIDHasher, std::equal_to<TSUColumnRowCoordinate>, std::allocator<std::pair<const TSUColumnRowCoordinate, TSUColumnRowCoordinate>>> *p_mCellIDToMergeRegionTopLeft;
  uint64_t **v11;
  uint64_t **v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  int v16;

  if (!a3)
    return 0;
  if ((objc_msgSend(a3, "isEmpty") & 1) != 0)
    return 0;
  p_mMergeRegionTopLeftToMergeRegionSize = &self->mMergeRegionTopLeftToMergeRegionSize;
  value = self->mMergeRegionTopLeftToMergeRegionSize.__table_.__p2_.__value_;
  if (value < objc_msgSend(a3, "cellCount"))
  {
    v7 = -[TSTMergeRegionMapIterator initWithMergeRegionMap:]([TSTMergeRegionMapIterator alloc], "initWithMergeRegionMap:", self);
    while (-[TSTMergeRegionMapIterator hasNextMergeRegion](v7, "hasNextMergeRegion"))
    {
      if ((objc_msgSend(a3, "partiallyIntersectsCellRange:", -[TSTMergeRegionMapIterator nextMergeRegion](v7, "nextMergeRegion")) & 1) != 0)
      {

        return 1;
      }
    }

    return 0;
  }
  v9 = objc_msgSend((id)objc_msgSend(a3, "iterator"), "getNext");
  v16 = v9;
  if ((_WORD)v9 == 0xFFFF || (*(_QWORD *)&v9 & 0xFF0000) == 0xFF0000)
    return 0;
  p_mCellIDToMergeRegionTopLeft = &self->mCellIDToMergeRegionTopLeft;
  while (1)
  {
    v11 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(p_mCellIDToMergeRegionTopLeft, &v16);
    if (v11)
    {
      v15 = *((_DWORD *)v11 + 5);
      v12 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(p_mMergeRegionTopLeftToMergeRegionSize, (int *)&v15);
      if (!v12)
      {
        v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMergeRegionMap partiallyIntersectsCellRegion:]");
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 381, CFSTR("merge region map inconsistency found"));
      }
      if (!objc_msgSend(a3, "containsCellRange:", v15 | ((unint64_t)*((unsigned int *)v12 + 5) << 32)))break;
    }
    if ((_WORD)v16 == 0xFFFF || (v16 & 0xFF0000) == 0xFF0000)
      return 0;
  }
  return 1;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)unionedMergeRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mUnionedMergeRange;
}

- (BOOL)find:(id)a3
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mUnionedMergeRange;
  BOOL v4;
  TSTMergeRegionMap *v5;
  unsigned __int16 v6;
  unsigned int v7;
  uint64_t **v8;
  void *v9;
  uint64_t v10;
  int modifyObjectToken_high;
  $CA3468F20078D5D2DB35E78E73CA60DA v14;

  v14 = a3;
  mUnionedMergeRange = self->mUnionedMergeRange;
  if (HIWORD(*(unint64_t *)&mUnionedMergeRange))
    v4 = (*(_QWORD *)&mUnionedMergeRange & 0xFFFF00000000) == 0;
  else
    v4 = 1;
  if (v4)
    goto LABEL_13;
  v5 = self;
  LOBYTE(self) = 0;
  if (a3.var1.var1 && (*(_QWORD *)&a3 & 0xFFFF00000000) != 0)
  {
    if (mUnionedMergeRange.origin.row > a3.var0.var0
      || (v6 = mUnionedMergeRange.origin.row + mUnionedMergeRange.size.numberOfRows - 1, v6 < a3.var0.var0)
      || a3.var0.var1 < mUnionedMergeRange.origin.column
      || (v7 = (LOBYTE(mUnionedMergeRange.size.numberOfColumns) + mUnionedMergeRange.origin.column - 1),
          v7 < a3.var0.var1)
      || v7 < (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1)
      || v6 < (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1))
    {
LABEL_13:
      LOBYTE(self) = 0;
      return (char)self;
    }
    self = (TSTMergeRegionMap *)std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&v5->mCellIDToMergeRegionTopLeft.__table_.__bucket_list_.__ptr_.__value_, (int *)&v14);
    if (self)
    {
      modifyObjectToken_high = HIDWORD(self->super._modifyObjectToken);
      v8 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&v5->mMergeRegionTopLeftToMergeRegionSize.__table_.__bucket_list_.__ptr_.__value_, &modifyObjectToken_high);
      if (!v8)
      {
        v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMergeRegionMap find:]");
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 413, CFSTR("merge region map inconsistency found"));
      }
      LOBYTE(self) = *((unsigned __int16 *)v8 + 11) == v14.var1.var1 && *((unsigned __int16 *)v8 + 10) == v14.var1.var0;
    }
  }
  return (char)self;
}

- (id)mergedGridIndicesForDimension:(int)a3
{
  id v4;
  TSTMergeRegionMapIterator *v5;
  uint64_t v6;
  unint64_t v7;

  if (a3)
  {
    if (a3 != 1)
    {
      v4 = 0;
      return v4;
    }
    v4 = objc_alloc_init(MEMORY[0x24BDD1698]);
    v5 = -[TSTMergeRegionMapIterator initWithMergeRegionMap:]([TSTMergeRegionMapIterator alloc], "initWithMergeRegionMap:", self);
    if (-[TSTMergeRegionMapIterator hasNextMergeRegion](v5, "hasNextMergeRegion"))
    {
      do
      {
        v6 = -[TSTMergeRegionMapIterator nextMergeRegion](v5, "nextMergeRegion");
        objc_msgSend(v4, "addIndexesInRange:", BYTE2(v6) + 1, WORD2(v6) - 1);
      }
      while (-[TSTMergeRegionMapIterator hasNextMergeRegion](v5, "hasNextMergeRegion"));
    }
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1698]);
    v5 = -[TSTMergeRegionMapIterator initWithMergeRegionMap:]([TSTMergeRegionMapIterator alloc], "initWithMergeRegionMap:", self);
    if (-[TSTMergeRegionMapIterator hasNextMergeRegion](v5, "hasNextMergeRegion"))
    {
      do
      {
        v7 = -[TSTMergeRegionMapIterator nextMergeRegion](v5, "nextMergeRegion");
        objc_msgSend(v4, "addIndexesInRange:", (unsigned __int16)v7 + 1, HIWORD(v7) - 1);
      }
      while (-[TSTMergeRegionMapIterator hasNextMergeRegion](v5, "hasNextMergeRegion"));
    }
  }

  return v4;
}

- (BOOL)hasRangeSpanningRows
{
  id v2;
  int v3;

  v2 = -[TSTMergeRegionMap iterator](self, "iterator");
  do
    v3 = objc_msgSend(v2, "hasNextMergeRegion");
  while (v3 && !((unint64_t)objc_msgSend(v2, "nextMergeRegion") >> 49));
  return v3;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>>>::~__hash_table((uint64_t)&self->mMergeRegionTopLeftToMergeRegionSize);
  std::__hash_table<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>>>::~__hash_table((uint64_t)&self->mCellIDToMergeRegionTopLeft);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  return self;
}

@end
