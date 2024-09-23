@implementation BiasEstimatorFeatures

- (BiasEstimatorFeatures)initWithBiasEstimatorFeatures:(id)a3
{
  id v5;
  BiasEstimatorFeatures *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NSArray *v20;
  NSArray *cirPacket1;
  double v22;
  double v23;
  void *v24;
  NSArray *v25;
  NSArray *cirPacket2;
  double v27;
  double v28;
  void *v30;
  objc_super v31;

  v5 = a3;
  if (!v5)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UWBSignalFeatures.mm"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("features"));

  }
  v31.receiver = self;
  v31.super_class = (Class)BiasEstimatorFeatures;
  v6 = -[BiasEstimatorFeatures init](&v31, "init");
  if (v6)
  {
    v6->_antennaMask = objc_msgSend(v5, "antennaMask");
    objc_msgSend(v5, "uwbTime");
    v6->_uwbTime = v7;
    objc_msgSend(v5, "timestamp");
    v6->_timestamp = v8;
    objc_msgSend(v5, "tofPicSecond");
    v6->_tofPicSecond = v9;
    objc_msgSend(v5, "rssiDbm");
    v6->_rssiDbm = v10;
    objc_msgSend(v5, "soiRssiDbm");
    v6->_soiRssiDbm = v11;
    objc_msgSend(v5, "toaNoiseRms");
    v6->_toaNoiseRms = v12;
    objc_msgSend(v5, "toaPpwinRms");
    v6->_toaPpwinRms = v13;
    objc_msgSend(v5, "toaPpwinPeak");
    v6->_toaPpwinPeak = v14;
    objc_msgSend(v5, "rttInitiator");
    v6->_rttInitiator = v15;
    objc_msgSend(v5, "tatInitiator");
    v6->_tatInitiator = v16;
    objc_msgSend(v5, "rttResponder");
    v6->_rttResponder = v17;
    objc_msgSend(v5, "tatResponder");
    v6->_tatResponder = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cirPacket1"));
    v20 = (NSArray *)objc_msgSend(v19, "copy");
    cirPacket1 = v6->_cirPacket1;
    v6->_cirPacket1 = v20;

    objc_msgSend(v5, "leadingEdgePacket1");
    v6->_leadingEdgePacket1 = v22;
    objc_msgSend(v5, "firstPathIndexPacket1");
    v6->_firstPathIndexPacket1 = v23;
    v6->_rxAntennaPacket1 = objc_msgSend(v5, "rxAntennaPacket1");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cirPacket2"));
    v25 = (NSArray *)objc_msgSend(v24, "copy");
    cirPacket2 = v6->_cirPacket2;
    v6->_cirPacket2 = v25;

    objc_msgSend(v5, "leadingEdgePacket2");
    v6->_leadingEdgePacket2 = v27;
    objc_msgSend(v5, "firstPathIndexPacket2");
    v6->_firstPathIndexPacket2 = v28;
    v6->_rxAntennaPacket2 = objc_msgSend(v5, "rxAntennaPacket2");
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", self->_antennaMask, CFSTR("antennaMask"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("uwbTime"), self->_uwbTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("tofPicSecond"), self->_tofPicSecond);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rssiDbm"), self->_rssiDbm);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("soiRssiDbm"), self->_soiRssiDbm);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("toaNoiseRms"), self->_toaNoiseRms);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("toaPpwinRms"), self->_toaPpwinRms);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("toaPpwinPeak"), self->_toaPpwinPeak);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rttInitiator"), self->_rttInitiator);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("tatInitiator"), self->_tatInitiator);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rttResponder"), self->_rttResponder);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("tatResponder"), self->_tatResponder);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cirPacket1, CFSTR("cirPacket1"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("leadingEdgePacket1"), self->_leadingEdgePacket1);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("firstPathIndexPacket1"), self->_firstPathIndexPacket1);
  objc_msgSend(v4, "encodeInt:forKey:", self->_rxAntennaPacket1, CFSTR("rxAntennaPacket1"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cirPacket2, CFSTR("cirPacket2"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("leadingEdgePacket2"), self->_leadingEdgePacket2);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("firstPathIndexPacket2"), self->_firstPathIndexPacket2);
  objc_msgSend(v4, "encodeInt:forKey:", self->_rxAntennaPacket2, CFSTR("rxAntennaPacket2"));

}

