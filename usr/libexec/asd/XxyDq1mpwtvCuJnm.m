@implementation XxyDq1mpwtvCuJnm

+ (void)x7PkBasAKbApbiZS:(_KUwyEjpVZR65eUyl *)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = dispatch_queue_create("com.apple.asd.clpw", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014E54;
  block[3] = &unk_1004CE9E0;
  block[4] = a3;
  dispatch_async(v4, block);

}

+ (id)sharedInstance
{
  XxyDq1mpwtvCuJnm *v2;
  void *v3;

  if (!qword_100511568)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v2 = objc_opt_new(XxyDq1mpwtvCuJnm);
      v3 = (void *)qword_100511568;
      qword_100511568 = (uint64_t)v2;

    }
    else
    {
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_1004CEB00);
    }
  }
  return (id)qword_100511568;
}

- (XxyDq1mpwtvCuJnm)init
{
  XxyDq1mpwtvCuJnm *v2;
  XxyDq1mpwtvCuJnm *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)XxyDq1mpwtvCuJnm;
  v2 = -[XxyDq1mpwtvCuJnm init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[XxyDq1mpwtvCuJnm setYABQBiEYyLNkt6IY:](v2, "setYABQBiEYyLNkt6IY:", 0);
    -[XxyDq1mpwtvCuJnm setKp3LsdVLlXwFNqJV:](v3, "setKp3LsdVLlXwFNqJV:", 0);
    -[XxyDq1mpwtvCuJnm setZDlKxUFITTJsP8iN:](v3, "setZDlKxUFITTJsP8iN:", -1.0);
    -[XxyDq1mpwtvCuJnm setVCWRguBEmim3giZ9:](v3, "setVCWRguBEmim3giZ9:", 0);
  }
  return v3;
}

- (BOOL)LjU00AjDrcTJbVJD
{
  return self->_jRTN5Tg2R7nMgayq;
}

- (BOOL)SNfHoVX7xML3tdWp
{
  return self->_YGGzx6XAo42A7s6x < 3u;
}

