@implementation RangeBiasEstimatorSingleAntennaModel

- (RangeBiasEstimatorSingleAntennaModel)init
{
  RangeBiasEstimatorSingleAntennaModel *v2;
  uint64_t i;
  void **v4;
  void **v5;
  uint64_t j;
  void **v7;
  void **v8;
  NSNumber *remoteTxAntennaMask;
  NSNumber *biasCorrectionEstimate;
  NeuralNetworkModelWithDataTransformer *neuralNetworkRangeBiasEstimatorModelAntennaMask1;
  NeuralNetworkModelWithDataTransformer *neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  RangeBiasEstimatorSingleAntennaModel *v13;
  __int128 v15;
  NIMLModelResource *v16;
  __int128 v17;
  NIMLModelResource *v18;
  void *v19[2];
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  int v23;
  void *v24;
  char v25;
  char v26;
  void *__p;
  char v28;
  char v29;
  void *v30[2];
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  int v34;
  void *v35;
  char v36;
  char v37;
  void *v38;
  char v39;
  char v40;
  void *v41[2];
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  int v45;
  void *v46;
  char v47;
  char v48;
  void *v49;
  char v50;
  char v51;
  void *__dst[2];
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  int v56;
  void *v57;
  char v58;
  char v59;
  void *v60;
  char v61;
  char v62;
  objc_super v63;
  void **v64;
  char v65;
  __int128 v66[7];
  char v67[120];
  __int128 v68[7];
  char v69[120];
  __int128 v70;

  v63.receiver = self;
  v63.super_class = (Class)RangeBiasEstimatorSingleAntennaModel;
  v2 = -[RangeBiasEstimatorSingleAntennaModel init](&v63, "init");

  if (v2)
  {
    if (byte_10085E1E7 < 0)
    {
      sub_100004678(__dst, (void *)xmmword_10085E1D0, *((unint64_t *)&xmmword_10085E1D0 + 1));
    }
    else
    {
      *(_OWORD *)__dst = xmmword_10085E1D0;
      v53 = unk_10085E1E0;
    }
    if (byte_10085E1FF < 0)
    {
      sub_100004678(&v54, (void *)xmmword_10085E1E8, *((unint64_t *)&xmmword_10085E1E8 + 1));
    }
    else
    {
      v54 = xmmword_10085E1E8;
      v55 = unk_10085E1F8;
    }
    v56 = 0;
    LOBYTE(v57) = 0;
    v59 = 0;
    LOBYTE(v60) = 0;
    v62 = 0;
    if (byte_10085E217 < 0)
    {
      sub_100004678(v41, (void *)xmmword_10085E200, *((unint64_t *)&xmmword_10085E200 + 1));
    }
    else
    {
      *(_OWORD *)v41 = xmmword_10085E200;
      v42 = unk_10085E210;
    }
    if (byte_10085E22F < 0)
    {
      sub_100004678(&v43, (void *)xmmword_10085E218, *((unint64_t *)&xmmword_10085E218 + 1));
    }
    else
    {
      v43 = xmmword_10085E218;
      v44 = unk_10085E228;
    }
    v45 = 0;
    LOBYTE(v46) = 0;
    v48 = 0;
    LOBYTE(v49) = 0;
    v51 = 0;
    if (byte_10085E247 < 0)
    {
      sub_100004678(v30, (void *)xmmword_10085E230, *((unint64_t *)&xmmword_10085E230 + 1));
    }
    else
    {
      *(_OWORD *)v30 = xmmword_10085E230;
      v31 = unk_10085E240;
    }
    if (byte_10085E25F < 0)
    {
      sub_100004678(&v32, (void *)xmmword_10085E248, *((unint64_t *)&xmmword_10085E248 + 1));
    }
    else
    {
      v32 = xmmword_10085E248;
      v33 = unk_10085E258;
    }
    v34 = 1;
    LOBYTE(v35) = 0;
    v37 = 0;
    LOBYTE(v38) = 0;
    v40 = 0;
    if (byte_10085E277 < 0)
    {
      sub_100004678(v19, (void *)xmmword_10085E260, *((unint64_t *)&xmmword_10085E260 + 1));
    }
    else
    {
      *(_OWORD *)v19 = xmmword_10085E260;
      v20 = unk_10085E270;
    }
    if (byte_10085E28F < 0)
    {
      sub_100004678(&v21, (void *)xmmword_10085E278, *((unint64_t *)&xmmword_10085E278 + 1));
    }
    else
    {
      v21 = xmmword_10085E278;
      v22 = unk_10085E288;
    }
    v23 = 1;
    LOBYTE(v24) = 0;
    v26 = 0;
    LOBYTE(__p) = 0;
    v29 = 0;
    sub_10033B124((char *)v68, (__int128 *)__dst);
    sub_10033B124(v69, (__int128 *)v41);
    v15 = 0uLL;
    v16 = 0;
    *(_QWORD *)&v66[0] = &v15;
    BYTE8(v66[0]) = 0;
    *(_QWORD *)&v15 = operator new(0xF0uLL);
    *((_QWORD *)&v15 + 1) = v15;
    v16 = (NIMLModelResource *)(v15 + 240);
    *((_QWORD *)&v15 + 1) = sub_10033B460((uint64_t)&v16, v68, &v70, (char *)v15);
    sub_10033B124((char *)v66, (__int128 *)v30);
    sub_10033B124(v67, (__int128 *)v19);
    v17 = 0uLL;
    v18 = 0;
    v64 = (void **)&v17;
    v65 = 0;
    *(_QWORD *)&v17 = operator new(0xF0uLL);
    *((_QWORD *)&v17 + 1) = v17;
    v18 = (NIMLModelResource *)(v17 + 240);
    *((_QWORD *)&v17 + 1) = sub_10033B460((uint64_t)&v18, v66, v68, (char *)v17);
    sub_10033B268((void **)&v2->_modelResourcePackage.trainedModelResources.__begin_);
    *(_OWORD *)&v2->_modelResourcePackage.trainedModelResources.__begin_ = v15;
    v2->_modelResourcePackage.trainedModelResources.__end_cap_.__value_ = v16;
    v15 = 0uLL;
    v16 = 0;
    sub_10033B268((void **)&v2->_modelResourcePackage.dataTranformerResources.__begin_);
    *(_OWORD *)&v2->_modelResourcePackage.dataTranformerResources.__begin_ = v17;
    v2->_modelResourcePackage.dataTranformerResources.__end_cap_.__value_ = v18;
    v17 = 0uLL;
    v18 = 0;
    v64 = (void **)&v17;
    sub_10033B348(&v64);
    v64 = (void **)&v15;
    sub_10033B348(&v64);
    for (i = 0; i != -240; i -= 120)
    {
      v4 = (void **)((char *)v66 + i);
      if (v67[i + 112] && *((char *)v4 + 231) < 0)
        operator delete(v4[26]);
      if (*((_BYTE *)v4 + 200) && v67[i + 79] < 0)
        operator delete(v4[22]);
      v5 = (void **)((char *)v66 + i);
      if (v67[i + 47] < 0)
        operator delete(v5[18]);
      if (*((char *)v5 + 143) < 0)
        operator delete(v4[15]);
    }
    for (j = 0; j != -240; j -= 120)
    {
      v7 = (void **)((char *)v68 + j);
      if (v69[j + 112] && *((char *)v7 + 231) < 0)
        operator delete(v7[26]);
      if (*((_BYTE *)v7 + 200) && v69[j + 79] < 0)
        operator delete(v7[22]);
      v8 = (void **)((char *)v68 + j);
      if (v69[j + 47] < 0)
        operator delete(v8[18]);
      if (*((char *)v8 + 143) < 0)
        operator delete(v7[15]);
    }
    remoteTxAntennaMask = v2->_remoteTxAntennaMask;
    v2->_remoteTxAntennaMask = 0;

    biasCorrectionEstimate = v2->_biasCorrectionEstimate;
    v2->_biasCorrectionEstimate = 0;

    neuralNetworkRangeBiasEstimatorModelAntennaMask1 = v2->_neuralNetworkRangeBiasEstimatorModelAntennaMask1;
    v2->_neuralNetworkRangeBiasEstimatorModelAntennaMask1 = 0;

    neuralNetworkRangeBiasEstimatorModelAntennaMask2 = v2->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
    v2->_neuralNetworkRangeBiasEstimatorModelAntennaMask2 = 0;

    if (v29 && v28 < 0)
      operator delete(__p);
    if (v26 && v25 < 0)
      operator delete(v24);
    if (SHIBYTE(v22) < 0)
      operator delete((void *)v21);
    if (SHIBYTE(v20) < 0)
      operator delete(v19[0]);
    if (v40 && v39 < 0)
      operator delete(v38);
    if (v37 && v36 < 0)
      operator delete(v35);
    if (SHIBYTE(v33) < 0)
      operator delete((void *)v32);
    if (SHIBYTE(v31) < 0)
      operator delete(v30[0]);
    if (v51 && v50 < 0)
      operator delete(v49);
    if (v48 && v47 < 0)
      operator delete(v46);
    if (SHIBYTE(v44) < 0)
      operator delete((void *)v43);
    if (SHIBYTE(v42) < 0)
      operator delete(v41[0]);
    if (v62 && v61 < 0)
      operator delete(v60);
    if (v59 && v58 < 0)
      operator delete(v57);
    if (SHIBYTE(v55) < 0)
      operator delete((void *)v54);
    if (SHIBYTE(v53) < 0)
      operator delete(__dst[0]);
  }
  v13 = v2;

  return v13;
}