- (BiasEstimatorFeatures)initWithCoder:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  BiasEstimatorFeatures *v38;
  BiasEstimatorFeatures *v39;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  objc_super v49;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("antennaMask"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("uwbTime"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tofPicSecond"));
  v11 = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("soiRssiDbm"));
  v48 = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rssiDbm"));
  v14 = v13;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("toaNoiseRms"));
  v47 = v15;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("toaPpwinRms"));
  v46 = v16;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("toaPpwinPeak"));
  v45 = v17;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rttInitiator"));
  v44 = v18;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tatInitiator"));
  v43 = v19;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rttResponder"));
  v42 = v20;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tatResponder"));
  v41 = v21;
  v23 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(Complex, v22), CFSTR("cirPacket1"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("leadingEdgePacket1"));
  v26 = v25;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("firstPathIndexPacket1"));
  v28 = v27;
  v29 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("rxAntennaPacket1"));
  v31 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(Complex, v30), CFSTR("cirPacket2"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("leadingEdgePacket2"));
  v34 = v33;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("firstPathIndexPacket2"));
  v36 = v35;
  v37 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("rxAntennaPacket2"));
  v49.receiver = self;
  v49.super_class = (Class)BiasEstimatorFeatures;
  v38 = -[BiasEstimatorFeatures init](&v49, "init");
  v39 = v38;
  if (v38)
  {
    -[BiasEstimatorFeatures setAntennaMask:](v38, "setAntennaMask:", v5);
    -[BiasEstimatorFeatures setUwbTime:](v39, "setUwbTime:", v7);
    -[BiasEstimatorFeatures setTimestamp:](v39, "setTimestamp:", v9);
    -[BiasEstimatorFeatures setTofPicSecond:](v39, "setTofPicSecond:", v11);
    -[BiasEstimatorFeatures setRssiDbm:](v39, "setRssiDbm:", v14);
    -[BiasEstimatorFeatures setSoiRssiDbm:](v39, "setSoiRssiDbm:", v48);
    -[BiasEstimatorFeatures setToaNoiseRms:](v39, "setToaNoiseRms:", v47);
    -[BiasEstimatorFeatures setToaPpwinRms:](v39, "setToaPpwinRms:", v46);
    -[BiasEstimatorFeatures setToaPpwinPeak:](v39, "setToaPpwinPeak:", v45);
    -[BiasEstimatorFeatures setRttInitiator:](v39, "setRttInitiator:", v44);
    -[BiasEstimatorFeatures setTatInitiator:](v39, "setTatInitiator:", v43);
    -[BiasEstimatorFeatures setRttResponder:](v39, "setRttResponder:", v42);
    -[BiasEstimatorFeatures setTatResponder:](v39, "setTatResponder:", v41);
    -[BiasEstimatorFeatures setCirPacket1:](v39, "setCirPacket1:", v24);
    -[BiasEstimatorFeatures setLeadingEdgePacket1:](v39, "setLeadingEdgePacket1:", v26);
    -[BiasEstimatorFeatures setFirstPathIndexPacket1:](v39, "setFirstPathIndexPacket1:", v28);
    -[BiasEstimatorFeatures setRxAntennaPacket1:](v39, "setRxAntennaPacket1:", v29);
    -[BiasEstimatorFeatures setCirPacket2:](v39, "setCirPacket2:", v32);
    -[BiasEstimatorFeatures setLeadingEdgePacket2:](v39, "setLeadingEdgePacket2:", v34);
    -[BiasEstimatorFeatures setFirstPathIndexPacket2:](v39, "setFirstPathIndexPacket2:", v36);
    -[BiasEstimatorFeatures setRxAntennaPacket2:](v39, "setRxAntennaPacket2:", v37);
  }

  return v39;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "initWithBiasEstimatorFeatures:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BiasEstimatorFeatures *v7;
  BiasEstimatorFeatures *v8;
  int antennaMask;
  unsigned int v10;
  double uwbTime;
  double v12;
  double v13;
  double timestamp;
  double v15;
  double v16;
  double rssiDbm;
  double v18;
  double v19;
  double soiRssiDbm;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSArray *cirPacket1;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  char v35;
  double v36;
  double v37;
  int rxAntennaPacket1;
  unsigned int v39;
  NSArray *cirPacket2;
  uint64_t v41;
  unsigned __int8 v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double leadingEdgePacket2;
  double v48;
  double v49;
  double firstPathIndexPacket2;
  double v51;
  double v52;
  int rxAntennaPacket2;
  unsigned int v54;
  BOOL v56;
  BOOL v57;
  BOOL v58;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double firstPathIndexPacket1;
  double v66;
  double leadingEdgePacket1;
  double v68;
  double tatResponder;
  double v70;
  double rttResponder;
  double v72;
  double tatInitiator;
  double v74;
  double rttInitiator;
  double v76;
  double toaPpwinPeak;
  double v78;
  double toaPpwinRms;
  double v80;
  double toaNoiseRms;
  double v82;
  double tofPicSecond;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (BiasEstimatorFeatures *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v58 = 1;
LABEL_36:

      goto LABEL_37;
    }
    antennaMask = self->_antennaMask;
    v10 = -[BiasEstimatorFeatures antennaMask](v7, "antennaMask");
    uwbTime = self->_uwbTime;
    -[BiasEstimatorFeatures uwbTime](v8, "uwbTime");
    v13 = v12;
    timestamp = self->_timestamp;
    -[BiasEstimatorFeatures timestamp](v8, "timestamp");
    v16 = v15;
    rssiDbm = self->_rssiDbm;
    -[BiasEstimatorFeatures rssiDbm](v8, "rssiDbm");
    v19 = v18;
    soiRssiDbm = self->_soiRssiDbm;
    -[BiasEstimatorFeatures soiRssiDbm](v8, "soiRssiDbm");
    v22 = v21;
    tofPicSecond = self->_tofPicSecond;
    -[BiasEstimatorFeatures tofPicSecond](v8, "tofPicSecond");
    v82 = v23;
    toaNoiseRms = self->_toaNoiseRms;
    -[BiasEstimatorFeatures toaNoiseRms](v8, "toaNoiseRms");
    v80 = v24;
    toaPpwinRms = self->_toaPpwinRms;
    -[BiasEstimatorFeatures toaPpwinRms](v8, "toaPpwinRms");
    v78 = v25;
    toaPpwinPeak = self->_toaPpwinPeak;
    -[BiasEstimatorFeatures toaPpwinPeak](v8, "toaPpwinPeak");
    v76 = v26;
    rttInitiator = self->_rttInitiator;
    -[BiasEstimatorFeatures rttInitiator](v8, "rttInitiator");
    v74 = v27;
    tatInitiator = self->_tatInitiator;
    -[BiasEstimatorFeatures tatInitiator](v8, "tatInitiator");
    v72 = v28;
    rttResponder = self->_rttResponder;
    -[BiasEstimatorFeatures rttResponder](v8, "rttResponder");
    v70 = v29;
    tatResponder = self->_tatResponder;
    -[BiasEstimatorFeatures tatResponder](v8, "tatResponder");
    v68 = v30;
    cirPacket1 = self->_cirPacket1;
    if (!cirPacket1)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorFeatures cirPacket1](v8, "cirPacket1"));

      if (!v32)
      {
        v35 = 0;
LABEL_7:
        leadingEdgePacket1 = self->_leadingEdgePacket1;
        -[BiasEstimatorFeatures leadingEdgePacket1](v8, "leadingEdgePacket1");
        v66 = v36;
        firstPathIndexPacket1 = self->_firstPathIndexPacket1;
        -[BiasEstimatorFeatures firstPathIndexPacket1](v8, "firstPathIndexPacket1");
        v64 = v37;
        rxAntennaPacket1 = self->_rxAntennaPacket1;
        v39 = -[BiasEstimatorFeatures rxAntennaPacket1](v8, "rxAntennaPacket1");
        cirPacket2 = self->_cirPacket2;
        v62 = v19;
        v63 = rssiDbm;
        v60 = v22;
        v61 = soiRssiDbm;
        if (!cirPacket2)
        {
          v41 = objc_claimAutoreleasedReturnValue(-[BiasEstimatorFeatures cirPacket2](v8, "cirPacket2"));

          if (!v41)
          {
            v43 = v16;
            v44 = timestamp;
            v45 = v13;
            v46 = uwbTime;
            goto LABEL_11;
          }
          cirPacket2 = self->_cirPacket2;
        }
        v41 = objc_claimAutoreleasedReturnValue(-[BiasEstimatorFeatures cirPacket2](v8, "cirPacket2"));
        v42 = -[NSArray isEqualToArray:](cirPacket2, "isEqualToArray:", v41);
        v43 = v16;
        v44 = timestamp;
        v45 = v13;
        v46 = uwbTime;

        LOBYTE(v41) = v42 ^ 1;
LABEL_11:
        leadingEdgePacket2 = self->_leadingEdgePacket2;
        -[BiasEstimatorFeatures leadingEdgePacket2](v8, "leadingEdgePacket2");
        v49 = v48;
        firstPathIndexPacket2 = self->_firstPathIndexPacket2;
        -[BiasEstimatorFeatures firstPathIndexPacket2](v8, "firstPathIndexPacket2");
        v52 = v51;
        rxAntennaPacket2 = self->_rxAntennaPacket2;
        v54 = -[BiasEstimatorFeatures rxAntennaPacket2](v8, "rxAntennaPacket2");
        v56 = v46 != v45 || antennaMask != v10;
        if (v44 != v43)
          v56 = 1;
        if (tofPicSecond != v82)
          v56 = 1;
        if (v63 != v62)
          v56 = 1;
        if (v61 != v60)
          v56 = 1;
        if (toaNoiseRms != v80)
          v56 = 1;
        if (toaPpwinRms != v78)
          v56 = 1;
        v57 = (leadingEdgePacket2 == v49) & ~(v56 | (toaPpwinPeak != v76
                                                  || rttInitiator != v74
                                                  || tatInitiator != v72
                                                  || rttResponder != v70
                                                  || tatResponder != v68) | v35 | (leadingEdgePacket1 != v66) | (firstPathIndexPacket1 != v64) | (rxAntennaPacket1 != v39) | v41);
        if (firstPathIndexPacket2 != v52)
          v57 = 0;
        v58 = rxAntennaPacket2 == v54 && v57;
        goto LABEL_36;
      }
      cirPacket1 = self->_cirPacket1;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorFeatures cirPacket1](v8, "cirPacket1"));
    v34 = -[NSArray isEqualToArray:](cirPacket1, "isEqualToArray:", v33);

    v35 = v34 ^ 1;
    goto LABEL_7;
  }
  v58 = 0;