- (void)UupMWO2j2nYek7xf:(id)a3 exi2C8VfynTXu5cU:(_KUwyEjpVZR65eUyl *)a4 TYPlhTGwKuAdWgfx:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSNumber *v14;
  NSNumber **p_kp3LsdVLlXwFNqJV;
  double zDlKxUFITTJsP8iN;
  CLLocationSourceInformation *v17;
  CLLocationSourceInformation *v18;
  unsigned int var1;
  uint64_t v20;
  double Msur5CGmk1XEBjLD;
  double v22;
  double var4;
  _UNKNOWN **v24;
  void (**v25)(_QWORD, _QWORD);
  void *v26;
  void *v27;
  double v28;
  void *v29;
  _UNKNOWN **v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  int YGGzx6XAo42A7s6x;
  uint64_t v38;
  NSNumber *v39;
  NSNumber *v40;
  CLLocationSourceInformation *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  NSNumber *yABQBiEYyLNkt6IY;
  double v46;
  BOOL v47;
  NSNumber *kp3LsdVLlXwFNqJV;
  CLLocationSourceInformation *vCWRguBEmim3giZ9;
  void *v50;
  double v51;
  double v52;
  NSDate *LUsBOf3PLbri6v6o;
  double v54;
  _BOOL4 v55;
  unsigned __int8 v56;
  void *v57;
  void *v58;
  void *v59;
  NSNumber *v60;
  NSNumber *v61;
  NSNumber *v62;
  CLLocationSourceInformation *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSDate *v75;
  NSDate *v76;
  NSDate *v77;
  void *v78;
  void *v79;
  void *v80;
  _KUwyEjpVZR65eUyl *v81;
  uint64_t v82;
  id v83;
  id v84;
  uint64_t v85;
  void *v86;
  NSNumber *v87;
  CLLocationSourceInformation *v88;
  void (**v89)(_QWORD, _QWORD);
  id *location;
  NSNumber *v91;
  uint64_t v92;
  _QWORD v93[6];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v92 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  *(CLLocationAccuracy *)v93 = kCLLocationAccuracyBestForNavigation;
  *(CLLocationAccuracy *)&v93[1] = kCLLocationAccuracyBest;
  *(CLLocationAccuracy *)&v93[2] = kCLLocationAccuracyNearestTenMeters;
  *(CLLocationAccuracy *)&v93[3] = kCLLocationAccuracyHundredMeters;
  *(CLLocationAccuracy *)&v93[4] = kCLLocationAccuracyKilometer;
  *(CLLocationAccuracy *)&v93[5] = kCLLocationAccuracyThreeKilometers;
  v14 = self->_yABQBiEYyLNkt6IY;
  p_kp3LsdVLlXwFNqJV = &self->_kp3LsdVLlXwFNqJV;
  location = (id *)&self->_vCWRguBEmim3giZ9;
  v91 = self->_kp3LsdVLlXwFNqJV;
  zDlKxUFITTJsP8iN = self->_zDlKxUFITTJsP8iN;
  v17 = self->_vCWRguBEmim3giZ9;
  v18 = v17;
  if (a4->var0 == 4)
  {
    v89 = (void (**)(_QWORD, _QWORD))v10;
    var1 = a4->var1;
    if (var1 == 5)
    {
      v87 = v14;
      v88 = v17;
      v84 = v12;
      v85 = objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", a4->var4.var0.var0, a4->var4.var1.var0.var1));
      *(_QWORD *)&self->_Msur5CGmk1XEBjLD = v93[a4->var4.var5.var2];
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "i4KDOQicW9Xd5WBz"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU eJSthhES04gLkDjz:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:eZh1LWn1FH2uQtPX:](Yp00msaYdVlZesvU, "eJSthhES04gLkDjz:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:eZh1LWn1FH2uQtPX:", &a4->var4.var15.var2.var1, v26, v12, &v92));

      v22 = 0.0;
      if (!v92)
      {
        objc_msgSend(v27, "doubleValue");
        v22 = v28 * 0.001;
      }
      v83 = v11;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "i4KDOQicW9Xd5WBz", a4));
      v30 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU eJSthhES04gLkDjz:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:eZh1LWn1FH2uQtPX:](Yp00msaYdVlZesvU, "eJSthhES04gLkDjz:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:eZh1LWn1FH2uQtPX:", (char *)&a4->var4.var26 + 168, v29, v12, &v92));

      if (v92)
      {

        v30 = &off_1004F4AE0;
      }
      v24 = &_sScG8IteratorV4next9isolationxSgScA_pSgYi_tYaFTu_ptr;
      objc_msgSend(v30, "doubleValue");
      var4 = v31;

      Msur5CGmk1XEBjLD = self->_Msur5CGmk1XEBjLD;
      v20 = v85;
    }
    else
    {
      if (var1 != 4)
      {
        v25 = (void (**)(_QWORD, _QWORD))v10;
        (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
        goto LABEL_58;
      }
      v87 = v14;
      v88 = v17;
      v83 = v11;
      v84 = v12;
      v20 = objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", a4->var4.var0.var0, a4->var4.var1.var0.var1));
      Msur5CGmk1XEBjLD = *(double *)&v93[a4->var4.var5.var2];
      self->_Msur5CGmk1XEBjLD = Msur5CGmk1XEBjLD;
      v81 = a4;
      v22 = (double)a4->var4.var5.var3 * 0.001;
      var4 = (double)a4->var4.var5.var4;
      v24 = &_sScG8IteratorV4next9isolationxSgScA_pSgYi_tYaFTu_ptr;
    }
    v86 = (void *)v20;
    -[XxyDq1mpwtvCuJnm initLocationManager:dko5Pwm7el1Ulopu:](self, "initLocationManager:dko5Pwm7el1Ulopu:", v20, Msur5CGmk1XEBjLD, v81);
    v32 = -v22;
    do
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24[325], "dateWithTimeIntervalSinceNow:", 0.003));
      objc_msgSend(v33, "runUntilDate:", v34);

      objc_msgSend(v13, "timeIntervalSinceNow");
      v36 = v35;
    }
    while (!-[XxyDq1mpwtvCuJnm LjU00AjDrcTJbVJD](self, "LjU00AjDrcTJbVJD") && v36 > v32);
    YGGzx6XAo42A7s6x = self->_YGGzx6XAo42A7s6x;
    v25 = v89;
    if (YGGzx6XAo42A7s6x > 2)
    {
      -[NSDate timeIntervalSinceNow](self->_LUsBOf3PLbri6v6o, "timeIntervalSinceNow");
      v44 = var4 * -0.001;
      yABQBiEYyLNkt6IY = self->_yABQBiEYyLNkt6IY;
      v47 = v46 < v44 || yABQBiEYyLNkt6IY == 0;
      if (v47 || !*p_kp3LsdVLlXwFNqJV || self->_Msur5CGmk1XEBjLD < self->_zDlKxUFITTJsP8iN)
      {
        self->_yABQBiEYyLNkt6IY = 0;

        kp3LsdVLlXwFNqJV = self->_kp3LsdVLlXwFNqJV;
        self->_kp3LsdVLlXwFNqJV = 0;

        vCWRguBEmim3giZ9 = self->_vCWRguBEmim3giZ9;
        self->_vCWRguBEmim3giZ9 = 0;

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[XxyDq1mpwtvCuJnm N8Azi3NI6QrNPsLP](self, "N8Azi3NI6QrNPsLP"));
        objc_msgSend(v50, "startUpdatingLocation");

      }
      do
      {
        objc_msgSend(v13, "timeIntervalSinceNow");
        v36 = v51;
        if (self->_yABQBiEYyLNkt6IY && *p_kp3LsdVLlXwFNqJV
          || (v52 = self->_zDlKxUFITTJsP8iN, v52 >= 0.0) && v52 <= self->_Msur5CGmk1XEBjLD)
        {
          v55 = 0;
        }
        else
        {
          LUsBOf3PLbri6v6o = self->_LUsBOf3PLbri6v6o;
          if (LUsBOf3PLbri6v6o)
          {
            -[NSDate timeIntervalSinceNow](LUsBOf3PLbri6v6o, "timeIntervalSinceNow");
            v55 = v54 < v44;
          }
          else
          {
            v55 = 1;
          }
        }
        v56 = -[XxyDq1mpwtvCuJnm SNfHoVX7xML3tdWp](self, "SNfHoVX7xML3tdWp");
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24[325], "dateWithTimeIntervalSinceNow:", 0.003));
        objc_msgSend(v57, "runUntilDate:", v58);

        v24 = &_sScG8IteratorV4next9isolationxSgScA_pSgYi_tYaFTu_ptr;
      }
      while ((v56 & 1) == 0 && v55 && v36 > v32);
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[XxyDq1mpwtvCuJnm N8Azi3NI6QrNPsLP](self, "N8Azi3NI6QrNPsLP"));
      objc_msgSend(v59, "stopUpdatingLocation");

      v60 = self->_yABQBiEYyLNkt6IY;
      if (v60 && *p_kp3LsdVLlXwFNqJV)
      {
        v61 = v60;

        v62 = self->_kp3LsdVLlXwFNqJV;
        zDlKxUFITTJsP8iN = self->_zDlKxUFITTJsP8iN;
        v63 = self->_vCWRguBEmim3giZ9;

        if (zDlKxUFITTJsP8iN > self->_Msur5CGmk1XEBjLD)
          v38 = 139007;
        else
          v38 = 0;
        v25 = v89;
      }
      else
      {
        v63 = v88;
        v25 = v89;
        v61 = v87;
        v62 = v91;
        if (v87 && v91)
        {
          v38 = 139006;
        }
        else
        {
          self->_zDlKxUFITTJsP8iN = 0.0;
          v38 = 139002;
        }
      }
      -[NSNumber doubleValue](v61, "doubleValue");
      v65 = v64 * 1000000.0;
      -[NSNumber doubleValue](v62, "doubleValue");
      v67 = v66 * 1000000.0;
      v87 = v61;
      objc_storeStrong((id *)&self->_yABQBiEYyLNkt6IY, v61);
      v91 = v62;
      objc_storeStrong((id *)&self->_kp3LsdVLlXwFNqJV, v62);
      self->_zDlKxUFITTJsP8iN = zDlKxUFITTJsP8iN;
      v88 = v63;
      objc_storeStrong(location, v63);
      v43 = (uint64_t)v65;
      v42 = (uint64_t)v67;
    }
    else
    {
      if (YGGzx6XAo42A7s6x >= 3)
        v38 = 139000;
      else
        v38 = (YGGzx6XAo42A7s6x + 139003);
      self->_zDlKxUFITTJsP8iN = 0.0;
      v39 = self->_yABQBiEYyLNkt6IY;
      self->_yABQBiEYyLNkt6IY = 0;

      v40 = self->_kp3LsdVLlXwFNqJV;
      self->_kp3LsdVLlXwFNqJV = 0;

      v41 = self->_vCWRguBEmim3giZ9;
      self->_vCWRguBEmim3giZ9 = 0;

      v42 = 0;
      v43 = 0;
    }
    v68 = objc_alloc_init((Class)NSMutableArray);
    v69 = objc_alloc_init((Class)NSMutableDictionary);
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v38));
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v70, CFSTR("ec"));

    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v43));
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v71, CFSTR("mlat"));

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v42));
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v72, CFSTR("mlon"));

    if (*(_DWORD *)(v82 + 4) >= 3u)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", zDlKxUFITTJsP8iN));
      objc_msgSend(v69, "setObject:forKeyedSubscript:", v73, CFSTR("ha"));

      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0 - v36));
      objc_msgSend(v69, "setObject:forKeyedSubscript:", v74, CFSTR("time"));

      if (*(_DWORD *)(v82 + 4) >= 4u)
      {
        v75 = self->_LUsBOf3PLbri6v6o;
        if (v75)
          v76 = v75;
        else
          v76 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v77 = v76;
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v76, CFSTR("lt"));
        if (*location)
        {
          v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*location, "isSimulatedBySoftware")));
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v78, CFSTR("sim"));

          v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*location, "isProducedByAccessory")));
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v79, CFSTR("acc"));

        }
      }
    }
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v69));
    objc_msgSend(v68, "addObject:", v80);

    ((void (**)(_QWORD, id))v25)[2](v25, v68);
    v11 = v83;
    v12 = v84;
    v14 = v87;
    v18 = v88;
  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    v25 = (void (**)(_QWORD, _QWORD))v10;
  }