- (BOOL)configureWithResourceFileHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  NeuralNetworkModelWithDataTransformer *v8;
  NeuralNetworkModelWithDataTransformer *neuralNetworkRangeBiasEstimatorModelAntennaMask1;
  uint64_t v10;
  NeuralNetworkModelWithDataTransformer **p_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  NeuralNetworkModelWithDataTransformer *neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  NeuralNetworkModelWithDataTransformer *v13;
  NSObject *v14;
  _BOOL4 v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  void *__p[2];
  char v21;
  void *v22[2];
  char v23;
  uint8_t buf[4];
  int v25;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#bias-est, Configuring bias estimator with resource file handler", buf, 2u);
  }
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003EDA0C();
    goto LABEL_20;
  }
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleName")));
  sub_10000BF04(v22, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resourceBundleDir")));
  sub_10000BF04(__p, (char *)objc_msgSend(v7, "UTF8String"));
  -[RangeBiasEstimatorSingleAntennaModel addBundleNameToModelResourcePackage:andBundleDirectory:](self, "addBundleNameToModelResourcePackage:andBundleDirectory:", v22, __p);
  if (v21 < 0)
    operator delete(__p[0]);

  if (v23 < 0)
    operator delete(v22[0]);

  v8 = (NeuralNetworkModelWithDataTransformer *)objc_claimAutoreleasedReturnValue(-[RangeBiasEstimatorSingleAntennaModel loadResourcesWithResourceIndex:](self, "loadResourcesWithResourceIndex:", 0));
  neuralNetworkRangeBiasEstimatorModelAntennaMask1 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1;
  self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1 = v8;

  if (!self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1)
  {
    v17 = qword_10085F520;
    v16 = 0;
    if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 67109120;
    v25 = 1;
    v18 = v17;
    goto LABEL_19;
  }
  v10 = objc_claimAutoreleasedReturnValue(-[RangeBiasEstimatorSingleAntennaModel loadResourcesWithResourceIndex:](self, "loadResourcesWithResourceIndex:", 1));
  neuralNetworkRangeBiasEstimatorModelAntennaMask2 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  p_neuralNetworkRangeBiasEstimatorModelAntennaMask2 = &self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  *p_neuralNetworkRangeBiasEstimatorModelAntennaMask2 = (NeuralNetworkModelWithDataTransformer *)v10;

  v13 = *p_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  v14 = qword_10085F520;
  v15 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (!v15)
    {
LABEL_20:
      v16 = 0;
      goto LABEL_21;
    }
    *(_DWORD *)buf = 67109120;
    v25 = 2;
    v18 = v14;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#bias-est, Unable to initialize Model with resources for antenna %d, bypassing bias estimation.", buf, 8u);
    goto LABEL_20;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#bias-est, Espresso Model initialized for both antennas", buf, 2u);
  }
  v16 = 1;
LABEL_21:

  return v16;
}

- (id)consumeInputFeatures:(id)a3
{
  id v4;
  unsigned __int8 v5;
  NSNumber *biasCorrectionEstimate;
  NSNumber *v7;
  NSNumber *remoteTxAntennaMask;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  char v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
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
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  double v42;
  double v43;
  long double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  id v54;
  const char *v55;
  int v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  long double __xa;
  double __x;
  void *v67;
  _BYTE *v68;
  void *__p;
  _BYTE *v70;
  void *v71;
  _BYTE *v72;
  void *v73;
  void *v74;
  long double v75;
  void *v76;
  void *v77;
  long double v78;
  uint8_t buf[8];
  uint64_t v80;
  uint64_t v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&qword_10085E2C8);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_10085E2C8))
  {
    dword_10085E2C0 = *((_DWORD *)sub_100004784() + 186);
    __cxa_guard_release(&qword_10085E2C8);
  }
  biasCorrectionEstimate = self->_biasCorrectionEstimate;
  self->_biasCorrectionEstimate = 0;

  if (v4)
  {
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "antennaMask")));
    remoteTxAntennaMask = self->_remoteTxAntennaMask;
    self->_remoteTxAntennaMask = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cirPacket1"));
    if (objc_msgSend(v9, "count") != (id)8)
      __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]", "NRBYRangeBiasEstimator.mm", 226, "[CIRValuesPacket1 count] == kDimCIRSamples");
    v10 = -[RangeBiasEstimatorSingleAntennaModel checkCirsValid:](self, "checkCirsValid:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cirPacket2"));
    if (objc_msgSend(v11, "count") != (id)8)
      __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]", "NRBYRangeBiasEstimator.mm", 230, "[CIRValuesPacket2 count] == kDimCIRSamples");
    v12 = v10 & -[RangeBiasEstimatorSingleAntennaModel checkCirsValid:](self, "checkCirsValid:", v11);
    v13 = qword_10085F520;
    v14 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
    if ((v12 & 1) == 0)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#bias-est, Invalid CIRs, not calculating bias estimate.", buf, 2u);
      }
      v39 = 0;
      goto LABEL_43;
    }
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#bias-est, Valid CIRs, continuing ... ", buf, 2u);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RangeBiasEstimatorSingleAntennaModel scaleCirValuesIfRequired:](self, "scaleCirValuesIfRequired:", v9));
    v16 = objc_claimAutoreleasedReturnValue(-[RangeBiasEstimatorSingleAntennaModel scaleCirValuesIfRequired:](self, "scaleCirValuesIfRequired:", v11));
    v17 = (void *)v16;
    if (v15 && v16)
    {
      -[RangeBiasEstimatorSingleAntennaModel getNormalizedCirAndPeakMagnitude:](self, "getNormalizedCirAndPeakMagnitude:", v15);
      -[RangeBiasEstimatorSingleAntennaModel getNormalizedCirAndPeakMagnitude:](self, "getNormalizedCirAndPeakMagnitude:", v17);
      -[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:](self, "getNormalizedFftCir:", v15);
      -[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:](self, "getNormalizedFftCir:", v17);
      if (v72 - (_BYTE *)v71 == 56)
      {
        if (v70 - (_BYTE *)__p == 56)
        {
          objc_msgSend(v4, "rttInitiator");
          v19 = v18;
          objc_msgSend(v4, "tatInitiator");
          v21 = v20;
          objc_msgSend(v4, "rttResponder");
          v23 = v22;
          objc_msgSend(v4, "tatResponder");
          v25 = v24;
          v26 = v23 + v24;
          if (v23 + v24 == 0.0)
            __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]", "NRBYRangeBiasEstimator.mm", 266, "(tat_r + rtt_r) != 0");
          objc_msgSend(v4, "leadingEdgePacket1");
          v28 = v27;
          objc_msgSend(v4, "firstPathIndexPacket1");
          v30 = v29;
          objc_msgSend(v4, "leadingEdgePacket2");
          v32 = v31;
          objc_msgSend(v4, "firstPathIndexPacket2");
          v34 = v32 - v33;
          if (dword_10085E2C0 == 1)
            v35 = v28 - v30 + -1.0;
          else
            v35 = v28 - v30;
          if (dword_10085E2C0 == 1)
            v36 = v34 + -1.0;
          else
            v36 = v34;
          objc_msgSend(v4, "toaNoiseRms");
          if (v37 == 0.0 || v78 == 0.0 || v75 == 0.0)
          {
            v38 = qword_10085F520;
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "#bias-est, Cannot calculate snr, returning nil", buf, 2u);
            }
            v39 = 0;
          }
          else
          {
            objc_msgSend(v4, "toaNoiseRms", (double)v75);
            __xa = v42;
            v64 = log10(v78);
            v63 = log10(__xa);
            objc_msgSend(v4, "toaNoiseRms");
            v44 = v43;
            __x = log10(v75);
            v62 = log10(v44);
            objc_msgSend(v4, "soiRssiDbm");
            v46 = v45;
            objc_msgSend(v4, "rssiDbm");
            v61 = v47;
            v60 = v46;
            objc_msgSend(v4, "tofPicSecond");
            v59 = v48;
            if (dword_10085E2C0 == 1)
              v49 = 0.100000001;
            else
              v49 = 1.0;
            objc_msgSend(v4, "toaNoiseRms");
            v58 = v50;
            objc_msgSend(v4, "toaPpwinRms");
            v57 = v51;
            objc_msgSend(v4, "toaPpwinPeak");
            *(_QWORD *)buf = v61;
            v80 = v60;
            v81 = v59;
            v82 = v58 * v49;
            v83 = v49 * v57;
            v84 = v49 * v52;
            v85 = v63 * -20.0 + v64 * 20.0;
            v86 = v62 * -20.0 + __x * 20.0;
            v87 = v35;
            v88 = v36;
            v89 = v19 - v25;
            v90 = v23 - v21;
            v91 = (v19 + v21 - v26) / v26 * 1000000.0;
            v92 = *(_QWORD *)v71;
            v93 = *((_QWORD *)v71 + 1);
            v94 = *((_QWORD *)v71 + 2);
            v95 = *((_QWORD *)v71 + 3);
            v96 = *((_QWORD *)v71 + 4);
            v97 = *((_QWORD *)v71 + 5);
            v98 = *((_QWORD *)v71 + 6);
            v99 = *(_QWORD *)__p;
            v100 = *((_QWORD *)__p + 1);
            v101 = *((_QWORD *)__p + 2);
            v102 = *((_QWORD *)__p + 3);
            v103 = *((_QWORD *)__p + 4);
            v104 = *((_QWORD *)__p + 5);
            v105 = *((_QWORD *)__p + 6);
            v106 = *(_QWORD *)v76;
            v107 = *((_QWORD *)v76 + 1);
            v108 = *((_QWORD *)v76 + 2);
            v109 = *((_QWORD *)v76 + 3);
            v110 = *((_QWORD *)v76 + 4);
            v111 = *((_QWORD *)v76 + 5);
            v112 = *((_QWORD *)v76 + 6);
            v113 = *((_QWORD *)v76 + 7);
            v114 = *(_QWORD *)v73;
            v115 = *((_QWORD *)v73 + 1);
            v116 = *((_QWORD *)v73 + 2);
            v117 = *((_QWORD *)v73 + 3);
            v118 = *((_QWORD *)v73 + 4);
            v119 = *((_QWORD *)v73 + 5);
            v120 = *((_QWORD *)v73 + 6);
            v121 = *((_QWORD *)v73 + 7);
            sub_100337D5C(&v67, buf, 0x2BuLL);
            if (v68 - (_BYTE *)v67 != 344)
              __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]", "NRBYRangeBiasEstimator.mm", 347, "rangeBiasEstimatorModelInputParams.size() == kDimInputFeaturesSingleAntennaRangeBiasModel");
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 43));
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[RangeBiasEstimatorSingleAntennaModel createAndPopulateBiasEstimatorInput:ofDimension:](self, "createAndPopulateBiasEstimatorInput:ofDimension:", &v67, v53));

            if (v39)
            {
              v54 = v39;
            }
            else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            {
              sub_1003EDA64();
            }

            if (v67)
            {
              v68 = v67;
              operator delete(v67);
            }
          }
          if (__p)
          {
            v70 = __p;
            operator delete(__p);
          }
          if (v71)
          {
            v72 = v71;
            operator delete(v71);
          }
          if (v73)
          {
            v74 = v73;
            operator delete(v73);
          }
          if (v76)
          {
            v77 = v76;
            operator delete(v76);
          }
