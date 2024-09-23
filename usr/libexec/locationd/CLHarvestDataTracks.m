@implementation CLHarvestDataTracks

- (CLHarvestDataTracks)initWithCoder:(id)a3
{
  uint64_t v4;
  CLHarvestDataTracks *v5;
  id v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  _OWORD v20[8];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _OWORD v31[8];
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  _OWORD v42[8];
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  _OWORD v53[8];
  _OWORD v54[2];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _OWORD v63[2];
  objc_super v64;

  v64.receiver = self;
  v64.super_class = (Class)CLHarvestDataTracks;
  v5 = -[CLHarvestDataTracks init](&v64, "init");
  if (v5)
  {
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(CLLocation, v4), CFSTR("LocationKey"));
    if (v6)
    {
      objc_msgSend(v6, "clientLocation");
    }
    else
    {
      v62 = 0u;
      memset(v63, 0, 28);
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v55 = 0u;
    }
    v53[6] = v61;
    v53[7] = v62;
    v54[0] = v63[0];
    *(_OWORD *)((char *)v54 + 12) = *(_OWORD *)((char *)v63 + 12);
    v53[2] = v57;
    v53[3] = v58;
    v53[4] = v59;
    v53[5] = v60;
    v53[0] = v55;
    v53[1] = v56;
    -[CLHarvestDataTracks setLocation:](v5, "setLocation:", v53);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("TripTimestampKey"));
    -[CLHarvestDataTracks setTripTimestamp:](v5, "setTripTimestamp:", v7);
    -[CLHarvestDataTracks setTripId:](v5, "setTripId:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v8), CFSTR("TripIdKey")));
    -[CLHarvestDataTracks setRat:](v5, "setRat:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("RatKey")));
    -[CLHarvestDataTracks setMcc:](v5, "setMcc:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("MccKey")));
    -[CLHarvestDataTracks setMnc:](v5, "setMnc:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("MncKey")));
    -[CLHarvestDataTracks setContext:](v5, "setContext:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("ContextKey")));
    -[CLHarvestDataTracks setBundleId:](v5, "setBundleId:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v9), CFSTR("BundleIdKey")));
    -[CLHarvestDataTracks setBundleIds:](v5, "setBundleIds:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("BundleIdsKey")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("ModeIndicatorKey")))
      v11 = (uint64_t)objc_msgSend(a3, "decodeIntForKey:", CFSTR("ModeIndicatorKey"));
    else
      v11 = 78;
    -[CLHarvestDataTracks setModeIndicator:](v5, "setModeIndicator:", v11);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("ActiveAccessoryKey")))
      -[CLHarvestDataTracks setActiveAccessory:](v5, "setActiveAccessory:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(CLPAccessoryMeta, v12), CFSTR("ActiveAccessoryKey")));
    -[CLHarvestDataTracks setIsProactiveLocationSession:](v5, "setIsProactiveLocationSession:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("IsProactiveLocationSessionKey")));
    -[CLHarvestDataTracks setMotionVehicleConnectedStateChanged:](v5, "setMotionVehicleConnectedStateChanged:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("MotionVehicleStateChangedKey")));
    -[CLHarvestDataTracks setMotionVehicleConnected:](v5, "setMotionVehicleConnected:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("MotionVehicleKey")));
    v14 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(CLHarvestDataMotionActivity, v13), CFSTR("RawMotionActivityKey"));
    if (v14)
    {
      objc_msgSend(v14, "activity");
    }
    else
    {
      v52 = 0;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
    }
    v42[6] = v50;
    v42[7] = v51;
    v43 = v52;
    v42[2] = v46;
    v42[3] = v47;
    v42[4] = v48;
    v42[5] = v49;
    v42[0] = v44;
    v42[1] = v45;
    -[CLHarvestDataTracks setRawMotionActivity:](v5, "setRawMotionActivity:", v42);
    v16 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(CLHarvestDataMotionActivity, v15), CFSTR("MotionActivityKey"));
    if (v16)
    {
      objc_msgSend(v16, "activity");
    }
    else
    {
      v41 = 0;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
    }
    v31[6] = v39;
    v31[7] = v40;
    v32 = v41;
    v31[2] = v35;
    v31[3] = v36;
    v31[4] = v37;
    v31[5] = v38;
    v31[0] = v33;
    v31[1] = v34;
    -[CLHarvestDataTracks setMotionActivity:](v5, "setMotionActivity:", v31);
    v18 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(CLHarvestDataMotionActivity, v17), CFSTR("DominantMotionActivityKey"));
    if (v18)
    {
      objc_msgSend(v18, "activity");
    }
    else
    {
      v30 = 0;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
    }
    v20[6] = v28;
    v20[7] = v29;
    v21 = v30;
    v20[2] = v24;
    v20[3] = v25;
    v20[4] = v26;
    v20[5] = v27;
    v20[0] = v22;
    v20[1] = v23;
    -[CLHarvestDataTracks setDominantMotionActivity:](v5, "setDominantMotionActivity:", v20);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  id v6;
  double v7;
  CLHarvestDataMotionActivity *v8;
  CLHarvestDataMotionActivity *v9;
  CLHarvestDataMotionActivity *v10;
  CLHarvestDataMotionActivity *v11;
  CLHarvestDataMotionActivity *v12;
  CLHarvestDataMotionActivity *v13;
  _OWORD v14[8];
  uint64_t v15;
  _OWORD v16[8];
  uint64_t v17;
  _OWORD v18[8];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[2];
  _OWORD v29[8];
  _OWORD v30[2];

  v5 = objc_alloc((Class)CLLocation);
  if (self)
  {
    -[CLHarvestDataTracks location](self, "location");
  }
  else
  {
    v27 = 0u;
    memset(v28, 0, 28);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
  }
  v29[6] = v26;
  v29[7] = v27;
  v30[0] = v28[0];
  *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)((char *)v28 + 12);
  v29[2] = v22;
  v29[3] = v23;
  v29[4] = v24;
  v29[5] = v25;
  v29[0] = v20;
  v29[1] = v21;
  v6 = objc_msgSend(v5, "initWithClientLocation:", v29);
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("LocationKey"));

  -[CLHarvestDataTracks tripTimestamp](self, "tripTimestamp");
  *(float *)&v7 = v7;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("TripTimestampKey"), v7);
  objc_msgSend(a3, "encodeObject:forKey:", -[CLHarvestDataTracks tripId](self, "tripId"), CFSTR("TripIdKey"));
  objc_msgSend(a3, "encodeInt:forKey:", -[CLHarvestDataTracks rat](self, "rat"), CFSTR("RatKey"));
  objc_msgSend(a3, "encodeInt:forKey:", -[CLHarvestDataTracks mcc](self, "mcc"), CFSTR("MccKey"));
  objc_msgSend(a3, "encodeInt:forKey:", -[CLHarvestDataTracks mnc](self, "mnc"), CFSTR("MncKey"));
  objc_msgSend(a3, "encodeInt:forKey:", -[CLHarvestDataTracks context](self, "context"), CFSTR("ContextKey"));
  objc_msgSend(a3, "encodeObject:forKey:", -[CLHarvestDataTracks bundleId](self, "bundleId"), CFSTR("BundleIdKey"));
  objc_msgSend(a3, "encodeObject:forKey:", -[CLHarvestDataTracks bundleIds](self, "bundleIds"), CFSTR("BundleIdsKey"));
  objc_msgSend(a3, "encodeInt:forKey:", -[CLHarvestDataTracks modeIndicator](self, "modeIndicator"), CFSTR("ModeIndicatorKey"));
  objc_msgSend(a3, "encodeObject:forKey:", -[CLHarvestDataTracks activeAccessory](self, "activeAccessory"), CFSTR("ActiveAccessoryKey"));
  objc_msgSend(a3, "encodeBool:forKey:", -[CLHarvestDataTracks isProactiveLocationSession](self, "isProactiveLocationSession"), CFSTR("IsProactiveLocationSessionKey"));
  objc_msgSend(a3, "encodeBool:forKey:", -[CLHarvestDataTracks motionVehicleConnectedStateChanged](self, "motionVehicleConnectedStateChanged"), CFSTR("MotionVehicleStateChangedKey"));
  objc_msgSend(a3, "encodeBool:forKey:", -[CLHarvestDataTracks motionVehicleConnected](self, "motionVehicleConnected"), CFSTR("MotionVehicleKey"));
  v8 = [CLHarvestDataMotionActivity alloc];
  if (self)
  {
    -[CLHarvestDataTracks rawMotionActivity](self, "rawMotionActivity");
  }
  else
  {
    v19 = 0;
    memset(v18, 0, sizeof(v18));
  }
  v9 = -[CLHarvestDataMotionActivity initWithMotionActivity:](v8, "initWithMotionActivity:", v18);
  objc_msgSend(a3, "encodeObject:forKey:", v9, CFSTR("RawMotionActivityKey"));

  v10 = [CLHarvestDataMotionActivity alloc];
  if (self)
  {
    -[CLHarvestDataTracks motionActivity](self, "motionActivity");
  }
  else
  {
    v17 = 0;
    memset(v16, 0, sizeof(v16));
  }
  v11 = -[CLHarvestDataMotionActivity initWithMotionActivity:](v10, "initWithMotionActivity:", v16);
  objc_msgSend(a3, "encodeObject:forKey:", v11, CFSTR("MotionActivityKey"));

  v12 = [CLHarvestDataMotionActivity alloc];
  if (self)
  {
    -[CLHarvestDataTracks dominantMotionActivity](self, "dominantMotionActivity");
  }
  else
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
  }
  v13 = -[CLHarvestDataMotionActivity initWithMotionActivity:](v12, "initWithMotionActivity:", v14);
  objc_msgSend(a3, "encodeObject:forKey:", v13, CFSTR("DominantMotionActivityKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHarvestDataTracks)initWithTracksData:(HarvestData *)a3 andLocation:
{
  _OWORD *v3;
  _OWORD *v4;
  CLHarvestDataTracks *v6;
  CLHarvestDataTracks *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_var1;
  HarvestData *v13;
  _QWORD *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v28[8];
  uint64_t v29;
  _OWORD v30[8];
  uint64_t v31;
  _OWORD v32[8];
  int64_t var0;
  _OWORD v34[8];
  _OWORD v35[2];
  objc_super v36;

  v4 = v3;
  v36.receiver = self;
  v36.super_class = (Class)CLHarvestDataTracks;
  v6 = -[CLHarvestDataTracks init](&v36, "init");
  v7 = v6;
  if (v6)
  {
    v8 = v4[7];
    v34[6] = v4[6];
    v34[7] = v8;
    v35[0] = v4[8];
    *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)((char *)v4 + 140);
    v9 = v4[3];
    v34[2] = v4[2];
    v34[3] = v9;
    v10 = v4[5];
    v34[4] = v4[4];
    v34[5] = v10;
    v11 = v4[1];
    v34[0] = *v4;
    v34[1] = v11;
    -[CLHarvestDataTracks setLocation:](v6, "setLocation:", v34);
    -[CLHarvestDataTracks setTripTimestamp:](v7, "setTripTimestamp:", a3->var0);
    p_var1 = &a3->var1;
    if (*((char *)&a3->var1.__r_.__value_.var0.var1 + 23) < 0)
      p_var1 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_var1->__r_.__value_.var0.var1.__data_;
    -[CLHarvestDataTracks setTripId:](v7, "setTripId:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_var1));
    -[CLHarvestDataTracks setRat:](v7, "setRat:", a3->var1.__r_.var0);
    -[CLHarvestDataTracks setMcc:](v7, "setMcc:", *(unsigned int *)&a3->var1.__r_.var1);
    -[CLHarvestDataTracks setMnc:](v7, "setMnc:", LODWORD(a3->var1.var0));
    -[CLHarvestDataTracks setContext:](v7, "setContext:", HIDWORD(a3->var1.var0));
    v13 = a3 + 1;
    if (a3[1].var1.__r_.__value_.var0.var0.__data_[15] < 0)
      v13 = *(HarvestData **)&v13->var0;
    -[CLHarvestDataTracks setBundleId:](v7, "setBundleId:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
    v14 = &a3[1].var1.__r_.__value_.var0.var1 + 1;
    if (SHIBYTE(a3[1].var1.var0) < 0)
      v14 = (_QWORD *)*v14;
    -[CLHarvestDataTracks setBundleIds:](v7, "setBundleIds:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v14));
    -[CLHarvestDataTracks setIsProactiveLocationSession:](v7, "setIsProactiveLocationSession:", BYTE4(a3[2].var0));
    -[CLHarvestDataTracks setMotionVehicleConnectedStateChanged:](v7, "setMotionVehicleConnectedStateChanged:", BYTE5(a3[2].var0));
    -[CLHarvestDataTracks setMotionVehicleConnected:](v7, "setMotionVehicleConnected:", BYTE6(a3[2].var0));
    v15 = *(_OWORD *)&a3[3].var1.var0;
    v16 = *((_OWORD *)&a3[4].var1.__r_.__value_.var0.var1 + 1);
    v32[6] = *(_OWORD *)a3[4].var1.__r_.__value_.var0.var0.__data_;
    v32[7] = v16;
    var0 = a3[4].var1.var0;
    v17 = *((_OWORD *)&a3[2].var1.__r_.__value_.var0.var1 + 1);
    v18 = *(_OWORD *)a3[3].var1.__r_.__value_.var0.var0.__data_;
    v32[2] = *(_OWORD *)&a3[2].var1.var0;
    v32[3] = v18;
    v32[4] = *((_OWORD *)&a3[3].var1.__r_.__value_.var0.var1 + 1);
    v32[5] = v15;
    v32[0] = *(_OWORD *)a3[2].var1.__r_.__value_.var0.var0.__data_;
    v32[1] = v17;
    -[CLHarvestDataTracks setRawMotionActivity:](v7, "setRawMotionActivity:", v32);
    v19 = *(_OWORD *)&a3[7].var1.__r_.__value_.var0.var1.__size_;
    v30[6] = *(_OWORD *)&a3[7].var0;
    v30[7] = v19;
    v31 = *(_QWORD *)&a3[7].var1.__r_.var0;
    v20 = *(_OWORD *)&a3[6].var0;
    v30[2] = *(_OWORD *)&a3[5].var1.__r_.var0;
    v30[3] = v20;
    v21 = *(_OWORD *)&a3[6].var1.__r_.var0;
    v30[4] = *(_OWORD *)&a3[6].var1.__r_.__value_.var0.var1.__size_;
    v30[5] = v21;
    v22 = *(_OWORD *)&a3[5].var1.__r_.__value_.var0.var1.__size_;
    v30[0] = *(_OWORD *)&a3[5].var0;
    v30[1] = v22;
    -[CLHarvestDataTracks setMotionActivity:](v7, "setMotionActivity:", v30);
    v23 = *(_OWORD *)a3[10].var1.__r_.__value_.var0.var0.__data_;
    v28[6] = *(_OWORD *)&a3[9].var1.var0;
    v28[7] = v23;
    v29 = *((_QWORD *)&a3[10].var1.__r_.__value_.var0.var1 + 2);
    v24 = *(_OWORD *)&a3[8].var1.var0;
    v28[2] = *((_OWORD *)&a3[8].var1.__r_.__value_.var0.var1 + 1);
    v28[3] = v24;
    v25 = *((_OWORD *)&a3[9].var1.__r_.__value_.var0.var1 + 1);
    v28[4] = *(_OWORD *)a3[9].var1.__r_.__value_.var0.var0.__data_;
    v28[5] = v25;
    v26 = *(_OWORD *)a3[8].var1.__r_.__value_.var0.var0.__data_;
    v28[0] = *(_OWORD *)&a3[7].var1.var0;
    v28[1] = v26;
    -[CLHarvestDataTracks setDominantMotionActivity:](v7, "setDominantMotionActivity:", v28);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHarvestDataTracks;
  -[CLHarvestDataTracks dealloc](&v3, "dealloc");
}

- (id)jsonObject
{
  id v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[2];
  _OWORD v14[8];
  _OWORD v15[2];
  _QWORD v16[11];
  _QWORD v17[11];

  v16[0] = CFSTR("location");
  v3 = objc_alloc((Class)CLLocation);
  if (self)
  {
    -[CLHarvestDataTracks location](self, "location");
  }
  else
  {
    v12 = 0u;
    memset(v13, 0, 28);
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v5 = 0u;
  }
  v14[6] = v11;
  v14[7] = v12;
  v15[0] = v13[0];
  *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)((char *)v13 + 12);
  v14[2] = v7;
  v14[3] = v8;
  v14[4] = v9;
  v14[5] = v10;
  v14[0] = v5;
  v14[1] = v6;
  v17[0] = objc_msgSend(objc_msgSend(v3, "initWithClientLocation:", v14, v5, v6, v7, v8, v9, v10, v11, v12, v13[0], *(_QWORD *)&v13[1], *((_QWORD *)&v13[1] + 1)), "jsonObject");
  v16[1] = CFSTR("tripTimestamp");
  -[CLHarvestDataTracks tripTimestamp](self, "tripTimestamp");
  v17[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v16[2] = CFSTR("tripId");
  v17[2] = -[CLHarvestDataTracks tripId](self, "tripId");
  v16[3] = CFSTR("rat");
  v17[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLHarvestDataTracks rat](self, "rat"));
  v16[4] = CFSTR("mcc");
  v17[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLHarvestDataTracks mcc](self, "mcc"));
  v16[5] = CFSTR("mnc");
  v17[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLHarvestDataTracks mnc](self, "mnc"));
  v16[6] = CFSTR("context");
  v17[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLHarvestDataTracks context](self, "context"));
  v16[7] = CFSTR("bundleId");
  v17[7] = -[CLHarvestDataTracks bundleId](self, "bundleId");
  v16[8] = CFSTR("bundleIds");
  v17[8] = -[CLHarvestDataTracks bundleIds](self, "bundleIds");
  v16[9] = CFSTR("modeIndicator");
  v17[9] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[CLHarvestDataTracks modeIndicator](self, "modeIndicator"));
  v16[10] = CFSTR("isProactiveLocationSession");
  v17[10] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLHarvestDataTracks isProactiveLocationSession](self, "isProactiveLocationSession"));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 11);
}