LABEL_58:

}

- (void)initLocationManager:(id)a3 dko5Pwm7el1Ulopu:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v14;
  double v15;

  v12 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    self->_YGGzx6XAo42A7s6x = 0;
    self->_jRTN5Tg2R7nMgayq = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v12));
    v7 = objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundle:", v6);
    -[XxyDq1mpwtvCuJnm setN8Azi3NI6QrNPsLP:](self, "setN8Azi3NI6QrNPsLP:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[XxyDq1mpwtvCuJnm N8Azi3NI6QrNPsLP](self, "N8Azi3NI6QrNPsLP"));
    objc_msgSend(v8, "setDelegate:", self);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[XxyDq1mpwtvCuJnm N8Azi3NI6QrNPsLP](self, "N8Azi3NI6QrNPsLP"));
    objc_msgSend(v9, "setDesiredAccuracy:", a4);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[XxyDq1mpwtvCuJnm N8Azi3NI6QrNPsLP](self, "N8Azi3NI6QrNPsLP"));
    objc_msgSend(v10, "setDistanceFilter:", kCLLocationAccuracyKilometer);

    if (-[XxyDq1mpwtvCuJnm LjU00AjDrcTJbVJD](self, "LjU00AjDrcTJbVJD")
      && !-[XxyDq1mpwtvCuJnm SNfHoVX7xML3tdWp](self, "SNfHoVX7xML3tdWp"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[XxyDq1mpwtvCuJnm N8Azi3NI6QrNPsLP](self, "N8Azi3NI6QrNPsLP"));
      objc_msgSend(v11, "startUpdatingLocation");

    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015B34;
    block[3] = &unk_1004CEB28;
    block[4] = self;
    v14 = v12;
    v15 = a4;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSDate *v11;
  NSDate *v12;
  NSNumber *v13;
  NSNumber *yABQBiEYyLNkt6IY;
  double v15;
  NSNumber *v16;
  NSNumber *kp3LsdVLlXwFNqJV;
  double v18;
  NSDate *v19;
  NSDate *LUsBOf3PLbri6v6o;
  CLLocationSourceInformation *v21;
  CLLocationSourceInformation *vCWRguBEmim3giZ9;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "reverseObjectEnumerator", a3, 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9);
        if (!self->_LUsBOf3PLbri6v6o
          || (v11 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1)
                                                                                   + 8 * (_QWORD)v9), "timestamp")),
              v12 = self->_LUsBOf3PLbri6v6o,
              v11,
              v11 > v12))
        {
          objc_msgSend(v10, "coordinate");
          v13 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          yABQBiEYyLNkt6IY = self->_yABQBiEYyLNkt6IY;
          self->_yABQBiEYyLNkt6IY = v13;

          objc_msgSend(v10, "coordinate");
          v16 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
          kp3LsdVLlXwFNqJV = self->_kp3LsdVLlXwFNqJV;
          self->_kp3LsdVLlXwFNqJV = v16;

          objc_msgSend(v10, "horizontalAccuracy");
          self->_zDlKxUFITTJsP8iN = v18;
          v19 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timestamp"));
          LUsBOf3PLbri6v6o = self->_LUsBOf3PLbri6v6o;
          self->_LUsBOf3PLbri6v6o = v19;

          v21 = (CLLocationSourceInformation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sourceInformation"));
          vCWRguBEmim3giZ9 = self->_vCWRguBEmim3giZ9;
          self->_vCWRguBEmim3giZ9 = v21;

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  NSNumber *yABQBiEYyLNkt6IY;
  NSNumber *kp3LsdVLlXwFNqJV;

  yABQBiEYyLNkt6IY = self->_yABQBiEYyLNkt6IY;
  self->_yABQBiEYyLNkt6IY = 0;

  kp3LsdVLlXwFNqJV = self->_kp3LsdVLlXwFNqJV;
  self->_kp3LsdVLlXwFNqJV = 0;

}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  self->_YGGzx6XAo42A7s6x = a4;
  self->_jRTN5Tg2R7nMgayq = 1;
}