LABEL_42:

LABEL_43:
          goto LABEL_44;
        }
        v55 = "normalizedFftCirPacket1.size() == normalizedFftCirPacket2.size()";
        v56 = 257;
      }
      else
      {
        v55 = "normalizedFftCirPacket1.size() == kDimExtractedFftCir";
        v56 = 256;
      }
      __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]", "NRBYRangeBiasEstimator.mm", v56, v55);
    }
    v40 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#bias-est, Scaling CIRs failed, not calculating bias estimate.", buf, 2u);
    }
    v39 = 0;
    goto LABEL_42;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003EDA38();
  v39 = 0;
LABEL_44:

  return v39;
}

- (id)preprocessInputFeatures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  unsigned int v25;
  unsigned int v26;
  void *v27;
  uint64_t v28;
  RangeBiasEstimatorInput *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t i;
  void *v34;
  RangeBiasEstimatorInput *v35;
  RangeBiasEstimatorInput *v36;
  const char *v38;
  int v39;
  NSObject *v40;
  void *__p;
  char *v42;
  char *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const char *v49;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureValueForName:", CFSTR("input")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "multiArrayValue"));

    if (objc_msgSend(v7, "count") == (id)43)
    {
      if ((uint64_t)objc_msgSend(v7, "count") > 12)
      {
        v8 = 0;
        __p = 0;
        v42 = 0;
        v43 = 0;
        do
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
          objc_msgSend(v9, "doubleValue");
          v11 = v10;
          v12 = v42;
          if (v42 >= v43)
          {
            v14 = (char *)__p;
            v15 = (v42 - (_BYTE *)__p) >> 3;
            v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 61)
              sub_100026E7C();
            v17 = v43 - (_BYTE *)__p;
            if ((v43 - (_BYTE *)__p) >> 2 > v16)
              v16 = v17 >> 2;
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
              v18 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v18 = v16;
            if (v18)
            {
              v19 = (char *)sub_10005538C((uint64_t)&v43, v18);
              v14 = (char *)__p;
              v12 = v42;
            }
            else
            {
              v19 = 0;
            }
            v20 = &v19[8 * v15];
            *(_QWORD *)v20 = v11;
            v13 = v20 + 8;
            while (v12 != v14)
            {
              v21 = *((_QWORD *)v12 - 1);
              v12 -= 8;
              *((_QWORD *)v20 - 1) = v21;
              v20 -= 8;
            }
            __p = v20;
            v42 = v13;
            v43 = &v19[8 * v18];
            if (v14)
              operator delete(v14);
          }
          else
          {
            *(_QWORD *)v42 = v10;
            v13 = v12 + 8;
          }
          v42 = v13;

          ++v8;
        }
        while (v8 != 13);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 13));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[RangeBiasEstimatorSingleAntennaModel createAndPopulateBiasEstimatorInput:ofDimension:](self, "createAndPopulateBiasEstimatorInput:ofDimension:", &__p, v22));

        if (v23)
        {
          if (-[NSNumber intValue](self->_remoteTxAntennaMask, "intValue") != 1
            && -[NSNumber intValue](self->_remoteTxAntennaMask, "intValue") != 2)
          {
            __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel preprocessInputFeatures:]", "NRBYRangeBiasEstimator.mm", 380, "[_remoteTxAntennaMask intValue] == kAntennaMask1 || [_remoteTxAntennaMask intValue] == kAntennaMask2");
          }
          v24 = (id)qword_10085F520;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = -[NSNumber intValue](self->_remoteTxAntennaMask, "intValue");
            *(_DWORD *)buf = 67109120;
            LODWORD(v45) = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#bias-est, Using Antenna %d NN bias model", buf, 8u);
          }

          v26 = -[NSNumber intValue](self->_remoteTxAntennaMask, "intValue");
          if (v26 == 2)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[NeuralNetworkModelWithDataTransformer rangeBiasEstimatorModelDataTransformer](self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2, "rangeBiasEstimatorModelDataTransformer"));
            v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "applyTransformation:", v23));
          }
          else
          {
            if (v26 != 1)
            {
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
                sub_1003EDABC();
              v40 = qword_10085F520;
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v45 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Libraries/NearbyAlgorithms/RangeBiasEstimation/NRB"
                      "YRangeBiasEstimator.mm";
                v46 = 1024;
                v47 = 392;
                v48 = 2080;
                v49 = "-[RangeBiasEstimatorSingleAntennaModel preprocessInputFeatures:]";
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "#bias-est, %s:%d: assertion failure in %s", buf, 0x1Cu);
              }
              abort();
            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[NeuralNetworkModelWithDataTransformer rangeBiasEstimatorModelDataTransformer](self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1, "rangeBiasEstimatorModelDataTransformer"));
            v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "applyTransformation:", v23));
          }
          v30 = (void *)v28;

          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "featureValueForName:", CFSTR("input")));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "multiArrayValue"));

            for (i = 0; i != 13; ++i)
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", i));
              objc_msgSend(v7, "setObject:atIndexedSubscript:", v34, i);

            }
            v35 = -[RangeBiasEstimatorInput initWithData:]([RangeBiasEstimatorInput alloc], "initWithData:", v7);
            v29 = v35;
            if (v35)
            {
              v36 = v35;
            }
            else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            {
              sub_1003EDA64();
            }

          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
              sub_1003EDAE8();
            v29 = 0;
          }

        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003EDA64();
          v29 = 0;
        }

        if (__p)
        {
          v42 = (char *)__p;
          operator delete(__p);
        }

        goto LABEL_52;
      }
      v38 = "kStartIdxOfFeaturesThatRequireScaling+kLengthOfFeaturesThatRequireScaling <= [inputFeatureMultiArray count]";
      v39 = 366;
    }
    else
    {
      v38 = "[inputFeatureMultiArray count] == kDimInputFeaturesSingleAntennaRangeBiasModel";
      v39 = 365;
    }
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel preprocessInputFeatures:]", "NRBYRangeBiasEstimator.mm", v39, v38);
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003EDA90();
  v29 = 0;