LABEL_37:

  return v58;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  NSArray *cirPacket1;
  void *v10;
  NSArray *cirPacket2;
  void *v12;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v7);

  objc_msgSend(v8, "appendFormat:", CFSTR("AntennaMask: %d"), self->_antennaMask);
  objc_msgSend(v8, "appendFormat:", CFSTR(", current Timestamp: %f"), *(_QWORD *)&self->_timestamp);
  objc_msgSend(v8, "appendFormat:", CFSTR(", uwbTime: %f"), *(_QWORD *)&self->_uwbTime);
  objc_msgSend(v8, "appendFormat:", CFSTR(", tofPicSecond: %f"), *(_QWORD *)&self->_tofPicSecond);
  objc_msgSend(v8, "appendFormat:", CFSTR(", rssiDbm: %.3f"), *(_QWORD *)&self->_rssiDbm);
  objc_msgSend(v8, "appendFormat:", CFSTR(", soiRssiDbm: %.3f"), *(_QWORD *)&self->_soiRssiDbm);
  objc_msgSend(v8, "appendFormat:", CFSTR(", toaNoiseRms: %d"), (int)self->_toaNoiseRms);
  objc_msgSend(v8, "appendFormat:", CFSTR(", toaPpwinRms: %d"), (int)self->_toaPpwinRms);
  objc_msgSend(v8, "appendFormat:", CFSTR(", toaPpwinPeak: %d"), (int)self->_toaPpwinPeak);
  objc_msgSend(v8, "appendFormat:", CFSTR(", rttInitiator: %d"), (int)self->_rttInitiator);
  objc_msgSend(v8, "appendFormat:", CFSTR(", tatInitiator: %d"), (int)self->_tatInitiator);
  objc_msgSend(v8, "appendFormat:", CFSTR(", rttResponder: %d"), (int)self->_rttResponder);
  objc_msgSend(v8, "appendFormat:", CFSTR(", tatResponder: %d"), (int)self->_tatResponder);
  cirPacket1 = self->_cirPacket1;
  if (cirPacket1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray description](cirPacket1, "description"));
    objc_msgSend(v8, "appendFormat:", CFSTR(", cirPacket1: %@"), v10);

  }
  objc_msgSend(v8, "appendFormat:", CFSTR(", leadingEdgePacket1: %d"), (int)self->_leadingEdgePacket1);
  objc_msgSend(v8, "appendFormat:", CFSTR(", firstPathIndexPacket1: %d"), (int)self->_firstPathIndexPacket1);
  objc_msgSend(v8, "appendFormat:", CFSTR(", rxAntennaPacket1: %d"), self->_rxAntennaPacket1);
  cirPacket2 = self->_cirPacket2;
  if (cirPacket2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray description](cirPacket2, "description"));
    objc_msgSend(v8, "appendFormat:", CFSTR(", cirPacket1: %@"), v12);

  }
  objc_msgSend(v8, "appendFormat:", CFSTR(", leadingEdgePacket2: %d"), (int)self->_leadingEdgePacket2);
  objc_msgSend(v8, "appendFormat:", CFSTR(", firstPathIndexPacket2: %d"), (int)self->_firstPathIndexPacket2);
  objc_msgSend(v8, "appendFormat:", CFSTR(", rxAntennaPacket2: %d>"), self->_rxAntennaPacket2);
  return v8;
}