- (CLLocationManager)N8Azi3NI6QrNPsLP
{
  return (CLLocationManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setN8Azi3NI6QrNPsLP:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int)YGGzx6XAo42A7s6x
{
  return self->_YGGzx6XAo42A7s6x;
}

- (void)setYGGzx6XAo42A7s6x:(int)a3
{
  self->_YGGzx6XAo42A7s6x = a3;
}

- (BOOL)jRTN5Tg2R7nMgayq
{
  return self->_jRTN5Tg2R7nMgayq;
}

- (void)setJRTN5Tg2R7nMgayq:(BOOL)a3
{
  self->_jRTN5Tg2R7nMgayq = a3;
}

- (NSNumber)yABQBiEYyLNkt6IY
{
  return self->_yABQBiEYyLNkt6IY;
}

- (void)setYABQBiEYyLNkt6IY:(id)a3
{
  objc_storeStrong((id *)&self->_yABQBiEYyLNkt6IY, a3);
}

- (NSNumber)kp3LsdVLlXwFNqJV
{
  return self->_kp3LsdVLlXwFNqJV;
}

- (void)setKp3LsdVLlXwFNqJV:(id)a3
{
  objc_storeStrong((id *)&self->_kp3LsdVLlXwFNqJV, a3);
}

- (double)Msur5CGmk1XEBjLD
{
  return self->_Msur5CGmk1XEBjLD;
}

- (void)setMsur5CGmk1XEBjLD:(double)a3
{
  self->_Msur5CGmk1XEBjLD = a3;
}

- (double)zDlKxUFITTJsP8iN
{
  return self->_zDlKxUFITTJsP8iN;
}

- (void)setZDlKxUFITTJsP8iN:(double)a3
{
  self->_zDlKxUFITTJsP8iN = a3;
}

- (NSDate)LUsBOf3PLbri6v6o
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLUsBOf3PLbri6v6o:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CLLocationSourceInformation)vCWRguBEmim3giZ9
{
  return (CLLocationSourceInformation *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVCWRguBEmim3giZ9:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vCWRguBEmim3giZ9, 0);
  objc_storeStrong((id *)&self->_LUsBOf3PLbri6v6o, 0);
  objc_storeStrong((id *)&self->_kp3LsdVLlXwFNqJV, 0);
  objc_storeStrong((id *)&self->_yABQBiEYyLNkt6IY, 0);
  objc_storeStrong((id *)&self->_N8Azi3NI6QrNPsLP, 0);
}

@end
