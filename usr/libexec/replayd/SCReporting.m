@implementation SCReporting

- (SCReporting)initWithClientBundleID:(id)a3 clientMainBundleID:(id)a4 streamID:(id)a5
{
  id v8;
  id v9;
  id v10;
  SCReporting *v11;
  uint64_t v12;
  NSDate *captureStartTime;
  id v14;
  id v15;
  id v16;
  RPThermalPressure *v17;
  RPThermalPressure *thermalPressureMonitor;
  NSMutableDictionary *v19;
  NSMutableDictionary *thermalResults;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  SCReporting *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SCReporting;
  v11 = -[SCReporting init](&v22, "init");
  if (v11)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "-[SCReporting initWithClientBundleID:clientMainBundleID:streamID:]";
      v25 = 1024;
      v26 = 89;
      v27 = 2048;
      v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    -[SCReporting setPixelFormat:](v11, "setPixelFormat:", &stru_100083968);
    -[SCReporting setColorMatrix:](v11, "setColorMatrix:", &stru_100083968);
    -[SCReporting setColorSpace:](v11, "setColorSpace:", &stru_100083968);
    v12 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    captureStartTime = v11->_captureStartTime;
    v11->_captureStartTime = (NSDate *)v12;

    v14 = objc_msgSend(v8, "copy");
    -[SCReporting setClientBundleID:](v11, "setClientBundleID:", v14);

    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.systemuiserver")))
      v15 = objc_msgSend(v8, "hasPrefix:", CFSTR("/usr/sbin/screencapture"));
    else
      v15 = 0;
    -[SCReporting setIsClientScreenCapture:](v11, "setIsClientScreenCapture:", v15);
    v16 = objc_msgSend(v10, "copy");
    -[SCReporting setStreamID:](v11, "setStreamID:", v16);

    v17 = objc_alloc_init(RPThermalPressure);
    thermalPressureMonitor = v11->_thermalPressureMonitor;
    v11->_thermalPressureMonitor = v17;

    -[RPThermalPressure setDelegate:](v11->_thermalPressureMonitor, "setDelegate:", v11);
    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    thermalResults = v11->_thermalResults;
    v11->_thermalResults = v19;

    -[SCReporting resetThermalResults](v11, "resetThermalResults");
  }

  return v11;
}

- (int64_t)stringToSCReportingPixelFormat:(id)a3
{
  uint64_t v3;

  v3 = (uint64_t)objc_msgSend(a3, "integerValue");
  if (v3 > 1111970368)
  {
    if (v3 != 1111970369)
    {
      if (v3 == 1815162994)
        return 2;
      return 0;
    }
    return 1;
  }
  else
  {
    if (v3 != 875704422)
    {
      if (v3 == 875704438)
        return 3;
      return 0;
    }
    return 4;
  }
}

- (int64_t)stringToSCReportingColorMatrix:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ITU_R_601_4")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMPTE_240M_1995")) & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ITU_R_709_2"));
  }

  return v4;
}

- (int64_t)stringToSCReportingColorSpace:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceDisplayP3")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceDisplayP3_HLG")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceExtendedLinearDisplayP3")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceSRGB")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceLinearSRGB")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceExtendedSRGB")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceExtendedLinearSRGB")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceGenericGrayGamma2_2")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceLinearGray")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceExtendedGray")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceExtendedLinearGray")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceGenericRGBLinear")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceGenericCMYK")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceGenericXYZ")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceGenericLab")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceACESCGLinear")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceAdobeRGB1998")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceDCIP3")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceITUR_709")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceROMMRGB")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceITUR_2020")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceExtendedLinearITUR_2020")) & 1) != 0)
  {
    v4 = 22;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("kCGColorSpaceGenericRGB")))
  {
    v4 = 23;
  }
  else
  {
    v4 = 24;
  }

  return v4;
}

- (int64_t)intToSCReportingAudioSampleRate:(int64_t)a3
{
  if (a3 > 23999)
  {
    if (a3 != 24000)
    {
      if (a3 == 48000)
        return 4;
      return 0;
    }
    return 3;
  }
  else
  {
    if (a3 != 8000)
    {
      if (a3 == 16000)
        return 2;
      return 0;
    }
    return 1;
  }
}

- (int64_t)getCurrentStreamScreenConfiguration
{
  int64_t includedApplicationsCount;

  if (self->_individualWindow)
    return 6;
  includedApplicationsCount = self->_includedApplicationsCount;
  if (includedApplicationsCount && self->_excludedApplicationsCount)
    return 4;
  if (self->_includedWindowsCount)
  {
    if (self->_excludedWindowsCount)
      return 2;
    else
      return 1;
  }
  else if (includedApplicationsCount)
  {
    return 3;
  }
  else
  {
    return 5;
  }
}