- (id)description
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", -[CLHarvestDataTracks jsonObject](self, "jsonObject"), 0, 0), 4);
}

- (CLDaemonLocation)location
{
  $AB5116BA7E623E054F959CECB034F4E7 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)&self[3].course;
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)&self[3].speed;
  retstr->rawCoordinate = v3;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&self[3].timestamp;
  v4 = *(_OWORD *)&self[3].suitability;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self[2].ellipsoidalAltitude;
  *(_OWORD *)&retstr->speed = v4;
  v5 = *(_OWORD *)&self[3].altitude;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self[3].coordinate.longitude;
  *(_OWORD *)&retstr->timestamp = v5;
  v6 = *(_OWORD *)&self[2].referenceFrame;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self[2].rawCourse;
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)(&self[3].confidence + 1);
  return self;
}

- (void)setLocation:(CLDaemonLocation *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v9;

  v3 = *(_OWORD *)&a3->coordinate.longitude;
  *(_OWORD *)&self->_location.suitability = *(_OWORD *)&a3->suitability;
  *(_OWORD *)&self->_location.coordinate.longitude = v3;
  v4 = *(_OWORD *)&a3->altitude;
  v5 = *(_OWORD *)&a3->speed;
  v6 = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)&self->_location.course = *(_OWORD *)&a3->course;
  *(_OWORD *)&self->_location.timestamp = v6;
  *(_OWORD *)&self->_location.altitude = v4;
  *(_OWORD *)&self->_location.speed = v5;
  v7 = *(_OWORD *)&a3->lifespan;
  rawCoordinate = a3->rawCoordinate;
  v9 = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)&self->_location.integrity = *(_OWORD *)&a3->integrity;
  self->_location.rawCoordinate = rawCoordinate;
  *(_OWORD *)&self->_location.rawCourse = v9;
  *(_OWORD *)&self->_location.lifespan = v7;
}

