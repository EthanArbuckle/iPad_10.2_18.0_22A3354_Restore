@implementation SFProximityEstimatorMaxOfMean

- (int)_estimateRSSIForSFBLEDevice:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  uint64_t rssiIndex;
  void *v8;
  char Int64Ranged;
  unsigned int v10;
  uint64_t v11;
  unsigned int rssiMinCount;
  char *channelNumberArray;
  char *rssiArray;
  char v15;
  char v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  char v20;
  int v21;
  int v22;
  int v23;
  uint64_t v25;
  int v26;
  unint64_t rssiCount;
  unint64_t i;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  _QWORD v51[4];

  v51[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "rssi");
  if ((v5 & 0x8000000000000000) == 0)
    goto LABEL_17;
  v6 = v5;
  rssiIndex = self->_rssiIndex;
  objc_msgSend(v4, "advertisementFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  Int64Ranged = CFDictionaryGetInt64Ranged();

  self->_channelNumberArray[rssiIndex] = Int64Ranged;
  self->_rssiArray[rssiIndex] = v6;
  if ((rssiIndex + 1) < self->_rssiMinCount)
    v10 = rssiIndex + 1;
  else
    v10 = 0;
  self->_rssiIndex = v10;
  LODWORD(v11) = self->_rssiCount;
  rssiMinCount = self->_rssiMinCount;
  if (v11 < rssiMinCount)
  {
    LODWORD(v11) = v11 + 1;
    self->_rssiCount = v11;
    rssiMinCount = self->_rssiMinCount;
  }
  if (v11 < rssiMinCount)
    goto LABEL_17;
  v51[0] = 0;
  v51[1] = 0;
  v50[0] = 0;
  v50[1] = 0;
  v33 = -1;
  if ((_DWORD)v11)
  {
    channelNumberArray = self->_channelNumberArray;
    rssiArray = self->_rssiArray;
    v11 = v11;
    do
    {
      v16 = *channelNumberArray++;
      v15 = v16;
      v17 = v16 & 3;
      v18 = *rssiArray++;
      *((_DWORD *)v51 + v17) += v18;
      ++*((_DWORD *)v50 + v17);
      *(_BYTE *)((unint64_t)&v33 | v15 & 3) = v15;
      --v11;
    }
    while (v11);
  }
  v19 = 0;
  v20 = 0x80;
  do
  {
    v21 = *(_DWORD *)((char *)v50 + v19);
    if (v21)
    {
      v22 = *(_DWORD *)((char *)v51 + v19) / v21;
      *(_DWORD *)((char *)v51 + v19) = (char)v22;
      if ((char)v22 > v20)
        v20 = v22;
    }
    v19 += 4;
  }
  while (v19 != 16);
  if (v20 != 128)
  {
    v23 = v20;
    if (gLogCategory_SFProximityEstimator <= 9
      && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
    {
      v32 = v4;
      v25 = 0;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      do
      {
        v26 = *((unsigned __int8 *)&v33 + v25);
        if (v26 != 255)
        {
          v30 = *((unsigned __int8 *)&v33 + v25);
          v31 = *((unsigned int *)v51 + v25);
          SNPrintF_Add();
          rssiCount = self->_rssiCount;
          if ((_DWORD)rssiCount)
          {
            for (i = 0; i < rssiCount; ++i)
            {
              if (self->_channelNumberArray[i] == v26)
              {
                v30 = self->_rssiArray[i];
                SNPrintF_Add();
                rssiCount = self->_rssiCount;
              }
            }
          }
          SNPrintF_Add();
        }
        ++v25;
      }
      while (v25 != 4);
      v4 = v32;
      if (gLogCategory_SFProximityEstimator < 51
        && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v32, "identifier", v30, v31);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
    }
  }
  else
  {
LABEL_17:
    v23 = 0;
  }

  return v23;
}

- (void)dealloc
{
  char *channelNumberArray;
  char *rssiArray;
  objc_super v5;

  channelNumberArray = self->_channelNumberArray;
  if (channelNumberArray)
  {
    free(channelNumberArray);
    self->_channelNumberArray = 0;
  }
  rssiArray = self->_rssiArray;
  if (rssiArray)
  {
    free(rssiArray);
    self->_rssiArray = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SFProximityEstimatorMaxOfMean;
  -[SFProximityEstimatorMaxOfMean dealloc](&v5, sel_dealloc);
}

- (SFProximityEstimatorMaxOfMean)initWithProximityInfo:(id)a3
{
  id v4;
  SFProximityEstimatorMaxOfMean *v5;
  unsigned int Int64Ranged;
  int v7;
  char *v8;
  char *v9;
  SFProximityEstimatorMaxOfMean *v10;
  SFProximityEstimator *v12;
  SEL v13;
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFProximityEstimatorMaxOfMean;
  v5 = -[SFProximityEstimator initWithProximityInfo:](&v15, sel_initWithProximityInfo_, v4);
  if (!v5)
    goto LABEL_10;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v5->_rssiMinCount = Int64Ranged;
  if (Int64Ranged)
  {
    if (Int64Ranged < 0x41)
      goto LABEL_7;
    Int64Ranged = 64;
    v7 = 64;
  }
  else
  {
    v7 = 16;
    Int64Ranged = 16;
  }
  v5->_rssiMinCount = v7;
LABEL_7:
  v8 = (char *)malloc_type_calloc(Int64Ranged, 1uLL, 0x100004077774924uLL);
  v5->_channelNumberArray = v8;
  if (v8)
  {
    v9 = (char *)malloc_type_calloc(v5->_rssiMinCount, 1uLL, 0x100004077774924uLL);
    v5->_rssiArray = v9;
    if (v9)
    {
      v10 = v5;
LABEL_10:

      return v5;
    }
  }
  else
  {
    FatalErrorF();
  }
  v12 = (SFProximityEstimator *)FatalErrorF();
  return (SFProximityEstimatorMaxOfMean *)-[SFProximityEstimator initWithProximityInfo:](v12, v13, v14);
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;

  NSAppendPrintF();
  v3 = 0;
  -[SFProximityEstimator descriptionParams](self, "descriptionParams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    NSAppendPrintF();
    v5 = v3;

    v3 = v5;
  }

  if (self->_rssiMinCount)
  {
    NSAppendPrintF();
    v6 = v3;

    v3 = v6;
  }
  return v3;
}

@end
