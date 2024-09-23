@implementation TMTimeSynthesizer

- (id)timeAtRtc:(double)a3
{
  TMTimeSynthesizerStates *v5;
  TMTimeSynthesizerStates *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  TMTimeSynthesizerStates *v11;
  BOOL v12;
  double v13;
  NSObject *v14;
  NSString *name;
  double lastTimeRtc;
  double rtc;
  TMTime *v18;
  double v19;
  double v20;
  NSObject *v21;
  NSString *v22;
  int v24;
  NSString *v25;
  __int16 v26;
  TMTimeSynthesizerStates *v27;
  __int16 v28;
  TMTimeSynthesizerStates *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;

  v5 = sub_100006D88((uint64_t)self, a3);
  if (v5)
  {
    v6 = v5;
    v7 = a3 - self->_rtc;
    -[TMTimeSynthesizerStates utc](v5, "utc");
    v9 = v8 - self->_utc;
    if (v7 <= v9)
      v10 = v9 - v7;
    else
      v10 = v7 - v9;
    v11 = sub_100006D88((uint64_t)self, self->_rtc);
    v12 = v7 >= 0.0 && v10 <= 1.0;
    if (!v12 || (-[TMTimeSynthesizerStates utc_var](v6, "utc_var"), v10 > sqrt(v13) * 50.0))
    {
      v14 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        lastTimeRtc = self->_lastTimeRtc;
        rtc = self->_rtc;
        v24 = 138414082;
        v25 = name;
        v26 = 2112;
        v27 = v11;
        v28 = 2112;
        v29 = v6;
        v30 = 2048;
        v31 = v7;
        v32 = 2048;
        v33 = v9;
        v34 = 2048;
        v35 = v10;
        v36 = 2048;
        v37 = lastTimeRtc;
        v38 = 2048;
        v39 = rtc;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@,WrongPredictState,Current,%@,PredictState,%@,dRtc,%.3lf,dUtc,%.3lf,ddtc,%.3lf,lastRtc,%.3lf,rtc,%.3lf", (uint8_t *)&v24, 0x52u);
      }
    }
    v18 = objc_alloc_init(TMTime);
    -[TMTimeSynthesizerStates rtc](v6, "rtc");
    -[TMTime setRtc_s:](v18, "setRtc_s:");
    -[TMTimeSynthesizerStates utc](v6, "utc");
    -[TMTime setUtc_s:](v18, "setUtc_s:");
    -[TMTimeSynthesizerStates utc_var](v6, "utc_var");
    -[TMTime setUtcUnc_s:](v18, "setUtcUnc_s:", sqrt(v19));
    -[TMTimeSynthesizerStates rateSf](v6, "rateSf");
    -[TMTime setSf:](v18, "setSf:");
    -[TMTimeSynthesizerStates sf_var](v6, "sf_var");
    -[TMTime setSfUnc:](v18, "setSfUnc:", sqrt(v20));
    -[TMTime setSynthesized:](v18, "setSynthesized:", 1);
    -[TMTime setSource:](v18, "setSource:", CFSTR("TMTimeSynthesizer"));
    -[TMTime setReliability:](v18, "setReliability:", sub_1000073F4(self, v18));
  }
  else
  {
    v21 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_name;
      v24 = 138412290;
      v25 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@, Filter Not Available for timeAtRtc", (uint8_t *)&v24, 0xCu);
    }
    return 0;
  }
  return v18;
}

