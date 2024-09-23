@implementation TSTLayoutTask

- (TSTLayoutTask)initWithMasterLayout:(id)a3
{
  TSTLayoutTask *v4;
  TSTLayoutTask *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTLayoutTask;
  v4 = -[TSTLayoutTask init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mMasterLayout = (TSTMasterLayout *)a3;
    v4->mCellStatesToLayout = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->mCellStatesToLayout = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTLayoutTask;
  -[TSTLayoutTask dealloc](&v3, sel_dealloc);
}

- (void)flushToGlobalCaches
{
  id v3;
  NSMutableArray *mCellStatesToLayout;
  id v5;
  _QWORD v6[7];

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  mCellStatesToLayout = self->mCellStatesToLayout;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__TSTLayoutTask_flushToGlobalCaches__block_invoke;
  v6[3] = &unk_24D82F980;
  v6[4] = self;
  v6[5] = v3;
  v6[6] = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](mCellStatesToLayout, "enumerateObjectsUsingBlock:", v6);
  -[TSUConcurrentCache addEntriesFromDictionary:](-[TSTMasterLayout dupContentCache](self->mMasterLayout, "dupContentCache"), "addEntriesFromDictionary:", v3);

  -[TSUConcurrentCache addEntriesFromDictionary:](-[TSTMasterLayout cellIDToWPColumnCache](self->mMasterLayout, "cellIDToWPColumnCache"), "addEntriesFromDictionary:", v5);
}

uint64_t __36__TSTLayoutTask_flushToGlobalCaches__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  double v8;
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
  BOOL v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD v24[6];
  _QWORD v25[12];
  BOOL v26;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  v3 = objc_msgSend(v2, "modelCellID");
  v4 = objc_msgSend(v2, "mergedRange");
  result = objc_msgSend(v2, "wpColumn");
  if (result)
  {
    v6 = result;
    if (objc_msgSend(v2, "keyVal")
      && (objc_msgSend(v2, "layoutCacheFlags") & 2) != 0
      && ((objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tableInfo"), "editingCellID") ^ v3) & 0xFFFFFF) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, objc_msgSend(v2, "keyVal"));
    }
    if (objc_msgSend(v2, "hasContent")
      && (objc_msgSend(v2, "layoutCacheFlags") & 1) != 0
      && !objc_msgSend(v2, "verticalAlignment"))
    {
      HIDWORD(v7) = v3;
      LODWORD(v7) = v3;
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v6, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (v7 >> 16) & 0xFFFF00FF));
    }
    result = objc_msgSend(v2, "inDynamicLayout");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(v2, "cellPropsRowHeight");
      if ((_DWORD)result)
      {
        if ((_WORD)v4 == 0xFFFF || (v4 & 0xFF0000) == 0xFF0000 || !HIWORD(v4) || (v4 & 0xFFFF00000000) == 0)
        {
          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = __36__TSTLayoutTask_flushToGlobalCaches__block_invoke_3;
          v24[3] = &unk_24D82A5C8;
          v22 = *(_QWORD *)(a1 + 32);
          v24[4] = v2;
          v24[5] = v22;
          v23 = v24;
        }
        else
        {
          v8 = TSTMasterLayoutSizeOfTextInColumn((void *)objc_msgSend(v2, "wpColumn"));
          v10 = v9;
          objc_msgSend(v2, "paddingInsets");
          v12 = v11;
          v14 = v13;
          v16 = v15;
          v18 = v17;
          v19 = objc_msgSend(v2, "cell");
          v21 = v19
             && *(unsigned __int8 *)(v19 + 9) << 8 == 1536
             && (v20 = objc_msgSend(v2, "cell")) != 0
             && *(_DWORD *)(v20 + 104) == 263;
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __36__TSTLayoutTask_flushToGlobalCaches__block_invoke_2;
          v25[3] = &unk_24D82F958;
          v22 = *(_QWORD *)(a1 + 32);
          v25[4] = v22;
          v25[11] = v4;
          *(double *)&v25[5] = v8;
          v25[6] = v10;
          v25[7] = v12;
          v25[8] = v14;
          v25[9] = v16;
          v25[10] = v18;
          v23 = v25;
          v26 = v21;
        }
        return objc_msgSend((id)objc_msgSend(*(id *)(v22 + 8), "whCacheQueue"), "performAsyncWrite:", v23);
      }
    }
  }
  return result;
}

uint64_t __36__TSTLayoutTask_flushToGlobalCaches__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mergeRanges"), "addRange:andSize:andPaddingInsets:andIsCheckbox:", *(_QWORD *)(a1 + 88), *(unsigned __int8 *)(a1 + 96), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __36__TSTLayoutTask_flushToGlobalCaches__block_invoke_3(uint64_t a1)
{
  unsigned int v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "modelCellID");
  v3 = TSTMasterLayoutSizeOfTextInColumn((void *)objc_msgSend(*(id *)(a1 + 32), "wpColumn"));
  v5 = v4;
  v6 = objc_msgSend(*(id *)(a1 + 32), "cell", v3);
  if (v6 && *(unsigned __int8 *)(v6 + 9) << 8 == 1536)
    objc_msgSend(*(id *)(a1 + 32), "cell");
  if (v5 <= 0.0)
    return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "widthHeightCache"), "resetFitHeightForCellID:", v2);
  objc_msgSend(*(id *)(a1 + 32), "paddingInsets");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "paddingInsets");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "widthHeightCache"), "setFitHeight:forCellID:", v2, v5 + v8 + v9);
}

- (NSMutableArray)cellStatesToLayout
{
  return self->mCellStatesToLayout;
}

- (void)setCellStatesToLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