- (id)populateOrderedInputFeature
{
  id v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t j;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", CFSTR("%d, %f, %f, %d, %.3f, %.3f"), self->_antennaMask, *(_QWORD *)&self->_timestamp, *(_QWORD *)&self->_uwbTime, (int)self->_tofPicSecond, *(_QWORD *)&self->_rssiDbm, *(_QWORD *)&self->_soiRssiDbm);
  objc_msgSend(v3, "appendFormat:", CFSTR(", %d, %d, %d"), (int)self->_toaNoiseRms, (int)self->_toaPpwinRms, (int)self->_toaPpwinPeak);
  objc_msgSend(v3, "appendFormat:", CFSTR(", %llu, %llu, %llu, %llu"), (unint64_t)self->_rttInitiator, (unint64_t)self->_tatInitiator, (unint64_t)self->_rttResponder, (unint64_t)self->_tatResponder);
  for (i = 0; -[NSArray count](self->_cirPacket1, "count") > i; ++i)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_cirPacket1, "objectAtIndex:", i));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "real"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_cirPacket1, "objectAtIndex:", i));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imag"));

    objc_msgSend(v3, "appendFormat:", CFSTR(", %d, %d"), objc_msgSend(v6, "intValue"), objc_msgSend(v8, "intValue"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(", %d, %d, %d"), (int)self->_leadingEdgePacket1, (int)self->_firstPathIndexPacket1, self->_rxAntennaPacket1);
  for (j = 0; -[NSArray count](self->_cirPacket2, "count") > j; ++j)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_cirPacket2, "objectAtIndex:", j));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "real"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_cirPacket2, "objectAtIndex:", j));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imag"));

    objc_msgSend(v3, "appendFormat:", CFSTR(", %d, %d"), objc_msgSend(v11, "intValue"), objc_msgSend(v13, "intValue"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(", %d, %d, %d"), (int)self->_leadingEdgePacket2, (int)self->_firstPathIndexPacket2, self->_rxAntennaPacket2);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_antennaMask));
  v33 = (unint64_t)objc_msgSend(v43, "hash");
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_uwbTime));
  v31 = (unint64_t)objc_msgSend(v42, "hash");
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp));
  v30 = (unint64_t)objc_msgSend(v41, "hash");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_tofPicSecond));
  v28 = (unint64_t)objc_msgSend(v40, "hash");
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rssiDbm));
  v27 = (unint64_t)objc_msgSend(v39, "hash");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_soiRssiDbm));
  v25 = (unint64_t)objc_msgSend(v38, "hash");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_toaNoiseRms));
  v24 = (unint64_t)objc_msgSend(v37, "hash");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_toaPpwinRms));
  v23 = (unint64_t)objc_msgSend(v36, "hash");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_toaPpwinPeak));
  v21 = (unint64_t)objc_msgSend(v35, "hash");
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rttInitiator));
  v20 = (unint64_t)objc_msgSend(v34, "hash");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_tatInitiator));
  v18 = (unint64_t)objc_msgSend(v32, "hash");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rttResponder));
  v17 = (unint64_t)objc_msgSend(v29, "hash");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_tatResponder));
  v16 = (unint64_t)objc_msgSend(v26, "hash");
  v15 = (unint64_t)-[NSArray hash](self->_cirPacket1, "hash");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_leadingEdgePacket1));
  v14 = (unint64_t)objc_msgSend(v22, "hash");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_firstPathIndexPacket1));
  v3 = (unint64_t)objc_msgSend(v19, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_rxAntennaPacket1));
  v5 = (unint64_t)objc_msgSend(v4, "hash");
  v6 = (unint64_t)-[NSArray hash](self->_cirPacket2, "hash");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_leadingEdgePacket2));
  v8 = (unint64_t)objc_msgSend(v7, "hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_firstPathIndexPacket2));
  v10 = (unint64_t)objc_msgSend(v9, "hash");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_rxAntennaPacket2));
  v12 = v31 ^ v33 ^ v30 ^ v28 ^ v27 ^ v25 ^ v24 ^ v23 ^ v21 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v5 ^ v6 ^ v8 ^ v10 ^ (unint64_t)objc_msgSend(v11, "hash");

  return v12;
}

