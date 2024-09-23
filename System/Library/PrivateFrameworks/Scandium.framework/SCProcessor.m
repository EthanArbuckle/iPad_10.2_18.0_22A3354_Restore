@implementation SCProcessor

- (SCProcessor)initWithStartPacket:(const void *)a3 ofLength:(unint64_t)a4 delegate:(id)a5 withSignalQualityMetricsEnabled:(BOOL)a6 bypassingAlgorithms:(BOOL)a7 bootDate:(id)a8 hardwareModel:(id)a9
{
  _BOOL4 v10;
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  SCProcessor *v18;
  SCProcessor *v19;
  NSObject *v20;
  __int128 *v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char *v26;
  id ****v27;
  NSObject *v28;
  SCProcessor *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t (***v33)();
  uint64_t v34;
  uint64_t (***v35)();
  uint64_t v36;
  uint64_t (***v37)();
  uint64_t v38;
  uint64_t (***v39)();
  uint64_t v40;
  NSObject *v41;
  uint64_t v43;
  __int16 v44;
  char v45;
  __int16 v46;
  char v47;
  id v48;
  id v49;
  id v50;
  id to;
  id location;
  objc_super v53;
  void *__p[2];
  char v55;
  id v56;
  id v57;
  id v58;
  id from;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _OWORD v72[2];
  uint64_t (**v73)();
  id v74;
  uint64_t (***v75)();
  uint64_t (**v76)();
  id v77;
  uint64_t (***v78)();
  uint64_t (**v79)();
  id v80;
  uint64_t (***v81)();
  uint64_t (**v82)();
  id v83;
  uint64_t (***v84)();
  uint8_t buf[2];
  char v86;
  unint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[24];
  int v94;
  uint64_t v95;

  v10 = a7;
  v11 = a6;
  v95 = *MEMORY[0x24BDAC8D0];
  v15 = a5;
  v16 = a8;
  v17 = a9;
  v53.receiver = self;
  v53.super_class = (Class)SCProcessor;
  v18 = -[SCProcessor init](&v53, sel_init);
  v19 = v18;
  if (!v18)
  {
LABEL_13:
    v29 = 0;
    goto LABEL_42;
  }
  objc_storeWeak((id *)&v18->_delegate, v15);
  if (a4 != 112 && a4 != 115)
  {
    sc_get_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[SCProcessor initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:].cold.1(a4, v28);

    goto LABEL_13;
  }
  v19->_bypassAlgorithms = v10;
  if (v10)
  {
    sc_get_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2457F9000, v20, OS_LOG_TYPE_DEFAULT, "note that the algorithms are being bypassed", buf, 2u);
    }

  }
  objc_initWeak(&location, v19);
  objc_copyWeak(&to, &location);
  objc_copyWeak(&v50, &location);
  objc_copyWeak(&v49, &location);
  objc_copyWeak(&v48, &location);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  memset(v72, 0, 21);
  LOWORD(v43) = 0;
  BYTE2(v43) = 0;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v21 = (__int128 *)((char *)a3 + 11);
  v66 = 0;
  if (a4 == 112)
  {
    v46 = *(_WORD *)a3;
    v47 = *((_BYTE *)a3 + 2);
    v22 = *(_QWORD *)((char *)a3 + 3);
    v23 = *(_OWORD *)((char *)a3 + 91);
    v71 = *(_OWORD *)((char *)a3 + 75);
    v72[0] = v23;
    *(_QWORD *)((char *)v72 + 13) = *((_QWORD *)a3 + 13);
    v24 = *(_OWORD *)((char *)a3 + 27);
    v67 = *v21;
    v68 = v24;
    v25 = *(_OWORD *)((char *)a3 + 59);
    v69 = *(_OWORD *)((char *)a3 + 43);
    v70 = v25;
    v26 = (char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String", v43);
    v27 = (id ****)operator new();
    v91 = v70;
    v92 = v71;
    *(_OWORD *)v93 = v72[0];
    v88 = v67;
    v89 = v68;
    *(_WORD *)buf = v46;
    v86 = v47;
    v87 = v22;
    *(_QWORD *)&v93[13] = *(_QWORD *)((char *)v72 + 13);
    v90 = v69;
    v94 = 0;
  }
  else
  {
    v44 = *(_WORD *)a3;
    v45 = *((_BYTE *)a3 + 2);
    v22 = *(_QWORD *)((char *)a3 + 3);
    v30 = *(_OWORD *)((char *)a3 + 91);
    v64 = *(_OWORD *)((char *)a3 + 75);
    v65 = v30;
    v66 = *(_QWORD *)((char *)a3 + 107);
    v31 = *(_OWORD *)((char *)a3 + 27);
    v60 = *v21;
    v61 = v31;
    v32 = *(_OWORD *)((char *)a3 + 59);
    v62 = *(_OWORD *)((char *)a3 + 43);
    v63 = v32;
    v26 = (char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    v27 = (id ****)operator new();
    v91 = v63;
    v92 = v64;
    *(_OWORD *)v93 = v65;
    v88 = v60;
    v89 = v61;
    *(_WORD *)buf = v44;
    v86 = v45;
    v87 = v22;
    *(_QWORD *)&v93[16] = v66;
    v90 = v62;
    v94 = 1;
  }
  objc_copyWeak(&from, &to);
  v84 = 0;
  v82 = &off_25169D020;
  objc_moveWeak(&v83, &from);
  v84 = &v82;
  objc_destroyWeak(&from);
  objc_copyWeak(&v58, &v50);
  v81 = 0;
  v79 = &off_25169D0B0;
  objc_moveWeak(&v80, &v58);
  v81 = &v79;
  objc_destroyWeak(&v58);
  objc_copyWeak(&v57, &v49);
  v78 = 0;
  v76 = &off_25169D140;
  objc_moveWeak(&v77, &v57);
  v78 = &v76;
  objc_destroyWeak(&v57);
  objc_copyWeak(&v56, &v48);
  v75 = 0;
  v73 = &off_25169D1D0;
  objc_moveWeak(&v74, &v56);
  v75 = &v73;
  objc_destroyWeak(&v56);
  std::string::basic_string[abi:ne180100]<0>(__p, v26);
  scandium::Processor::Processor(v27, buf, &v82, &v79, &v76, &v73, v11, __p);
  if (v55 < 0)
    operator delete(__p[0]);
  v33 = v75;
  if (v75 == &v73)
  {
    v34 = 4;
    v33 = &v73;
  }
  else
  {
    if (!v75)
      goto LABEL_22;
    v34 = 5;
  }
  (*v33)[v34]();
LABEL_22:
  v35 = v78;
  if (v78 == &v76)
  {
    v36 = 4;
    v35 = &v76;
  }
  else
  {
    if (!v78)
      goto LABEL_27;
    v36 = 5;
  }
  (*v35)[v36]();
LABEL_27:
  v37 = v81;
  if (v81 == &v79)
  {
    v38 = 4;
    v37 = &v79;
  }
  else
  {
    if (!v81)
      goto LABEL_32;
    v38 = 5;
  }
  (*v37)[v38]();
LABEL_32:
  v39 = v84;
  if (v84 == &v82)
  {
    v40 = 4;
    v39 = &v82;
    goto LABEL_36;
  }
  if (v84)
  {
    v40 = 5;
LABEL_36:
    (*v39)[v40]();
  }
  std::unique_ptr<scandium::Processor>::reset[abi:ne180100]((id *****)&v19->_processor, v27);
  v19->_expectedDuration = ((double)scandium::Processor::max_packet_count((scandium::Processor *)v19->_processor.__ptr_.__value_)
                          + -1.0)
                         * 0.015625;
  v19->_expectedNumberOfPackets = scandium::Processor::max_packet_count((scandium::Processor *)v19->_processor.__ptr_.__value_);
  v19->_forBackground = scandium::Processor::background((scandium::Processor *)v19->_processor.__ptr_.__value_);
  v19->_startTimestamp = v22;
  if (!v11)
  {
    sc_get_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2457F9000, v41, OS_LOG_TYPE_DEFAULT, "note that signal quality metrics are disabled", buf, 2u);
    }

  }
  v29 = v19;
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&to);
  objc_destroyWeak(&location);
