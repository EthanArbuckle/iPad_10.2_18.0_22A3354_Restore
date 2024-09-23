@implementation PptTextBlock

- (PptTextBlock)init
{
  PptTextBlock *v2;
  PptTextBlock *v3;
  NSMutableString *v4;
  NSMutableString *mText;
  NSMutableArray *v6;
  NSMutableArray *mMetaCharacterFields;
  NSMutableArray *v8;
  NSMutableArray *mBookmarks;
  NSMutableArray *v10;
  NSMutableArray *mHyperlinks;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PptTextBlock;
  v2 = -[PptTextBlock init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->mTextHeader = 0;
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    mText = v3->mText;
    v3->mText = v4;

    v3->mStyleText = 0;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mMetaCharacterFields = v3->mMetaCharacterFields;
    v3->mMetaCharacterFields = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mBookmarks = v3->mBookmarks;
    v3->mBookmarks = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mHyperlinks = v3->mHyperlinks;
    v3->mHyperlinks = v10;

    v3->mTextRuler = 0;
  }
  return v3;
}

- (void)readTextBlock:(id)a3
{
  void *v4;
  void *v5;
  const void *v6;
  PptTextHeaderAtom *v7;
  void *v8;
  void *v9;
  const void *v10;
  void *v11;
  _DWORD *exception;
  _DWORD *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "firstChildOfType:", 3999);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
LABEL_9:
    exception = __cxa_allocate_exception(4uLL);
    *exception = 1000;
  }
  v6 = (const void *)objc_msgSend(v4, "eshObject");
  if (!v6)
  {
    self->mTextHeader = 0;
    goto LABEL_9;
  }
  self->mTextHeader = v7;
  if (!v7)
    goto LABEL_9;
  -[PptTextBlock readString:](self, "readString:", v14);
  -[PptTextBlock readStyles:](self, "readStyles:", v14);
  -[PptTextBlock readSpecialInfo:](self, "readSpecialInfo:", v14);
  -[PptTextBlock readMetaCharacterFieldsBookmarksAndHyperlinks:](self, "readMetaCharacterFieldsBookmarksAndHyperlinks:", v14);
  objc_msgSend(v14, "firstChildOfType:", 4006);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (const void *)objc_msgSend(v8, "eshObject");
    if (v10)
    {
      self->mTextRuler = v11;
      if (v11)
        goto LABEL_7;
    }
    else
    {
      self->mTextRuler = 0;
    }
    v13 = __cxa_allocate_exception(4uLL);
    *v13 = 1000;
  }
LABEL_7:

}