LABEL_52:

  return v29;
}

- (id)predictOutput:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  __int128 v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSNumber *v15;
  NSNumber *biasCorrectionEstimate;
  NSObject *v17;
  __int128 v19;
  _QWORD v20[21];
  uint8_t buf[4];
  _BYTE v22[14];

  v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003EDB14();
    goto LABEL_13;
  }
  if (!-[RangeBiasEstimatorSingleAntennaModel predictBiasEstimate:scaledInputFeatures:output:](self, "predictBiasEstimate:scaledInputFeatures:output:", -[NSNumber intValue](self->_remoteTxAntennaMask, "intValue"), v4, v20))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003EDBB4();
LABEL_13:
    v13 = 0;
    goto LABEL_21;
  }
  if (v20[10] != 11)
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel predictOutput:]", "NRBYRangeBiasEstimator.mm", 449, "output.width == kDimOutputSingleAntennaRangeBiasModel");
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 11);
  v6 = 0;
  v7 = 0.0;
  *(_QWORD *)&v8 = 67109376;
  v19 = v8;
  v9 = 0.0;
  do
  {
    v10 = *(float *)(v20[0] + 4 * v6);
    v11 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v19;
      *(_DWORD *)v22 = v6;
      *(_WORD *)&v22[4] = 2048;
      *(double *)&v22[6] = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "#bias-est, Output Probability index = %d, value = %f", buf, 0x12u);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10, v19));
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v12, v6);

    v7 = v7 + v10;
    v9 = v9 + dbl_10047A9E8[v6++] * v10;
  }
  while (v6 != 11);
  v14 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#bias-est, biasCorrectionEstimate = %f", buf, 0xCu);
  }
  v15 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
  biasCorrectionEstimate = self->_biasCorrectionEstimate;
  self->_biasCorrectionEstimate = v15;

  if (v7 >= 1.00001 || v7 <= 0.99999)
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel predictOutput:]", "NRBYRangeBiasEstimator.mm", 467, "(totalProbability < 1.0 + epsilon) && (totalProbability > 1.0 - epsilon)");
  v17 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003EDB40(v17, v7);
  v13 = objc_msgSend(v5, "copy");

LABEL_21:
  return v13;
}

- (void)addBundleNameToModelResourcePackage:()basic_string<char andBundleDirectory:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  const std::string *v3;
  const std::string *v4;
  NIMLModelResource *begin;
  unint64_t v8;
  uint64_t v9;
  NIMLModelResource *v10;
  unint64_t v11;
  uint64_t v12;

  v4 = v3;
  begin = self->_modelResourcePackage.trainedModelResources.__begin_;
  if (self->_modelResourcePackage.trainedModelResources.__end_ != begin)
  {
    v8 = 0;
    v9 = 56;
    do
    {
      sub_100291384((std::string *)((char *)begin + v9 + 32), (const std::string *)a3);
      sub_100291384((std::string *)((char *)self->_modelResourcePackage.trainedModelResources.__begin_ + v9), v4);
      ++v8;
      begin = self->_modelResourcePackage.trainedModelResources.__begin_;
      v9 += 120;
    }
    while (0xEEEEEEEEEEEEEEEFLL * ((self->_modelResourcePackage.trainedModelResources.__end_ - begin) >> 3) > v8);
  }
  v10 = self->_modelResourcePackage.dataTranformerResources.__begin_;
  if (self->_modelResourcePackage.dataTranformerResources.__end_ != v10)
  {
    v11 = 0;
    v12 = 56;
    do
    {
      sub_100291384((std::string *)((char *)v10 + v12 + 32), (const std::string *)a3);
      sub_100291384((std::string *)((char *)self->_modelResourcePackage.dataTranformerResources.__begin_ + v12), v4);
      ++v11;
      v10 = self->_modelResourcePackage.dataTranformerResources.__begin_;
      v12 += 120;
    }
    while (0xEEEEEEEEEEEEEEEFLL * ((self->_modelResourcePackage.dataTranformerResources.__end_ - v10) >> 3) > v11);
  }
}

- (id)getResourcePathWithBundleName:()basic_string<char bundleDir:()std:(std::allocator<char>> *)data :char_traits<char> resourceName:resourceExtension:
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unsigned __int8 v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char *v20;
  uint64_t v21;
  std::__fs::filesystem::path v22;

  v6 = v5;
  v7 = v4;
  if (*((char *)v3 + 23) < 0)
    v3 = (uint64_t *)*v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
  if (*((char *)&data->__r_.__value_.var0.var1 + 23) < 0)
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", data));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v11));
  v13 = objc_retainAutorelease(v11);
  v20 = (char *)objc_msgSend(v13, "UTF8String");
  sub_10029149C(&v22.__pn_, &v20);
  std::__fs::filesystem::__status(&v22, 0);
  v14 = v21;
  if (SHIBYTE(v22.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__pn_.__r_.__value_.__l.__data_);
  if (v14 != 255 && v14)
  {
    if (*((char *)v7 + 23) < 0)
      v7 = (uint64_t *)*v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
    if (*((char *)v6 + 23) < 0)
      v6 = (uint64_t *)*v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathForResource:ofType:", v17, v18));

    if (v15)
    {
      v15 = v15;
      v16 = v15;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003EDBE0();
      v16 = 0;
    }
  }
  else
  {
    v15 = (id)qword_10085F520;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1003EDC0C((uint64_t)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), (uint8_t *)&v22, v15);
    v16 = 0;
  }

  return v16;
}

- (id)loadResourcesWithResourceIndex:(int)a3
{
  unint64_t v5;
  RangeBiasEstimatorModelDataTransformer *v6;
  int v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void **v14;
  void **v15;
  void **v16;
  void *v17;
  id v18;
  const std::__fs::filesystem::path *v19;
  uint8_t v20;
  NSObject *v21;
  char v22;
  uint64_t context;
  uint64_t plan;
  uint64_t v25;
  void **v26;
  RangeBiasEstimatorModelDataTransformer *v27;
  void **v28;
  void *v29;
  void *v30;
  RangeBiasEstimatorModelDataTransformer *v31;
  NSObject *v32;
  void **v33;
  NSObject *v34;
  NeuralNetworkModelWithDataTransformer *v35;
  NeuralNetworkModelWithDataTransformer *v36;
  int v38;
  const char *v39;
  const char *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49[15];
  char v50;
  char v51[15];
  char v52;
  char v53[7];
  void *v54[2];
  char v55;
  std::string __p;
  std::string v57;
  std::string v58;
  std::string __dst;
  std::string v60;
  std::string v61;
  std::string v62;
  std::string v63;
  __int128 v64;
  void **v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  std::string buf;
  uint8_t v72[8];

  v68 = 0;
  v69 = 0;
  v70 = 0;
  sub_10033B584((char *)&v68, (__int128 *)self->_modelResourcePackage.trainedModelResources.__begin_, (__int128 *)self->_modelResourcePackage.trainedModelResources.__end_, 0xEEEEEEEEEEEEEEEFLL* ((self->_modelResourcePackage.trainedModelResources.__end_- self->_modelResourcePackage.trainedModelResources.__begin_) >> 3));
  v65 = 0;
  v66 = 0;
  v67 = 0;
  sub_10033B584((char *)&v65, (__int128 *)self->_modelResourcePackage.dataTranformerResources.__begin_, (__int128 *)self->_modelResourcePackage.dataTranformerResources.__end_, 0xEEEEEEEEEEEEEEEFLL* ((self->_modelResourcePackage.dataTranformerResources.__end_- self->_modelResourcePackage.dataTranformerResources.__begin_) >> 3));
  v5 = 0xEEEEEEEEEEEEEEEFLL * ((v69 - v68) >> 3);
  if (v5 != 0xEEEEEEEEEEEEEEEFLL * ((v66 - (uint64_t)v65) >> 3))
  {
    v40 = "trainedModelResourceArray.size() == dataTransformerResourceArray.size()";
    v41 = 514;
    goto LABEL_89;
  }
  if (v5 <= a3)
  {
    v40 = "trainedModelResourceArray.size() > index";
    v41 = 515;
LABEL_89:
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel loadResourcesWithResourceIndex:]", "NRBYRangeBiasEstimator.mm", v41, v40);
  }
  v6 = 0;
  v7 = a3;
  v44 = a3 + 1;
  v8 = 1;
  do
  {
    v9 = v8;
    memset(&v63, 0, sizeof(v63));
    memset(&v62, 0, sizeof(v62));
    memset(&v61, 0, sizeof(v61));
    memset(&v60, 0, sizeof(v60));
    if ((v8 & 1) != 0)
    {
      v10 = v68 + 120 * v7;
      if (*(_BYTE *)(v10 + 80) && *(_BYTE *)(v68 + 120 * v7 + 112))
      {
        std::string::operator=(&v61, (const std::string *)(v10 + 56));
        v11 = v68 + 120 * v7;
        if (!*(_BYTE *)(v11 + 112))
          goto LABEL_91;
        std::string::operator=(&v60, (const std::string *)(v11 + 88));
        std::string::operator=(&v63, (const std::string *)(v68 + 120 * v7));
        v12 = v68 + 120 * v7;
        v13 = *(_DWORD *)(v12 + 48);
        std::string::operator=(&v62, (const std::string *)(v12 + 24));
        goto LABEL_13;
      }
      v38 = 533;
      v39 = "trainedModelResourceArray[index].bundleDirectory.has_value() && trainedModelResourceArray[index].bundleName.has_value()";
LABEL_86:
      __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel loadResourcesWithResourceIndex:]", "NRBYRangeBiasEstimator.mm", v38, v39);
    }
    v14 = &v65[15 * v7];
    if (!*((_BYTE *)v14 + 80) || !LOBYTE(v65[15 * v7 + 14]))
    {
      v38 = 541;
      v39 = "dataTransformerResourceArray[index].bundleDirectory.has_value() && dataTransformerResourceArray[index].bundl"
            "eName.has_value()";
      goto LABEL_86;
    }
    std::string::operator=(&v61, (const std::string *)(v14 + 7));
    v15 = &v65[15 * v7];
    if (!*((_BYTE *)v15 + 112))
