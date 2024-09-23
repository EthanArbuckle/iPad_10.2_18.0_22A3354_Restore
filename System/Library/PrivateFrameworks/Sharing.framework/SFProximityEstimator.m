@implementation SFProximityEstimator

- (unsigned)updateWithSFBLEDevice:(id)a3
{
  id v4;
  SFProximityEstimator *v5;
  SFProximityEstimator *v6;
  uint64_t v7;
  unsigned int v8;
  int rssiEnter;
  int *p_rssiEnter;
  _BOOL4 IsVirtualMachine;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "closeProximityEstimatorMedium");
  v5 = (SFProximityEstimator *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "closeProximityEstimatorSmall");
  v6 = (SFProximityEstimator *)objc_claimAutoreleasedReturnValue();

  v7 = -[SFProximityEstimator _estimateRSSIForSFBLEDevice:](self, "_estimateRSSIForSFBLEDevice:", v4);
  if ((v7 & 0x80000000) == 0 && !SFDeviceIsVirtualMachine())
  {
    v8 = 0;
    goto LABEL_62;
  }
  if ((_DWORD)v7 == objc_msgSend(v4, "rssiEstimate"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "setRssiEstimate:", v7);
    v8 = 4;
  }
  p_rssiEnter = &self->_rssiEnter;
  rssiEnter = self->_rssiEnter;
  IsVirtualMachine = SFDeviceIsVirtualMachine();
  v12 = (int)v7 >= rssiEnter || IsVirtualMachine;
  objc_msgSend(v4, "setTriggered:", v12);
  if ((_DWORD)v12 == 1)
  {
    if (v6 == self)
    {
      if ((objc_msgSend(v4, "insideSmallBubble") & 1) == 0)
      {
        objc_msgSend(v4, "setInsideSmallBubble:", 1);
        v8 |= 0x10u;
        if (gLogCategory_SFProximityEstimator <= 30
          && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_39;
        }
      }
    }
    else if (v5 == self)
    {
      if ((objc_msgSend(v4, "insideMediumBubble") & 1) == 0)
      {
        objc_msgSend(v4, "setInsideMediumBubble:", 1);
        v8 |= 0x10u;
        if (gLogCategory_SFProximityEstimator <= 30
          && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_39;
        }
      }
    }
    else if ((objc_msgSend(v4, "insideBubble") & 1) == 0)
    {
      objc_msgSend(v4, "setInsideBubble:", 1);
      v8 |= 0x10u;
      if (gLogCategory_SFProximityEstimator <= 30
        && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
      {
LABEL_39:
        v19 = *p_rssiEnter;
        v20 = v4;
        LogPrintF();
      }
    }
  }
  else
  {
    p_rssiEnter = &self->_rssiExit;
    if ((int)v7 >= self->_rssiExit)
      goto LABEL_40;
    if (v6 == self)
    {
      if (objc_msgSend(v4, "insideSmallBubble"))
      {
        objc_msgSend(v4, "setInsideSmallBubble:", 0);
        v8 |= 0x10u;
        if (gLogCategory_SFProximityEstimator <= 30
          && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_39;
        }
      }
    }
    else if (v5 == self)
    {
      if (objc_msgSend(v4, "insideMediumBubble"))
      {
        objc_msgSend(v4, "setInsideMediumBubble:", 0);
        v8 |= 0x10u;
        if (gLogCategory_SFProximityEstimator <= 30
          && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_39;
        }
      }
    }
    else if (objc_msgSend(v4, "insideBubble"))
    {
      objc_msgSend(v4, "setInsideBubble:", 0);
      v8 |= 0x10u;
      if (gLogCategory_SFProximityEstimator <= 30
        && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_39;
      }
    }
  }
LABEL_40:
  v13 = objc_msgSend(v4, "distance", v19, v20);
  if (v13 != 60)
  {
    if (v13 == 20)
    {
      if ((int)v7 < self->_rssiImmediate)
      {
        v14 = (int)v7 <= self->_rssiFar;
        v15 = 60;
        v16 = 20;
LABEL_51:
        if (v14)
          v17 = v15;
        else
          v17 = v16;
        goto LABEL_56;
      }
LABEL_54:
      v17 = 10;
      goto LABEL_56;
    }
    if (v13 == 10)
    {
      if ((int)v7 <= self->_rssiFar)
      {
        v17 = 60;
        goto LABEL_56;
      }
      v14 = (int)v7 <= self->_rssiNear;
      v15 = 20;
      v16 = 10;
      goto LABEL_51;
    }
  }
  if ((int)v7 >= self->_rssiImmediate)
    goto LABEL_54;
  if ((int)v7 >= self->_rssiNear)
    v17 = 20;
  else
    v17 = 60;
LABEL_56:
  if (v17 != v13)
  {
    objc_msgSend(v4, "setDistance:", v17);
    if (gLogCategory_SFProximityEstimator <= 30
      && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 |= 2u;
  }
LABEL_62:

  return v8;
}

+ (SFProximityEstimator)proximityEstimatorWithProximityInfo:(id)a3
{
  id v3;
  uint64_t Int64Ranged;
  Class *v5;
  __objc2_class **v6;
  void *v7;

  v3 = a3;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v5 = (Class *)off_1E4820D98;
  v6 = off_1E4820D90;
  if (Int64Ranged << 32 != 0x700000000)
    v6 = off_1E4820D88;
  if (Int64Ranged << 32 != 0x600000000)
    v5 = (Class *)v6;
  v7 = (void *)objc_msgSend(objc_alloc(*v5), "initWithProximityInfo:", v3);

  return (SFProximityEstimator *)v7;
}

- (SFProximityEstimator)initWithProximityInfo:(id)a3
{
  id v4;
  SFProximityEstimator *v5;
  SFProximityEstimator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFProximityEstimator;
  v5 = -[SFProximityEstimator init](&v8, sel_init);
  if (v5)
  {
    v5->_rssiEnter = CFDictionaryGetInt64Ranged();
    v5->_rssiExit = CFDictionaryGetInt64Ranged();
    v5->_rssiImmediate = CFDictionaryGetInt64Ranged();
    v5->_rssiNear = CFDictionaryGetInt64Ranged();
    v5->_rssiFar = CFDictionaryGetInt64Ranged();
    v6 = v5;
  }

  return v5;
}

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

- (id)descriptionParams
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v11;

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E483B8E8);
  v4 = (void *)v3;
  if (self->_rssiEnter)
  {
    v11 = (void *)v3;
    NSAppendPrintF();
    v5 = v11;

    v4 = v5;
  }
  if (self->_rssiExit)
  {
    NSAppendPrintF();
    v6 = v4;

    v4 = v6;
  }
  if (self->_rssiImmediate)
  {
    NSAppendPrintF();
    v7 = v4;

    v4 = v7;
  }
  if (self->_rssiNear)
  {
    NSAppendPrintF();
    v8 = v4;

    v4 = v8;
  }
  if (self->_rssiFar)
  {
    NSAppendPrintF();
    v9 = v4;

    v4 = v9;
  }
  return v4;
}

- (int)_estimateRSSIForSFBLEDevice:(id)a3
{
  return objc_msgSend(a3, "smoothedRSSI");
}

- (int)estimatedRSSI
{
  return self->_estimatedRSSI;
}

@end