- (void)readString:(id)a3
{
  void *v4;
  void *v5;
  const void *v6;
  char *v7;
  void *v8;
  void *v9;
  const void *v10;
  EshRecord *v11;
  EshRecord *v12;
  unsigned int DataLength;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _DWORD *exception;
  _DWORD *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "firstChildOfType:", 4000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (const void *)objc_msgSend(v4, "eshObject");
    if (!v6
    {
      exception = __cxa_allocate_exception(4uLL);
      *exception = 1000;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", v7 + 48);
    -[NSMutableString setString:](self->mText, "setString:", v8);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v21, "firstChildOfType:", 4008);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v9)
  {
    v10 = (const void *)objc_msgSend(v9, "eshObject");
    if (!v10
    {
      v20 = __cxa_allocate_exception(4uLL);
      *v20 = 1000;
    }
    v12 = v11;
    DataLength = EshRecord::getDataLength(v11);
    if (DataLength)
    {
      v14 = *((_QWORD *)v12 + 6);
      v15 = DataLength;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v14, DataLength, 12);
      if (v8)
        goto LABEL_15;
      v16 = operator new[]();
      v17 = v16;
      for (i = 0; i != v15; ++i)
        *(_WORD *)(v16 + 2 * i) = *(unsigned __int8 *)(v14 + i);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", v16, v15);
      MEMORY[0x22E2DD3F0](v17, 0x1000C80BDFB0063);
      if (v8)
LABEL_15:
        -[NSMutableString setString:](self->mText, "setString:", v8);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)readStyles:(id)a3
{
  void *v4;
  const void *v5;
  void *v6;
  _DWORD *exception;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "firstChildOfType:", 4002);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || (objc_msgSend(v8, "firstChildOfType:", 4001), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (const void *)objc_msgSend(v4, "eshObject");
    if (v5)
    {
      self->mStyleText = v6;
      if (v6)
        goto LABEL_5;
    }
    else
    {
      self->mStyleText = 0;
    }
    exception = __cxa_allocate_exception(4uLL);
    *exception = 1000;
  }
LABEL_5:

}

- (void)readMetaCharacterFieldsBookmarksAndHyperlinks:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  int v8;
  PptMetaCharacterBlock *v9;
  void *v10;
  uint64_t v11;
  PptHyperlinkBlock *v12;
  unsigned int *v13;
  PptMetaCharacterBlock *v14;
  unsigned int *v15;
  unsigned int *v16;
  unsigned int *v17;
  unsigned int *v18;
  _DWORD *exception;
  id v20;

  v20 = a3;
  v4 = objc_msgSend(v20, "childCount");
  if (v4)
  {
    v5 = 0;
    while (2)
    {
      objc_msgSend(v20, "childAt:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (const void *)objc_msgSend(v6, "eshObject");
      v8 = (*(uint64_t (**)(const void *))(*(_QWORD *)v7 + 16))(v7);
      v9 = 0;
      switch(v8)
      {
        case 4082:
          objc_msgSend(v20, "childAt:", v5 + 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "eshObject");
          if (!v11 || (*(unsigned int (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11) != 4063)
          {
            exception = __cxa_allocate_exception(4uLL);
            *exception = 1000;
          }
          v12 = objc_alloc_init(PptHyperlinkBlock);
          -[PptHyperlinkBlock setInteractiveInfoContainerHolder:](v12, "setInteractiveInfoContainerHolder:", v6);
          -[PptHyperlinkBlock setTxInteractiveInfoAtomHolder:](v12, "setTxInteractiveInfoAtomHolder:", v10);
          -[NSMutableArray addObject:](self->mHyperlinks, "addObject:", v12);

          goto LABEL_21;
        case 4083:
        case 4084:
        case 4085:
        case 4086:
          goto LABEL_23;
        case 4087:
          if (!v15)
            goto LABEL_21;
          v14 = -[PptMetaCharacterBlock initWithType:position:extraData:]([PptMetaCharacterBlock alloc], "initWithType:position:extraData:", 4087, v15[12], v15[13]);
          goto LABEL_19;
        case 4088:
          if (!v16)
            goto LABEL_21;
          v14 = -[PptMetaCharacterBlock initWithType:position:]([PptMetaCharacterBlock alloc], "initWithType:position:", 4088, v16[12]);
          goto LABEL_19;
        case 4089:
          if (!v17)
            goto LABEL_21;
          v14 = -[PptMetaCharacterBlock initWithType:position:]([PptMetaCharacterBlock alloc], "initWithType:position:", 4089, v17[12]);
          goto LABEL_19;
        case 4090:
          if (!v18)
            goto LABEL_21;
          v14 = -[PptMetaCharacterBlock initWithType:position:]([PptMetaCharacterBlock alloc], "initWithType:position:", 4090, v18[12]);
          goto LABEL_19;
        default:
          if (v8 == 4007)
          {
            v9 = 0;
            -[NSMutableArray addObject:](self->mBookmarks, "addObject:", v6);
          }
          else if (v8 == 4056)
          {
            if (v13)
            {
              v14 = -[PptMetaCharacterBlock initWithType:position:]([PptMetaCharacterBlock alloc], "initWithType:position:", 4056, v13[12]);
LABEL_19:
              v9 = v14;
              if (v14)
                -[NSMutableArray addObject:](self->mMetaCharacterFields, "addObject:", v14);
            }
            else
            {
LABEL_21:
              v9 = 0;
            }
          }
LABEL_23:

          if (v4 == ++v5)
            break;
          continue;
      }
      break;
    }
  }

}

- (void)textRuler
{
  return self->mTextRuler;
}

- (int)textType
{
  return self->mTextHeader->var6;
}

- (id)text
{
  return self->mText;
}

- (int)paragraphRunCount
{
  _QWORD *mStyleText;
  uint64_t v3;

  mStyleText = self->mStyleText;
  if (mStyleText)
    return (mStyleText[7] - mStyleText[6]) >> 3;
  else
    LODWORD(v3) = 0;
  return v3;
}

- (void)paragraphRunAtIndex:(int)a3
{
  void *result;
  uint64_t v4;
  unint64_t v5;

  result = self->mStyleText;
  if (result)
  {
    v4 = *((_QWORD *)result + 6);
    v5 = (unint64_t)(*((_QWORD *)result + 7) - v4) >> 3;
    if ((int)v5 >= a3)
    {
      if (v5 <= a3)
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      return *(void **)(v4 + 8 * a3);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int)characterRunCount
{
  _QWORD *mStyleText;
  uint64_t v3;

  mStyleText = self->mStyleText;
  if (mStyleText)
    return (mStyleText[10] - mStyleText[9]) >> 3;
  else
    LODWORD(v3) = 0;
  return v3;
}

- (id)hyperlinks
{
  return self->mHyperlinks;
}

- (id)metaCharacterFields
{
  return self->mMetaCharacterFields;
}

- (PptCharRun)characterRunAtIndex:(int)a3
{
  PptCharRun *result;
  uint64_t v4;
  unint64_t v5;

  result = (PptCharRun *)self->mStyleText;
  if (result)
  {
    v4 = *(_QWORD *)&result[2].var0;
    v5 = (unint64_t)(*(_QWORD *)((char *)&result[2].var1 + 4) - v4) >> 3;
    if ((int)v5 >= a3)
    {
      if (v5 <= a3)
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      return *(PptCharRun **)(v4 + 8 * a3);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (unsigned)textIndex
{
  return EshRecord::getInstance((EshRecord *)self->mTextHeader);
}

- (id)bookmarks
{
  return self->mBookmarks;
}

- (int)specialInfoRunCount
{
  _QWORD *mSpecialInfo;
  uint64_t v3;

  mSpecialInfo = self->mSpecialInfo;
  if (mSpecialInfo)
    return (mSpecialInfo[7] - mSpecialInfo[6]) >> 3;
  else
    LODWORD(v3) = 0;
  return v3;
}

- (void)specialInfoRunAtIndex:(int)a3
{
  _QWORD *mSpecialInfo;
  uint64_t v4;
  char *v5;

  mSpecialInfo = self->mSpecialInfo;
  if (mSpecialInfo
    && (v5 = (char *)(mSpecialInfo + 6),
        v4 = mSpecialInfo[6],
        (int)((unint64_t)(*((_QWORD *)v5 + 1) - v4) >> 3) >= a3))
  {
    return *(void **)(v4 + 8 * a3);
  }
  else
  {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHyperlinks, 0);
  objc_storeStrong((id *)&self->mBookmarks, 0);
  objc_storeStrong((id *)&self->mMetaCharacterFields, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

- (void)readSpecialInfo:(id)a3
{
  void *v4;
  void *v5;
  const void *v6;
  void *v7;
  _DWORD *exception;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "firstChildOfType:", 4010);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (const void *)objc_msgSend(v4, "eshObject");
    if (v6)
    {
      self->mSpecialInfo = v7;
      if (v7)
        goto LABEL_4;
    }
    else
    {
      self->mSpecialInfo = 0;
    }
    exception = __cxa_allocate_exception(4uLL);
    *exception = 1000;
  }
LABEL_4:

}

@end