LABEL_91:
      sub_10000BA44();
    std::string::operator=(&v60, (const std::string *)(v15 + 11));
    std::string::operator=(&v63, (const std::string *)&v65[15 * v7]);
    v16 = &v65[15 * v7];
    v13 = *((_DWORD *)v16 + 12);
    std::string::operator=(&v62, (const std::string *)v16 + 1);
LABEL_13:
    if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
      sub_100004678(&__dst, v60.__r_.__value_.__l.__data_, v60.__r_.__value_.__l.__size_);
    else
      __dst = v60;
    if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
      sub_100004678(&v58, v61.__r_.__value_.__l.__data_, v61.__r_.__value_.__l.__size_);
    else
      v58 = v61;
    if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
      sub_100004678(&v57, v63.__r_.__value_.__l.__data_, v63.__r_.__value_.__l.__size_);
    else
      v57 = v63;
    if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
      sub_100004678(&__p, v62.__r_.__value_.__l.__data_, v62.__r_.__value_.__l.__size_);
    else
      __p = v62;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RangeBiasEstimatorSingleAntennaModel getResourcePathWithBundleName:bundleDir:resourceName:resourceExtension:](self, "getResourcePathWithBundleName:bundleDir:resourceName:resourceExtension:", &__dst, &v58, &v57, &__p));
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v57.__r_.__value_.__l.__data_);
    if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v58.__r_.__value_.__l.__data_);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__dst.__r_.__value_.__l.__data_);
    v18 = objc_retainAutorelease(v17);
    sub_10000BF04(v54, (char *)objc_msgSend(v18, "UTF8String"));
    v19 = (const std::__fs::filesystem::path *)sub_10017ED1C(&buf, (char *)v54);
    std::__fs::filesystem::__status(v19, 0);
    v20 = v72[0];
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (v20 == 255 || !v20)
    {
      v21 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      {
        v33 = v54;
        if (v55 < 0)
          v33 = (void **)v54[0];
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v33;
        _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "#bias-est, Unable to locate resource file %s, bypassing bias estimation.", (uint8_t *)&buf, 0xCu);
      }
LABEL_38:
      v22 = 0;
      goto LABEL_39;
    }
    if (v13 == 1)
    {
      v27 = [RangeBiasEstimatorModelDataTransformer alloc];
      if (v55 >= 0)
        v28 = v54;
      else
        v28 = (void **)v54[0];
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v28));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v29));
      v31 = -[RangeBiasEstimatorModelDataTransformer initWithContentsOfURL:](v27, "initWithContentsOfURL:", v30);

      v32 = qword_10085F520;
      if (v31)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
          HIDWORD(buf.__r_.__value_.__r.__words[0]) = v44;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#bias-est, Loaded data transformer model %d", (uint8_t *)&buf, 8u);
        }
        v22 = 1;
        v6 = v31;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003EDCA8(&v48, v49);
        v22 = 0;
        v6 = 0;
      }
    }
    else if (v13)
    {
      v22 = 1;
    }
    else
    {
      context = espresso_create_context(0, 0xFFFFFFFFLL);
      plan = espresso_create_plan(context, 0);
      v25 = plan;
      if (v55 >= 0)
        v26 = v54;
      else
        v26 = (void **)v54[0];
      if (espresso_plan_add_network(plan, v26, 65568, &buf))
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003EDC7C(&v52, v53);
        goto LABEL_38;
      }
      if (espresso_plan_build(v25))
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003EDC50(&v50, v51);
        goto LABEL_38;
      }
      v64 = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
      v34 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v72 = 67109120;
        *(_DWORD *)&v72[4] = v44;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#bias-est, Loaded NN model %d", v72, 8u);
      }
      v22 = 1;
      v42 = v25;
      v43 = context;
    }
LABEL_39:
    if (v55 < 0)
      operator delete(v54[0]);

    if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v60.__r_.__value_.__l.__data_);
    if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v61.__r_.__value_.__l.__data_);
    if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v62.__r_.__value_.__l.__data_);
    if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v63.__r_.__value_.__l.__data_);
    if ((v22 & 1) == 0)
    {
      v35 = 0;
      goto LABEL_83;
    }
    v8 = 0;
  }
  while ((v9 & 1) != 0);
  if (!v6)
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel loadResourcesWithResourceIndex:]", "NRBYRangeBiasEstimator.mm", 603, "rangeBiasEstimatorModelDataTransformer != nil");
  v36 = [NeuralNetworkModelWithDataTransformer alloc];
  v45 = v64;
  v46 = v42;
  v47 = v43;
  v35 = -[NeuralNetworkModelWithDataTransformer initWithNeuralNetworkModel:andDataTransformer:](v36, "initWithNeuralNetworkModel:andDataTransformer:", &v45, v6);
LABEL_83:

  v63.__r_.__value_.__r.__words[0] = (std::string::size_type)&v65;
  sub_10033B348((void ***)&v63);
  v65 = (void **)&v68;
  sub_10033B348(&v65);
  return v35;
}

- (BOOL)checkCirsValid:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  BOOL v23;

  v3 = a3;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "real"));
    objc_msgSend(v7, "doubleValue");
    if (v8 == 0.0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v4));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imag"));
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

      if (v12 == 0.0)
        ++v5;
    }
    else
    {

    }
    ++v4;
  }
  while (v4 != 8);
  if (v5 == 8)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003EDCD4();
LABEL_17:
    v23 = 0;
    goto LABEL_18;
  }
  v13 = 0;
  v14 = 0.0;
  v15 = 0.0;
  do
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v13));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "real"));
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v13));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imag"));
    objc_msgSend(v21, "doubleValue");
    v15 = v15 + v19;
    v14 = v14 + v22;

    ++v13;
  }
  while (v13 != 8);
  v23 = 1;
  if (v15 == 0.0 && v14 == 0.0)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003EDD00();
    goto LABEL_17;
  }
LABEL_18:

  return v23;
}

- (id)createAndPopulateBiasEstimatorInput:(const void *)a3 ofDimension:(id)a4
{
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  RangeBiasEstimatorInput *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t v21[8];
  id v22;
  void *v23;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a4));
  v22 = 0;
  v6 = objc_msgSend(objc_alloc((Class)MLMultiArray), "initWithShape:dataType:error:", v5, 65600, &v22);
  v7 = v22;
  v8 = qword_10085F520;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003EDD2C((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#bias-est, Created biasEstimatorInputMLArray, populating values.", v21, 2u);
    }
    if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
    {
      v16 = 0;
      do
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)a3 + 8 * v16)));
        v23 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, v19);

        ++v16;
      }
      while (v16 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
    }
    v15 = -[RangeBiasEstimatorInput initWithData:]([RangeBiasEstimatorInput alloc], "initWithData:", v6);
  }

  return v15;
}

