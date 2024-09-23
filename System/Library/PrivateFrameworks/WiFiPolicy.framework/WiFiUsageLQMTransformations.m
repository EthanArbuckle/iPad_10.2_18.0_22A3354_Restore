@implementation WiFiUsageLQMTransformations

+ (unint64_t)rateFromRatePercentage:(int64_t)a3 linkMaxRate:(unint64_t)a4
{
  unint64_t result;

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 == 0x7FFFFFFFFFFFFFFFLL)
    return a3;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL)
    return (unint64_t)((double)a3 / (double)(unint64_t)_ratioScale * (double)a4);
  return result;
}

+ (unint64_t)byteScale
{
  return _byteScale;
}

+ (unint64_t)ratioWithValue:(unint64_t)a3 Over:(unint64_t)a4 WithScale:(unint64_t)a5
{
  unint64_t result;

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 && a4 != 0x7FFFFFFFFFFFFFFFLL)
    return a5 * a3 / a4;
  return result;
}

+ (unint64_t)ratioScale
{
  return _ratioScale;
}

+ ($3CC19D079FD0B010EE84973AA846B91B)decodingAttemptsWithRxCrsGlitch:(SEL)a3 rxBadPLCP:(unint64_t)a4 RxBphyCrsGlitch:(unint64_t)a5 rxBphyBadPLCP:(unint64_t)a6 rxStart:(unint64_t)a7
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;

  v8 = a6 + a4 + a5 + a7 + a8;
  v9 = (unint64_t)((double)(_ratioScale * (a6 + a4)) / (double)v8);
  v10 = (unint64_t)((double)(_ratioScale * (a7 + a5)) / (double)v8);
  v11 = (double)(_ratioScale * a8);
  retstr->var0 = v8;
  retstr->var1 = v9;
  retstr->var2 = v10;
  retstr->var3 = (unint64_t)(v11 / (double)v8);
  return result;
}

+ ($50828A08DC8D0425568E958C1030530A)ratePercentagesWithTxRate:(SEL)a3 rxRate:(unint64_t)a4 txFallbackRate:(unint64_t)a5 txFrames:(unint64_t)a6 rxFrames:(unint64_t)a7 nss:(unint64_t)a8 bw:(unint64_t)a9 phyMode:(unint64_t)a10 band:(int)a11 deviceMaxRate:(int)a12
{
  BOOL v19;
  int v20;
  int64x2_t v21;
  unint64_t v23;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  if (a12)
    v19 = 0;
  else
    v19 = a11 == 256;
  if (v19)
    v20 = 128;
  else
    v20 = a11;
  v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *(int64x2_t *)&retstr->var0 = v21;
  *(int64x2_t *)&retstr->var2 = v21;
  *(int64x2_t *)&retstr->var4 = v21;
  if (a9 != 0x7FFFFFFFFFFFFFFFLL && a10 != 0x7FFFFFFFFFFFFFFFLL && v20 != 0)
  {
    result = +[WiFiUsageLQMTransformations getMaxPhyrateWithNss:Bw:Phy:](WiFiUsageLQMTransformations, "getMaxPhyrateWithNss:Bw:Phy:", a9);
    v23 = 0x7FFFFFFFFFFFFFFFLL;
    if (result && result != ($50828A08DC8D0425568E958C1030530A *)0x7FFFFFFFFFFFFFFFLL)
    {
      if ((unint64_t)result >= a13)
        v25 = a13;
      else
        v25 = (unint64_t)result;
      if (a4 != 0x7FFFFFFFFFFFFFFFLL)
        v23 = _ratioScale * a4 / v25;
      retstr->var0 = v23;
      v26 = 0x7FFFFFFFFFFFFFFFLL;
      if (a5 != 0x7FFFFFFFFFFFFFFFLL)
        v26 = _ratioScale * a5 / v25;
      retstr->var1 = v26;
      if (_minFramesForRates <= a7)
        v27 = _ratioScale * a6 / v25;
      else
        v27 = 0x7FFFFFFFFFFFFFFFLL;
      retstr->var4 = v27;
      retstr->var5 = v25;
    }
  }
  if (a13)
    v28 = a13 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v28 = 1;
  if (!v28)
  {
    v29 = _minFramesForRates;
    v30 = 0x7FFFFFFFFFFFFFFFLL;
    v31 = 0x7FFFFFFFFFFFFFFFLL;
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && _minFramesForRates <= a7)
      v31 = _ratioScale * a4 / a13;
    retstr->var2 = v31;
    if (a5 != 0x7FFFFFFFFFFFFFFFLL && v29 <= a8)
      v30 = _ratioScale * a5 / a13;
    retstr->var3 = v30;
  }
  return result;
}

