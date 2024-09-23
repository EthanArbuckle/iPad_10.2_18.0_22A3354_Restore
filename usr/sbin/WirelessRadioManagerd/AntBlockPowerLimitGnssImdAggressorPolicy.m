@implementation AntBlockPowerLimitGnssImdAggressorPolicy

- (AntBlockPowerLimitGnssImdAggressorPolicy)init
{
  AntBlockPowerLimitGnssImdAggressorPolicy *v2;
  NSMutableArray *v3;
  NSMutableArray *mBandPolicy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AntBlockPowerLimitGnssImdAggressorPolicy;
  v2 = -[AntBlockPowerLimitGnssImdAggressorPolicy init](&v6, "init");
  *(_QWORD *)&v2->_mCellularCoexTech = 0;
  *(_QWORD *)&v2->_mCellularFrequencyKHz = 0;
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mBandPolicy = v2->_mBandPolicy;
  v2->_mBandPolicy = v3;

  return v2;
}

- (void)setParameter:(unsigned int)a3 CellularBand:(unsigned int)a4 CellFreq:(unsigned int)a5 CellBW:(unsigned int)a6
{
  self->_mCellularCoexTech = a3;
  self->_mCellularBand = a4;
  self->_mCellularFrequencyKHz = a5;
  self->_mCellularBandwidthKHz = a6;
}

- (void)extractPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  AntBlockPowerLimitGnssImdAggressorPolicy *v14;
  void *v15;
  AntBlockPowerLimitGnssImdBandPolicy *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  id obj;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Coex_Tech")));
    v7 = objc_msgSend(v6, "integerValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Cellular_Band")));
    v9 = objc_msgSend(v8, "integerValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Cellular_Center_Frequency_KHz")));
    v11 = objc_msgSend(v10, "integerValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Cellular_Bandwidth_KHz")));
    -[AntBlockPowerLimitGnssImdAggressorPolicy setParameter:CellularBand:CellFreq:CellBW:](self, "setParameter:CellularBand:CellFreq:CellBW:", v7, v9, v11, objc_msgSend(v12, "integerValue"));

    v26 = v5;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Band_Policy")));
    if (obj)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v29)
      {
        v28 = *(_QWORD *)v31;
        do
        {
          v13 = 0;
          do
          {
            v14 = self;
            if (*(_QWORD *)v31 != v28)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v13);
            v16 = objc_alloc_init(AntBlockPowerLimitGnssImdBandPolicy);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Enable")));
            v18 = objc_msgSend(v17, "BOOLValue");
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Cellular_Ant_Bitmap")));
            v20 = objc_msgSend(v19, "integerValue");
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Mitigation_Type")));
            v22 = objc_msgSend(v21, "integerValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Cellular_TX_Power_Cap")));
            objc_msgSend(v23, "doubleValue");
            LODWORD(v25) = vcvtd_n_s64_f64(v24, 4uLL);
            -[AntBlockPowerLimitGnssImdBandPolicy setParameterEnable:CellularAntBitmap:MitigationType:CellularTxPowerCap:](v16, "setParameterEnable:CellularAntBitmap:MitigationType:CellularTxPowerCap:", v18, v20, v22, v25);

            self = v14;
            -[AntBlockPowerLimitGnssImdAggressorPolicy addPolicy:](v14, "addPolicy:", v16);

            v13 = (char *)v13 + 1;
          }
          while (v29 != v13);
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v29);
      }
    }

    v5 = v26;
  }

}

- (void)addPolicy:(id)a3
{
  NSMutableArray *mBandPolicy;

  if (a3)
  {
    mBandPolicy = self->_mBandPolicy;
    if (mBandPolicy)
      -[NSMutableArray addObject:](mBandPolicy, "addObject:");
  }
}

- (unsigned)mCellularCoexTech
{
  return self->_mCellularCoexTech;
}

- (void)setMCellularCoexTech:(unsigned int)a3
{
  self->_mCellularCoexTech = a3;
}

- (unsigned)mCellularBand
{
  return self->_mCellularBand;
}

- (void)setMCellularBand:(unsigned int)a3
{
  self->_mCellularBand = a3;
}

- (unsigned)mCellularFrequencyKHz
{
  return self->_mCellularFrequencyKHz;
}

- (void)setMCellularFrequencyKHz:(unsigned int)a3
{
  self->_mCellularFrequencyKHz = a3;
}

- (unsigned)mCellularBandwidthKHz
{
  return self->_mCellularBandwidthKHz;
}

- (void)setMCellularBandwidthKHz:(unsigned int)a3
{
  self->_mCellularBandwidthKHz = a3;
}

- (NSMutableArray)mBandPolicy
{
  return self->_mBandPolicy;
}

- (void)setMBandPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mBandPolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mBandPolicy, 0);
}

@end