- (TMTime)lastQualityTime
{
  return (TMTime *)objc_getProperty(self, a2, 136, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithClockAccuracy:noiseDensity:name:", -[TMTimeSynthesizer name](self, "name"), self->_xoAccuracy, self->_clkSg);
  objc_msgSend(v4, "setRunning:", -[TMTimeSynthesizer isRunning](self, "isRunning"));
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_rtc;
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_utc;
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_rateSf;
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_utc_var;
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_sf_var;
  *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_utc_sf_cov;
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_smoothedSf;
  *((_DWORD *)v4 + 26) = self->_measNumber;
  objc_msgSend(v4, "setLastQualityTime:", -[TMTimeSynthesizer lastQualityTime](self, "lastQualityTime"));
  objc_msgSend(v4, "setLastInputSource:", -[TMTimeSynthesizer lastInputSource](self, "lastInputSource"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[TMTimeSynthesizer name](self, "name"), CFSTR("name"));
  objc_msgSend(a3, "encodeBool:forKey:", -[TMTimeSynthesizer isRunning](self, "isRunning"), CFSTR("running"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("rtc"), self->_rtc);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("utc"), self->_utc);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("rateSf"), self->_rateSf);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("utc_var"), self->_utc_var);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("sf_var"), self->_sf_var);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("utc_sf_cov"), self->_utc_sf_cov);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("xoAccuracy"), self->_xoAccuracy);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("clkSg"), self->_clkSg);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("smoothedSf"), self->_smoothedSf);
  objc_msgSend(a3, "encodeInt:forKey:", self->_measNumber, CFSTR("measNumber"));
  objc_msgSend(a3, "encodeObject:forKey:", -[TMTimeSynthesizer lastQualityTime](self, "lastQualityTime"), CFSTR("lastQualityTime"));
  objc_msgSend(a3, "encodeObject:forKey:", -[TMTimeSynthesizer lastInputSource](self, "lastInputSource"), CFSTR("lastInputSource"));
}

- (TMTimeSynthesizer)initWithCoder:(id)a3
{
  TMTimeSynthesizer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = -[TMTimeSynthesizer init](self, "init");
  if (v4)
  {
    -[TMTimeSynthesizer setName:](v4, "setName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("name")));
    -[TMTimeSynthesizer setRunning:](v4, "setRunning:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("running")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("rtc"));
    v4->_rtc = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("utc"));
    v4->_utc = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("rateSf"));
    v4->_rateSf = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("utc_var"));
    v4->_utc_var = v8;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("sf_var"));
    v4->_sf_var = v9;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("utc_sf_cov"));
    v4->_utc_sf_cov = v10;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("xoAccuracy"));
    v4->_xoAccuracy = v11;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("clkSg"));
    v4->_clkSg = v12;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("smoothedSf"));
    v4->_smoothedSf = v13;
    v4->_measNumber = objc_msgSend(a3, "decodeIntForKey:", CFSTR("measNumber"));
    -[TMTimeSynthesizer setLastQualityTime:](v4, "setLastQualityTime:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(TMTime), CFSTR("lastQualityTime")));
    -[TMTimeSynthesizer setLastInputSource:](v4, "setLastInputSource:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("lastInputSource")));
    -[TMTimeSynthesizer displayLastQualityTime](v4, "displayLastQualityTime");
    v4->_lastRtcForSmoothSf = 0.0;
  }
  return v4;
}

+ (id)newSynthesizerFromDataRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TMTimeSynthesizer+Caching.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));
  v15 = 0;
  v4 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", a3, &v15);
  v5 = v15;
  if (v15)
  {
    v6 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001BEE4(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(TMTimeSynthesizer), NSKeyedArchiveRootObjectKey);
  objc_msgSend(v4, "finishDecoding");

  return v13;
}