- (double)tripTimestamp
{
  return self->_tripTimestamp;
}

- (void)setTripTimestamp:(double)a3
{
  self->_tripTimestamp = a3;
}

- (NSString)tripId
{
  return self->_tripId;
}

- (void)setTripId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)rat
{
  return self->_rat;
}

- (void)setRat:(int)a3
{
  self->_rat = a3;
}

- (int)mcc
{
  return self->_mcc;
}

- (void)setMcc:(int)a3
{
  self->_mcc = a3;
}

- (int)mnc
{
  return self->_mnc;
}

- (void)setMnc:(int)a3
{
  self->_mnc = a3;
}

- (int)context
{
  return self->_context;
}

- (void)setContext:(int)a3
{
  self->_context = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)modeIndicator
{
  return self->_modeIndicator;
}

- (void)setModeIndicator:(int)a3
{
  self->_modeIndicator = a3;
}

- (CLPAccessoryMeta)activeAccessory
{
  return self->_activeAccessory;
}

- (void)setActiveAccessory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)isProactiveLocationSession
{
  return self->_isProactiveLocationSession;
}

- (void)setIsProactiveLocationSession:(BOOL)a3
{
  self->_isProactiveLocationSession = a3;
}

- (BOOL)motionVehicleConnectedStateChanged
{
  return self->_motionVehicleConnectedStateChanged;
}