- (int64_t)getColorFromRGBA:(double)a3 withGreen:(double)a4 withBlue:(double)a5 withAlpha:(double)a6
{
  BOOL v8;
  BOOL v9;
  int64_t result;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;

  if (a3 > 1.0 && a4 > 1.0 && a5 > 1.0)
  {
    a3 = a3 / 255.0;
    a4 = a4 / 255.0;
    a5 = a5 / 255.0;
  }
  v8 = a3 == 0.0;
  if (a4 != 0.0)
    v8 = 0;
  v9 = a5 == 0.0 && v8;
  if (a6 == 0.0 && v9)
    result = 16;
  else
    result = 2;
  if (!v9)
  {
    if (a3 == 0.333 && a4 == 0.333 && a5 == 0.333)
    {
      return 3;
    }
    else if (a3 == 0.667 && a4 == 0.667 && a5 == 0.667)
    {
      return 4;
    }
    else if (a3 == 0.5 && a4 == 0.5 && a5 == 0.5)
    {
      return 6;
    }
    else
    {
      v11 = a3 == 1.0;
      if (a4 != 1.0)
        v11 = 0;
      if (v11 && a5 == 1.0)
      {
        return 5;
      }
      else
      {
        v12 = a3 == 1.0;
        if (a4 != 0.0)
          v12 = 0;
        if (v12 && a5 == 0.0)
        {
          return 7;
        }
        else
        {
          v13 = a3 == 0.0;
          if (a4 != 1.0)
            v13 = 0;
          if (v13 && a5 == 0.0)
          {
            return 8;
          }
          else
          {
            if (a5 != 1.0)
              v8 = 0;
            if (v8)
            {
              return 9;
            }
            else if (a5 == 1.0 && v13)
            {
              return 10;
            }
            else if (a5 == 0.0 && v11)
            {
              return 11;
            }
            else if (a5 == 1.0 && v12)
            {
              return 12;
            }
            else if (a3 == 1.0 && a4 == 0.5 && a5 == 0.0)
            {
              return 13;
            }
            else if (a3 == 0.5 && a4 == 0.0 && a5 == 0.5)
            {
              return 14;
            }
            else if (a5 == 0.2 && a4 == 0.4 && a3 == 0.6)
            {
              return 15;
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)collectSummaryEventMetrics
{
  NSNumber *v3;
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *v6;
  const __CFString *v7;
  const __CFString *v8;
  NSNumber *v9;
  NSNumber *v10;
  NSNumber *v11;
  NSNumber *v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  double v16;
  double v17;
  NSNumber *v18;
  double v19;
  NSNumber *v20;
  double v21;
  NSNumber *v22;
  double v23;
  NSNumber *v24;
  NSNumber *v25;
  NSNumber *v26;
  NSNumber *v27;
  NSNumber *v28;
  NSNumber *v29;
  NSNumber *v30;
  NSNumber *v31;
  NSNumber *v32;
  NSNumber *v33;
  NSNumber *v34;
  NSNumber *v35;
  double v36;
  NSNumber *v37;
  double v38;
  NSNumber *v39;
  double v40;
  NSNumber *v41;
  double v42;
  NSNumber *v43;
  NSNumber *v44;
  double v45;
  NSNumber *v46;
  void *v47;
  NSNumber *v48;
  void *v49;
  NSNumber *v50;
  void *v51;
  NSNumber *v52;
  void *v53;
  void *v54;
  void *v55;
  NSNumber *v56;
  void *v57;
  NSNumber *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  __CFString *v67;
  __CFString *v68;
  __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  unsigned int v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  uint8_t buf[4];
  const char *v132;
  __int16 v133;
  int v134;
  __int16 v135;
  id v136;
  _QWORD v137[67];
  _QWORD v138[67];

  -[SCReporting addToThermalResultsWithLevel:](self, "addToThermalResultsWithLevel:", -[RPThermalPressure getCurrentPressureLevel](self->_thermalPressureMonitor, "getCurrentPressureLevel"));
  v117 = objc_alloc((Class)NSMutableDictionary);
  v137[0] = CFSTR("SID");
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting streamID](self, "streamID"));
  v138[0] = v130;
  v137[1] = CFSTR("CVCW");
  v3 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB60(llroundf((float)-[SCReporting frameWidth](self, "frameWidth")), 0x32uLL));
  v129 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v138[1] = v129;
  v137[2] = CFSTR("CVCH");
  v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB60(llroundf((float)-[SCReporting frameHeight](self, "frameHeight")), 0x32uLL));
  v128 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v138[2] = v128;
  v137[3] = CFSTR("CVCR");
  v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf((float)-[SCReporting targetFrameRate](self, "targetFrameRate")), 2uLL));
  v127 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v138[3] = v127;
  v137[4] = CFSTR("PVFC");
  v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf((float)-[SCReporting totalFrameCount](self, "totalFrameCount")), 2uLL));
  v126 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v138[4] = v126;
  v137[5] = CFSTR("CBID");
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting clientBundleID](self, "clientBundleID"));
  v124 = -[SCReporting shouldReportBundleID:](self, "shouldReportBundleID:");
  if (v124)
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[SCReporting clientBundleID](self, "clientBundleID"));
  else
    v7 = &stru_100083968;
  v66 = (__CFString *)v7;
  v138[5] = v7;
  v137[6] = CFSTR("CPF");
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting pixelFormat](self, "pixelFormat"));
  if (v123)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting pixelFormat](self, "pixelFormat"));
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting stringToSCReportingPixelFormat:](self, "stringToSCReportingPixelFormat:")));
  }
  else
  {
    v8 = &stru_100083968;
  }
  v69 = (__CFString *)v8;
  v138[6] = v8;
  v137[7] = CFSTR("CSF");
  v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SCReporting scaleToFit](self, "scaleToFit")));
  v138[7] = v122;
  v137[8] = CFSTR("CPA");
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SCReporting preserveAspectRatio](self, "preserveAspectRatio")));
  v138[8] = v121;
  v137[9] = CFSTR("CSC");
  v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SCReporting showCursor](self, "showCursor")));
  v138[9] = v120;
  v137[10] = CFSTR("CBG");
  v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting backgroundColor](self, "backgroundColor")));
  v138[10] = v119;
  v137[11] = CFSTR("CSW");
  v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB60(llroundf((float)-[SCReporting inputSurfaceWidth](self, "inputSurfaceWidth")), 0x32uLL));
  v116 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v138[11] = v116;
  v137[12] = CFSTR("CSH");
  v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB60(llroundf((float)-[SCReporting inputSurfaceHeight](self, "inputSurfaceHeight")), 0x32uLL));
  v115 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v138[12] = v115;
  v137[13] = CFSTR("CDW");
  v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB60(llroundf((float)-[SCReporting destSurfaceWidth](self, "destSurfaceWidth")), 0x32uLL));
  v114 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v138[13] = v114;
  v137[14] = CFSTR("CDH");
  v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB60(llroundf((float)-[SCReporting destSurfaceHeight](self, "destSurfaceHeight")), 0x32uLL));
  v113 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v138[14] = v113;
  v137[15] = CFSTR("CQD");
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting frameQueueSize](self, "frameQueueSize")));
  v138[15] = v112;
  v137[16] = CFSTR("CCM");
  v13 = objc_claimAutoreleasedReturnValue(-[SCReporting colorMatrix](self, "colorMatrix"));
  if (v13)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting colorMatrix](self, "colorMatrix"));
    v14 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting stringToSCReportingColorMatrix:](self, "stringToSCReportingColorMatrix:")));
  }
  else
  {
    v14 = &stru_100083968;
  }
  v68 = (__CFString *)v14;
  v138[16] = v14;
  v137[17] = CFSTR("CCS");
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting colorSpace](self, "colorSpace"));
  v111 = (void *)v13;
  if (v110)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting colorSpace](self, "colorSpace"));
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting stringToSCReportingColorSpace:](self, "stringToSCReportingColorSpace:")));
  }
  else
  {
    v15 = &stru_100083968;
  }
  v67 = (__CFString *)v15;
  v138[17] = v15;
  v137[18] = CFSTR("PDUR");
  -[SCReporting activeDuration](self, "activeDuration");
  *(float *)&v16 = v16;
  v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llroundf(*(float *)&v16)));
  v138[18] = v109;
  v137[19] = CFSTR("PLAT");
  -[SCReporting averageFrameLatency](self, "averageFrameLatency");
  *(float *)&v17 = round(v17 * 1000000.0);
  v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf(*(float *)&v17), 2uLL));
  v108 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v138[19] = v108;
  v137[20] = CFSTR("AE");
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SCReporting audioEnabled](self, "audioEnabled")));
  v138[20] = v107;
  v137[21] = CFSTR("ASR");
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting intToSCReportingAudioSampleRate:](self, "intToSCReportingAudioSampleRate:", -[SCReporting audioSampleRate](self, "audioSampleRate"))));
  v138[21] = v106;
  v137[22] = CFSTR("ACC");
  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting audioChannelCount](self, "audioChannelCount")));
  v138[22] = v105;
  v137[23] = CFSTR("AEXC");
  v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting excludeCallingClientAudio](self, "excludeCallingClientAudio")));
  v138[23] = v104;
  v137[24] = CFSTR("ALAT");
  -[SCReporting averageFrameLatencyAudio](self, "averageFrameLatencyAudio");
  *(float *)&v19 = round(v19 * 1000000.0);
  v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf(*(float *)&v19), 2uLL));
  v103 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v138[24] = v103;
  v137[25] = CFSTR("CFD");
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting getCurrentStreamScreenConfiguration](self, "getCurrentStreamScreenConfiguration")));
  v138[25] = v102;
  v137[26] = CFSTR("CFSRC");
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting filterSource](self, "filterSource")));
  v138[26] = v101;
  v137[27] = CFSTR("SWCMD");
  v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting startWithCompositeMode](self, "startWithCompositeMode")));
  v138[27] = v100;
  v137[28] = CFSTR("NDUR");
  -[SCReporting newsroomTotalDuration](self, "newsroomTotalDuration");
  *(float *)&v21 = v21;
  v22 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf(*(float *)&v21), 2uLL));
  v99 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v138[28] = v99;
  v137[29] = CFSTR("FDUR");
  -[SCReporting floatingTotalDuration](self, "floatingTotalDuration");
  *(float *)&v23 = v23;
  v24 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf(*(float *)&v23), 2uLL));
  v98 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v138[29] = v98;
  v137[30] = CFSTR("NSC");
  v25 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting newsroomSessionCount](self, "newsroomSessionCount"), 2uLL));
  v97 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v138[30] = v97;
  v137[31] = CFSTR("FSC");
  v26 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting floatingSessionCount](self, "floatingSessionCount"), 2uLL));
  v96 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v138[31] = v96;
  v137[32] = CFSTR("NFC");
  v27 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting newsroomTotalFrameCount](self, "newsroomTotalFrameCount"), 2uLL));
  v95 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v138[32] = v95;
  v137[33] = CFSTR("FFC");
  v28 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting floatingTotalFrameCount](self, "floatingTotalFrameCount"), 2uLL));
  v94 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v138[33] = v94;
  v137[34] = CFSTR("NTFC");
  v29 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting newsroomToFloatingTransitionCount](self, "newsroomToFloatingTransitionCount"), 2uLL));
  v93 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v138[34] = v93;
  v137[35] = CFSTR("FTNC");
  v30 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting floatingToNewsroomTransitionCount](self, "floatingToNewsroomTransitionCount"), 2uLL));
  v92 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v138[35] = v92;
  v137[36] = CFSTR("NTLC");
  v31 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting newsroomTopLeftWindowCount](self, "newsroomTopLeftWindowCount"), 2uLL));
  v91 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v138[36] = v91;
  v137[37] = CFSTR("NTRC");
  v32 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting newsroomTopRightWindowCount](self, "newsroomTopRightWindowCount"), 2uLL));
  v90 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v138[37] = v90;
  v137[38] = CFSTR("NBRC");
  v33 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting newsroomBottomRightWindowCount](self, "newsroomBottomRightWindowCount"), 2uLL));
  v89 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v138[38] = v89;
  v137[39] = CFSTR("NBLC");
  v34 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting newsroomBottomLeftWindowCount](self, "newsroomBottomLeftWindowCount"), 2uLL));
  v88 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v138[39] = v88;
  v137[40] = CFSTR("NFMC");
  v35 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting newsroomFullScreenContentCount](self, "newsroomFullScreenContentCount"), 2uLL));
  v87 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v138[40] = v87;
  v137[41] = CFSTR("PDR");
  -[SCReporting portraitEffectTotalDuration](self, "portraitEffectTotalDuration");
  *(float *)&v36 = v36;
  v37 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf(*(float *)&v36), 2uLL));
  v86 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v138[41] = v86;
  v137[42] = CFSTR("CSDR");
  -[SCReporting centerStageEffectTotalDuration](self, "centerStageEffectTotalDuration");
  *(float *)&v38 = v38;
  v39 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf(*(float *)&v38), 2uLL));
  v85 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v138[42] = v85;
  v137[43] = CFSTR("SLDR");
  -[SCReporting studioLightEffectTotalDuration](self, "studioLightEffectTotalDuration");
  *(float *)&v40 = v40;
  v41 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf(*(float *)&v40), 2uLL));
  v84 = (void *)objc_claimAutoreleasedReturnValue(v41);
  v138[43] = v84;
  v137[44] = CFSTR("BGDR");
  -[SCReporting backgroundReplacementTotalDuration](self, "backgroundReplacementTotalDuration");
  *(float *)&v42 = v42;
  v43 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf(*(float *)&v42), 2uLL));
  v83 = (void *)objc_claimAutoreleasedReturnValue(v43);
  v138[44] = v83;
  v137[45] = CFSTR("GBRE");
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SCReporting gestureDetectionBasedReactionsEnabled](self, "gestureDetectionBasedReactionsEnabled")));
  v138[45] = v82;
  v137[46] = CFSTR("MTRC");
  v44 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting manualTriggeredReactionsCount](self, "manualTriggeredReactionsCount"), 2uLL));
  v81 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v138[46] = v81;
  v137[47] = CFSTR("PIEV");
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting portraitIntensityEndValue](self, "portraitIntensityEndValue")));
  v138[47] = v80;
  v137[48] = CFSTR("SIEV");
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting studioLightIntensityEndValue](self, "studioLightIntensityEndValue")));
  v138[48] = v79;
  v137[49] = CFSTR("CDT");
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting cameraDeviceType](self, "cameraDeviceType")));
  v138[49] = v78;
  v137[50] = CFSTR("IWC");
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting includedWindowsCount](self, "includedWindowsCount")));
  v138[50] = v77;
  v137[51] = CFSTR("IAC");
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting includedApplicationsCount](self, "includedApplicationsCount")));
  v138[51] = v76;
  v137[52] = CFSTR("EWC");
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting excludedWindowsCount](self, "excludedWindowsCount")));
  v138[52] = v75;
  v137[53] = CFSTR("EAC");
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting excludedApplicationsCount](self, "excludedApplicationsCount")));
  v138[53] = v74;
  v137[54] = CFSTR("DUID");
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[RPStringUtility rotatingDeviceUniqueID](RPStringUtility, "rotatingDeviceUniqueID")));
  v138[54] = v73;
  v137[55] = CFSTR("CRT");
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting captureResolutionType](self, "captureResolutionType")));
  v138[55] = v72;
  v137[56] = CFSTR("CHDR");
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting captureDynamicRange](self, "captureDynamicRange")));
  v138[56] = v71;
  v137[57] = CFSTR("MICE");
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SCReporting micEnabled](self, "micEnabled")));
  v138[57] = v70;
  v137[58] = CFSTR("MLAT");
  -[SCReporting averageFrameLatencyMic](self, "averageFrameLatencyMic");
  *(float *)&v45 = round(v45 * 1000000.0);
  v46 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf(*(float *)&v45), 2uLL));
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  v138[58] = v47;
  v137[59] = CFSTR("REC");
  v48 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting recordingOutputCount](self, "recordingOutputCount"), 2uLL));
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v138[59] = v49;
  v137[60] = CFSTR("RED");
  v50 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting recordingTotalDuration](self, "recordingTotalDuration"), 2uLL));
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  v138[60] = v51;
  v137[61] = CFSTR("RES");
  v52 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting recordingTotalFileSize](self, "recordingTotalFileSize"), 2uLL));
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  v138[61] = v53;
  v137[62] = CFSTR("CSS");
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SCReporting isClientScreenCapture](self, "isClientScreenCapture")));
  v138[62] = v54;
  v137[63] = CFSTR("CSMC");
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SCReporting showMouseClicks](self, "showMouseClicks")));
  v138[63] = v55;
  v137[64] = CFSTR("PAFC");
  v56 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf((float)-[SCReporting totalAudioFrameCount](self, "totalAudioFrameCount")), 2uLL));
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  v138[64] = v57;
  v137[65] = CFSTR("PMFC");
  v58 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(llroundf((float)-[SCReporting totalMicFrameCount](self, "totalMicFrameCount")), 2uLL));
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  v138[65] = v59;
  v137[66] = CFSTR("TPL");
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting thermalDescription](self, "thermalDescription"));
  v138[66] = v60;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v138, v137, 67));
  v118 = objc_msgSend(v117, "initWithDictionary:", v61);

  if (v110)
  {

  }
  if (v111)
  {

  }
  if (v123)
  {

  }
  if (v124)

  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v132 = "-[SCReporting collectSummaryEventMetrics]";
    v133 = 1024;
    v134 = 325;
    v135 = 2112;
    v136 = v118;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %@", buf, 0x1Cu);
  }
  return v118;
}