LABEL_42:

  return v29;
}

- (void)handleResult:(const Result *)a3 withAnalytics:(const void *)a4
{
  float *p_var1;
  Result v6;
  double v7;
  void *v8;
  SCAnalytics v9;
  int v10;
  Result v11;

  v6 = *a3;
  p_var1 = &a3->var1;
  v7 = *(double *)&v6;
  v11 = v6;
  if (v6.var0 < 70.0)
    *(float *)&v7 = 1.0;
  v10 = LODWORD(v7);
  scandium::convert_analytics_to_objc((uint64_t)a4, 0, p_var1, &v10, 1, (uint64_t *)&v9, v7);
  -[SCProcessor delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCProcessor currentTimestamp](self, "currentTimestamp");
  objc_msgSend(v8, "handleResult:withAnalytics:atTimestamp:", &v11, &v9);

  self->_expended = 1;
  SCAnalytics::~SCAnalytics(&v9);
}

- (void)handleAbort:(unsigned __int8)a3 withAnalytics:(const void *)a4
{
  double v4;
  uint64_t v6;
  void *v7;
  SCAnalytics v8;

  if ((a3 - 1) >= 0xA)
    v6 = 0;
  else
    v6 = a3;
  scandium::convert_analytics_to_objc((uint64_t)a4, v6 | 0x100, 0, 0, 0, (uint64_t *)&v8, v4);
  -[SCProcessor delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCProcessor currentTimestamp](self, "currentTimestamp");
  objc_msgSend(v7, "handleAbort:withAnalytics:atTimestamp:", v6, &v8);

  self->_expended = 1;
  SCAnalytics::~SCAnalytics(&v8);
}