+ (unint64_t)getMaxPhyrateWithNss:(unint64_t)a3 Bw:(unint64_t)a4 Phy:(int)a5
{
  uint64_t v5;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;

  if (!a5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = *(_QWORD *)&a5;
  v8 = objc_msgSend(a1, "maxPhyModeFrom:", *(_QWORD *)&a5);
  if (v8 == 512)
    v9 = 256;
  else
    v9 = v8;
  v10 = (v9 - 2);
  if (v10 <= 0x3E)
  {
    if (((1 << (v9 - 2)) & 0x4000000040000041) != 0)
      return 54000;
    if (v10 == 2)
      return 11000;
    if (v10 == 14)
    {
      v12 = 0;
      goto LABEL_17;
    }
  }
  if (v9 == 128)
  {
    v12 = 1;
LABEL_17:
    if ((uint64_t)a4 > 79)
    {
      if (a4 == 80)
      {
        v13 = 2;
      }
      else
      {
        if (a4 != 160)
          goto LABEL_28;
        v13 = 3;
      }
    }
    else
    {
      if (a4 != 20)
      {
        if (a4 == 40)
        {
          v13 = 1;
          goto LABEL_26;
        }
LABEL_28:
        v14 = a3 - 1;
        v13 = 4;
LABEL_29:
        +[WiFiUsagePrivacyFilter getLabelForPhyModes:](WiFiUsagePrivacyFilter, "getLabelForPhyModes:", v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%s: Invalid Parameters nSS:%lu(idx:%ld) bw:%lu(idx:%lu) phy:%@(%X)(idx:%lu)"), "+[WiFiUsageLQMTransformations getMaxPhyrateWithNss:Bw:Phy:]", a3, v14, a4, v13, v15, v5, v12);

        return 0x7FFFFFFFFFFFFFFFLL;
      }
      v13 = 0;
    }
LABEL_26:
    v14 = a3 - 1;
    if (a3 - 1 < 3)
      return qword_1CC50EB88[12 * v14 + 3 * v13 + v12];
    goto LABEL_29;
  }
  if (v9 == 256)
  {
    v12 = 2;
    goto LABEL_17;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (void)initialize
{
  _ratioScale = 100;
  _byteScale = 1;
  _decimalsScale = 10;
  _minFramesForRates = 20;
  _minDurationCCAms = 100;
  NSLog(CFSTR("%s: ratioScale set to %lu ; decimalScale set to %lu ; minFramesForRates set to %lu ; minDurationCCAms set to %lu"),
    a2,
    "+[WiFiUsageLQMTransformations initialize]",
    100,
    10,
    20,
    100);
}

+ (void)updateConfig
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[WiFiUsageLQMConfiguration getConfigForKey:](WiFiUsageLQMConfiguration, "getConfigForKey:", CFSTR("LQMTransformation"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("ratioScale"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          _ratioScale = objc_msgSend(v2, "unsignedLongValue");
      }
      objc_msgSend(v6, "objectForKey:", CFSTR("decimalsScale"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          _decimalsScale = objc_msgSend(v3, "unsignedLongValue");
      }
      objc_msgSend(v6, "objectForKey:", CFSTR("minFramesForRates"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          _minFramesForRates = objc_msgSend(v4, "unsignedLongValue");
      }
      objc_msgSend(v6, "objectForKey:", CFSTR("minDurationForCCAms"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          _minDurationCCAms = objc_msgSend(v5, "unsignedLongValue");
      }

    }
  }
  NSLog(CFSTR("%s: ratioScale set to %lu ; minFramesForRates set to %lu ; minDurationCCAms set to %lu"),
    "+[WiFiUsageLQMTransformations updateConfig]",
    _ratioScale,
    _minFramesForRates,
    _minDurationCCAms);

}

+ (unint64_t)mpduDensityScale
{
  return _decimalsScale;
}

+ (id)numberForKeyPath:(id)a3 ofObject:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a4, "valueForKeyPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "unsignedLongValue") == 0x7FFFFFFFFFFFFFFFLL)
      v6 = 0;
    else
      v6 = v5;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)validateRate:(unint64_t)a3 frames:(unint64_t)a4
{
  unint64_t result;

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (_minFramesForRates <= a4)
      return a3;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

+ ($06626BA963112C91E7E52BBD3AECAE4D)ctrlFrmsPercentagesWithRxCtrlUcast:(SEL)a3 RTS:(unint64_t)a4 CTS:(unint64_t)a5 BACK:(unint64_t)a6 ACK:(unint64_t)a7
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  retstr->var0 = a4;
  if (a4)
  {
    v8 = _ratioScale * a5 / a4;
    v9 = _ratioScale * a6 / a4;
    v10 = _ratioScale * a7 / a4;
    v11 = _ratioScale * a8 / a4;
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  retstr->var1 = v8;
  retstr->var2 = v9;
  retstr->var3 = v10;
  retstr->var4 = v11;
  return result;
}

+ ($3CC19D079FD0B010EE84973AA846B91B)rxUcastPercentagesWithRxData:(SEL)a3 rxMgmt:(unint64_t)a4 rxCtrl:(unint64_t)a5
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v6 = a5 + a4 + a6;
  retstr->var0 = v6;
  if (v6)
  {
    v7 = _ratioScale * a4 / v6;
    v8 = _ratioScale * a5 / v6;
    v9 = _ratioScale * a6 / v6;
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  retstr->var1 = v7;
  retstr->var2 = v8;
  retstr->var3 = v9;
  return result;
}

+ ($AA6A45B2DFCED8527C3A0E9A46B0D48F)rxDecodingErrorsPercentagesWithRxFrmTooLong:(SEL)a3 rxFrmTooShrt:(unint64_t)a4 rxBadFCS:(unint64_t)a5 rxResponseTimeout:(unint64_t)a6 rxNoDelim:(unint64_t)a7 rxAnyErr:(unint64_t)a8 rxFifo0Ovfl:(unint64_t)a9 rxFifo1Ovfl:(unint64_t)a10
{
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v11 = a5 + a4 + a6 + a7 + a8 + a9 + a10 + a11;
  retstr->var0 = v11;
  if (v11)
  {
    result = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)_ratioScale;
    v12 = _ratioScale * a4 / v11;
    v13 = _ratioScale * a5 / v11;
    v14 = _ratioScale * a6 / v11;
    v15 = _ratioScale * a7 / v11;
    v16 = _ratioScale * a8 / v11;
    v17 = _ratioScale * a9 / v11;
    v18 = _ratioScale * a10 / v11;
    v19 = _ratioScale * a11 / v11;
  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  retstr->var1 = v12;
  retstr->var2 = v13;
  retstr->var3 = v14;
  retstr->var4 = v15;
  retstr->var5 = v16;
  retstr->var6 = v18;
  retstr->var7 = v19;
  retstr->var8 = v17;
  return result;
}

+ (id)dateWithMachContinuousTime:(unint64_t)a3 WithRef:(id)a4 asNS:(unint64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", a4, (double)(a5 - a3) / -1000000000.0);
}

+ ($9D2DAF67E984336BD89D1161AD44CF98)txErrorsPercentagesWithtxSuccess:(SEL)a3 txDropped:(unint64_t)a4 txNoBuff:(unint64_t)a5 txNoRes:(unint64_t)a6 txNoAck:(unint64_t)a7 txChipModeErr:(unint64_t)a8 txExpired:(unint64_t)a9 txFail:(unint64_t)a10 txFwFree:(unint64_t)a11 txMaxRetries:(unint64_t)a12 txForceExpire:(unint64_t)a13
{
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64x2_t v21;

  retstr->var7 = 0;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  v14 = a5 + a4 + a6 + a7 + a8 + a9 + a10 + a11 + a12 + a13 + a14;
  retstr->var0 = v14;
  if (v14)
  {
    result = ($9D2DAF67E984336BD89D1161AD44CF98 *)_ratioScale;
    v15 = _ratioScale * (a6 + a5 + a7 + a8 + a9 + a10 + a11 + a12 + a13 + a14) / v14;
    retstr->var1 = _ratioScale * a4 / v14;
    retstr->var2 = v15;
    retstr->var3 = (unint64_t)result * a5 / v14;
    retstr->var4 = (unint64_t)result * a6 / v14;
    retstr->var5 = (unint64_t)result * a7 / v14;
    retstr->var6 = (unint64_t)result * a8 / v14;
    retstr->var7 = (unint64_t)result * a9 / v14;
    v16 = (unint64_t)result * a10 / v14;
    v17 = (unint64_t)result * a11 / v14;
    v18 = (unint64_t)result * a12 / v14;
    v19 = (unint64_t)result * a13 / v14;
    v20 = (unint64_t)result * a14 / v14;
  }
  else
  {
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&retstr->var1 = v21;
    *(int64x2_t *)&retstr->var3 = v21;
    *(int64x2_t *)&retstr->var5 = v21;
    retstr->var7 = 0x7FFFFFFFFFFFFFFFLL;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  retstr->var8 = v16;
  retstr->var9 = v17;
  retstr->var10 = v18;
  retstr->var11 = v19;
  retstr->var12 = v20;
  return result;
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)ccaStatsWithDuration:(SEL)a3 ccaSelf:(unint64_t)a4 ccaOther:(unint64_t)a5 interference:(unint64_t)a6
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (_minDurationCCAms <= a4)
    v8 = a5;
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (_minDurationCCAms <= a4)
    v9 = a6;
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (_minDurationCCAms <= a4)
    v7 = a7;
  retstr->var0 = v8;
  retstr->var1 = v9;
  retstr->var2 = v7;
  return result;
}

+ (id)ofdmDesenseReason:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[8];
  _QWORD v24[9];

  v24[8] = *MEMORY[0x1E0C80C00];
  v23[0] = &unk_1E88624A8;
  v23[1] = &unk_1E88624C0;
  v24[0] = CFSTR("GDB(bPhy)");
  v24[1] = CFSTR("GDB(ofdm)");
  v23[2] = &unk_1E88624D8;
  v23[3] = &unk_1E88624F0;
  v24[2] = CFSTR("BTCoex(bPhy)");
  v24[3] = CFSTR("BTCoex(ofdm)");
  v23[4] = &unk_1E8862508;
  v23[5] = &unk_1E8862520;
  v24[4] = CFSTR("LTECoex(bPhy)");
  v24[5] = CFSTR("LTECoex(ofdm)");
  v23[6] = &unk_1E8862538;
  v23[7] = &unk_1E8862550;
  v24[6] = CFSTR("InitGainOrCRS(bPhy)");
  v24[7] = CFSTR("initGainOrCRS(ofdm)");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  if ((a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@&"), v10);

    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@&"), v12);

  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@&"), v14);

  if ((a3 & 8) == 0)
  {
LABEL_5:
    if ((a3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@&"), v16);

  if ((a3 & 0x10) == 0)
  {
LABEL_6:
    if ((a3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@&"), v18);

  if ((a3 & 0x20) == 0)
  {
LABEL_7:
    if ((a3 & 0x40) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@&"), v22);

    if ((a3 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@&"), v20);

  if ((a3 & 0x40) != 0)
    goto LABEL_17;
LABEL_8:
  if ((a3 & 0x80) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@&"), v7);

  }
LABEL_10:

  return v5;
}

+ (id)scanClient:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E8862568;
  v8[1] = &unk_1E88624A8;
  v9[0] = CFSTR("AWDL");
  v9[1] = CFSTR("NAN");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)getBinForDouble:(double)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6
{
  id v9;
  __CFString *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  __CFString *v23;
  const __CFString *v24;
  __CFString *v25;
  __CFString *v26;

  v9 = a4;
  v10 = (__CFString *)a5;
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    v12 = 0;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      if (v15 >= a3)
        break;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      ++v11;
      v12 = v16;
      if (objc_msgSend(v9, "count") <= v11)
        goto LABEL_8;
    }
    v16 = v12;
  }
  else
  {
    v16 = 0;
    v11 = 0;
  }
LABEL_8:
  v17 = v16;
  v18 = v17;
  if (objc_msgSend(v9, "count") > v11)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    v18 = v17;
    if (v21 >= a3)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (objc_msgSend(v9, "count") == v11)
  {
    -[__CFString doubleValue](v18, "doubleValue");
    if (v22 < a3)
    {

      v18 = 0;
    }
  }
  if (a6 == 2)
  {
    v25 = v18;
  }
  else
  {
    if (a6)
    {
      v26 = 0;
      goto LABEL_25;
    }
    if (v17)
      v23 = v17;
    else
      v23 = v10;
    v24 = CFSTR("+inf");
    if (v18)
      v24 = v18;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@:%@]"), v23, v24);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;
LABEL_25:

  return v26;
}

+ (id)getBinEvery10thOverRatioScale:(unint64_t)a3 As:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v19[12];

  v19[11] = *MEMORY[0x1E0C80C00];
  v19[0] = &unk_1E8862568;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)_ratioScale * 0.1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)_ratioScale * 0.2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)_ratioScale * 0.3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)_ratioScale * 0.4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)_ratioScale * 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)_ratioScale * 0.6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)_ratioScale * 0.7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)_ratioScale * 0.8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)_ratioScale * 0.9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", _ratioScale);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, v13, CFSTR("0"), a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)getBinRssi:(int64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8863FF8, CFSTR("-inf"), a4);
}

+ (id)getBinNoise:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8864010, CFSTR("-inf"), a4);
}

+ (id)getBinSnr:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8864028, CFSTR("0"), a4);
}