- (id)dataRepresentation
{
  NSData *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v12 = 0;
  v2 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v12);
  v3 = v12;
  if (v12)
  {
    v4 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001BF48(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  return v2;
}

- (BOOL)intersects:(id)a3
{
  id v4;
  double v5;
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
  id v17;
  BOOL v18;
  _QWORD v20[9];

  v4 = -[TMTimeSynthesizer synthesizedTimeAtLastRTC](self, "synthesizedTimeAtLastRTC");
  objc_msgSend(a3, "rtc_s");
  objc_msgSend(v4, "propagatedTimeAtRTC:");
  v6 = v5;
  objc_msgSend(v4, "utcUnc_s");
  v8 = v7;
  objc_msgSend(a3, "rtc_s");
  v10 = v9;
  objc_msgSend(v4, "rtc_s");
  v12 = sub_10000A56C(v8, vabdd_f64(v10, v11));
  objc_msgSend(a3, "utc_s");
  v14 = v13;
  objc_msgSend(a3, "utcUnc_s");
  v16 = v15;
  v17 = objc_msgSend(a3, "source");
  if (v12 <= 0.0 || v16 <= 0.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL _timesIntersect(CFAbsoluteTime, CFTimeInterval, NSString *, CFAbsoluteTime, CFTimeInterval)"), CFSTR("TMTimeSynthesizer+Clamping.m"), 16, CFSTR("Negative uncertainty"));
  v18 = v6 + v12 - (v14 - v16) >= 0.0 && v14 + v16 - (v6 - v12) >= 0.0;
  if (!v18)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000165BC;
    v20[3] = &unk_1000293C0;
    *(double *)&v20[5] = v14 + v16 - (v6 - v12);
    *(double *)&v20[6] = v6 + v12 - (v14 - v16);
    v20[4] = v17;
    *(double *)&v20[7] = v16;
    *(double *)&v20[8] = v12;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.STFClampReject"), v20);
  }
  return v18;
}

- (void)inflateHistoricalDataBy:(double)a3
{
  NSObject *v5;
  NSString *name;
  double utc_var;
  double utc_sf_cov;
  TMTime *v9;
  TMTime *v10;
  double v11;
  int v12;
  NSString *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;

  v5 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    utc_var = self->_utc_var;
    utc_sf_cov = self->_utc_sf_cov;
    v12 = 138413058;
    v13 = name;
    v14 = 2048;
    v15 = a3;
    v16 = 2048;
    v17 = utc_var;
    v18 = 2048;
    v19 = utc_sf_cov;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@,Inflate,inflation_s,%lf,utcVar,%lf,sfCovar,%lf", (uint8_t *)&v12, 0x2Au);
  }
  if (a3 != 0.0)
  {
    v9 = -[TMTimeSynthesizer lastQualityTime](self, "lastQualityTime");
    v10 = v9;
    if (v9)
    {
      -[TMTime utcUnc_s](v9, "utcUnc_s");
      -[TMTime setUtcUnc_s:](v10, "setUtcUnc_s:", v11 + a3);
    }

    self->_utc_var = self->_utc_var + a3 * (a3 + sqrt(self->_utc_var) * 2.0);
    self->_utc_sf_cov = 0.0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[TMTimeSynthesizer setName:](self, "setName:", 0);
  -[TMTimeSynthesizer setLastQualityTime:](self, "setLastQualityTime:", 0);
  -[TMTimeSynthesizer setLastInputSource:](self, "setLastInputSource:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TMTimeSynthesizer;
  -[TMTimeSynthesizer dealloc](&v3, "dealloc");
}

- (TMTimeSynthesizer)initWithClockAccuracy:(double)a3 noiseDensity:(double)a4 name:(id)a5
{
  TMTimeSynthesizer *v8;
  TMTimeSynthesizer *v9;

  v8 = -[TMTimeSynthesizer init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[TMTimeSynthesizer reset](v8, "reset");
    v9->_clkSg = a4;
    v9->_xoAccuracy = a3;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v9->_rateSf = _Q0;
    v9->_lastRtcForSmoothSf = 0.0;
    -[TMTimeSynthesizer setName:](v9, "setName:", a5);
    v9->_lastInputSource = 0;
    -[TMTimeSynthesizer displayLastQualityTime](v9, "displayLastQualityTime");
  }
  return v9;
}

- (void)displayLastQualityTime
{
  TMTime *v3;
  uint64_t v4;
  _BOOL4 v5;
  NSString *name;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSString *v16;
  int v17;
  NSString *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;

  v3 = -[TMTimeSynthesizer lastQualityTime](self, "lastQualityTime");
  v4 = qword_100033720;
  v5 = os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      name = self->_name;
      v7 = -[TMTime source](v3, "source");
      -[TMTime rtc_s](v3, "rtc_s");
      v9 = v8;
      -[TMTime utc_s](v3, "utc_s");
      v11 = v10;
      -[TMTime utcUnc_s](v3, "utcUnc_s");
      v17 = 138413314;
      v18 = name;
      v19 = 2112;
      v20 = v7;
      v21 = 2048;
      v22 = v9;
      v23 = 2048;
      v24 = v11;
      v25 = 2048;
      v26 = v12;
      v13 = "%@,lastQualityTime,Src,%@,Rtc,%.6lf,Utc,%.6lf,Unc,%.6lf";
      v14 = v4;
      v15 = 52;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, v15);
    }
  }
  else if (v5)
  {
    v16 = self->_name;
    v17 = 138412290;
    v18 = v16;
    v13 = "%@,lastQualityTime,Empty";
    v14 = v4;
    v15 = 12;
    goto LABEL_6;
  }

}

