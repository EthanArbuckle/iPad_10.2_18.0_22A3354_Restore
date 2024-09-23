@implementation NIGnssExtensionsManager

- (NIGnssExtensionsManager)initWithQueue:(id)a3 bundleId:(id)a4 reason:(id)a5
{
  id v9;
  id v10;
  id v11;
  NIGnssExtensionsManager *v12;
  NIGnssExtensionsManager *v13;
  OS_dispatch_queue *fQueue;
  NIGnssExtensionsManager *v15;
  CLGnssExtensionsClient *v16;
  CLGnssExtensionsClient *fAssertion;
  NIGnssExtensionsManager *v18;
  _QWORD v20[4];
  NIGnssExtensionsManager *v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NIGnssExtensionsManager;
  v12 = -[NIGnssExtensionsManager init](&v22, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->fQueue, a3);
    fQueue = v13->fQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002D166C;
    v20[3] = &unk_1008130C8;
    v15 = v13;
    v21 = v15;
    v16 = (CLGnssExtensionsClient *)+[CLGnssExtensionsClient newAssertionForBundleIdentifier:withReason:withCallbackQueue:andBlock:](CLGnssExtensionsClient, "newAssertionForBundleIdentifier:withReason:withCallbackQueue:andBlock:", v10, v11, fQueue, v20);
    fAssertion = v15->fAssertion;
    v15->fAssertion = v16;

    v18 = v15;
  }

  return v13;
}

- (NIGnssExtensionsManager)initWithQueue:(id)a3 bundle:(id)a4 reason:(id)a5
{
  id v9;
  id v10;
  id v11;
  NIGnssExtensionsManager *v12;
  NIGnssExtensionsManager *v13;
  OS_dispatch_queue *fQueue;
  NIGnssExtensionsManager *v15;
  CLGnssExtensionsClient *v16;
  CLGnssExtensionsClient *fAssertion;
  NIGnssExtensionsManager *v18;
  _QWORD v20[4];
  NIGnssExtensionsManager *v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NIGnssExtensionsManager;
  v12 = -[NIGnssExtensionsManager init](&v22, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->fQueue, a3);
    fQueue = v13->fQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002D18C8;
    v20[3] = &unk_1008130C8;
    v15 = v13;
    v21 = v15;
    v16 = (CLGnssExtensionsClient *)+[CLGnssExtensionsClient newAssertionForBundle:withReason:withCallbackQueue:andBlock:](CLGnssExtensionsClient, "newAssertionForBundle:withReason:withCallbackQueue:andBlock:", v10, v11, fQueue, v20);
    fAssertion = v15->fAssertion;
    v15->fAssertion = v16;

    v18 = v15;
  }

  return v13;
}

+ (vector<nearby::algorithms::finding::GnssSatelliteData,)getGnssSatelliteDataVecFromDict:(id)a2
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  BOOL v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  GnssSatelliteData *var1;
  GnssSatelliteData *var0;
  GnssSatelliteData *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  GnssSatelliteData *v42;
  GnssSatelliteData *v43;
  GnssSatelliteData *v44;
  __int128 v45;
  __int128 v46;
  vector<nearby::algorithms::finding::GnssSatelliteData, std::allocator<nearby::algorithms::finding::GnssSatelliteData>> *result;
  id v48;

  v48 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKey:", CFSTR("data")));
  v6 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  retstr->var1 = 0;
  while ((unint64_t)objc_msgSend(v5, "count") > v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("satSystem")));
    v9 = objc_msgSend(v8, "intValue");

    if (v9 - 1 >= 6)
      v10 = 0;
    else
      v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("satId")));
    v12 = objc_msgSend(v11, "intValue");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("elevationDeg")));
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("azimuthDeg")));
    objc_msgSend(v16, "floatValue");
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("l1Cn0")));
    objc_msgSend(v19, "floatValue");
    v21 = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("l5Cn0")));
    objc_msgSend(v22, "floatValue");
    v24 = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("isPhaseTracked")));
    v26 = objc_msgSend(v25, "intValue") == 1;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("isTracked")));
    v28 = v15;
    v29 = v18;
    v30 = v21;
    v31 = v24;
    v32 = objc_msgSend(v27, "intValue") == 1;

    var1 = retstr->var1;
    var0 = retstr->var2.var0;
    if (var1 >= var0)
    {
      v36 = 0xAAAAAAAAAAAAAAABLL * ((var1 - retstr->var0) >> 4);
      v37 = v36 + 1;
      if (v36 + 1 > 0x555555555555555)
        sub_100026E7C();
      v38 = 0xAAAAAAAAAAAAAAABLL * ((var0 - retstr->var0) >> 4);
      if (2 * v38 > v37)
        v37 = 2 * v38;
      if (v38 >= 0x2AAAAAAAAAAAAAALL)
        v39 = 0x555555555555555;
      else
        v39 = v37;
      if (v39)
        v40 = (char *)sub_1002D1DB8((uint64_t)&retstr->var2, v39);
      else
        v40 = 0;
      v41 = &v40[48 * v36];
      *(_DWORD *)v41 = v10;
      *((_DWORD *)v41 + 1) = v12;
      *((double *)v41 + 1) = v28;
      *((double *)v41 + 2) = v29;
      *((double *)v41 + 3) = v30;
      *((double *)v41 + 4) = v31;
      v41[40] = v26;
      v41[41] = v32;
      v43 = retstr->var0;
      v42 = retstr->var1;
      v44 = (GnssSatelliteData *)v41;
      if (v42 != retstr->var0)
      {
        do
        {
          v45 = *((_OWORD *)v42 - 3);
          v46 = *((_OWORD *)v42 - 1);
          *((_OWORD *)v44 - 2) = *((_OWORD *)v42 - 2);
          *((_OWORD *)v44 - 1) = v46;
          *((_OWORD *)v44 - 3) = v45;
          v44 = (GnssSatelliteData *)((char *)v44 - 48);
          v42 = (GnssSatelliteData *)((char *)v42 - 48);
        }
        while (v42 != v43);
        v42 = v43;
      }
      v35 = (GnssSatelliteData *)(v41 + 48);
      retstr->var0 = v44;
      retstr->var1 = (GnssSatelliteData *)(v41 + 48);
      retstr->var2.var0 = (GnssSatelliteData *)&v40[48 * v39];
      if (v42)
        operator delete(v42);
    }
    else
    {
      *(_DWORD *)var1 = v10;
      *((_DWORD *)var1 + 1) = v12;
      *((double *)var1 + 1) = v28;
      *((double *)var1 + 2) = v29;
      *((double *)var1 + 3) = v30;
      *((double *)var1 + 4) = v31;
      *((_BYTE *)var1 + 40) = v26;
      v35 = (GnssSatelliteData *)((char *)var1 + 48);
      *((_BYTE *)var1 + 41) = v32;
    }
    retstr->var1 = v35;

    ++v6;
  }

  return result;
}

- (void)invalidate
{
  -[CLGnssExtensionsClient invalidate](self->fAssertion, "invalidate");
}

- (GnssExtensionsCallbackDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (GnssExtensionsCallbackDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fAssertion, 0);
  objc_storeStrong((id *)&self->fQueue, 0);
}

@end