- (void)setMotionVehicleConnectedStateChanged:(BOOL)a3
{
  self->_motionVehicleConnectedStateChanged = a3;
}

- (BOOL)motionVehicleConnected
{
  return self->_motionVehicleConnected;
}

- (void)setMotionVehicleConnected:(BOOL)a3
{
  self->_motionVehicleConnected = a3;
}

- (CLMotionActivity)rawMotionActivity
{
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v10 = *(_OWORD *)&self[1].fsmTransitionData.fConsecStatic;
  v11 = *(_OWORD *)&self[2].conservativeMountedProbability;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[2].source;
  *(_OWORD *)&retstr[1].isStanding = v11;
  *(double *)&retstr[1].isVehicleConnected = self[2].timestamp;
  v12 = *(_OWORD *)&self[1].source;
  v13 = *(_OWORD *)&self[1].timestamp;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self[1].conservativeMountedProbability;
  *(_OWORD *)&retstr->isVehicleConnected = v13;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[1].estExitTime;
  *(_OWORD *)&retstr[1].type = v10;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self->fsmTransitionData.fConsecStatic;
  *(_OWORD *)&retstr->mountedConfidence = v12;
  return self;
}

- (void)setRawMotionActivity:(CLMotionActivity *)a3
{
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_OWORD *)&self->_rawMotionActivity.type = *(_OWORD *)&a3->type;
  v12 = *(_OWORD *)&a3->mountedConfidence;
  v13 = *(_OWORD *)&a3->isStanding;
  v14 = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_rawMotionActivity.vehicleType = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_rawMotionActivity.isVehicleConnected = v14;
  *(_OWORD *)&self->_rawMotionActivity.isStanding = v13;
  *(_OWORD *)&self->_rawMotionActivity.mountedConfidence = v12;
  v15 = *(_OWORD *)&a3[1].type;
  v16 = *(_OWORD *)&a3[1].mountedConfidence;
  v17 = *(_OWORD *)&a3[1].isStanding;
  *(_QWORD *)&self->_anon_98[48] = *(_QWORD *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self->_anon_98[32] = v17;
  *(_OWORD *)&self->_anon_98[16] = v16;
  *(_OWORD *)self->_anon_98 = v15;
}