- (id)synthesizedTimeAtLastRTC
{
  if (self->_running)
    return -[TMTimeSynthesizer timeAtRtc:](self, "timeAtRtc:", self->_lastTimeRtc);
  else
    return 0;
}

- (double)rtcWhenBeyondUncertainty:(double)a3
{
  double utc_var;
  double v5;
  double v6;
  double v7;
  double v8;

  if (self->_running && (utc_var = self->_utc_var, a3 * a3 >= utc_var) && !self->_needTimeNow && self->_measNumber > 3)
  {
    v5 = (self->_sf_var + self->_clkSg * 10800.0 / 3.0) * 1.0e12;
    v6 = (self->_utc_sf_cov + self->_utc_sf_cov) * 1.0e12;
    v7 = (sqrt((utc_var - a3 * a3) * 1.0e12 * (v5 * -4.0) + v6 * v6) - v6) / (v5 + v5);
    v8 = (a3 - sqrt(utc_var)) / (self->_xoAccuracy * 0.5);
    if (v7 < v8)
      v8 = v7;
    return self->_rtc + v8 * 0.75;
  }
  else
  {
    self->_needTimeNow = 0;
    return -INFINITY;
  }
}

- (void)reset
{
  self->_running = 0;
}

- (void)update:(id)a3 withError:(id *)a4
{
  NSObject *v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 running;
  double rtc;
  NSObject *v19;
  NSString *name;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  double v28;
  double v29;
  NSObject *v30;
  NSString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  TMTimeSynthesizerStates *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  int v61;
  int v62;
  NSObject *v63;
  NSString *v64;
  unint64_t rejects;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  unint64_t v75;
  NSObject *v76;
  NSString *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  NSObject *v90;
  NSString *v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double utc_sf_cov;
  double v118;
  NSObject *v119;
  NSString *v120;
  double utc;
  double v122;
  double rateSf;
  long double v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  double v134;
  double v135;
  uint64_t v136;
  uint64_t v137;
  int measNumber;
  double v139;
  double v140;
  double v141;
  double v142;
  _QWORD v143[6];
  _QWORD v144[5];
  _QWORD v145[5];
  _QWORD v146[7];
  _QWORD v147[7];
  _QWORD v148[6];
  uint8_t buf[4];
  NSString *v150;
  __int16 v151;
  _BYTE v152[48];
  __int16 v153;
  double v154;
  __int16 v155;
  long double v156;
  __int16 v157;
  uint64_t v158;
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  uint64_t v162;
  __int16 v163;
  id v164;
  __int16 v165;
  uint64_t v166;
  __int16 v167;
  double v168;
  __int16 v169;
  uint64_t v170;
  __int16 v171;
  double v172;
  __int16 v173;
  int v174;

  self->_needTimeNow = 0;
  if (objc_msgSend(a3, "isSynthesized"))
  {
    v7 = qword_100033718;
    if (!os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
    {
      if (!a4)
        return;
      goto LABEL_4;
    }
    sub_10001C440(v7);
    if (a4)
    {
LABEL_4:
      v8 = 0;
LABEL_26:
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kTimedErrorDomain"), v8, 0);
    }
  }
  else
  {
    objc_msgSend(a3, "utcUnc_s");
    if (v9 >= 0.000001)
    {
      running = self->_running;
      objc_msgSend(a3, "rtc_s");
      if (running && rtc < self->_rtc)
        rtc = self->_rtc;
      self->_lastTimeRtc = rtc;
      ++self->_measNumber;
      if (objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", CFSTR("MobileLockdown")))
      {
        if (self->_running)
        {
          v19 = qword_100033720;
          if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
          {
            name = self->_name;
            objc_msgSend(a3, "rtc_s");
            v22 = v21;
            objc_msgSend(a3, "utc_s");
            v24 = v23;
            objc_msgSend(a3, "utcUnc_s");
            v26 = v25;
            v27 = objc_msgSend(a3, "source");
            v28 = self->_rtc;
            *(_DWORD *)buf = 138413570;
            v150 = name;
            v151 = 2048;
            *(_QWORD *)v152 = v22;
            *(_WORD *)&v152[8] = 2048;
            *(_QWORD *)&v152[10] = v24;
            *(_WORD *)&v152[18] = 2048;
            *(_QWORD *)&v152[20] = v26;
            *(_WORD *)&v152[28] = 2112;
            *(_QWORD *)&v152[30] = v27;
            *(_WORD *)&v152[38] = 2048;
            *(double *)&v152[40] = v28;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@,ignoreMobileLockdown,rtc,%.6lf,utc,%.6lf,unc,%.6lf,source,%@,_rtc,%.6lf", buf, 0x3Eu);
          }
          if (a4)
          {
            v8 = 2;
            goto LABEL_26;
          }
          return;
        }
      }
      else if (self->_running)
      {
        objc_msgSend(a3, "rtc_s");
        if (v29 >= self->_rtc + -0.006)
        {
          objc_msgSend(a3, "rtc_s");
          if (v42 < self->_rtc)
            v42 = self->_rtc;
          v43 = sub_100006D88((uint64_t)self, v42);
          v147[0] = _NSConcreteStackBlock;
          v147[1] = 3221225472;
          v147[2] = sub_100018B1C;
          v147[3] = &unk_1000294B8;
          v147[4] = v43;
          v147[5] = a3;
          v147[6] = self;
          AnalyticsSendEventLazy(CFSTR("com.apple.timed.TDTFUpdatePrediction"), v147);
          objc_msgSend(a3, "utcUnc_s");
          v45 = v44;
          objc_msgSend(a3, "utcUnc_s");
          v47 = v46;
          -[TMTimeSynthesizerStates utc_var](v43, "utc_var");
          v49 = v48;
          objc_msgSend(a3, "utc_s");
          v51 = v50;
          -[TMTimeSynthesizerStates utc](v43, "utc");
          v53 = v51 - v52;
          -[TMTimeSynthesizerStates utc_var](v43, "utc_var");
          v55 = v54;
          objc_msgSend(a3, "utcUnc_s");
          v57 = v56;
          objc_msgSend(a3, "utcUnc_s");
          v59 = v55 + v57 * v58;
          v60 = 3.0;
          if ((objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", CFSTR("TMLSSourceComputed")) & 1) == 0)
          {
            if (objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", CFSTR("TimeSourceGnssValidPos")))v60 = 10.0;
            else
              v60 = 5.0;
          }
          v61 = sub_1000172B0((uint64_t)TMTimeSynthesizer, objc_msgSend(a3, "source"));
          v62 = v61;
          if (v53 * v53 <= v59 * (v60 * v60))
          {
            v104 = v45 * v47 * 1000000.0;
            v105 = v49 * 1000000.0;
            v106 = v105 + v104;
            if (v61)
              self->_rejects = 0;
            -[TMTimeSynthesizerStates rtc](v43, "rtc");
            self->_rtc = v107;
            -[TMTimeSynthesizerStates utc](v43, "utc");
            self->_utc = v108;
            -[TMTimeSynthesizerStates rateSf](v43, "rateSf");
            self->_rateSf = v109;
            -[TMTimeSynthesizerStates utc_var](v43, "utc_var");
            self->_utc_var = v110;
            -[TMTimeSynthesizerStates sf_var](v43, "sf_var");
            self->_sf_var = v111;
            -[TMTimeSynthesizerStates utc_sf_cov](v43, "utc_sf_cov");
            self->_utc_sf_cov = v112;
            v113 = v104 / v106;
            -[TMTimeSynthesizerStates utc_sf_cov](v43, "utc_sf_cov");
            v115 = v114 * 1000000.0 / v106;
            v116 = self->_rateSf + v53 * v115;
            self->_utc = self->_utc + v105 / v106 * v53;
            self->_rateSf = v116;
            utc_sf_cov = self->_utc_sf_cov;
            v118 = self->_sf_var - utc_sf_cov * v115;
            if (v118 < 6.25e-14)
              v118 = 6.25e-14;
            self->_utc_var = v113 * self->_utc_var;
            self->_sf_var = v118;
            self->_utc_sf_cov = v113 * utc_sf_cov;
            -[TMTimeSynthesizer setLastInputSource:](self, "setLastInputSource:", objc_msgSend(a3, "source"));
            sub_100017698(self, a3);
            sub_100017BF0((uint64_t)self);
            v119 = qword_100033720;
            if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
            {
              v120 = self->_name;
              v122 = self->_rtc;
              utc = self->_utc;
              rateSf = self->_rateSf;
              v142 = sqrt(self->_sf_var);
              v140 = sqrt(self->_utc_var);
              v141 = sqrt(self->_utc_sf_cov);
              v124 = log10(self->_clkSg);
              objc_msgSend(a3, "rtc_s");
              v126 = v125;
              objc_msgSend(a3, "utc_s");
              v128 = v127;
              objc_msgSend(a3, "utcUnc_s");
              v130 = v129;
              v131 = objc_msgSend(a3, "source");
              -[TMTimeSynthesizerStates utc](v43, "utc");
              v133 = v132;
              -[TMTimeSynthesizerStates utc_var](v43, "utc_var");
              v135 = sqrt(v134);
              -[TMTimeSynthesizerStates rateSf](v43, "rateSf");
              v137 = v136;
              -[TMTimeSynthesizerStates sf_var](v43, "sf_var");
              measNumber = self->_measNumber;
              *(_DWORD *)buf = 138416386;
              v150 = v120;
              v151 = 2048;
              *(double *)v152 = v122;
              *(_WORD *)&v152[8] = 2048;
              *(double *)&v152[10] = utc;
              *(_WORD *)&v152[18] = 2048;
              *(double *)&v152[20] = v140;
              *(_WORD *)&v152[28] = 2048;
              *(double *)&v152[30] = rateSf;
              *(_WORD *)&v152[38] = 2048;
              *(double *)&v152[40] = v142;
              v153 = 2048;
              v154 = v141;
              v155 = 2048;
              v156 = v124;
              v157 = 2048;
              v158 = v126;
              v159 = 2048;
              v160 = v128;
              v161 = 2048;
              v162 = v130;
              v163 = 2112;
              v164 = v131;
              v165 = 2048;
              v166 = v133;
              v167 = 2048;
              v168 = v135;
              v169 = 2048;
              v170 = v137;
              v171 = 2048;
              v172 = sqrt(v139);
              v173 = 1024;
              v174 = measNumber;
              _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "%@,SynthesizedClock,rtc,%.6lf,utc,%.6lf,utcUnc,%.6lf,sf,%.8lf,sfUnc,%.8lf,utcSfCov,%.8lf,logNoise,%.6lf,timeRtc,%.6lf,timeUtc,%.6lf,timeUnc,%.6lf,timeSource,%@,predUtc,%.6lf,predUtcUnc,%.6lf,predSf,%.8lf,predSfUnc,%.8lf,measNumber,%d", buf, 0xA8u);
            }
            v143[0] = _NSConcreteStackBlock;
            v143[1] = 3221225472;
            v143[2] = sub_100018F48;
            v143[3] = &unk_100028F00;
            v143[4] = self;
            v143[5] = a3;
            AnalyticsSendEventLazy(CFSTR("com.apple.timed.TDTFSynthesizedClock"), v143);
          }
          else
          {
            v63 = qword_100033720;
            if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
            {
              v64 = self->_name;
              rejects = self->_rejects;
              -[TMTimeSynthesizerStates utc](v43, "utc");
              v67 = v66;
              objc_msgSend(a3, "rtc_s");
              v69 = v68;
              objc_msgSend(a3, "utc_s");
              v71 = v70;
              objc_msgSend(a3, "utcUnc_s");
              v73 = v72;
              v74 = COERCE_DOUBLE(objc_msgSend(a3, "source"));
              *(_DWORD *)buf = 138414082;
              v150 = v64;
              v151 = 2048;
              *(_QWORD *)v152 = rejects;
              *(_WORD *)&v152[8] = 2048;
              *(double *)&v152[10] = v53;
              *(_WORD *)&v152[18] = 2048;
              *(_QWORD *)&v152[20] = v67;
              *(_WORD *)&v152[28] = 2048;
              *(_QWORD *)&v152[30] = v69;
              *(_WORD *)&v152[38] = 2048;
              *(_QWORD *)&v152[40] = v71;
              v153 = 2048;
              v154 = v73;
              v155 = 2112;
              v156 = v74;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%@,RejectATime,rejects,%lu,innv,%.6lf,predTime,%.6lf,rtc,%.6lf,utc,%.6lf,unc,%.6lf,source,%@", buf, 0x52u);
            }
            v146[0] = _NSConcreteStackBlock;
            v146[1] = 3221225472;
            v146[2] = sub_100018CD8;
            v146[3] = &unk_1000294E0;
            *(double *)&v146[6] = v53;
            v146[4] = self;
            v146[5] = a3;
            AnalyticsSendEventLazy(CFSTR("com.apple.timed.TDTFRejectATime"), v146);
            if (a4)
              *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kTimedErrorDomain"), 4, 0);
            if (v62)
            {
              v75 = self->_rejects + 1;
              self->_rejects = v75;
              self->_needTimeNow = 1;
              v76 = qword_100033720;
              if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
              {
                v77 = self->_name;
                objc_msgSend(a3, "rtc_s");
                v79 = v78;
                objc_msgSend(a3, "utc_s");
                v81 = v80;
                objc_msgSend(a3, "utcUnc_s");
                v83 = v82;
                v84 = objc_msgSend(a3, "source");
                *(_DWORD *)buf = 138413570;
                v150 = v77;
                v151 = 1024;
                *(_DWORD *)v152 = v75;
                *(_WORD *)&v152[4] = 2048;
                *(_QWORD *)&v152[6] = v79;
                *(_WORD *)&v152[14] = 2048;
                *(_QWORD *)&v152[16] = v81;
                *(_WORD *)&v152[24] = 2048;
                *(_QWORD *)&v152[26] = v83;
                *(_WORD *)&v152[34] = 2112;
                *(_QWORD *)&v152[36] = v84;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%@,RequestFastTime,Reject,number,%u,rtc,%.6lf,utc,%.6lf,uncertainty,%.6lf,source,%@", buf, 0x3Au);
              }
              v145[0] = _NSConcreteStackBlock;
              v145[1] = 3221225472;
              v145[2] = sub_100018DC0;
              v145[3] = &unk_100028BA0;
              v145[4] = v43;
              AnalyticsSendEventLazy(CFSTR("com.apple.timed.TDTFRequestFastTime"), v145);
              if (self->_rejects > 4
                || (-[TMTimeSynthesizerStates utc_var](v43, "utc_var"),
                    v86 = v85,
                    objc_msgSend(a3, "utcUnc_s"),
                    v88 = v87,
                    objc_msgSend(a3, "utcUnc_s"),
                    v86 > v88 * v89 * 16.0))
              {
                v90 = qword_100033720;
                if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
                {
                  v91 = self->_name;
                  v92 = self->_rejects;
                  -[TMTimeSynthesizerStates utc](v43, "utc");
                  v94 = v93;
                  -[TMTimeSynthesizerStates utc_var](v43, "utc_var");
                  v96 = sqrt(v95);
                  objc_msgSend(a3, "rtc_s");
                  v98 = v97;
                  objc_msgSend(a3, "utc_s");
                  v100 = v99;
                  objc_msgSend(a3, "utcUnc_s");
                  v102 = v101;
                  v103 = COERCE_DOUBLE(objc_msgSend(a3, "source"));
                  *(_DWORD *)buf = 138414082;
                  v150 = v91;
                  v151 = 2048;
                  *(_QWORD *)v152 = v92;
                  *(_WORD *)&v152[8] = 2048;
                  *(_QWORD *)&v152[10] = v94;
                  *(_WORD *)&v152[18] = 2048;
                  *(double *)&v152[20] = v96;
                  *(_WORD *)&v152[28] = 2048;
                  *(_QWORD *)&v152[30] = v98;
                  *(_WORD *)&v152[38] = 2048;
                  *(_QWORD *)&v152[40] = v100;
                  v153 = 2048;
                  v154 = v102;
                  v155 = 2112;
                  v156 = v103;
                  _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%@,ResetSynthesizer,rejects,%lu,predTime,%.6lf,predTimeUtc,%.6lf,rtc,%.6lf,utc,%.6lf,unc,%.6lf,source,%@", buf, 0x52u);
                }
                v144[0] = _NSConcreteStackBlock;
                v144[1] = 3221225472;
                v144[2] = sub_100018E84;
                v144[3] = &unk_100028BA0;
                v144[4] = v43;
                AnalyticsSendEventLazy(CFSTR("com.apple.timed.TDTFResetDueToRejects"), v144);
                sub_1000177E0(self, a3);
                if (a4)
                {
                  v8 = 5;
                  goto LABEL_26;
                }
              }
            }
          }
        }
        else
        {
          v30 = qword_100033720;
          if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
          {
            v31 = self->_name;
            objc_msgSend(a3, "rtc_s");
            v33 = v32;
            objc_msgSend(a3, "utc_s");
            v35 = v34;
            objc_msgSend(a3, "utcUnc_s");
            v37 = v36;
            v38 = objc_msgSend(a3, "source");
            v39 = self->_rtc;
            *(_DWORD *)buf = 138413570;
            v150 = v31;
            v151 = 2048;
            *(_QWORD *)v152 = v33;
            *(_WORD *)&v152[8] = 2048;
            *(_QWORD *)&v152[10] = v35;
            *(_WORD *)&v152[18] = 2048;
            *(_QWORD *)&v152[20] = v37;
            *(_WORD *)&v152[28] = 2112;
            *(_QWORD *)&v152[30] = v38;
            *(_WORD *)&v152[38] = 2048;
            *(double *)&v152[40] = v39;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@,RtcRollBack,rtc,%.6lf,utc,%.6lf,unc,%.6lf,source,%@,_rtc,%.6lf", buf, 0x3Eu);
          }
          v148[0] = _NSConcreteStackBlock;
          v148[1] = 3221225472;
          v148[2] = sub_100018A68;
          v148[3] = &unk_100028F00;
          v148[4] = self;
          v148[5] = a3;
          AnalyticsSendEventLazy(CFSTR("com.apple.timed.TDTFRtcRollback"), v148);
          v40 = self->_rtc;
          objc_msgSend(a3, "rtc_s");
          if (a4 && v40 - v41 > 3600.0)
          {
            v8 = 3;
            goto LABEL_26;
          }
        }
        return;
      }
      sub_1000177E0(self, a3);
      return;
    }
    v10 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_name;
      objc_msgSend(a3, "rtc_s");
      v13 = v12;
      objc_msgSend(a3, "utc_s");
      v15 = v14;
      objc_msgSend(a3, "utcUnc_s");
      *(_DWORD *)buf = 138413314;
      v150 = v11;
      v151 = 2048;
      *(_QWORD *)v152 = v13;
      *(_WORD *)&v152[8] = 2048;
      *(_QWORD *)&v152[10] = v15;
      *(_WORD *)&v152[18] = 2048;
      *(_QWORD *)&v152[20] = v16;
      *(_WORD *)&v152[28] = 2112;
      *(_QWORD *)&v152[30] = objc_msgSend(a3, "source");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@,zeroTimeUncertainty,timeRtc,%.6lf,timeUtc,%.6lf,timeUnc,%.6lf,timeSource,%@", buf, 0x34u);
    }
    if (a4)
    {
      v8 = 1;
      goto LABEL_26;
    }
  }
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setLastQualityTime:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSString)lastInputSource
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastInputSource:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

@end