- (id)thermalDescription
{
  id v3;
  __CFString *v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const __CFString *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_thermalResults, "allKeys"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v4 = &stru_100083968;
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      v9 = v4;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_thermalResults, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8)));
        v11 = (void *)v10;
        v12 = ",";
        if (!(v6 + (_DWORD)v8))
          v12 = "";
        if (v10)
          v13 = (const __CFString *)v10;
        else
          v13 = &stru_100083968;
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("%s%@"), v12, v13));

        v8 = (char *)v8 + 1;
        v9 = v4;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v6 += (int)v8;
    }
    while (v5);
  }

  return v4;
}

- (void)updateReportWithContentFilterDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SCStreamContentFilterIndividualWindowID")));

  if (v4)
  {
    self->_individualWindow = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SCStreamContentFilterIncludedWindows")));
    self->_includedWindowsCount = (int64_t)objc_msgSend(v5, "count");

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SCStreamContentFilterExcludedWindows")));
    self->_excludedWindowsCount = (int64_t)objc_msgSend(v6, "count");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SCStreamContentFilterIncludedBundleIDs")));
    v8 = objc_msgSend(v7, "count");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SCStreamContentFilterIncludedVideoPIDs")));
    self->_includedApplicationsCount = (int64_t)v8 + (_QWORD)objc_msgSend(v9, "count");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SCStreamContentFilterExcludedBundleIDs")));
    v11 = objc_msgSend(v10, "count");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SCStreamContentFilterExcludedVideoPIDs")));
    self->_excludedApplicationsCount = (int64_t)v11 + (_QWORD)objc_msgSend(v12, "count");

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SCStreamPreservedContentFilterCompositeConfig")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesCompositeSessionMode")));
  v15 = 0;
  if (v13 && v14)
    v15 = objc_msgSend(v14, "integerValue");
  self->_startWithCompositeMode = (int64_t)v15;
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SCStreamContentFilterSource")));
  v17 = v16;
  if (v16)
    v16 = objc_msgSend(v16, "integerValue");
  self->_filterSource = (int64_t)v16;

}