- (CLMotionActivity)motionActivity
{
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v10 = *(_OWORD *)&self[4].type;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[3].vehicleType;
  *(_OWORD *)&retstr[1].isStanding = v10;
  *(_QWORD *)&retstr[1].isVehicleConnected = *(_QWORD *)&self[4].mountedConfidence;
  v11 = *(_OWORD *)&self[3].mountedConfidence;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self[3].type;
  *(_OWORD *)&retstr->isVehicleConnected = v11;
  v12 = *(_OWORD *)&self[3].isVehicleConnected;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[3].isStanding;
  *(_OWORD *)&retstr[1].type = v12;
  v13 = *(_OWORD *)&self[2].vehicleType;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self[2].isVehicleConnected;
  *(_OWORD *)&retstr->mountedConfidence = v13;
  return self;
}

- (void)setMotionActivity:(CLMotionActivity *)a3
{
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_OWORD *)&self->_motionActivity.type = *(_OWORD *)&a3->type;
  v12 = *(_OWORD *)&a3->mountedConfidence;
  v13 = *(_OWORD *)&a3->isStanding;
  v14 = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_motionActivity.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_motionActivity.vehicleType = v14;
  *(_OWORD *)&self->_motionActivity.mountedConfidence = v12;
  *(_OWORD *)&self->_motionActivity.isStanding = v13;
  v15 = *(_OWORD *)&a3[1].type;
  v16 = *(_OWORD *)&a3[1].mountedConfidence;
  v17 = *(_OWORD *)&a3[1].isStanding;
  *(_QWORD *)&self->_anon_120[48] = *(_QWORD *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self->_anon_120[16] = v16;
  *(_OWORD *)&self->_anon_120[32] = v17;
  *(_OWORD *)self->_anon_120 = v15;
}