- (BOOL)predictBiasEstimate:(unsigned __int8)a3 scaledInputFeatures:(id)a4 output:(id *)a5
{
  int v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  double v12;
  float v13;
  float *v14;
  float *v15;
  float *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  float *v22;
  int v23;
  BOOL v24;
  NeuralNetworkModelWithDataTransformer *neuralNetworkRangeBiasEstimatorModelAntennaMask1;
  uint64_t v27;
  NeuralNetworkModelWithDataTransformer *neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  NeuralNetworkModelWithDataTransformer *v32;
  uint64_t v33;
  NeuralNetworkModelWithDataTransformer *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  NeuralNetworkModelWithDataTransformer *v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  _OWORD v43[10];
  uint64_t v44;
  void *__p;
  float *v46;
  float *v47;
  uint8_t buf[32];
  uint64_t v49;

  v5 = a3;
  v7 = a4;
  __p = 0;
  v46 = 0;
  v47 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "featureValueForName:", CFSTR("input")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "multiArrayValue"));

  for (i = 0; i != 43; ++i)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", i));
    objc_msgSend(v11, "doubleValue");
    v13 = v12;
    v14 = v46;
    if (v46 >= v47)
    {
      v16 = (float *)__p;
      v17 = ((char *)v46 - (_BYTE *)__p) >> 2;
      v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 62)
        sub_100026E7C();
      v19 = (char *)v47 - (_BYTE *)__p;
      if (((char *)v47 - (_BYTE *)__p) >> 1 > v18)
        v18 = v19 >> 1;
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL)
        v20 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v20 = v18;
      if (v20)
      {
        v21 = (char *)sub_10003B05C((uint64_t)&v47, v20);
        v16 = (float *)__p;
        v14 = v46;
      }
      else
      {
        v21 = 0;
      }
      v22 = (float *)&v21[4 * v17];
      *v22 = v13;
      v15 = v22 + 1;
      while (v14 != v16)
      {
        v23 = *((_DWORD *)v14-- - 1);
        *((_DWORD *)v22-- - 1) = v23;
      }
      __p = v22;
      v46 = v15;
      v47 = (float *)&v21[4 * v20];
      if (v16)
        operator delete(v16);
    }
    else
    {
      *v46 = v13;
      v15 = v14 + 1;
    }
    v46 = v15;

  }
  v44 = 0;
  memset(v43, 0, sizeof(v43));
  v49 = 43;
  if (espresso_buffer_pack_tensor_shape(v43, 1, &v49))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003EDE14();
    goto LABEL_22;
  }
  *(_QWORD *)&v43[0] = __p;
  LODWORD(v44) = 65568;
  if (v5 == 2)
  {
    neuralNetworkRangeBiasEstimatorModelAntennaMask2 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
    if (neuralNetworkRangeBiasEstimatorModelAntennaMask2)
    {
      -[NeuralNetworkModelWithDataTransformer neuralNetworkModel](neuralNetworkRangeBiasEstimatorModelAntennaMask2, "neuralNetworkModel");
      neuralNetworkRangeBiasEstimatorModelAntennaMask2 = *(NeuralNetworkModelWithDataTransformer **)buf;
      v29 = *(_QWORD *)&buf[8];
    }
    else
    {
      v29 = 0;
      memset(buf, 0, sizeof(buf));
    }
    if (byte_10085E2A7 >= 0)
      v30 = &qword_10085E290;
    else
      v30 = (uint64_t *)qword_10085E290;
    if (espresso_network_bind_buffer(neuralNetworkRangeBiasEstimatorModelAntennaMask2, v29, v30, v43, 0x10000, 0x20000, 0x10000))
    {
      if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      {
LABEL_22:
        v24 = 0;
        goto LABEL_23;
      }
LABEL_38:
      sub_1003EDDE8();
      goto LABEL_22;
    }
    v32 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
    if (v32)
    {
      -[NeuralNetworkModelWithDataTransformer neuralNetworkModel](v32, "neuralNetworkModel");
      v32 = *(NeuralNetworkModelWithDataTransformer **)buf;
      v33 = *(_QWORD *)&buf[8];
    }
    else
    {
      v33 = 0;
      memset(buf, 0, sizeof(buf));
    }
    if (byte_10085E2BF >= 0)
      v36 = &qword_10085E2A8;
    else
      v36 = (uint64_t *)qword_10085E2A8;
    if (espresso_network_bind_buffer(v32, v33, v36, a5, 0x20000, 0x10000, 0x10000))
    {
      if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
LABEL_56:
      sub_1003EDDBC();
      goto LABEL_22;
    }
    v38 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
    if (v38)
      goto LABEL_67;
  }
  else
  {
    if (v5 != 1)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003EDABC();
      v41 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Libraries/NearbyAlgorithms/RangeBiasEstimat"
                             "ion/NRBYRangeBiasEstimator.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 723;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "-[RangeBiasEstimatorSingleAntennaModel predictBiasEstimate:scaledInputFeatures:output:]";
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "#bias-est, %s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
    }
    neuralNetworkRangeBiasEstimatorModelAntennaMask1 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1;
    if (neuralNetworkRangeBiasEstimatorModelAntennaMask1)
    {
      -[NeuralNetworkModelWithDataTransformer neuralNetworkModel](neuralNetworkRangeBiasEstimatorModelAntennaMask1, "neuralNetworkModel");
      neuralNetworkRangeBiasEstimatorModelAntennaMask1 = *(NeuralNetworkModelWithDataTransformer **)buf;
      v27 = *(_QWORD *)&buf[8];
    }
    else
    {
      v27 = 0;
      memset(buf, 0, sizeof(buf));
    }
    if (byte_10085E2A7 >= 0)
      v31 = &qword_10085E290;
    else
      v31 = (uint64_t *)qword_10085E290;
    if (espresso_network_bind_buffer(neuralNetworkRangeBiasEstimatorModelAntennaMask1, v27, v31, v43, 0x10000, 0x20000, 0x10000))
    {
      if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      goto LABEL_38;
    }
    v34 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1;
    if (v34)
    {
      -[NeuralNetworkModelWithDataTransformer neuralNetworkModel](v34, "neuralNetworkModel");
      v34 = *(NeuralNetworkModelWithDataTransformer **)buf;
      v35 = *(_QWORD *)&buf[8];
    }
    else
    {
      v35 = 0;
      memset(buf, 0, sizeof(buf));
    }
    if (byte_10085E2BF >= 0)
      v37 = &qword_10085E2A8;
    else
      v37 = (uint64_t *)qword_10085E2A8;
    if (espresso_network_bind_buffer(v34, v35, v37, a5, 0x20000, 0x10000, 0x10000))
    {
      if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      goto LABEL_56;
    }
    v38 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1;
    if (v38)
    {
LABEL_67:
      -[NeuralNetworkModelWithDataTransformer neuralNetworkModel](v38, "neuralNetworkModel");
      v38 = *(NeuralNetworkModelWithDataTransformer **)&buf[16];
      goto LABEL_69;
    }
  }
  memset(buf, 0, sizeof(buf));
LABEL_69:
  v39 = espresso_plan_execute_sync(v38);
  v40 = qword_10085F520;
  if (v39)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003EDD90();
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#bias-est, Executed espresso plan.", buf, 2u);
  }
  v24 = 1;
LABEL_23:

  if (__p)
  {
    v46 = (float *)__p;
    operator delete(__p);
  }

  return v24;
}

