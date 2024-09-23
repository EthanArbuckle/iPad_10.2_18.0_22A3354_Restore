@implementation STPropVariant

- (void)setShortValue:(signed __int16)a3
{
  self->mProp.vt = 2;
  self->mProp.v.iVal = a3;
}

- (void)setLongValue:(int)a3
{
  self->mProp.vt = 3;
  self->mProp.v.lVal = a3;
}

- (void)setStringValue:(id)a3
{
  _QWORD v4[3];

  v4[2] = 0;
  v4[0] = 30;
  v4[1] = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  propVariantCopyContents((unsigned __int16 *)v4, (uint64_t)&self->mProp);
}

- (void)setBlobValue:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v7[3];

  v7[0] = 65;
  v4 = a3;
  v7[1] = objc_msgSend(v4, "length");
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "bytes");

  v7[2] = v6;
  propVariantCopyContents((unsigned __int16 *)v7, (uint64_t)&self->mProp);
}

- (_SsrwPropVariant)propVariant
{
  return &self->mProp;
}

- (id)asDataOfType:(int *)a3
{
  void *v4;
  unsigned int vt;
  unsigned __int16 *bstrVal;
  size_t cbSize;
  void *v8;
  $7BD1F95CDF8DF2E91110A12B66875B48 *pData;
  uint64_t v10;
  _DWORD *v11;
  _DWORD *v12;
  void *v13;
  uint64_t v14;
  _DWORD *v15;
  _QWORD *v16;

  v4 = 0;
  vt = self->mProp.vt;
  if (vt > 0x3F)
  {
    switch(vt)
    {
      case '@':
        *a3 = 3;
        v16 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
        if (v16)
        {
          v12 = v16;
          if (!time_tFromWinFileTime(&self->mProp.v.blob.cbSize, v16))
          {
            v13 = (void *)MEMORY[0x24BDBCE50];
            v15 = v12;
            v14 = 8;
            goto LABEL_22;
          }
          free(v12);
        }
        break;
      case 'A':
        *a3 = 5;
        v8 = (void *)MEMORY[0x24BDBCE50];
        pData = ($7BD1F95CDF8DF2E91110A12B66875B48 *)self->mProp.v.blob.pData;
        cbSize = self->mProp.v.blob.cbSize;
        goto LABEL_19;
      case 'G':
        *a3 = 4;
        v10 = *(unsigned int *)self->mProp.v.bstrVal;
        if (v10 <= 0xFFFFFFFB)
        {
          v11 = malloc_type_malloc(v10 + 4, 0x6F2CDB48uLL);
          if (v11)
          {
            v12 = v11;
            CsLeWriteUInt32(*(unsigned int *)self->mProp.v.bstrVal, v11);
            CsLeWriteUInt32(*((unsigned int *)self->mProp.v.bstrVal + 1), v12 + 1);
            memcpy(v12 + 2, *((const void **)self->mProp.v.bstrVal + 1), *(unsigned int *)self->mProp.v.bstrVal - 4);
            v13 = (void *)MEMORY[0x24BDBCE50];
            v14 = (*(_DWORD *)self->mProp.v.bstrVal + 4);
            v15 = v12;
LABEL_22:
            objc_msgSend(v13, "dataWithBytes:length:", v15, v14);
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            free(v12);
            return v4;
          }
        }
        break;
      default:
        return v4;
    }
    v4 = 0;
    return v4;
  }
  switch(vt)
  {
    case 2u:
      *a3 = 0;
      v8 = (void *)MEMORY[0x24BDBCE50];
      pData = &self->mProp.v;
      cbSize = 2;
      goto LABEL_19;
    case 3u:
      *a3 = 1;
      v8 = (void *)MEMORY[0x24BDBCE50];
      pData = &self->mProp.v;
      cbSize = 4;
      goto LABEL_19;
    case 0x1Eu:
      *a3 = 2;
      bstrVal = self->mProp.v.bstrVal;
      cbSize = strlen((const char *)bstrVal) + 1;
      v8 = (void *)MEMORY[0x24BDBCE50];
      pData = ($7BD1F95CDF8DF2E91110A12B66875B48 *)bstrVal;
LABEL_19:
      objc_msgSend(v8, "dataWithBytes:length:", pData, cbSize);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  propVariantCleanup((uint64_t)&self->mProp);
  v3.receiver = self;
  v3.super_class = (Class)STPropVariant;
  -[STPropVariant dealloc](&v3, sel_dealloc);
}

@end
