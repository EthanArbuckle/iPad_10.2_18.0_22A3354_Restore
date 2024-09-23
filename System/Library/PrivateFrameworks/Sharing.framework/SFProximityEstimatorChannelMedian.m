@implementation SFProximityEstimatorChannelMedian

- (id)description
{
  id v3;
  void *v4;
  id v5;

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

  return v3;
}

- (int)_estimateRSSIForSFBLEDevice:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  char Int64Ranged;
  char *v9;
  uint64_t v10;
  char v11;
  _BYTE *v12;
  char v13;
  unsigned int v14;
  uint64_t v15;
  char *v16;
  char v17;
  char *v18;
  int v19;
  int v20;
  int v21;
  char v22;
  char v23;
  char v24;
  char v25;
  int v26;
  uint64_t v28;
  char *rssiValues;
  unsigned __int8 *v30;
  _BYTE *v31;
  const char *v32;
  unint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;

  v4 = a3;
  v5 = objc_msgSend(v4, "rssi");
  if ((v5 & 0x8000000000000000) == 0)
    goto LABEL_27;
  v6 = v5;
  objc_msgSend(v4, "advertisementFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Int64Ranged = CFDictionaryGetInt64Ranged();

  v9 = (char *)self->_channels + 8 * (Int64Ranged & 3) - (Int64Ranged & 3);
  *v9 = Int64Ranged;
  v10 = v9[4];
  v9[v10 + 1] = v6;
  if ((v10 + 1) <= 2u)
    v11 = v10 + 1;
  else
    v11 = 0;
  v9[4] = v11;
  v14 = v9[5];
  v12 = v9 + 5;
  v13 = v14;
  if (v14 < 3)
    *v12 = v13 + 1;
  v15 = 0;
  v16 = &self->_channels[0].rssiValues[2];
  v17 = 0x80;
  do
  {
    v18 = &v16[v15];
    if (v16[v15 + 2] >= 3u)
    {
      v19 = *(v18 - 2);
      v20 = *(v18 - 1);
      v21 = *v18;
      if (v21 <= v19)
        v22 = *(v18 - 2);
      else
        v22 = *v18;
      if (v20 < v21)
        v22 = *(v18 - 1);
      if (v21 >= v19)
        v23 = *(v18 - 2);
      else
        v23 = *v18;
      if (v20 <= v21)
        v24 = v23;
      else
        v24 = *(v18 - 1);
      if (v19 > v20)
        v25 = v24;
      else
        v25 = v22;
      v18[3] = v25;
      if (v25 > v17)
        v17 = v25;
    }
    v15 += 7;
  }
  while (v15 != 28);
  if (v17 != 128)
  {
    v26 = v17;
    if (gLogCategory_SFProximityEstimator <= 9
      && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
    {
      v39 = v26;
      v28 = 0;
      rssiValues = self->_channels[0].rssiValues;
      do
      {
        v30 = &self->_channels[0].channel + 8 * v28 - v28;
        v31 = v30 + 5;
        if (v30[5])
        {
          v32 = "; ";
          if (!v28)
            v32 = "";
          v37 = *v30;
          v38 = (char)v30[6];
          v36 = v32;
          SNPrintF_Add();
          if (*v31)
          {
            v33 = 0;
            do
            {
              if (v33)
                v34 = ", ";
              else
                v34 = "";
              v36 = v34;
              v37 = rssiValues[v33];
              SNPrintF_Add();
              ++v33;
            }
            while (v33 < *v31);
          }
          SNPrintF_Add();
        }
        ++v28;
        rssiValues += 7;
      }
      while (v28 != 4);
      v26 = v39;
      if (gLogCategory_SFProximityEstimator < 51
        && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v4, "identifier", v36, v37, v38);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
    }
  }
  else
  {
LABEL_27:
    v26 = 0;
  }

  return v26;
}

@end