- (int)antennaMask
{
  return self->_antennaMask;
}

- (void)setAntennaMask:(int)a3
{
  self->_antennaMask = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)uwbTime
{
  return self->_uwbTime;
}

- (void)setUwbTime:(double)a3
{
  self->_uwbTime = a3;
}

- (double)tofPicSecond
{
  return self->_tofPicSecond;
}

- (void)setTofPicSecond:(double)a3
{
  self->_tofPicSecond = a3;
}

- (double)rssiDbm
{
  return self->_rssiDbm;
}

- (void)setRssiDbm:(double)a3
{
  self->_rssiDbm = a3;
}

- (double)soiRssiDbm
{
  return self->_soiRssiDbm;
}

- (void)setSoiRssiDbm:(double)a3
{
  self->_soiRssiDbm = a3;
}

- (double)toaNoiseRms
{
  return self->_toaNoiseRms;
}

- (void)setToaNoiseRms:(double)a3
{
  self->_toaNoiseRms = a3;
}

- (double)toaPpwinRms
{
  return self->_toaPpwinRms;
}

- (void)setToaPpwinRms:(double)a3
{
  self->_toaPpwinRms = a3;
}

- (double)toaPpwinPeak
{
  return self->_toaPpwinPeak;
}

- (void)setToaPpwinPeak:(double)a3
{
  self->_toaPpwinPeak = a3;
}