- (void)handleMotionStatusChange:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a3;
  if (-[SCProcessor forBackground](self, "forBackground"))
  {
    sc_get_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[SCProcessor handleMotionStatusChange:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  else
  {
    -[SCProcessor delegate](self, "delegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[SCProcessor currentTimestamp](self, "currentTimestamp");
    objc_msgSend(v13, "handleMotionStatusChange:atTimestamp:", v3);

  }
}

- (void)handlePostureStatusChange:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a3;
  if (-[SCProcessor forBackground](self, "forBackground"))
  {
    sc_get_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[SCProcessor handlePostureStatusChange:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  else
  {
    -[SCProcessor delegate](self, "delegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[SCProcessor currentTimestamp](self, "currentTimestamp");
    objc_msgSend(v13, "handlePostureStatusChange:atTimestamp:", v3);

  }
}

- (double)currentTimestamp
{
  return (double)self->_frameCount * 0.015625;
}

- (void)processPacket:(const void *)a3 ofLength:(unint64_t)a4
{
  Processor *value;
  id *****p_processor;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int frameCount;
  void *v15;
  NSObject *v17;
  int v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  _OWORD v22[14];
  _OWORD v23[2];
  SCAnalytics buf;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a4 == 247)
  {
    p_processor = (id *****)&self->_processor;
    value = self->_processor.__ptr_.__value_;
    if (value)
    {
      v7 = *((_OWORD *)a3 + 13);
      v22[12] = *((_OWORD *)a3 + 12);
      v22[13] = v7;
      v23[0] = *((_OWORD *)a3 + 14);
      *(_QWORD *)((char *)v23 + 15) = *(_QWORD *)((char *)a3 + 239);
      v8 = *((_OWORD *)a3 + 9);
      v22[8] = *((_OWORD *)a3 + 8);
      v22[9] = v8;
      v9 = *((_OWORD *)a3 + 11);
      v22[10] = *((_OWORD *)a3 + 10);
      v22[11] = v9;
      v10 = *((_OWORD *)a3 + 5);
      v22[4] = *((_OWORD *)a3 + 4);
      v22[5] = v10;
      v11 = *((_OWORD *)a3 + 7);
      v22[6] = *((_OWORD *)a3 + 6);
      v22[7] = v11;
      v12 = *((_OWORD *)a3 + 1);
      v22[0] = *(_OWORD *)a3;
      v22[1] = v12;
      v13 = *((_OWORD *)a3 + 3);
      v22[2] = *((_OWORD *)a3 + 2);
      v22[3] = v13;
      if (self->_bypassAlgorithms)
      {
        frameCount = self->_frameCount;
        if (frameCount == scandium::Processor::max_packet_count((scandium::Processor *)value) - 1)
        {
          v21 = 0x4270000042C80000;
          bzero(&buf, 0x3F8uLL);
          -[SCProcessor delegate](self, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCProcessor currentTimestamp](self, "currentTimestamp");
          objc_msgSend(v15, "handleResult:withAnalytics:atTimestamp:", &v21, &buf);

          self->_expended = 1;
          SCAnalytics::~SCAnalytics(&buf);
        }
      }
      else
      {
        scandium::Processor::process((uint64_t)value, (uint64_t)v22);
        v18 = self->_frameCount;
        if (v18 == scandium::Processor::max_packet_count((scandium::Processor *)self->_processor.__ptr_.__value_)
                  - 1
          && !self->_expended)
        {
          sc_get_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            -[SCProcessor processPacket:ofLength:].cold.1(-[SCProcessor forBackground](self, "forBackground"), &self->_frameCount, (uint8_t *)&buf, v19);

          -[SCProcessor delegate](self, "delegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCProcessor currentTimestamp](self, "currentTimestamp");
          objc_msgSend(v20, "handleAbort:withAnalytics:atTimestamp:", 8, 0);

          self->_expended = 1;
        }
      }
      ++self->_frameCount;
      if (self->_expended)
        std::unique_ptr<scandium::Processor>::reset[abi:ne180100](p_processor, 0);
    }
  }
  else
  {
    sc_get_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SCProcessor processPacket:ofLength:].cold.2(a4, v17);

  }
}

- (id)dictionaryForAnalytics:(const SCAnalytics *)a3 sessionDuration:(double)a4 systemInterface:(id)a5
{
  id v8;
  id var14;
  id var46;
  id var47;
  id var19;
  id var49;
  id var48;
  id var57;
  id var51;
  id var53;
  id var55;
  id var58;
  id var121;
  id var119;
  id v22;
  void *v23;
  void *v24;
  id var33;
  id var123;
  __int128 v27;
  id var122;
  id var83;
  id var82;
  id var45;
  id var38;
  id var42;
  id var44;
  id var39;
  id var80;
  id var79;
  id var84;
  id var77;
  id var76;
  id var9;
  id var60;
  id var62;
  id var64;
  id var66;
  id var29;
  id var11;
  void *v48;
  void *v49;
  void *v50;
  id var1;
  id var5;
  id var7;
  __int128 v54;
  id var3;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id var120;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id var78;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id var24;
  __int128 v106;
  id v107;
  id v108;
  id var30;
  void *v110;
  _QWORD v112[116];
  __int128 v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  __int128 v121;
  id v122;
  id v123;
  id v124;
  void *v125;
  void *v126;
  id v127;
  id v128;
  __int128 v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  __int128 v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id var23;
  id v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  id v179;
  id v180;
  id v181;
  __int128 v182;
  id var90;
  __int128 v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id var98;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id var108;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id var31;
  id var32;
  id v208;
  id v209;
  id v210;
  void *v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  __int128 v220;
  id v221;
  _QWORD v222[125];
  __int128 v223;
  id var15;
  id v225;
  id var18;
  id v227;
  id v228;
  id v229;
  id var56;
  id v231;
  id var50;
  id v233;
  id var52;
  id v235;
  id var54;
  id v237;
  id v238;
  id v239;
  id v240;
  id v241;
  id v242;
  id v243;
  void *v244;
  void *v245;
  id v246;
  id v247;
  __int128 v248;
  id v249;
  id var126;
  id v251;
  id var81;
  id v253;
  __int128 v254;
  id var37;
  id v256;
  id var41;
  id v258;
  id var43;
  id v260;
  id var40;
  id v262;
  id v263;
  id v264;
  id v265;
  id v266;
  id var86;
  id v268;
  id var85;
  id v270;
  id var75;
  id v272;
  id var8;
  id v274;
  id var59;
  id v276;
  id var61;
  id v278;
  id var63;
  id v280;
  id var65;
  id v282;
  id var28;
  id v284;
  id var67;
  id var73;
  id var69;
  id var71;
  id var68;
  id var74;
  id v291;
  id var72;
  id var16;
  id var10;
  id v295;
  void *v296;
  void *v297;
  void *v298;
  id var94;
  id var93;
  id var87;
  __int128 v302;
  id v303;
  __int128 v304;
  id var102;
  id var101;
  id var95;
  id var96;
  id var97;
  id v310;
  id var99;
  id v312;
  id v313;
  id var109;
  id var103;
  id var104;
  id var105;
  id var106;
  id var107;
  id v320;
  id var0;
  id var4;
  id v323;
  id var6;
  id v325;
  id v326;
  id var2;
  id v328;
  id var34;
  id var26;
  void *v331;
  id var17;
  id var27;
  id v334;
  id var118;
  id var117;
  id var111;
  id var112;
  id var113;
  __int128 v340;
  id var116;
  uint64_t v342;

  v342 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  if (-[SCProcessor forBackground](self, "forBackground"))
  {
    v223 = *(_OWORD *)&a3->var12;
    v222[0] = CFSTR("agcOpcDuration");
    v222[1] = CFSTR("agcOpcGreenSampleRate");
    v222[2] = CFSTR("agcOpcNumConverged");
    v222[3] = CFSTR("agcOpcNumRetries");
    var14 = a3->var14;
    var15 = a3->var15;
    v225 = var14;
    v222[4] = CFSTR("bailoutPoint");
    v222[5] = CFSTR("droppedSessionWindowCpmsTotalLength");
    var46 = a3->var46;
    var47 = a3->var47;
    var19 = a3->var19;
    var18 = a3->var18;
    v227 = var46;
    v222[6] = CFSTR("droppedSessionWindowCpmsMaxSegmentLength");
    v222[7] = CFSTR("droppedSessionWindowSaturationMaxSegmentLength");
    var48 = a3->var48;
    var49 = a3->var49;
    v228 = var47;
    v229 = var49;
    v222[8] = CFSTR("droppedSessionWindowDownTotalLength");
    v222[9] = CFSTR("droppedSessionWindowSaturationTotalLength");
    var57 = a3->var57;
    var56 = a3->var56;
    v231 = var48;
    v222[10] = CFSTR("droppedWindow0CpmsTotalLength");
    v222[11] = CFSTR("droppedWindow0SaturationTotalLength");
    var51 = a3->var51;
    var50 = a3->var50;
    v233 = var51;
    v222[12] = CFSTR("droppedWindow1CpmsTotalLength");
    v222[13] = CFSTR("droppedWindow1SaturationTotalLength");
    var53 = a3->var53;
    var52 = a3->var52;
    v235 = var53;
    v222[14] = CFSTR("droppedWindow2CpmsTotalLength");
    v222[15] = CFSTR("droppedWindow2SaturationTotalLength");
    var55 = a3->var55;
    var54 = a3->var54;
    v237 = var55;
    v222[16] = CFSTR("earlyBailout");
    v222[17] = CFSTR("highFrequencyWindow");
    v238 = var19;
    v239 = var57;
    var58 = a3->var58;
    v222[18] = CFSTR("highFrequencyWindowLength");
    v222[19] = CFSTR("iledGreen");
    var121 = a3->var121;
    v240 = var58;
    v241 = var121;
    var119 = a3->var119;
    v222[20] = CFSTR("iledIr");
    v222[21] = CFSTR("iledRed");
    v22 = a3->var120;
    v242 = var119;
    v243 = v22;
    v222[22] = CFSTR("incompleteReason");
    numberOrNsNull((NSNumber *)a3->var25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = v23;
    v222[23] = CFSTR("internalTemperature");
    numberOrNsNull((NSNumber *)a3->var20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    var33 = a3->var33;
    v245 = v24;
    v246 = var33;
    v222[24] = CFSTR("irWavelength");
    v222[25] = CFSTR("mavMax1s");
    var123 = a3->var123;
    v254 = *(_OWORD *)&a3->var35;
    v27 = *(_OWORD *)&a3->var124;
    v222[26] = CFSTR("mavMean1s");
    v222[27] = CFSTR("mavMedian1s");
    var122 = a3->var122;
    v247 = var123;
    v249 = var122;
    v222[28] = CFSTR("mavMin1s");
    v222[29] = CFSTR("mavStd1s");
    var83 = a3->var83;
    var126 = a3->var126;
    v251 = var83;
    v222[30] = CFSTR("maxChannelConfidenceLong");
    v222[31] = CFSTR("maxChannelConfidenceShortIR");
    var82 = a3->var82;
    var81 = a3->var81;
    v253 = var82;
    v222[32] = CFSTR("maxChannelConfidenceShortRed");
    v222[33] = CFSTR("meanAccelX");
    v222[34] = CFSTR("meanAccelY");
    v222[35] = CFSTR("meanAccelZ");
    var45 = a3->var45;
    var38 = a3->var38;
    var37 = a3->var37;
    v256 = var45;
    v222[36] = CFSTR("meanPerfusionIndexGreenShort");
    v222[37] = CFSTR("meanPerfusionIndexIrLong");
    var42 = a3->var42;
    var41 = a3->var41;
    v258 = var42;
    v222[38] = CFSTR("meanPerfusionIndexIrShort");
    v222[39] = CFSTR("meanPerfusionIndexRedLong");
    var44 = a3->var44;
    var43 = a3->var43;
    v260 = var44;
    v222[40] = CFSTR("meanPerfusionIndexRedShort");
    v222[41] = CFSTR("meanSpO2Long");
    var39 = a3->var39;
    var40 = a3->var40;
    v262 = var38;
    v248 = v27;
    v222[42] = CFSTR("meanSpO2ShortIR");
    v222[43] = CFSTR("meanSpO2ShortRed");
    var80 = a3->var80;
    v263 = var39;
    v264 = var80;
    v222[44] = CFSTR("medianChannelConfidenceLong");
    v222[45] = CFSTR("medianChannelConfidenceShortIR");
    var79 = a3->var79;
    v265 = a3->var78;
    v266 = var79;
    v222[46] = CFSTR("medianChannelConfidenceShortRed");
    v222[47] = CFSTR("medianGIRPIR");
    var84 = a3->var84;
    var86 = a3->var86;
    v268 = var84;
    v222[48] = CFSTR("medianMeasurementConfidence");
    v222[49] = CFSTR("medianWeightedStdDev");
    var77 = a3->var77;
    var85 = a3->var85;
    v270 = var77;
    v222[50] = CFSTR("minChannelConfidenceLong");
    v222[51] = CFSTR("minChannelConfidenceShortIR");
    var76 = a3->var76;
    var75 = a3->var75;
    v272 = var76;
    v222[52] = CFSTR("minChannelConfidenceShortRed");
    v222[53] = CFSTR("numChannelsPassingGIRPIRMax");
    var9 = a3->var9;
    var8 = a3->var8;
    v274 = var9;
    v222[54] = CFSTR("numChannelsPassingGIRPIRMin");
    v222[55] = CFSTR("numChannelsPassingSNRMax");
    var60 = a3->var60;
    var59 = a3->var59;
    v276 = var60;
    v222[56] = CFSTR("numChannelsPassingSNRMaxLong");
    v222[57] = CFSTR("numChannelsPassingSNRMaxShortIR");
    var62 = a3->var62;
    var61 = a3->var61;
    v278 = var62;
    v222[58] = CFSTR("numChannelsPassingSNRMaxShortRed");
    v222[59] = CFSTR("numChannelsPassingSNRMin");
    var64 = a3->var64;
    var63 = a3->var63;
    v280 = var64;
    v222[60] = CFSTR("numChannelsPassingSNRMinLong");
    v222[61] = CFSTR("numChannelsPassingSNRMinShortIR");
    var66 = a3->var66;
    var65 = a3->var65;
    v282 = var66;
    v222[62] = CFSTR("numChannelsPassingSNRMinShortRed");
    v222[63] = CFSTR("numFailedWinAggGIRPIR");
    v222[64] = CFSTR("numFailedWinStd");
    var29 = a3->var29;
    var28 = a3->var28;
    v284 = var29;
    v222[65] = CFSTR("numHighConfidenceChannelsMax");
    var67 = a3->var67;
    v222[66] = CFSTR("numHighConfidenceChannelsMaxLong");
    var73 = a3->var73;
    v222[67] = CFSTR("numHighConfidenceChannelsMaxShortIR");
    var69 = a3->var69;
    v222[68] = CFSTR("numHighConfidenceChannelsMaxShortRed");
    var71 = a3->var71;
    v222[69] = CFSTR("numHighConfidenceChannelsMin");
    var68 = a3->var68;
    v222[70] = CFSTR("numHighConfidenceChannelsMinLong");
    var74 = a3->var74;
    v222[71] = CFSTR("numHighConfidenceChannelsMinShortIR");
    v291 = a3->var70;
    v222[72] = CFSTR("numHighConfidenceChannelsMinShortRed");
    var72 = a3->var72;
    v222[73] = CFSTR("numSuccessfulWindows");
    var16 = a3->var16;
    v222[74] = CFSTR("numValidChannelsMax");
    var11 = a3->var11;
    var10 = a3->var10;
    v222[75] = CFSTR("numValidChannelsMin");
    v295 = var11;
    v222[76] = CFSTR("postedHeartRate");
    numberOrNsNull((NSNumber *)a3->var21);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v296 = v48;
    v222[77] = CFSTR("postedHeartRateRounded");
    numberOrNsNull((NSNumber *)a3->var21);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v297 = v49;
    v222[78] = CFSTR("postedSpO2Rounded");
    numberOrNsNull((NSNumber *)a3->var22);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v222[79] = CFSTR("ppgAcPeakToPeakBlank");
    var94 = a3->var94;
    v222[80] = CFSTR("ppgAcPeakToPeakGreen");
    var93 = a3->var93;
    v222[81] = CFSTR("ppgAcPeakToPeakIrLong");
    var87 = a3->var87;
    v222[82] = CFSTR("ppgAcPeakToPeakIrShortIr");
    v222[83] = CFSTR("ppgAcPeakToPeakIrShortRed");
    v222[84] = CFSTR("ppgAcPeakToPeakRedLong");
    v303 = a3->var90;
    v222[85] = CFSTR("ppgAcPeakToPeakRedShortIr");
    v304 = *(_OWORD *)&a3->var91;
    v222[86] = CFSTR("ppgAcPeakToPeakRedShortRed");
    v222[87] = CFSTR("ppgAcStdBlank");
    var102 = a3->var102;
    v222[88] = CFSTR("ppgAcStdGreen");
    var101 = a3->var101;
    v222[89] = CFSTR("ppgAcStdIrLong");
    var95 = a3->var95;
    v222[90] = CFSTR("ppgAcStdIrShortIr");
    var96 = a3->var96;
    v222[91] = CFSTR("ppgAcStdIrShortRed");
    var97 = a3->var97;
    v222[92] = CFSTR("ppgAcStdRedLong");
    v310 = a3->var98;
    v222[93] = CFSTR("ppgAcStdRedShortIr");
    var99 = a3->var99;
    v222[94] = CFSTR("ppgAcStdRedShortRed");
    v312 = a3->var100;
    v222[95] = CFSTR("ppgMeanBlank");
    v313 = a3->var110;
    v222[96] = CFSTR("ppgMeanGreen");
    var109 = a3->var109;
    v222[97] = CFSTR("ppgMeanIrLong");
    var103 = a3->var103;
    v222[98] = CFSTR("ppgMeanIrShortIr");
    var104 = a3->var104;
    v222[99] = CFSTR("ppgMeanIrShortRed");
    var105 = a3->var105;
    v222[100] = CFSTR("ppgMeanRedLong");
    var106 = a3->var106;
    v222[101] = CFSTR("ppgMeanRedShortIr");
    var107 = a3->var107;
    v222[102] = CFSTR("ppgMeanRedShortRed");
    v320 = a3->var108;
    v222[103] = CFSTR("rawSpO2");
    var1 = a3->var1;
    var0 = a3->var0;
    v222[104] = CFSTR("rawSpO2NoConfidenceGate");
    var5 = a3->var5;
    var4 = a3->var4;
    v222[105] = CFSTR("rawSpO2NoConfidenceGateWindow0");
    v323 = var5;
    v222[106] = CFSTR("rawSpO2NoConfidenceGateWindow1");
    var7 = a3->var7;
    var6 = a3->var6;
    v222[107] = CFSTR("rawSpO2NoConfidenceGateWindow2");
    v298 = v50;
    v54 = *(_OWORD *)&a3->var88;
    v325 = var7;
    v222[108] = CFSTR("rawSpO2Window0");
    v326 = var1;
    v222[109] = CFSTR("rawSpO2Window1");
    var3 = a3->var3;
    var2 = a3->var2;
    v302 = v54;
    v222[110] = CFSTR("rawSpO2Window2");
    v328 = var3;
    v222[111] = CFSTR("redWavelength");
    var34 = a3->var34;
    v222[112] = CFSTR("sessionCompleted");
    var26 = a3->var26;
    v222[113] = CFSTR("sessionDuration");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v222[114] = CFSTR("sessionSampleCount");
    var17 = a3->var17;
    v222[115] = CFSTR("sessionSuccessful");
    var27 = a3->var27;
    v222[116] = CFSTR("systemInstanceString");
    v222[117] = CFSTR("tiaGainBlank");
    var118 = a3->var118;
    v222[118] = CFSTR("tiaGainGreen");
    var117 = a3->var117;
    v331 = v56;
    v222[119] = CFSTR("tiaGainIrLong");
    var111 = a3->var111;
    v334 = v8;
    v222[120] = CFSTR("tiaGainIrShortIr");
    var112 = a3->var112;
    v222[121] = CFSTR("tiaGainIrShortRed");
    var113 = a3->var113;
    v222[122] = CFSTR("tiaGainRedLong");
    v340 = *(_OWORD *)&a3->var114;
    v222[123] = CFSTR("tiaGainRedShortIr");
    v222[124] = CFSTR("tiaGainRedShortRed");
    var116 = a3->var116;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v223, v222, 125);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v113 = *(_OWORD *)&a3->var12;
    v112[0] = CFSTR("agcOpcDuration");
    v112[1] = CFSTR("agcOpcGreenSampleRate");
    v112[2] = CFSTR("agcOpcNumConverged");
    v112[3] = CFSTR("agcOpcNumRetries");
    v58 = a3->var14;
    v114 = a3->var15;
    v115 = v58;
    v112[4] = CFSTR("droppedSessionWindowCpmsMaxSegmentLength");
    v112[5] = CFSTR("droppedSessionWindowCpmsTotalLength");
    v59 = a3->var46;
    v116 = a3->var47;
    v117 = v59;
    v60 = a3->var56;
    v112[6] = CFSTR("droppedSessionWindowDownTotalLength");
    v112[7] = CFSTR("droppedSessionWindowSaturationMaxSegmentLength");
    v62 = a3->var48;
    v61 = a3->var49;
    v118 = v60;
    v119 = v61;
    v112[8] = CFSTR("droppedSessionWindowSaturationTotalLength");
    v112[9] = CFSTR("highFrequencyWindow");
    v121 = *(_OWORD *)&a3->var57;
    v112[10] = CFSTR("highFrequencyWindowLength");
    v112[11] = CFSTR("iledGreen");
    v63 = a3->var121;
    v120 = v62;
    v122 = v63;
    v64 = a3->var119;
    v112[12] = CFSTR("iledIr");
    v112[13] = CFSTR("iledRed");
    var120 = a3->var120;
    v123 = v64;
    v124 = var120;
    v112[14] = CFSTR("incompleteReason");
    numberOrNsNull((NSNumber *)a3->var25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = v23;
    v112[15] = CFSTR("internalTemperature");
    numberOrNsNull((NSNumber *)a3->var20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = a3->var33;
    v126 = v24;
    v127 = v66;
    v112[16] = CFSTR("irWavelength");
    v112[17] = CFSTR("mavMax1s");
    v128 = a3->var123;
    v129 = *(_OWORD *)&a3->var124;
    v112[18] = CFSTR("mavMean1s");
    v112[19] = CFSTR("mavMedian1s");
    v67 = a3->var122;
    v112[20] = CFSTR("mavMin1s");
    v112[21] = CFSTR("mavStd1s");
    v68 = a3->var126;
    v130 = v67;
    v131 = v68;
    v69 = a3->var83;
    v112[22] = CFSTR("maxChannelConfidenceLong");
    v112[23] = CFSTR("maxChannelConfidenceShortIR");
    v70 = a3->var81;
    v132 = v69;
    v133 = v70;
    v71 = a3->var82;
    v112[24] = CFSTR("maxChannelConfidenceShortRed");
    v112[25] = CFSTR("meanAccelX");
    v135 = *(_OWORD *)&a3->var35;
    v112[26] = CFSTR("meanAccelY");
    v112[27] = CFSTR("meanAccelZ");
    v72 = a3->var37;
    v73 = a3->var38;
    v134 = v71;
    v136 = v72;
    v74 = a3->var45;
    v112[28] = CFSTR("meanPerfusionIndexGreenShort");
    v112[29] = CFSTR("meanPerfusionIndexIrLong");
    v75 = a3->var41;
    v76 = a3->var42;
    v137 = v74;
    v138 = v75;
    v112[30] = CFSTR("meanPerfusionIndexIrShort");
    v112[31] = CFSTR("meanPerfusionIndexRedLong");
    v77 = a3->var43;
    v78 = a3->var44;
    v139 = v76;
    v140 = v77;
    v112[32] = CFSTR("meanPerfusionIndexRedShort");
    v112[33] = CFSTR("meanSpO2Long");
    v80 = a3->var39;
    v79 = a3->var40;
    v141 = v78;
    v142 = v79;
    v112[34] = CFSTR("meanSpO2ShortIR");
    v112[35] = CFSTR("meanSpO2ShortRed");
    v143 = v73;
    v144 = v80;
    v81 = a3->var80;
    v112[36] = CFSTR("medianChannelConfidenceLong");
    v112[37] = CFSTR("medianChannelConfidenceShortIR");
    var78 = a3->var78;
    v145 = v81;
    v146 = var78;
    v83 = a3->var79;
    v112[38] = CFSTR("medianChannelConfidenceShortRed");
    v112[39] = CFSTR("medianGIRPIR");
    v84 = a3->var86;
    v147 = v83;
    v148 = v84;
    v85 = a3->var84;
    v112[40] = CFSTR("medianMeasurementConfidence");
    v112[41] = CFSTR("medianWeightedStdDev");
    v86 = a3->var85;
    v149 = v85;
    v150 = v86;
    v87 = a3->var77;
    v112[42] = CFSTR("minChannelConfidenceLong");
    v112[43] = CFSTR("minChannelConfidenceShortIR");
    v88 = a3->var75;
    v151 = v87;
    v152 = v88;
    v89 = a3->var76;
    v112[44] = CFSTR("minChannelConfidenceShortRed");
    v112[45] = CFSTR("numChannelsPassingGIRPIR");
    v90 = a3->var8;
    v153 = v89;
    v154 = v90;
    v112[46] = CFSTR("numChannelsPassingSNRMax");
    v112[47] = CFSTR("numChannelsPassingSNRMaxLong");
    v91 = a3->var60;
    v155 = a3->var59;
    v156 = v91;
    v112[48] = CFSTR("numChannelsPassingSNRMaxShortIR");
    v112[49] = CFSTR("numChannelsPassingSNRMaxShortRed");
    v92 = a3->var62;
    v157 = a3->var61;
    v158 = v92;
    v112[50] = CFSTR("numChannelsPassingSNRMin");
    v112[51] = CFSTR("numChannelsPassingSNRMinLong");
    v93 = a3->var64;
    v159 = a3->var63;
    v160 = v93;
    v94 = a3->var65;
    v112[52] = CFSTR("numChannelsPassingSNRMinShortIR");
    v112[53] = CFSTR("numChannelsPassingSNRMinShortRed");
    v95 = a3->var66;
    v161 = v94;
    v162 = v95;
    v112[54] = CFSTR("numFailedWinAggGIRPIR");
    v112[55] = CFSTR("numFailedWinStd");
    v96 = a3->var29;
    v163 = a3->var28;
    v164 = v96;
    v97 = a3->var67;
    v112[56] = CFSTR("numHighConfidenceChannelsMax");
    v112[57] = CFSTR("numHighConfidenceChannelsMaxLong");
    v98 = a3->var73;
    v165 = v97;
    v166 = v98;
    v99 = a3->var69;
    v112[58] = CFSTR("numHighConfidenceChannelsMaxShortIR");
    v112[59] = CFSTR("numHighConfidenceChannelsMaxShortRed");
    v100 = a3->var71;
    v167 = v99;
    v168 = v100;
    v101 = a3->var68;
    v112[60] = CFSTR("numHighConfidenceChannelsMin");
    v112[61] = CFSTR("numHighConfidenceChannelsMinLong");
    v102 = a3->var74;
    v169 = v101;
    v170 = v102;
    v103 = a3->var70;
    v112[62] = CFSTR("numHighConfidenceChannelsMinShortIR");
    v112[63] = CFSTR("numHighConfidenceChannelsMinShortRed");
    v104 = a3->var72;
    v171 = v103;
    v172 = v104;
    v112[64] = CFSTR("numMotionPrompts");
    var24 = a3->var24;
    var23 = a3->var23;
    v112[65] = CFSTR("numPosturePrompts");
    v174 = var24;
    v112[66] = CFSTR("numValidChannels");
    numberOrNsNull((NSNumber *)a3->var10);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = v48;
    v112[67] = CFSTR("postedHeartRate");
    numberOrNsNull((NSNumber *)a3->var21);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = v49;
    v112[68] = CFSTR("postedHeartRateRounded");
    numberOrNsNull((NSNumber *)a3->var21);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = v50;
    v112[69] = CFSTR("postedSpO2Rounded");
    numberOrNsNull((NSNumber *)a3->var22);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v112[70] = CFSTR("ppgAcPeakToPeakBlank");
    v179 = a3->var94;
    v112[71] = CFSTR("ppgAcPeakToPeakGreen");
    v180 = a3->var93;
    v112[72] = CFSTR("ppgAcPeakToPeakIrLong");
    v181 = a3->var87;
    v112[73] = CFSTR("ppgAcPeakToPeakIrShortIr");
    v182 = *(_OWORD *)&a3->var88;
    v112[74] = CFSTR("ppgAcPeakToPeakIrShortRed");
    v112[75] = CFSTR("ppgAcPeakToPeakRedLong");
    var90 = a3->var90;
    v112[76] = CFSTR("ppgAcPeakToPeakRedShortIr");
    v106 = *(_OWORD *)&a3->var91;
    v112[77] = CFSTR("ppgAcPeakToPeakRedShortRed");
    v112[78] = CFSTR("ppgAcStdBlank");
    v185 = a3->var102;
    v112[79] = CFSTR("ppgAcStdGreen");
    v186 = a3->var101;
    v112[80] = CFSTR("ppgAcStdIrLong");
    v187 = a3->var95;
    v112[81] = CFSTR("ppgAcStdIrShortIr");
    v188 = a3->var96;
    v112[82] = CFSTR("ppgAcStdIrShortRed");
    v189 = a3->var97;
    v112[83] = CFSTR("ppgAcStdRedLong");
    var98 = a3->var98;
    v112[84] = CFSTR("ppgAcStdRedShortIr");
    v191 = a3->var99;
    v112[85] = CFSTR("ppgAcStdRedShortRed");
    v192 = a3->var100;
    v112[86] = CFSTR("ppgMeanBlank");
    v193 = a3->var110;
    v112[87] = CFSTR("ppgMeanGreen");
    v194 = a3->var109;
    v112[88] = CFSTR("ppgMeanIrLong");
    v195 = a3->var103;
    v112[89] = CFSTR("ppgMeanIrShortIr");
    v196 = a3->var104;
    v112[90] = CFSTR("ppgMeanIrShortRed");
    v197 = a3->var105;
    v112[91] = CFSTR("ppgMeanRedLong");
    v198 = a3->var106;
    v112[92] = CFSTR("ppgMeanRedShortIr");
    v199 = a3->var107;
    v112[93] = CFSTR("ppgMeanRedShortRed");
    var108 = a3->var108;
    v112[94] = CFSTR("rawSpO2");
    v201 = a3->var0;
    v112[95] = CFSTR("rawSpO2NoConfidenceGate");
    v107 = a3->var5;
    v202 = a3->var4;
    v112[96] = CFSTR("rawSpO2NoConfidenceGateWindow0");
    v203 = v107;
    v112[97] = CFSTR("rawSpO2NoConfidenceGateWindow1");
    v108 = a3->var7;
    v204 = a3->var6;
    v112[98] = CFSTR("rawSpO2NoConfidenceGateWindow2");
    v205 = v108;
    v112[99] = CFSTR("realTimeMaxMAV");
    var30 = a3->var30;
    var31 = a3->var31;
    v112[100] = CFSTR("realTimeMedianMAV");
    var32 = a3->var32;
    v112[101] = CFSTR("realTimeMinMAV");
    v178 = v56;
    v184 = v106;
    v208 = var30;
    v112[102] = CFSTR("redWavelength");
    v209 = a3->var34;
    v112[103] = CFSTR("sessionCompleted");
    v210 = a3->var26;
    v112[104] = CFSTR("sessionDuration");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4, CFSTR("agcOpcDuration"), CFSTR("agcOpcGreenSampleRate"), CFSTR("agcOpcNumConverged"), CFSTR("agcOpcNumRetries"), CFSTR("droppedSessionWindowCpmsMaxSegmentLength"), CFSTR("droppedSessionWindowCpmsTotalLength"), CFSTR("droppedSessionWindowDownTotalLength"), CFSTR("droppedSessionWindowSaturationMaxSegmentLength"), CFSTR("droppedSessionWindowSaturationTotalLength"), CFSTR("highFrequencyWindow"), CFSTR("highFrequencyWindowLength"), CFSTR("iledGreen"), CFSTR("iledIr"), CFSTR("iledRed"), CFSTR("incompleteReason"), CFSTR("internalTemperature"),
      CFSTR("irWavelength"),
      CFSTR("mavMax1s"),
      CFSTR("mavMean1s"),
      CFSTR("mavMedian1s"),
      CFSTR("mavMin1s"),
      CFSTR("mavStd1s"),
      CFSTR("maxChannelConfidenceLong"),
      CFSTR("maxChannelConfidenceShortIR"),
      CFSTR("maxChannelConfidenceShortRed"),
      CFSTR("meanAccelX"),
      CFSTR("meanAccelY"),
      CFSTR("meanAccelZ"),
      CFSTR("meanPerfusionIndexGreenShort"),
      CFSTR("meanPerfusionIndexIrLong"),
      CFSTR("meanPerfusionIndexIrShort"),
      CFSTR("meanPerfusionIndexRedLong"),
      CFSTR("meanPerfusionIndexRedShort"),
      CFSTR("meanSpO2Long"),
      CFSTR("meanSpO2ShortIR"),
      CFSTR("meanSpO2ShortRed"),
      CFSTR("medianChannelConfidenceLong"),
      CFSTR("medianChannelConfidenceShortIR"),
      CFSTR("medianChannelConfidenceShortRed"),
      CFSTR("medianGIRPIR"),
      CFSTR("medianMeasurementConfidence"),
      CFSTR("medianWeightedStdDev"),
      CFSTR("minChannelConfidenceLong"),
      CFSTR("minChannelConfidenceShortIR"),
      CFSTR("minChannelConfidenceShortRed"),
      CFSTR("numChannelsPassingGIRPIR"),
      CFSTR("numChannelsPassingSNRMax"),
      CFSTR("numChannelsPassingSNRMaxLong"),
      CFSTR("numChannelsPassingSNRMaxShortIR"),
      CFSTR("numChannelsPassingSNRMaxShortRed"),
      CFSTR("numChannelsPassingSNRMin"),
      CFSTR("numChannelsPassingSNRMinLong"),
      CFSTR("numChannelsPassingSNRMinShortIR"),
      CFSTR("numChannelsPassingSNRMinShortRed"),
      CFSTR("numFailedWinAggGIRPIR"),
      CFSTR("numFailedWinStd"),
      CFSTR("numHighConfidenceChannelsMax"),
      CFSTR("numHighConfidenceChannelsMaxLong"),
      CFSTR("numHighConfidenceChannelsMaxShortIR"),
      CFSTR("numHighConfidenceChannelsMaxShortRed"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v112[105] = CFSTR("sessionSampleCount");
    v212 = a3->var17;
    v112[106] = CFSTR("sessionSuccessful");
    v213 = a3->var27;
    v112[107] = CFSTR("systemInstanceString");
    v112[108] = CFSTR("tiaGainBlank");
    v215 = a3->var118;
    v211 = v110;
    v112[109] = CFSTR("tiaGainGreen");
    v216 = a3->var117;
    v214 = v8;
    v112[110] = CFSTR("tiaGainIrLong");
    v217 = a3->var111;
    v112[111] = CFSTR("tiaGainIrShortIr");
    v218 = a3->var112;
    v112[112] = CFSTR("tiaGainIrShortRed");
    v219 = a3->var113;
    v112[113] = CFSTR("tiaGainRedLong");
    v220 = *(_OWORD *)&a3->var114;
    v112[114] = CFSTR("tiaGainRedShortIr");
    v112[115] = CFSTR("tiaGainRedShortRed");
    v221 = a3->var116;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v113, v112, 116);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v57;
}

- (BOOL)forBackground
{
  return self->_forBackground;
}

- (double)expectedDuration
{
  return self->_expectedDuration;
}

- (unsigned)expectedNumberOfPackets
{
  return self->_expectedNumberOfPackets;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (SCProcessorDelegate)delegate
{
  return (SCProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  std::unique_ptr<scandium::Processor>::reset[abi:ne180100]((id *****)&self->_processor, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (uint64_t)initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:
{
}

- (id)initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_25169D1D0;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (void)initWithStartPacket:(uint64_t)a1 ofLength:(NSObject *)a2 delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 134218496;
  v3 = 112;
  v4 = 2048;
  v5 = 115;
  v6 = 2048;
  v7 = a1;
  _os_log_fault_impl(&dword_2457F9000, a2, OS_LOG_TYPE_FAULT, "invalid start packet length: expected %zu or %zu, got %zu", (uint8_t *)&v2, 0x20u);
}

- (void)initWithStartPacket:(uint64_t)a1 ofLength:(NSObject *)a2 delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v4 = 136315138;
  v5 = v3;
  _os_log_fault_impl(&dword_2457F9000, a2, OS_LOG_TYPE_FAULT, "failed to construct algs Processor: %s", (uint8_t *)&v4, 0xCu);
}

- (void)initWithStartPacket:(uint64_t)a3 ofLength:(uint64_t)a4 delegate:(uint64_t)a5 withSignalQualityMetricsEnabled:(uint64_t)a6 bypassingAlgorithms:(uint64_t)a7 bootDate:(uint64_t)a8 hardwareModel:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, a1, a3, "failed to construct algs Processor", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleMotionStatusChange:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, a1, a3, "motion feedback received from algs while in a background session", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)handlePostureStatusChange:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, a1, a3, "posture feedback received from algs while in a background session", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)processPacket:(uint8_t *)buf ofLength:(os_log_t)log .cold.1(char a1, int *a2, uint8_t *buf, os_log_t log)
{
  const char *v4;
  int v5;

  v4 = "foreground";
  v5 = *a2;
  if ((a1 & 1) != 0)
    v4 = "background";
  *(_DWORD *)buf = 136446466;
  *(_QWORD *)(buf + 4) = v4;
  *((_WORD *)buf + 6) = 1026;
  *(_DWORD *)(buf + 14) = v5 + 1;
  _os_log_fault_impl(&dword_2457F9000, log, OS_LOG_TYPE_FAULT, "the algorithms layer failed to produce a %{public}s result after %{public}d packets were processed", buf, 0x12u);
}

- (void)processPacket:(uint64_t)a1 ofLength:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218240;
  v3 = 247;
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_2457F9000, a2, OS_LOG_TYPE_ERROR, "invalid input packet length: expected %zu, got %zu", (uint8_t *)&v2, 0x16u);
}

@end