+ (id)getBinDecodingAttempts:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8864040, CFSTR("0"), a4);
}

+ (id)getBinRetries:(unint64_t)a3 As:(unint64_t)a4
{
  return CFSTR("TODO: Find a valid range for RetriesPerFrames and define bins");
}

+ (id)getBinBytesPerFrame:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8864058, CFSTR("0"), a4);
}

+ (id)getBinBytesPerPacket:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8864070, CFSTR("0"), a4);
}

+ (id)getBinMpduDensity:(unint64_t)a3 As:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "getBinForDouble:In:WithLowestEdge:As:", &unk_1E8864088, CFSTR("0"), a4, (double)a3 / (double)(unint64_t)_decimalsScale);
}

+ (id)getBinFrames:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E88640A0, CFSTR("0"), a4);
}

+ (id)getBinForRoamingLatency:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E88640B8, CFSTR("0"), a4);
}

+ (id)getBinTimeIntervalUpTo12h:(double)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", (unint64_t)a3, &unk_1E88640D0, CFSTR("0"), a4);
}

+ (id)getBinTimeIntervalUpTo60s:(double)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", (unint64_t)a3, &unk_1E88640E8, CFSTR("0"), a4);
}

+ (id)getBinQueuedAmpdu:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8864100, CFSTR("0"), a4);
}