- (CLMotionActivity)dominantMotionActivity
{
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  *(_QWORD *)&retstr[1].isVehicleConnected = *(_QWORD *)&self[5].fsmTransitionData.fConsecStatic;
  v10 = *(_OWORD *)&self[5].estExitTime;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[5].timestamp;
  *(_OWORD *)&retstr[1].isStanding = v10;
  v11 = *(_OWORD *)&self[4].fsmTransitionData.fConsecStatic;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self[4].estExitTime;
  *(_OWORD *)&retstr->isVehicleConnected = v11;
  v12 = *(_OWORD *)&self[5].conservativeMountedProbability;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[5].source;
  *(_OWORD *)&retstr[1].type = v12;
  v13 = *(_OWORD *)&self[4].timestamp;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self[4].conservativeMountedProbability;
  *(_OWORD *)&retstr->mountedConfidence = v13;
  return self;
}

- (void)setDominantMotionActivity:(CLMotionActivity *)a3
{
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_OWORD *)&self->_dominantMotionActivity.type = *(_OWORD *)&a3->type;
  v12 = *(_OWORD *)&a3->mountedConfidence;
  v13 = *(_OWORD *)&a3->isStanding;
  v14 = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_dominantMotionActivity.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_dominantMotionActivity.vehicleType = v14;
  *(_OWORD *)&self->_dominantMotionActivity.mountedConfidence = v12;
  *(_OWORD *)&self->_dominantMotionActivity.isStanding = v13;
  v15 = *(_OWORD *)&a3[1].type;
  v16 = *(_OWORD *)&a3[1].mountedConfidence;
  v17 = *(_OWORD *)&a3[1].isStanding;
  *(_QWORD *)&self->_anon_1a8[48] = *(_QWORD *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self->_anon_1a8[16] = v16;
  *(_OWORD *)&self->_anon_1a8[32] = v17;
  *(_OWORD *)self->_anon_1a8 = v15;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 120) = 0xFFFF;
  *(_OWORD *)((char *)self + 484) = 0u;
  __asm { FMOV            V2.2D, #-1.0 }
  *(_OWORD *)((char *)self + 500) = xmmword_101BAFC90;
  *(_OWORD *)((char *)self + 516) = _Q2;
  *(_OWORD *)((char *)self + 532) = _Q2;
  *(_OWORD *)((char *)self + 548) = _Q2;
  *((_DWORD *)self + 141) = 0;
  *((_QWORD *)self + 71) = 0xBFF0000000000000;
  *((_OWORD *)self + 36) = 0u;
  *((_DWORD *)self + 148) = 0;
  *(_QWORD *)((char *)self + 596) = 0xBFF0000000000000;
  *((_DWORD *)self + 151) = 0x7FFFFFFF;
  *((_QWORD *)self + 76) = 0;
  *((_QWORD *)self + 78) = 0;
  *((_QWORD *)self + 77) = 0;
  *((_BYTE *)self + 632) = 0;
  return self;
}

@end