- (void)updateReportWithClientProperties:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  NSString *v14;
  NSString *pixelFormat;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  float v54;
  float v55;
  void *v56;
  float v57;
  float v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  float v69;
  float v70;
  void *v71;
  float v72;
  float v73;
  void *v74;
  NSString *v75;
  NSString *colorSpace;
  void *v77;
  NSString *v78;
  NSString *colorMatrix;
  void *v80;
  void *v81;
  float v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  unsigned int v93;
  int64_t v94;
  void *v95;
  void *v96;
  unsigned int v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;

  v104 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesWidth")));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesHeight")));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesWidth")));
      objc_msgSend(v7, "floatValue");
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesHeight")));
      objc_msgSend(v10, "floatValue");
      v12 = v11;

      self->_frameWidth = (uint64_t)v9;
      self->_frameHeight = (uint64_t)v12;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesPixelFormat")));

  if (v13)
  {
    v14 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesPixelFormat")));
    pixelFormat = self->_pixelFormat;
    self->_pixelFormat = v14;

  }
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesFrameRate")));
  if (v16)
  {
    v17 = (void *)v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesFrameRate")));
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    if (v20 > 0.0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesFrameRate")));
      objc_msgSend(v21, "doubleValue");
      self->_targetFrameRate = (uint64_t)(1.0 / v22);

    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesScaleToFit")));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesScaleToFit")));
    self->_scaleToFit = objc_msgSend(v24, "BOOLValue");

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesPreserveAspectRatio")));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesPreserveAspectRatio")));
    self->_preserveAspectRatio = objc_msgSend(v26, "BOOLValue");

  }
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesQueueDepth")));
  if (v27)
  {
    v28 = (void *)v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesQueueDepth")));
    if ((uint64_t)objc_msgSend(v29, "longValue") <= 0)
    {

    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesQueueDepth")));
      v31 = (uint64_t)objc_msgSend(v30, "longValue");

      if (v31 > 8)
        goto LABEL_19;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesQueueDepth")));
      self->_frameQueueSize = (int64_t)objc_msgSend(v28, "longValue");
    }

  }