+ (id)getBinNetworkQualityResponsiveness:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8864118, CFSTR("0"), a4);
}

+ (id)getBinThroughput:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8864130, CFSTR("0"), a4);
}

+ (id)getBinRTT:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8864148, CFSTR("0"), a4);
}

+ (id)getBinScannedChannels:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8864160, CFSTR("0"), a4);
}

+ (id)getBinDesense:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8864178, CFSTR("0"), a4);
}

+ (id)getLabelTrafficState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = CFSTR("VO|");
    v7 = &stru_1E881F240;
    if ((a3 & 8) == 0)
      v6 = &stru_1E881F240;
    v8 = CFSTR("VI|");
    if ((a3 & 4) == 0)
      v8 = &stru_1E881F240;
    v9 = CFSTR("BE|");
    if ((a3 & 1) == 0)
      v9 = &stru_1E881F240;
    if ((a3 & 2) != 0)
      v7 = CFSTR("BK");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@"), v6, v8, v9, v7, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)getLabelPingPongStats:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v3, "sequence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "appendFormat:", CFSTR("%@|"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if ((objc_msgSend(v4, "isEqualToString:", &stru_1E881F240) & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (int)maxPhyModeFrom:(int)a3
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;

  v3 = a3 & 4;
  if ((a3 & 0x22) != 0)
    v3 = 2;
  if ((a3 & 0x48) != 0)
    v4 = 8;
  else
    v4 = v3;
  if ((a3 & 0x10) != 0)
    v5 = 16;
  else
    v5 = v4;
  if ((a3 & 0x80) != 0)
    v6 = 128;
  else
    v6 = v5;
  if ((a3 & 0x100) != 0)
    v7 = 256;
  else
    v7 = v6;
  if ((a3 & 0x200) != 0)
    return 512;
  else
    return v7;
}

@end