- (pair<std::vector<double>,)getNormalizedCirAndPeakMagnitude:(RangeBiasEstimatorSingleAntennaModel *)self
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  long double v10;
  void *v11;
  void *v12;
  double v13;
  long double v14;
  double v15;
  double v16;
  double *v17;
  double *v18;
  double *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  double *v25;
  uint64_t v26;
  double *v27;
  double *v28;
  double v30;
  double *v31;
  double v32;
  double v33;
  double v34;
  double *v35;
  uint64_t i;
  double v37;
  double *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  double *v44;
  double *v45;
  uint64_t v46;
  pair<std::vector<double>, double> *result;
  double *v48;
  double *v49;
  double *v50;
  void *__p;
  double *v52;
  double *v53;

  v5 = a4;
  v6 = 0;
  __p = 0;
  v52 = 0;
  v53 = 0;
  do
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "real"));
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imag"));
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    v15 = hypot(v10, v14);
    v16 = v15;
    v17 = v52;
    if (v52 >= v53)
    {
      v19 = (double *)__p;
      v20 = ((char *)v52 - (_BYTE *)__p) >> 3;
      v21 = v20 + 1;
      if ((unint64_t)(v20 + 1) >> 61)
        sub_100026E7C();
      v22 = (char *)v53 - (_BYTE *)__p;
      if (((char *)v53 - (_BYTE *)__p) >> 2 > v21)
        v21 = v22 >> 2;
      if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8)
        v23 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v23 = v21;
      if (v23)
      {
        v24 = (char *)sub_10005538C((uint64_t)&v53, v23);
        v19 = (double *)__p;
        v17 = v52;
      }
      else
      {
        v24 = 0;
      }
      v25 = (double *)&v24[8 * v20];
      *v25 = v16;
      v18 = v25 + 1;
      while (v17 != v19)
      {
        v26 = *((_QWORD *)v17-- - 1);
        *((_QWORD *)v25-- - 1) = v26;
      }
      __p = v25;
      v52 = v18;
      v53 = (double *)&v24[8 * v23];
      if (v19)
        operator delete(v19);
    }
    else
    {
      *v52 = v15;
      v18 = v17 + 1;
    }
    v52 = v18;
    ++v6;
  }
  while (v6 != 8);
  v27 = (double *)__p;
  v28 = (double *)((char *)__p + 8);
  if (__p != v18 && v28 != v18)
  {
    v30 = *(double *)__p;
    v31 = (double *)((char *)__p + 8);
    do
    {
      v32 = *v31++;
      v33 = v32;
      if (v30 < v32)
      {
        v30 = v33;
        v27 = v28;
      }
      v28 = v31;
    }
    while (v31 != v18);
  }
  v34 = *v27;
  v48 = 0;
  v49 = 0;
  v50 = 0;
  if (v34 == 0.0)
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel getNormalizedCirAndPeakMagnitude:]", "NRBYRangeBiasEstimator.mm", 749, "maxMagnitude != 0");
  v35 = 0;
  for (i = 0; i != 8; ++i)
  {
    v37 = log10(fmax(*((double *)__p + i), 1.0e-12) / v34) * 20.0;
    if (v35 >= v50)
    {
      v38 = v48;
      v39 = v35 - v48;
      v40 = v39 + 1;
      if ((unint64_t)(v39 + 1) >> 61)
        sub_100026E7C();
      v41 = (char *)v50 - (char *)v48;
      if (((char *)v50 - (char *)v48) >> 2 > v40)
        v40 = v41 >> 2;
      if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8)
        v42 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v42 = v40;
      if (v42)
      {
        v43 = (char *)sub_10005538C((uint64_t)&v50, v42);
        v38 = v48;
        v35 = v49;
      }
      else
      {
        v43 = 0;
      }
      v44 = (double *)&v43[8 * v39];
      *v44 = v37;
      v45 = v44 + 1;
      while (v35 != v38)
      {
        v46 = *((_QWORD *)v35-- - 1);
        *((_QWORD *)v44-- - 1) = v46;
      }
      v48 = v44;
      v50 = (double *)&v43[8 * v42];
      if (v38)
        operator delete(v38);
      v35 = v45;
    }
    else
    {
      *v35++ = v37;
    }
    v49 = v35;
  }
  retstr->var0.var0 = 0;
  retstr->var0.var1 = 0;
  retstr->var0.var2.var0 = 0;
  sub_1001375D8(retstr, v48, (uint64_t)v35, v35 - v48);
  retstr->var1 = v34;
  if (v48)
    operator delete(v48);
  if (__p)
  {
    v52 = (double *)__p;
    operator delete(__p);
  }

  return result;
}