LABEL_19:
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesShowCursor")));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesShowCursor")));
    self->_showCursor = objc_msgSend(v33, "BOOLValue");

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesBackgroundColorR")));
  objc_msgSend(v34, "doubleValue");
  v36 = v35;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesBackgroundColorG")));
  objc_msgSend(v37, "doubleValue");
  v39 = v38;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesBackgroundColorB")));
  objc_msgSend(v40, "doubleValue");
  v42 = v41;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesBackgroundColorA")));
  objc_msgSend(v43, "doubleValue");
  self->_backgroundColor = -[SCReporting getColorFromRGBA:withGreen:withBlue:withAlpha:](self, "getColorFromRGBA:withGreen:withBlue:withAlpha:", v36, v39, v42, v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesSourceRectX")));
  if (v45)
  {
    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesSourceRectY")));
    if (v46)
    {
      v47 = (void *)v46;
      v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesSourceRectWidth")));
      if (v48)
      {
        v49 = (void *)v48;
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesSourceRectHeight")));

        if (v50)
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesSourceRectX")));
          objc_msgSend(v51, "floatValue");
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesSourceRectY")));
          objc_msgSend(v52, "floatValue");
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesSourceRectWidth")));
          objc_msgSend(v53, "floatValue");
          v55 = v54;
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesSourceRectHeight")));
          objc_msgSend(v56, "floatValue");
          v58 = v57;

          self->_inputSurfaceWidth = (uint64_t)v55;
          self->_inputSurfaceHeight = (uint64_t)v58;
        }
        goto LABEL_28;
      }

    }
  }
LABEL_28:
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesDestinationRectX")));
  v60 = v104;
  if (!v59)
    goto LABEL_35;
  v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesDestinationRectY")));
  if (!v61)
    goto LABEL_34;
  v62 = (void *)v61;
  v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesDestinationRectWidth")));
  if (!v63)
  {

LABEL_34:
    v60 = v104;
    goto LABEL_35;
  }
  v64 = (void *)v63;
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesDestinationRectHeight")));

  v60 = v104;
  if (v65)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesDestinationRectX")));
    objc_msgSend(v66, "floatValue");
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesDestinationRectY")));
    objc_msgSend(v67, "floatValue");
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesDestinationRectWidth")));
    objc_msgSend(v68, "floatValue");
    v70 = v69;
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesDestinationRectHeight")));
    objc_msgSend(v71, "floatValue");
    v73 = v72;

    v60 = v104;
    self->_destSurfaceWidth = (uint64_t)v70;
    self->_destSurfaceHeight = (uint64_t)v73;
  }
LABEL_35:
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesColorSpace")));

  if (v74)
  {
    v75 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesColorSpace")));
    colorSpace = self->_colorSpace;
    self->_colorSpace = v75;

  }
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesColorMatrix")));

  if (v77)
  {
    v78 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesColorMatrix")));
    colorMatrix = self->_colorMatrix;
    self->_colorMatrix = v78;

  }
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesContentScale")));

  if (v80)
  {
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesContentScale")));
    objc_msgSend(v81, "floatValue");
    self->_contentScale = v82;

  }
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesAudioEnabled")));

  if (v83)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesAudioEnabled")));
    self->_audioEnabled = objc_msgSend(v84, "BOOLValue");

  }
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesSampleRate")));

  if (v85)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesSampleRate")));
    self->_audioSampleRate = (int)objc_msgSend(v86, "intValue");

  }
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesChannelCount")));

  if (v87)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesChannelCount")));
    self->_audioChannelCount = (int)objc_msgSend(v88, "intValue");

  }
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesExcludeCallingClientAudio")));

  if (v89)
  {
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesExcludeCallingClientAudio")));
    self->_excludeCallingClientAudio = objc_msgSend(v90, "BOOLValue");

  }
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesBestResolution")));
  if ((objc_msgSend(v91, "BOOLValue") & 1) != 0)
  {
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesNominalResolution")));
    v93 = objc_msgSend(v92, "BOOLValue");

    if (!v93)
    {
      v94 = 2;
      goto LABEL_58;
    }
  }
  else
  {

  }
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesNominalResolution")));
  if ((objc_msgSend(v95, "BOOLValue") & 1) != 0)
  {
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesBestResolution")));
    v97 = objc_msgSend(v96, "BOOLValue");

    if (!v97)
    {
      v94 = 3;
      goto LABEL_58;
    }
  }
  else
  {

  }
  v94 = 1;
LABEL_58:
  self->_captureResolutionType = v94;
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesCaptureDynamicRange")));

  if (v98)
  {
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesCaptureDynamicRange")));
    self->_captureDynamicRange = objc_msgSend(v99, "unsignedIntValue");

  }
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesMicrophoneEnabled")));

  if (v100)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesMicrophoneEnabled")));
    self->_micEnabled = objc_msgSend(v101, "BOOLValue");

  }
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesShowMouseClicks")));

  if (v102)
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("SCStreamPropertiesShowMouseClicks")));
    self->_showMouseClicks = objc_msgSend(v103, "BOOLValue");

  }
}

- (int64_t)stringToSCReportingRecordingFileType:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", AVFileTypeMPEG4) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", AVFileTypeQuickTimeMovie))
  {
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int64_t)stringToSCReportingRecordingVideoCodecType:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", AVVideoCodecTypeH264) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", AVVideoCodecTypeHEVC))
  {
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)updateReportWithRecordingStartConfiguration:(id)a3
{
  int64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = self->_recordingOutputCount + 1;
  self->_recordingOutputDuration = 0;
  self->_recordingOutputFileSize = 0;
  self->_recordingOutputCount = v4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SCRecordingOutputConfigOutputFileType")));
  self->_recordingOutputFileType = -[SCReporting stringToSCReportingRecordingFileType:](self, "stringToSCReportingRecordingFileType:", v6);

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SCRecordingOutputConfigVideoCodecType")));
  self->_recordingOutputVideoCodecType = -[SCReporting stringToSCReportingRecordingVideoCodecType:](self, "stringToSCReportingRecordingVideoCodecType:", v7);

}

- (void)updateReportWithRecordingFinishDuration:(int64_t)a3 fileSize:(int64_t)a4
{
  self->_recordingOutputDuration = a3;
  self->_recordingOutputFileSize = a4;
  self->_recordingTotalDuration += a3;
  self->_recordingTotalFileSize += a4;
}

- (id)collectSummaryRecordingEventMetrics
{
  void *v3;
  NSNumber *v4;
  void *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[6];

  v13[0] = CFSTR("SID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting streamID](self, "streamID"));
  v14[0] = v3;
  v13[1] = CFSTR("RED");
  v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting recordingOutputDuration](self, "recordingOutputDuration"), 2uLL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v14[1] = v5;
  v13[2] = CFSTR("RES");
  v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_10001CB80(-[SCReporting recordingOutputFileSize](self, "recordingOutputFileSize"), 2uLL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14[2] = v7;
  v13[3] = CFSTR("REFT");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting recordingOutputFileType](self, "recordingOutputFileType")));
  v14[3] = v8;
  v13[4] = CFSTR("REVC");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting recordingOutputVideoCodecType](self, "recordingOutputVideoCodecType")));
  v14[4] = v9;
  v13[5] = CFSTR("CSS");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SCReporting isClientScreenCapture](self, "isClientScreenCapture")));
  v14[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 6));

  return v11;
}