- (double)rttInitiator
{
  return self->_rttInitiator;
}

- (void)setRttInitiator:(double)a3
{
  self->_rttInitiator = a3;
}

- (double)tatInitiator
{
  return self->_tatInitiator;
}

- (void)setTatInitiator:(double)a3
{
  self->_tatInitiator = a3;
}

- (double)rttResponder
{
  return self->_rttResponder;
}

- (void)setRttResponder:(double)a3
{
  self->_rttResponder = a3;
}

- (double)tatResponder
{
  return self->_tatResponder;
}

- (void)setTatResponder:(double)a3
{
  self->_tatResponder = a3;
}

- (NSArray)cirPacket1
{
  return self->_cirPacket1;
}

- (void)setCirPacket1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (double)leadingEdgePacket1
{
  return self->_leadingEdgePacket1;
}

- (void)setLeadingEdgePacket1:(double)a3
{
  self->_leadingEdgePacket1 = a3;
}

- (double)firstPathIndexPacket1
{
  return self->_firstPathIndexPacket1;
}

- (void)setFirstPathIndexPacket1:(double)a3
{
  self->_firstPathIndexPacket1 = a3;
}

- (int)rxAntennaPacket1
{
  return self->_rxAntennaPacket1;
}

- (void)setRxAntennaPacket1:(int)a3
{
  self->_rxAntennaPacket1 = a3;
}

- (NSArray)cirPacket2
{
  return self->_cirPacket2;
}

- (void)setCirPacket2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (double)leadingEdgePacket2
{
  return self->_leadingEdgePacket2;
}

- (void)setLeadingEdgePacket2:(double)a3
{
  self->_leadingEdgePacket2 = a3;
}

- (double)firstPathIndexPacket2
{
  return self->_firstPathIndexPacket2;
}

- (void)setFirstPathIndexPacket2:(double)a3
{
  self->_firstPathIndexPacket2 = a3;
}

- (int)rxAntennaPacket2
{
  return self->_rxAntennaPacket2;
}

- (void)setRxAntennaPacket2:(int)a3
{
  self->_rxAntennaPacket2 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cirPacket2, 0);
  objc_storeStrong((id *)&self->_cirPacket1, 0);
}

@end