- (vector<double,)getNormalizedFftCir:(RangeBiasEstimatorSingleAntennaModel *)self
{
  id v5;
  uint64_t v6;
  __int128 v7;
  int32x2_t v8;
  char *v9;
  int v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  int v31;
  uint64_t j;
  char *v33;
  void *v34;
  void *v35;
  double v36;
  double *v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  double *v45;
  double *v46;
  float64_t v47;
  uint64_t v48;
  _OWORD *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char *v53;
  char *v54;
  float64_t v55;
  float64_t v56;
  char *v57;
  float64_t v58;
  unint64_t v59;
  double v60;
  long double v61;
  long double v62;
  double v63;
  double *var0;
  double *var1;
  double *v66;
  double *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  double *v73;
  uint64_t v74;
  vector<double, std::allocator<double>> *result;
  __int128 v76;
  float64x2_t v77;
  char *v78;
  void *v79;
  void *__dst;
  uint64_t v81;
  void *__src;
  double *v83;
  double *v84;
  void *__p;
  char *v86;
  _QWORD v87[5];

  v5 = a4;
  v6 = 0;
  *(_QWORD *)&v7 = 0x1000000010;
  do
  {
    v8 = vadd_s32((int32x2_t)qword_10047AA40[v6], (int32x2_t)0x1000000010);
    v87[++v6] = vsub_s32(v8, (int32x2_t)(*(_QWORD *)&vsra_n_u32((uint32x2_t)v8, (uint32x2_t)vcltz_s32(v8), 0x1CuLL) & 0xFFFFFFF0FFFFFFF0));
  }
  while (v6 != 4);
  v9 = 0;
  v10 = 0;
  __p = 0;
  v86 = 0;
  v87[0] = 0;
  do
  {
    if ((unint64_t)v9 >= v87[0])
    {
      v11 = (char *)__p;
      v12 = (v9 - (_BYTE *)__p) >> 4;
      v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 60)
        sub_100026E7C();
      v14 = v87[0] - (_QWORD)__p;
      if ((uint64_t)(v87[0] - (_QWORD)__p) >> 3 > v13)
        v13 = v14 >> 3;
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
        v15 = 0xFFFFFFFFFFFFFFFLL;
      else
        v15 = v13;
      if (v15)
      {
        v16 = (char *)sub_10013A59C((uint64_t)v87, v15);
        v11 = (char *)__p;
        v9 = v86;
      }
      else
      {
        v16 = 0;
      }
      v17 = &v16[16 * v12];
      *(_QWORD *)v17 = 0;
      *((_QWORD *)v17 + 1) = 0;
      v18 = v17;
      if (v9 != v11)
      {
        do
        {
          v7 = *((_OWORD *)v9 - 1);
          *((_OWORD *)v18 - 1) = v7;
          v18 -= 16;
          v9 -= 16;
        }
        while (v9 != v11);
        v11 = (char *)__p;
      }
      v9 = v17 + 16;
      __p = v18;
      v86 = v17 + 16;
      v87[0] = &v16[16 * v15];
      if (v11)
        operator delete(v11);
    }
    else
    {
      *(_QWORD *)v9 = 0;
      *((_QWORD *)v9 + 1) = 0;
      v9 += 16;
    }
    v86 = v9;
    ++v10;
  }
  while (v10 != 16);
  for (i = 0; i != 8; ++i)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", i, *(double *)&v7));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "real"));
    objc_msgSend(v21, "doubleValue");
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", i));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "imag"));
    objc_msgSend(v25, "doubleValue");
    v26 = (char *)__p + 16 * *((int *)&v87[1] + i);
    *v26 = v23;
    v26[1] = v27;

  }
  if ((unint64_t)(v86 - (_BYTE *)__p) <= 0xFF)
    __assert_rtn("fft_NpointCIR", "NRBYRangeBiasEstimator.mm", 887, "fft_in.size() >= N");
  v28 = 0;
  __src = 0;
  v83 = 0;
  v84 = 0;
  do
  {
    v30 = *(double *)__p;
    v29 = *((double *)__p + 1);
    v31 = v28;
    for (j = 16; j != 256; j += 16)
    {
      v33 = (char *)__p;
      v77 = vmulq_n_f64((float64x2_t)xmmword_10047A9D0, (double)v31);
      sub_10013BD1C(v77.f64);
      v79 = v34;
      __dst = v35;
      v30 = v30 + sub_10013BB50((double *)&v33[j], (double *)&v79);
      v29 = v29 + v36;
      v31 += v28;
    }
    v37 = v83;
    if (v83 >= v84)
    {
      v39 = (double *)__src;
      v40 = ((char *)v83 - (_BYTE *)__src) >> 4;
      v41 = v40 + 1;
      if ((unint64_t)(v40 + 1) >> 60)
        sub_100026E7C();
      v42 = (char *)v84 - (_BYTE *)__src;
      if (((char *)v84 - (_BYTE *)__src) >> 3 > v41)
        v41 = v42 >> 3;
      if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF0)
        v43 = 0xFFFFFFFFFFFFFFFLL;
      else
        v43 = v41;
      if (v43)
      {
        v44 = (char *)sub_10013A59C((uint64_t)&v84, v43);
        v39 = (double *)__src;
        v37 = v83;
      }
      else
      {
        v44 = 0;
      }
      v45 = (double *)&v44[16 * v40];
      *v45 = v30;
      v45[1] = v29;
      v46 = v45;
      if (v37 != v39)
      {
        do
        {
          *((_OWORD *)v46 - 1) = *((_OWORD *)v37 - 1);
          v46 -= 2;
          v37 -= 2;
        }
        while (v37 != v39);
        v39 = (double *)__src;
      }
      v38 = (uint64_t)(v45 + 2);
      __src = v46;
      v83 = v45 + 2;
      v84 = (double *)&v44[16 * v43];
      if (v39)
        operator delete(v39);
    }
    else
    {
      *v83 = v30;
      v37[1] = v29;
      v38 = (uint64_t)(v37 + 2);
    }
    v83 = (double *)v38;
    ++v28;
  }
  while (v28 != 16);
  __dst = 0;
  v81 = 0;
  v79 = 0;
  sub_10033B6A8(&v79, (char *)__src + 128, v38, (v38 - ((uint64_t)__src + 128)) >> 4);
  sub_10033B720((uint64_t)&v79, (uint64_t)__dst, (char *)__src, (char *)__src + 128, 8);
  if ((_BYTE *)__dst - (_BYTE *)v79 != 256)
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:]", "NRBYRangeBiasEstimator.mm", 789, "calculatedFftCir16ptShifted.size() == kDimFft");
  v47 = 0.0;
  v48 = 0;
  v77 = 0uLL;
  v78 = 0;
  do
  {
    v49 = (char *)v79 + 16 * dword_10047AA60[v48];
    if (*(_QWORD *)&v47 >= (unint64_t)v78)
    {
      v50 = (uint64_t)(*(_QWORD *)&v47 - *(_QWORD *)&v77.f64[0]) >> 4;
      if ((unint64_t)(v50 + 1) >> 60)
        sub_100026E7C();
      v51 = (uint64_t)&v78[-*(_QWORD *)&v77.f64[0]] >> 3;
      if (v51 <= v50 + 1)
        v51 = v50 + 1;
      if ((unint64_t)&v78[-*(_QWORD *)&v77.f64[0]] >= 0x7FFFFFFFFFFFFFF0)
        v52 = 0xFFFFFFFFFFFFFFFLL;
      else
        v52 = v51;
      if (v52)
        v53 = (char *)sub_10013A59C((uint64_t)&v78, v52);
      else
        v53 = 0;
      v54 = &v53[16 * v50];
      *(_OWORD *)v54 = *v49;
      v55 = v77.f64[1];
      v56 = v77.f64[0];
      v57 = v54;
      if (*(_QWORD *)&v77.f64[1] != *(_QWORD *)&v77.f64[0])
      {
        do
        {
          *((_OWORD *)v57 - 1) = *(_OWORD *)(*(_QWORD *)&v55 - 16);
          v57 -= 16;
          *(_QWORD *)&v55 -= 16;
        }
        while (*(_QWORD *)&v55 != *(_QWORD *)&v56);
        v55 = v77.f64[0];
      }
      *(_QWORD *)&v47 = v54 + 16;
      *(_QWORD *)&v77.f64[0] = v57;
      *(_QWORD *)&v77.f64[1] = v54 + 16;
      v78 = &v53[16 * v52];
      if (v55 != 0.0)
        operator delete(*(void **)&v55);
    }
    else
    {
      **(_OWORD **)&v47 = *v49;
      *(_QWORD *)&v47 += 16;
    }
    v77.f64[1] = v47;
    ++v48;
  }
  while (v48 != 7);
  v58 = v77.f64[0];
  v76 = *(_OWORD *)(*(_QWORD *)&v77.f64[0] + 48);
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  if (*(_QWORD *)&v47 == *(_QWORD *)&v58)
    goto LABEL_85;
  v59 = 0;
  v47 = v58;
  do
  {
    if (hypot(*(long double *)&v76, *((long double *)&v76 + 1)) == 0.0)
      __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:]", "NRBYRangeBiasEstimator.mm", 804, "std::abs(peakCir) != 0");
    v60 = sub_10033A8FC((double *)(*(_QWORD *)&v47 + 16 * v59), (long double *)&v76);
    v62 = hypot(v60, v61);
    if (v62 == 0.0)
      __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:]", "NRBYRangeBiasEstimator.mm", 806, "normalizedFftMagnitude != 0");
    v63 = log10(v62) * 20.0;
    var1 = retstr->var1;
    var0 = retstr->var2.var0;
    if (var1 >= var0)
    {
      v67 = retstr->var0;
      v68 = var1 - retstr->var0;
      v69 = v68 + 1;
      if ((unint64_t)(v68 + 1) >> 61)
        sub_100026E7C();
      v70 = (char *)var0 - (char *)v67;
      if (v70 >> 2 > v69)
        v69 = v70 >> 2;
      if ((unint64_t)v70 >= 0x7FFFFFFFFFFFFFF8)
        v71 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v71 = v69;
      if (v71)
      {
        v72 = (char *)sub_10005538C((uint64_t)&retstr->var2, v71);
        v67 = retstr->var0;
        var1 = retstr->var1;
      }
      else
      {
        v72 = 0;
      }
      v73 = (double *)&v72[8 * v68];
      *v73 = v63;
      v66 = v73 + 1;
      while (var1 != v67)
      {
        v74 = *((_QWORD *)var1-- - 1);
        *((_QWORD *)v73-- - 1) = v74;
      }
      retstr->var0 = v73;
      retstr->var1 = v66;
      retstr->var2.var0 = (double *)&v72[8 * v71];
      if (v67)
        operator delete(v67);
    }
    else
    {
      *var1 = v63;
      v66 = var1 + 1;
    }
    retstr->var1 = v66;
    ++v59;
    v47 = v77.f64[0];
  }
  while (v59 < (uint64_t)(*(_QWORD *)&v77.f64[1] - *(_QWORD *)&v77.f64[0]) >> 4);
  if (*(_QWORD *)&v77.f64[0])
  {
LABEL_85:
    v77.f64[1] = v47;
    operator delete(*(void **)&v47);
  }
  if (v79)
  {
    __dst = v79;
    operator delete(v79);
  }
  if (__src)
  {
    v83 = (double *)__src;
    operator delete(__src);
  }
  if (__p)
  {
    v86 = (char *)__p;
    operator delete(__p);
  }

  return result;
}

- (id)scaleCirValuesIfRequired:(id)a3
{
  id v3;
  id v4;
  int v5;
  uint64_t v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  float v16;
  id v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  Complex *v28;
  void *v29;
  void *v30;
  Complex *v31;
  NSObject *v32;
  uint8_t v34[16];

  v4 = a3;
  v5 = *((_DWORD *)sub_100004784() + 186);
  if (!v5)
  {
    v3 = objc_msgSend(v4, "copy");
    goto LABEL_16;
  }
  if (v5 == 2)
  {
    v32 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#bias-est, Unknown platform", v34, 2u);
    }
    goto LABEL_15;
  }
  if (v5 != 1)
    goto LABEL_16;
  v6 = 0;
  v7 = 0.0;
  v8 = 0.0;
  do
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "real"));
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v6));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imag"));
    objc_msgSend(v14, "doubleValue");
    v8 = fmax(fabs(v12), v8);
    v7 = fmax(fabs(v15), v7);

    ++v6;
  }
  while (v6 != 8);
  v16 = fmaxf(v8, v7);
  if (v16 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003EDE40();
LABEL_15:
    v3 = 0;
    goto LABEL_16;
  }
  v17 = objc_alloc_init((Class)NSMutableArray);
  v18 = 0;
  v19 = (float)(32767.0 / v16);
  do
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v18));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "real"));
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v18));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "imag"));
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    v28 = [Complex alloc];
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23 * v19));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27 * v19));
    v31 = -[Complex initWithRealPart:imagPart:](v28, "initWithRealPart:imagPart:", v29, v30);
    objc_msgSend(v17, "addObject:", v31);

    ++v18;
  }
  while (v18 != 8);
  v3 = objc_msgSend(v17, "copy");

LABEL_16:
  return v3;
}

- (NSNumber)biasCorrectionEstimate
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBiasCorrectionEstimate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  NIMLModelResourcePackage *p_dataTranformerResources;

  objc_storeStrong((id *)&self->_biasCorrectionEstimate, 0);
  objc_storeStrong((id *)&self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2, 0);
  objc_storeStrong((id *)&self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1, 0);
  p_dataTranformerResources = (NIMLModelResourcePackage *)&self->_modelResourcePackage.dataTranformerResources;
  sub_10033B348((void ***)&p_dataTranformerResources);
  p_dataTranformerResources = &self->_modelResourcePackage;
  sub_10033B348((void ***)&p_dataTranformerResources);
  objc_storeStrong((id *)&self->_remoteTxAntennaMask, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end