- (void)reportRecordingRTCEvent:(id)a3 withStreamID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting collectSummaryRecordingEventMetrics](self, "collectSummaryRecordingEventMetrics"));
  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446722;
    v10 = "-[SCReporting reportRecordingRTCEvent:withStreamID:]";
    v11 = 1024;
    v12 = 499;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d reportingMetric=%@", (uint8_t *)&v9, 0x1Cu);
  }
  objc_msgSend(v6, "reportSCEventWithType:dictionary:streamID:", 1, v8, v7);

}

- (void)resetReportingMetrics
{
  NSDate *v3;
  NSDate *captureStartTime;

  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  captureStartTime = self->_captureStartTime;
  self->_captureStartTime = v3;

  self->_totalFrameCount = 0;
  *(_OWORD *)&self->_totalAudioFrameCount = 0u;
  *(_OWORD *)&self->_newsroomTotalDuration = 0u;
  *(_OWORD *)&self->_newsroomSessionCount = 0u;
  *(_OWORD *)&self->_recordingTotalDuration = 0u;
  -[SCReporting resetThermalResults](self, "resetThermalResults");
}

- (void)resetThermalResults
{
  NSDate *v3;
  NSDate *thermalLevelIntervalStartTime;

  -[RPThermalPressure stopMonitoring](self->_thermalPressureMonitor, "stopMonitoring");
  -[NSMutableDictionary removeAllObjects](self->_thermalResults, "removeAllObjects");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thermalResults, "setObject:forKeyedSubscript:", &off_100085A50, &off_100085A68);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thermalResults, "setObject:forKeyedSubscript:", &off_100085A50, &off_100085A80);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thermalResults, "setObject:forKeyedSubscript:", &off_100085A50, &off_100085A98);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thermalResults, "setObject:forKeyedSubscript:", &off_100085A50, &off_100085AB0);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thermalResults, "setObject:forKeyedSubscript:", &off_100085A50, &off_100085AC8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thermalResults, "setObject:forKeyedSubscript:", &off_100085A50, &off_100085AE0);
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  thermalLevelIntervalStartTime = self->_thermalLevelIntervalStartTime;
  self->_thermalLevelIntervalStartTime = v3;

  -[RPThermalPressure startMonitoring](self->_thermalPressureMonitor, "startMonitoring");
}

- (void)reportRTCEvent:(id)a3 withStreamID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  double activeDuration;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  double v17;
  __int16 v18;
  int v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v8, "timeIntervalSinceDate:", self->_captureStartTime);
  self->_activeDuration = v9;

  if (self->_activeDuration <= 5.0)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      activeDuration = self->_activeDuration;
      v12 = 136446978;
      v13 = "-[SCReporting reportRTCEvent:withStreamID:]";
      v14 = 1024;
      v15 = 538;
      v16 = 2048;
      v17 = activeDuration;
      v18 = 1024;
      v19 = 5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d not reporting session of %f seconds less than %d seconds", (uint8_t *)&v12, 0x22u);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting collectSummaryEventMetrics](self, "collectSummaryEventMetrics"));
    if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136446722;
      v13 = "-[SCReporting reportRTCEvent:withStreamID:]";
      v14 = 1024;
      v15 = 534;
      v16 = 2112;
      v17 = *(double *)&v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d reportingMetric=%@", (uint8_t *)&v12, 0x1Cu);
    }
    objc_msgSend(v6, "reportSCEventWithType:dictionary:streamID:", 1, v10, v7);
    -[SCReporting resetReportingMetrics](self, "resetReportingMetrics");

  }
  -[SCReporting resetReportingMetrics](self, "resetReportingMetrics");

}

- (BOOL)shouldReportBundleID:(id)a3
{
  id v3;
  const char *v4;
  CC_LONG v5;
  BOOL v6;
  CC_SHA256_CTX v8;
  int data;
  tm v10;
  timeval v11;
  unsigned __int8 md[2];

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    if (qword_100095BD8 != -1)
      dispatch_once(&qword_100095BD8, &stru_1000816B8);
    v11.tv_sec = 0;
    *(_QWORD *)&v11.tv_usec = 0;
    memset(&v10, 0, sizeof(v10));
    gettimeofday(&v11, 0);
    localtime_r(&v11.tv_sec, &v10);
    data = v10.tm_yday + 366 * v10.tm_year;
    memset(&v8, 0, sizeof(v8));
    CC_SHA256_Init(&v8);
    CC_SHA256_Update(&v8, &unk_100095BC8, 0x10u);
    CC_SHA256_Update(&v8, &data, 4u);
    if (v3)
    {
      v4 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      v5 = strlen(v4);
      CC_SHA256_Update(&v8, v4, v5);
    }
    CC_SHA256_Final(md, &v8);
    v6 = *(unsigned __int16 *)md < 0x290u;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)thermalPressureDidChangeWithLevel:(int64_t)a3
{
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int64_t v10;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446722;
    v6 = "-[SCReporting thermalPressureDidChangeWithLevel:]";
    v7 = 1024;
    v8 = 576;
    v9 = 2048;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d level=%ld", (uint8_t *)&v5, 0x1Cu);
  }
  -[SCReporting addToThermalResultsWithLevel:](self, "addToThermalResultsWithLevel:", a3);
}

- (void)addToThermalResultsWithLevel:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  NSMutableDictionary *thermalResults;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSDate *v16;
  NSDate *thermalLevelIntervalStartTime;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSinceDate:", self->_thermalLevelIntervalStartTime);
  *(float *)&v6 = v6;
  v7 = (double)(uint64_t)llroundf(*(float *)&v6);

  thermalResults = self->_thermalResults;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](thermalResults, "objectForKeyedSubscript:", v9));
  objc_msgSend(v10, "doubleValue");
  v12 = v11 + v7;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
  v14 = self->_thermalResults;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

  v16 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  thermalLevelIntervalStartTime = self->_thermalLevelIntervalStartTime;
  self->_thermalLevelIntervalStartTime = v16;

}

- (NSString)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(id)a3
{
  objc_storeStrong((id *)&self->_streamID, a3);
}

- (int64_t)frameWidth
{
  return self->_frameWidth;
}

- (void)setFrameWidth:(int64_t)a3
{
  self->_frameWidth = a3;
}

- (int64_t)frameHeight
{
  return self->_frameHeight;
}

- (void)setFrameHeight:(int64_t)a3
{
  self->_frameHeight = a3;
}

- (int64_t)targetFrameRate
{
  return self->_targetFrameRate;
}

- (void)setTargetFrameRate:(int64_t)a3
{
  self->_targetFrameRate = a3;
}

- (int64_t)totalFrameCount
{
  return self->_totalFrameCount;
}

- (void)setTotalFrameCount:(int64_t)a3
{
  self->_totalFrameCount = a3;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleID, a3);
}

- (NSString)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(id)a3
{
  objc_storeStrong((id *)&self->_pixelFormat, a3);
}

- (BOOL)scaleToFit
{
  return self->_scaleToFit;
}

- (void)setScaleToFit:(BOOL)a3
{
  self->_scaleToFit = a3;
}

- (BOOL)preserveAspectRatio
{
  return self->_preserveAspectRatio;
}

- (void)setPreserveAspectRatio:(BOOL)a3
{
  self->_preserveAspectRatio = a3;
}

- (BOOL)showCursor
{
  return self->_showCursor;
}

- (void)setShowCursor:(BOOL)a3
{
  self->_showCursor = a3;
}

- (int64_t)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(int64_t)a3
{
  self->_backgroundColor = a3;
}

- (int64_t)inputSurfaceWidth
{
  return self->_inputSurfaceWidth;
}

- (void)setInputSurfaceWidth:(int64_t)a3
{
  self->_inputSurfaceWidth = a3;
}

- (int64_t)inputSurfaceHeight
{
  return self->_inputSurfaceHeight;
}

- (void)setInputSurfaceHeight:(int64_t)a3
{
  self->_inputSurfaceHeight = a3;
}

- (int64_t)destSurfaceWidth
{
  return self->_destSurfaceWidth;
}

- (void)setDestSurfaceWidth:(int64_t)a3
{
  self->_destSurfaceWidth = a3;
}

- (int64_t)destSurfaceHeight
{
  return self->_destSurfaceHeight;
}

- (void)setDestSurfaceHeight:(int64_t)a3
{
  self->_destSurfaceHeight = a3;
}

- (int64_t)frameQueueSize
{
  return self->_frameQueueSize;
}

- (void)setFrameQueueSize:(int64_t)a3
{
  self->_frameQueueSize = a3;
}

- (NSString)colorMatrix
{
  return self->_colorMatrix;
}

- (void)setColorMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_colorMatrix, a3);
}

- (NSString)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (float)contentScale
{
  return self->_contentScale;
}

- (void)setContentScale:(float)a3
{
  self->_contentScale = a3;
}

- (int64_t)totalAudioFrameCount
{
  return self->_totalAudioFrameCount;
}

- (void)setTotalAudioFrameCount:(int64_t)a3
{
  self->_totalAudioFrameCount = a3;
}

- (int64_t)totalMicFrameCount
{
  return self->_totalMicFrameCount;
}

- (void)setTotalMicFrameCount:(int64_t)a3
{
  self->_totalMicFrameCount = a3;
}

- (int64_t)includedWindowsCount
{
  return self->_includedWindowsCount;
}

- (void)setIncludedWindowsCount:(int64_t)a3
{
  self->_includedWindowsCount = a3;
}

- (int64_t)excludedWindowsCount
{
  return self->_excludedWindowsCount;
}

- (void)setExcludedWindowsCount:(int64_t)a3
{
  self->_excludedWindowsCount = a3;
}

- (int64_t)includedApplicationsCount
{
  return self->_includedApplicationsCount;
}

- (void)setIncludedApplicationsCount:(int64_t)a3
{
  self->_includedApplicationsCount = a3;
}

- (int64_t)excludedApplicationsCount
{
  return self->_excludedApplicationsCount;
}

- (void)setExcludedApplicationsCount:(int64_t)a3
{
  self->_excludedApplicationsCount = a3;
}

- (BOOL)individualWindow
{
  return self->_individualWindow;
}

- (void)setIndividualWindow:(BOOL)a3
{
  self->_individualWindow = a3;
}

- (double)activeDuration
{
  return self->_activeDuration;
}

- (void)setActiveDuration:(double)a3
{
  self->_activeDuration = a3;
}

- (double)averageFrameLatency
{
  return self->_averageFrameLatency;
}

- (void)setAverageFrameLatency:(double)a3
{
  self->_averageFrameLatency = a3;
}

- (BOOL)audioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (int64_t)audioSampleRate
{
  return self->_audioSampleRate;
}

- (void)setAudioSampleRate:(int64_t)a3
{
  self->_audioSampleRate = a3;
}

- (int64_t)audioChannelCount
{
  return self->_audioChannelCount;
}

- (void)setAudioChannelCount:(int64_t)a3
{
  self->_audioChannelCount = a3;
}

- (int64_t)excludeCallingClientAudio
{
  return self->_excludeCallingClientAudio;
}

- (void)setExcludeCallingClientAudio:(int64_t)a3
{
  self->_excludeCallingClientAudio = a3;
}

- (double)averageFrameLatencyAudio
{
  return self->_averageFrameLatencyAudio;
}

- (void)setAverageFrameLatencyAudio:(double)a3
{
  self->_averageFrameLatencyAudio = a3;
}

- (int64_t)filterSource
{
  return self->_filterSource;
}

- (void)setFilterSource:(int64_t)a3
{
  self->_filterSource = a3;
}

- (int64_t)startWithCompositeMode
{
  return self->_startWithCompositeMode;
}

- (void)setStartWithCompositeMode:(int64_t)a3
{
  self->_startWithCompositeMode = a3;
}

- (double)newsroomTotalDuration
{
  return self->_newsroomTotalDuration;
}

- (void)setNewsroomTotalDuration:(double)a3
{
  self->_newsroomTotalDuration = a3;
}

- (double)floatingTotalDuration
{
  return self->_floatingTotalDuration;
}

- (void)setFloatingTotalDuration:(double)a3
{
  self->_floatingTotalDuration = a3;
}

- (int64_t)newsroomSessionCount
{
  return self->_newsroomSessionCount;
}

- (void)setNewsroomSessionCount:(int64_t)a3
{
  self->_newsroomSessionCount = a3;
}

- (int64_t)floatingSessionCount
{
  return self->_floatingSessionCount;
}

- (void)setFloatingSessionCount:(int64_t)a3
{
  self->_floatingSessionCount = a3;
}

- (int64_t)newsroomTotalFrameCount
{
  return self->_newsroomTotalFrameCount;
}

- (void)setNewsroomTotalFrameCount:(int64_t)a3
{
  self->_newsroomTotalFrameCount = a3;
}

- (int64_t)floatingTotalFrameCount
{
  return self->_floatingTotalFrameCount;
}

- (void)setFloatingTotalFrameCount:(int64_t)a3
{
  self->_floatingTotalFrameCount = a3;
}

- (int64_t)newsroomAverageLatency
{
  return self->_newsroomAverageLatency;
}

- (void)setNewsroomAverageLatency:(int64_t)a3
{
  self->_newsroomAverageLatency = a3;
}

- (int64_t)floatingAverageLatency
{
  return self->_floatingAverageLatency;
}

- (void)setFloatingAverageLatency:(int64_t)a3
{
  self->_floatingAverageLatency = a3;
}

- (int64_t)newsroomToFloatingTransitionCount
{
  return self->_newsroomToFloatingTransitionCount;
}

- (void)setNewsroomToFloatingTransitionCount:(int64_t)a3
{
  self->_newsroomToFloatingTransitionCount = a3;
}

- (int64_t)floatingToNewsroomTransitionCount
{
  return self->_floatingToNewsroomTransitionCount;
}

- (void)setFloatingToNewsroomTransitionCount:(int64_t)a3
{
  self->_floatingToNewsroomTransitionCount = a3;
}

- (int64_t)newsroomTopLeftWindowCount
{
  return self->_newsroomTopLeftWindowCount;
}

- (void)setNewsroomTopLeftWindowCount:(int64_t)a3
{
  self->_newsroomTopLeftWindowCount = a3;
}

- (int64_t)newsroomTopRightWindowCount
{
  return self->_newsroomTopRightWindowCount;
}

- (void)setNewsroomTopRightWindowCount:(int64_t)a3
{
  self->_newsroomTopRightWindowCount = a3;
}

- (int64_t)newsroomBottomLeftWindowCount
{
  return self->_newsroomBottomLeftWindowCount;
}

- (void)setNewsroomBottomLeftWindowCount:(int64_t)a3
{
  self->_newsroomBottomLeftWindowCount = a3;
}

- (int64_t)newsroomBottomRightWindowCount
{
  return self->_newsroomBottomRightWindowCount;
}

- (void)setNewsroomBottomRightWindowCount:(int64_t)a3
{
  self->_newsroomBottomRightWindowCount = a3;
}

- (int64_t)newsroomFullScreenContentCount
{
  return self->_newsroomFullScreenContentCount;
}

- (void)setNewsroomFullScreenContentCount:(int64_t)a3
{
  self->_newsroomFullScreenContentCount = a3;
}

- (double)portraitEffectTotalDuration
{
  return self->_portraitEffectTotalDuration;
}

- (void)setPortraitEffectTotalDuration:(double)a3
{
  self->_portraitEffectTotalDuration = a3;
}

- (double)centerStageEffectTotalDuration
{
  return self->_centerStageEffectTotalDuration;
}

- (void)setCenterStageEffectTotalDuration:(double)a3
{
  self->_centerStageEffectTotalDuration = a3;
}

- (double)studioLightEffectTotalDuration
{
  return self->_studioLightEffectTotalDuration;
}

- (void)setStudioLightEffectTotalDuration:(double)a3
{
  self->_studioLightEffectTotalDuration = a3;
}

- (double)backgroundReplacementTotalDuration
{
  return self->_backgroundReplacementTotalDuration;
}

- (void)setBackgroundReplacementTotalDuration:(double)a3
{
  self->_backgroundReplacementTotalDuration = a3;
}

- (BOOL)gestureDetectionBasedReactionsEnabled
{
  return self->_gestureDetectionBasedReactionsEnabled;
}

- (void)setGestureDetectionBasedReactionsEnabled:(BOOL)a3
{
  self->_gestureDetectionBasedReactionsEnabled = a3;
}

- (int64_t)manualTriggeredReactionsCount
{
  return self->_manualTriggeredReactionsCount;
}

- (void)setManualTriggeredReactionsCount:(int64_t)a3
{
  self->_manualTriggeredReactionsCount = a3;
}

- (int64_t)studioLightIntensityEndValue
{
  return self->_studioLightIntensityEndValue;
}

- (void)setStudioLightIntensityEndValue:(int64_t)a3
{
  self->_studioLightIntensityEndValue = a3;
}

- (int64_t)portraitIntensityEndValue
{
  return self->_portraitIntensityEndValue;
}

- (void)setPortraitIntensityEndValue:(int64_t)a3
{
  self->_portraitIntensityEndValue = a3;
}

- (int64_t)cameraDeviceType
{
  return self->_cameraDeviceType;
}

- (void)setCameraDeviceType:(int64_t)a3
{
  self->_cameraDeviceType = a3;
}

- (int64_t)captureResolutionType
{
  return self->_captureResolutionType;
}

- (void)setCaptureResolutionType:(int64_t)a3
{
  self->_captureResolutionType = a3;
}

- (int64_t)captureDynamicRange
{
  return self->_captureDynamicRange;
}

- (void)setCaptureDynamicRange:(int64_t)a3
{
  self->_captureDynamicRange = a3;
}

- (BOOL)micEnabled
{
  return self->_micEnabled;
}

- (void)setMicEnabled:(BOOL)a3
{
  self->_micEnabled = a3;
}

- (double)averageFrameLatencyMic
{
  return self->_averageFrameLatencyMic;
}

- (void)setAverageFrameLatencyMic:(double)a3
{
  self->_averageFrameLatencyMic = a3;
}

- (int64_t)recordingOutputCount
{
  return self->_recordingOutputCount;
}

- (void)setRecordingOutputCount:(int64_t)a3
{
  self->_recordingOutputCount = a3;
}

- (int64_t)recordingOutputDuration
{
  return self->_recordingOutputDuration;
}

- (void)setRecordingOutputDuration:(int64_t)a3
{
  self->_recordingOutputDuration = a3;
}

- (int64_t)recordingOutputFileSize
{
  return self->_recordingOutputFileSize;
}

- (void)setRecordingOutputFileSize:(int64_t)a3
{
  self->_recordingOutputFileSize = a3;
}

- (int64_t)recordingOutputFileType
{
  return self->_recordingOutputFileType;
}

- (void)setRecordingOutputFileType:(int64_t)a3
{
  self->_recordingOutputFileType = a3;
}

- (int64_t)recordingOutputVideoCodecType
{
  return self->_recordingOutputVideoCodecType;
}

- (void)setRecordingOutputVideoCodecType:(int64_t)a3
{
  self->_recordingOutputVideoCodecType = a3;
}

- (int64_t)recordingTotalDuration
{
  return self->_recordingTotalDuration;
}

- (void)setRecordingTotalDuration:(int64_t)a3
{
  self->_recordingTotalDuration = a3;
}

- (int64_t)recordingTotalFileSize
{
  return self->_recordingTotalFileSize;
}

- (void)setRecordingTotalFileSize:(int64_t)a3
{
  self->_recordingTotalFileSize = a3;
}

- (BOOL)isClientScreenCapture
{
  return self->_isClientScreenCapture;
}

- (void)setIsClientScreenCapture:(BOOL)a3
{
  self->_isClientScreenCapture = a3;
}

- (BOOL)showMouseClicks
{
  return self->_showMouseClicks;
}

- (void)setShowMouseClicks:(BOOL)a3
{
  self->_showMouseClicks = a3;
}

- (int64_t)recordingEndReason
{
  return self->_recordingEndReason;
}

- (void)setRecordingEndReason:(int64_t)a3
{
  self->_recordingEndReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_colorMatrix, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_streamID, 0);
  objc_storeStrong((id *)&self->_thermalLevelIntervalStartTime, 0);
  objc_storeStrong((id *)&self->_thermalResults, 0);
  objc_storeStrong((id *)&self->_thermalPressureMonitor, 0);
  objc_storeStrong((id *)&self->_captureStartTime, 0);
}

@end
