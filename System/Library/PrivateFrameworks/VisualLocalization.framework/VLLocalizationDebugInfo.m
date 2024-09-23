@implementation VLLocalizationDebugInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VLLocalizationDebugInfo)initWithPixelBuffer:(double)a3 monotonicTimestamp:(double)a4 timestamp:(double)a5 duration:(double)a6 location:(uint64_t)a7 clLocation:(__CVBuffer *)a8 heading:(__int128 *)a9 gravity:(void *)a10 transform:(__int128 *)a11 cameraIntrinsics:(uint64_t)a12 radialDistortion:(unint64_t)a13 exposureTargetOffset:(double)a14 statistics:(double)a15 resultStatus:(double)a16 resultPose:(__int128)a17 preserveImageData:(__int128)a18
{
  id v33;
  VLLocalizationDebugInfo *v34;
  uint64_t v35;
  NSUUID *identifier;
  signed int PixelFormatType;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  void *BaseAddressOfPlane;
  CGImage *Image;
  __CFData *v42;
  void *v43;
  const __CFDictionary *v44;
  __CFString *v45;
  CGImageDestination *v46;
  __CFData *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  CGImage *v54;
  __CFData *v55;
  __CFString *v56;
  CGImageDestination *v57;
  NSData *imageData;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _VLStatistics *v64;
  _VLStatistics *statistics;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v75;
  GEOVLFLocation *analyticsLocation;
  VLLocalizationCrowdsourcingDetails *v77;
  _VLStatistics *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  VLLocalizationCrowdsourcingDetails *crowdsourcingDetails;
  VLLocalizationDebugInfo *v85;
  CGContext *context;
  CGColorSpace *space;
  __int128 v89;
  __int128 v90;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  objc_super v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  _QWORD v108[3];

  v108[1] = *MEMORY[0x24BDAC8D0];
  v89 = a11[1];
  v90 = *a11;
  v33 = a10;
  v100.receiver = a1;
  v100.super_class = (Class)VLLocalizationDebugInfo;
  v34 = -[VLLocalizationDebugInfo init](&v100, sel_init);
  if (!v34)
    goto LABEL_32;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v35 = objc_claimAutoreleasedReturnValue();
  identifier = v34->_identifier;
  v34->_identifier = (NSUUID *)v35;

  if (a27)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a8);
    if (PixelFormatType > 1714696751)
    {
      if (PixelFormatType != 2033463856 && PixelFormatType != 1714696752)
        goto LABEL_15;
    }
    else if (PixelFormatType != 875704422 && PixelFormatType != 875704438)
    {
      goto LABEL_15;
    }
    CVPixelBufferLockBaseAddress(a8, 1uLL);
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a8, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a8, 0);
    if (CVPixelBufferGetBytesPerRowOfPlane(a8, 0) == WidthOfPlane)
    {
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a8, 0);
      space = CGColorSpaceCreateDeviceGray();
      context = CGBitmapContextCreate(BaseAddressOfPlane, WidthOfPlane, HeightOfPlane, 8uLL, WidthOfPlane, space, 0);
      Image = CGBitmapContextCreateImage(context);
      objc_msgSend(MEMORY[0x24BDBCEC8], "data");
      v42 = (__CFData *)objc_claimAutoreleasedReturnValue();
      v107 = *MEMORY[0x24BDD96B0];
      v105 = *MEMORY[0x24BDD96A8];
      v106 = &unk_24CA9F288;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = v43;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v108, &v107, 1);
      v44 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v46 = CGImageDestinationCreateWithData(v42, v45, 1uLL, 0);

      CGImageDestinationAddImage(v46, Image, v44);
      if (CGImageDestinationFinalize(v46))
        v47 = v42;
      else
        v47 = 0;
      CFRelease(v46);
      CGImageRelease(Image);
      CGContextRelease(context);
      CGColorSpaceRelease(space);

      CVPixelBufferUnlockBaseAddress(a8, 1uLL);
      if (v47)
      {
LABEL_23:
        imageData = v34->_imageData;
        v34->_imageData = (NSData *)v47;

        goto LABEL_24;
      }
    }
    else
    {
      CVPixelBufferUnlockBaseAddress(a8, 1uLL);
    }
LABEL_15:
    v101 = 0;
    v102 = &v101;
    v103 = 0x2050000000;
    v48 = (void *)_MergedGlobals_0;
    v104 = _MergedGlobals_0;
    if (!_MergedGlobals_0)
    {
      *(_QWORD *)&v92 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v92 + 1) = 3221225472;
      *(_QWORD *)&v93 = __getCIImageClass_block_invoke;
      *((_QWORD *)&v93 + 1) = &unk_24CA9B760;
      *(_QWORD *)&v94 = &v101;
      __getCIImageClass_block_invoke((uint64_t)&v92);
      v48 = (void *)v102[3];
    }
    v49 = objc_retainAutorelease(v48);
    _Block_object_dispose(&v101, 8);
    v50 = (void *)objc_msgSend([v49 alloc], "initWithCVPixelBuffer:", a8);
    v101 = 0;
    v102 = &v101;
    v103 = 0x2050000000;
    v51 = (void *)qword_253E9A210;
    v104 = qword_253E9A210;
    if (!qword_253E9A210)
    {
      *(_QWORD *)&v92 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v92 + 1) = 3221225472;
      *(_QWORD *)&v93 = __getCIContextClass_block_invoke;
      *((_QWORD *)&v93 + 1) = &unk_24CA9B760;
      *(_QWORD *)&v94 = &v101;
      __getCIContextClass_block_invoke((uint64_t)&v92);
      v51 = (void *)v102[3];
    }
    v52 = objc_retainAutorelease(v51);
    _Block_object_dispose(&v101, 8);
    objc_msgSend(v52, "context");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "extent");
    v54 = (CGImage *)objc_msgSend(v53, "createCGImage:fromRect:", v50);

    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v55 = (__CFData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
    v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v57 = CGImageDestinationCreateWithData(v55, v56, 1uLL, 0);

    CGImageDestinationAddImage(v57, v54, 0);
    if (CGImageDestinationFinalize(v57))
      v47 = v55;
    else
      v47 = 0;
    CFRelease(v57);
    CGImageRelease(v54);

    goto LABEL_23;
  }
LABEL_24:
  *((_QWORD *)&v59 + 1) = *((_QWORD *)&a19 + 1);
  *((_QWORD *)&v60 + 1) = *((_QWORD *)&a20 + 1);
  *((_QWORD *)&v61 + 1) = *((_QWORD *)&a21 + 1);
  v34->_monotonicTimestamp = a2;
  v34->_timestamp = a3;
  v34->_duration = a4;
  v62 = *a9;
  v63 = a9[1];
  *(_QWORD *)&v34->_location.type = *((_QWORD *)a9 + 4);
  *(_OWORD *)v34->_location.pos_geoc = v62;
  *(_OWORD *)&v34->_location.pos_geoc[2] = v63;
  v34->_heading.trueHeading = a5;
  v34->_heading.accuracy = a6;
  *(_OWORD *)v34->_gravity = v90;
  *(_OWORD *)&v34->_gravity[16] = v89;
  *(_OWORD *)v34->_anon_90 = a17;
  *(_OWORD *)&v34->_anon_90[16] = a18;
  *(_OWORD *)&v34->_anon_90[32] = a19;
  *(_OWORD *)&v34->_anon_90[48] = a20;
  *(_OWORD *)v34->_anon_d0 = a21;
  *(_OWORD *)&v34->_anon_d0[16] = a22;
  *(_OWORD *)&v34->_anon_d0[32] = a23;
  *(_QWORD *)v34->_radialDistortion = a24;
  v34->_exposureTargetOffset = a25;
  v34->_resultStatus = a13;
  if (a12)
  {
    v64 = -[_VLStatistics initWithStats:]([_VLStatistics alloc], "initWithStats:", a12);
    statistics = v34->_statistics;
    v34->_statistics = v64;

  }
  v34->_hasResultPose = a26 != 0;
  if (a26)
  {
    *(_QWORD *)&v66 = *(_QWORD *)a26;
    *(_QWORD *)&v67 = *(_QWORD *)(a26 + 8);
    *(_QWORD *)&v68 = *(_QWORD *)(a26 + 16);
    v69 = *(_OWORD *)(a26 + 72);
    *((_QWORD *)&v66 + 1) = *(_QWORD *)(a26 + 24);
    *((_QWORD *)&v67 + 1) = *(_QWORD *)(a26 + 32);
    *(_QWORD *)&v59 = *(_QWORD *)(a26 + 48);
    *(_QWORD *)&v60 = *(_QWORD *)(a26 + 56);
    *((_QWORD *)&v68 + 1) = *(_QWORD *)(a26 + 40);
    *(_QWORD *)&v61 = *(_QWORD *)(a26 + 64);
    __asm { FMOV            V7.2D, #1.0 }
    *(_QWORD *)&_Q7 = *(_QWORD *)(a26 + 88);
    *(_OWORD *)v34->_anon_130 = v66;
    *(_OWORD *)&v34->_anon_130[16] = v59;
    *(_OWORD *)&v34->_anon_130[32] = v67;
    *(_OWORD *)&v34->_anon_130[48] = v60;
    *(_OWORD *)&v34->_anon_130[64] = v68;
    *(_OWORD *)&v34->_anon_130[80] = v61;
    *(_OWORD *)&v34->_anon_130[96] = v69;
    *(_OWORD *)&v34->_anon_130[112] = _Q7;
    *(_QWORD *)&v67 = *(_QWORD *)(a26 + 88);
    *(_OWORD *)v34->_anon_1b0 = *(_OWORD *)(a26 + 72);
    *(_OWORD *)&v34->_anon_1b0[16] = v67;
    *(_QWORD *)&v34->_anon_1b0[32] = 0xBFF0000000000000;
    v34->_resultConfidence = *(float *)(a26 + 96);
    v34->_resultCovariance.v[0][0] = *(float *)(a26 + 100);
    v34->_resultCovariance.v[0][1] = *(float *)(a26 + 104);
    v34->_resultCovariance.v[0][2] = *(float *)(a26 + 108);
    v34->_resultCovariance.v[0][3] = *(float *)(a26 + 112);
    v34->_resultCovariance.v[0][4] = *(float *)(a26 + 116);
    v34->_resultCovariance.v[0][5] = *(float *)(a26 + 120);
    v34->_resultCovariance.v[1][0] = *(float *)(a26 + 124);
    v34->_resultCovariance.v[1][1] = *(float *)(a26 + 128);
    v34->_resultCovariance.v[1][2] = *(float *)(a26 + 132);
    v34->_resultCovariance.v[1][3] = *(float *)(a26 + 136);
    v34->_resultCovariance.v[1][4] = *(float *)(a26 + 140);
    v34->_resultCovariance.v[1][5] = *(float *)(a26 + 144);
    v34->_resultCovariance.v[2][0] = *(float *)(a26 + 148);
    v34->_resultCovariance.v[2][1] = *(float *)(a26 + 152);
    v34->_resultCovariance.v[2][2] = *(float *)(a26 + 156);
    v34->_resultCovariance.v[2][3] = *(float *)(a26 + 160);
    v34->_resultCovariance.v[2][4] = *(float *)(a26 + 164);
    v34->_resultCovariance.v[2][5] = *(float *)(a26 + 168);
    v34->_resultCovariance.v[3][0] = *(float *)(a26 + 172);
    v34->_resultCovariance.v[3][1] = *(float *)(a26 + 176);
    v34->_resultCovariance.v[3][2] = *(float *)(a26 + 180);
    v34->_resultCovariance.v[3][3] = *(float *)(a26 + 184);
    v34->_resultCovariance.v[3][4] = *(float *)(a26 + 188);
    v34->_resultCovariance.v[3][5] = *(float *)(a26 + 192);
    v34->_resultCovariance.v[4][0] = *(float *)(a26 + 196);
    v34->_resultCovariance.v[4][1] = *(float *)(a26 + 200);
    v34->_resultCovariance.v[4][2] = *(float *)(a26 + 204);
    v34->_resultCovariance.v[4][3] = *(float *)(a26 + 208);
    v34->_resultCovariance.v[4][4] = *(float *)(a26 + 212);
    v34->_resultCovariance.v[4][5] = *(float *)(a26 + 216);
    v34->_resultCovariance.v[5][0] = *(float *)(a26 + 220);
    v34->_resultCovariance.v[5][1] = *(float *)(a26 + 224);
    v34->_resultCovariance.v[5][2] = *(float *)(a26 + 228);
    v34->_resultCovariance.v[5][3] = *(float *)(a26 + 232);
    v34->_resultCovariance.v[5][4] = *(float *)(a26 + 236);
    v34->_resultCovariance.v[5][5] = *(float *)(a26 + 240);
  }
  v75 = objc_msgSend(objc_alloc(MEMORY[0x24BE3D108]), "initWithCLLocation:location:heading:", v33, a9, a5);
  analyticsLocation = v34->_analyticsLocation;
  v34->_analyticsLocation = (GEOVLFLocation *)v75;

  if (v34->_statistics && v34->_hasResultPose)
  {
    v77 = [VLLocalizationCrowdsourcingDetails alloc];
    v78 = v34->_statistics;
    v79 = *(_OWORD *)&v34->_anon_130[80];
    v96 = *(_OWORD *)&v34->_anon_130[64];
    v97 = v79;
    v80 = *(_OWORD *)&v34->_anon_130[112];
    v98 = *(_OWORD *)&v34->_anon_130[96];
    v99 = v80;
    v81 = *(_OWORD *)&v34->_anon_130[16];
    v92 = *(_OWORD *)v34->_anon_130;
    v93 = v81;
    v82 = *(_OWORD *)&v34->_anon_130[48];
    v94 = *(_OWORD *)&v34->_anon_130[32];
    v95 = v82;
    v83 = -[VLLocalizationCrowdsourcingDetails initWithStats:resultTransform:](v77, "initWithStats:resultTransform:", v78, &v92);
    crowdsourcingDetails = v34->_crowdsourcingDetails;
    v34->_crowdsourcingDetails = (VLLocalizationCrowdsourcingDetails *)v83;

  }
  v85 = v34;
LABEL_32:

  return v34;
}

- (VLLocalizationDebugInfo)initWithCoder:(id)a3
{
  id v4;
  VLLocalizationDebugInfo *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSData *imageData;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  uint64_t v17;
  GEOVLFLocation *analyticsLocation;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  _QWORD *v36;
  double v37;
  uint64_t v38;
  _VLStatistics *statistics;
  int v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  float v46;
  VLLocalizationCrowdsourcingDetails *v47;
  _VLStatistics *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  VLLocalizationCrowdsourcingDetails *crowdsourcingDetails;
  VLLocalizationDebugInfo *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  const __CFString **v59;
  uint64_t *v60;
  void *v61;
  void *v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _OWORD v68[8];
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  objc_super v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  _QWORD v78[2];

  v78[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)VLLocalizationDebugInfo;
  v5 = -[VLLocalizationDebugInfo init](&v72, sel_init);
  if (!v5)
    goto LABEL_19;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSUUID *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v8 = objc_claimAutoreleasedReturnValue();
  imageData = v5->_imageData;
  v5->_imageData = (NSData *)v8;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("monotonicTimestamp"));
  v5->_monotonicTimestamp = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
  v5->_timestamp = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
  v5->_duration = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("location_x"));
  v5->_location.pos_geoc[0] = v13;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("location_y"));
  v5->_location.pos_geoc[1] = v14;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("location_z"));
  v5->_location.pos_geoc[2] = v15;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("location_accuracy"));
  v5->_location.horz_accuracy = v16;
  v5->_location.is_vl_fused = objc_msgSend(v4, "decodeIntForKey:", CFSTR("location_fused"));
  v5->_location.type = objc_msgSend(v4, "decodeIntForKey:", CFSTR("location_type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("full_location"));
  v17 = objc_claimAutoreleasedReturnValue();
  analyticsLocation = v5->_analyticsLocation;
  v5->_analyticsLocation = (GEOVLFLocation *)v17;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("heading"));
  v5->_heading.trueHeading = v19;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("heading_accuracy"));
  v5->_heading.accuracy = v20;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("gravity_x"));
  v66 = v21;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("gravity_y"));
  v64 = v22;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("gravity_z"));
  *(_QWORD *)&v23 = v66;
  *((_QWORD *)&v23 + 1) = v64;
  *(_OWORD *)v5->_gravity = v23;
  *(_OWORD *)&v5->_gravity[16] = v24;
  v71 = 0;
  v25 = objc_retainAutorelease(v4);
  v26 = (_OWORD *)objc_msgSend(v25, "decodeBytesForKey:returnedLength:", CFSTR("transform"), &v71);
  if (!v26 || v71 != 64)
  {
    v56 = (void *)MEMORY[0x24BDD1540];
    v57 = *MEMORY[0x24BDD0B88];
    v77 = *MEMORY[0x24BDBD370];
    v78[0] = CFSTR("transform bytes were not the expected length");
    v58 = (void *)MEMORY[0x24BDBCE70];
    v59 = (const __CFString **)v78;
    v60 = &v77;
LABEL_18:
    objc_msgSend(v58, "dictionaryWithObjects:forKeys:count:", v59, v60, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "errorWithDomain:code:userInfo:", v57, 4864, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "failWithError:", v62);

LABEL_19:
    v55 = 0;
    goto LABEL_20;
  }
  v27 = v26[1];
  v28 = v26[2];
  v29 = v26[3];
  *(_OWORD *)v5->_anon_90 = *v26;
  *(_OWORD *)&v5->_anon_90[16] = v27;
  *(_OWORD *)&v5->_anon_90[32] = v28;
  *(_OWORD *)&v5->_anon_90[48] = v29;
  v70 = 0;
  v25 = objc_retainAutorelease(v25);
  v30 = objc_msgSend(v25, "decodeBytesForKey:returnedLength:", CFSTR("camera_intrinsics"), &v70);
  if (!v30 || v70 != 36)
  {
    v56 = (void *)MEMORY[0x24BDD1540];
    v57 = *MEMORY[0x24BDD0B88];
    v75 = *MEMORY[0x24BDBD370];
    v76 = CFSTR("cameraIntrinsics bytes were not the expected length");
    v58 = (void *)MEMORY[0x24BDBCE70];
    v59 = &v76;
    v60 = &v75;
    goto LABEL_18;
  }
  v31 = *(_QWORD *)v30;
  v32 = *(_QWORD *)(v30 + 12);
  v33 = *(_DWORD *)(v30 + 20);
  v34 = *(_QWORD *)(v30 + 24);
  v35 = *(_DWORD *)(v30 + 32);
  *(_DWORD *)&v5->_anon_d0[8] = *(_DWORD *)(v30 + 8);
  *(_QWORD *)v5->_anon_d0 = v31;
  *(_DWORD *)&v5->_anon_d0[24] = v33;
  *(_QWORD *)&v5->_anon_d0[16] = v32;
  *(_DWORD *)&v5->_anon_d0[40] = v35;
  *(_QWORD *)&v5->_anon_d0[32] = v34;
  v69 = 0;
  v25 = objc_retainAutorelease(v25);
  v36 = (_QWORD *)objc_msgSend(v25, "decodeBytesForKey:returnedLength:", CFSTR("radial_distortion"), &v69);
  if (!v36 || v69 != 8)
  {
    v56 = (void *)MEMORY[0x24BDD1540];
    v57 = *MEMORY[0x24BDD0B88];
    v73 = *MEMORY[0x24BDBD370];
    v74 = CFSTR("radialDistortion bytes were not the expected length");
    v58 = (void *)MEMORY[0x24BDBCE70];
    v59 = &v74;
    v60 = &v73;
    goto LABEL_18;
  }
  *(_QWORD *)v5->_radialDistortion = *v36;
  objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("exposure_target_offset"));
  v5->_exposureTargetOffset = v37;
  v5->_resultStatus = objc_msgSend(v25, "decodeIntegerForKey:", CFSTR("status"));
  objc_msgSend(v25, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statistics"));
  v38 = objc_claimAutoreleasedReturnValue();
  statistics = v5->_statistics;
  v5->_statistics = (_VLStatistics *)v38;

  v40 = objc_msgSend(v25, "containsValueForKey:", CFSTR("result_transform"));
  v5->_hasResultPose = v40;
  if (v40)
  {
    objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("result_location_x"));
    v67 = v41;
    objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("result_location_y"));
    v65 = v42;
    objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("result_location_z"));
    *(_QWORD *)&v43 = v67;
    *((_QWORD *)&v43 + 1) = v65;
    *(_OWORD *)v5->_anon_1b0 = v43;
    *(_OWORD *)&v5->_anon_1b0[16] = v44;
    objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("result_location_accuracy"));
    *(_QWORD *)&v5->_anon_1b0[32] = v45;
    if (!objc_msgSend(v25, "_vl_decodeSimdDouble4x4:forKey:", v5->_anon_130, CFSTR("result_transform")))
      goto LABEL_19;
    objc_msgSend(v25, "decodeFloatForKey:", CFSTR("result_confidence"));
    v5->_resultConfidence = v46;
    if (!objc_msgSend(v25, "_vl_decodeFloat6x6:forKey:", &v5->_resultCovariance, CFSTR("result_covariance")))goto LABEL_19;
  }
  if (v5->_statistics && v5->_hasResultPose)
  {
    v47 = [VLLocalizationCrowdsourcingDetails alloc];
    v48 = v5->_statistics;
    v49 = *(_OWORD *)&v5->_anon_130[80];
    v68[4] = *(_OWORD *)&v5->_anon_130[64];
    v68[5] = v49;
    v50 = *(_OWORD *)&v5->_anon_130[112];
    v68[6] = *(_OWORD *)&v5->_anon_130[96];
    v68[7] = v50;
    v51 = *(_OWORD *)&v5->_anon_130[16];
    v68[0] = *(_OWORD *)v5->_anon_130;
    v68[1] = v51;
    v52 = *(_OWORD *)&v5->_anon_130[48];
    v68[2] = *(_OWORD *)&v5->_anon_130[32];
    v68[3] = v52;
    v53 = -[VLLocalizationCrowdsourcingDetails initWithStats:resultTransform:](v47, "initWithStats:resultTransform:", v48, v68);
    crowdsourcingDetails = v5->_crowdsourcingDetails;
    v5->_crowdsourcingDetails = (VLLocalizationCrowdsourcingDetails *)v53;

  }
  v55 = v5;
LABEL_20:

  return v55;
}

- (unint64_t)inliersCount
{
  unint64_t result;
  uint64_t v3;

  result = (unint64_t)self->_statistics;
  if (result)
  {
    v3 = objc_msgSend((id)result, "stats");
    return *(_DWORD *)(v3 + 88) & ~(*(int *)(v3 + 88) >> 31);
  }
  return result;
}

- (int)_inlierIndices
{
  int *result;

  result = (int *)self->_statistics;
  if (result)
    return *(int **)(objc_msgSend(result, "stats") + 16);
  return result;
}

- (float)points2D
{
  float *result;

  result = (float *)self->_statistics;
  if (result)
    return *(float **)(objc_msgSend(result, "stats") + 8);
  return result;
}

- (double)points3D
{
  double *result;

  result = (double *)self->_statistics;
  if (result)
    return *(double **)objc_msgSend(result, "stats");
  return result;
}

- (unint64_t)_solutionsCount
{
  unint64_t result;
  uint64_t v3;

  result = (unint64_t)self->_statistics;
  if (result)
  {
    v3 = objc_msgSend((id)result, "stats");
    return *(_DWORD *)(v3 + 80) & ~(*(int *)(v3 + 80) >> 31);
  }
  return result;
}

- (float)_solverConfidences
{
  float *result;

  result = (float *)self->_statistics;
  if (result)
    return *(float **)(objc_msgSend(result, "stats") + 64);
  return result;
}

- (float)_fusedConfidences
{
  float *result;

  result = (float *)self->_statistics;
  if (result)
    return *(float **)(objc_msgSend(result, "stats") + 72);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *imageData;
  double v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  int8x16_t v10;
  int8x16_t v11;
  _VLStatistics *statistics;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int32 v33;
  _OWORD v34[4];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("uuid"));
  imageData = self->_imageData;
  if (imageData)
    objc_msgSend(v4, "encodeObject:forKey:", imageData, CFSTR("image"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("monotonicTimestamp"), self->_monotonicTimestamp);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("location_x"), self->_location.pos_geoc[0]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("location_y"), self->_location.pos_geoc[1]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("location_z"), self->_location.pos_geoc[2]);
  *(float *)&v6 = self->_location.horz_accuracy;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("location_accuracy"), v6);
  objc_msgSend(v4, "encodeInt:forKey:", self->_location.is_vl_fused, CFSTR("location_fused"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_location.type, CFSTR("location_type"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_analyticsLocation, CFSTR("full_location"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("heading"), self->_heading.trueHeading);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("heading_accuracy"), self->_heading.accuracy);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("gravity_x"), *(double *)self->_gravity);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("gravity_y"), *(double *)&self->_gravity[8]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("gravity_z"), *(double *)&self->_gravity[16]);
  v7 = *(_OWORD *)&self->_anon_90[16];
  v34[0] = *(_OWORD *)self->_anon_90;
  v34[1] = v7;
  v8 = *(_OWORD *)&self->_anon_90[48];
  v34[2] = *(_OWORD *)&self->_anon_90[32];
  v34[3] = v8;
  objc_msgSend(v4, "encodeBytes:length:forKey:", v34, 64, CFSTR("transform"));
  v9 = *(_OWORD *)self->_anon_d0;
  HIDWORD(v9) = *(_OWORD *)&self->_anon_d0[16];
  v10 = *(int8x16_t *)&self->_anon_d0[32];
  v11 = vextq_s8(vextq_s8(*(int8x16_t *)&self->_anon_d0[16], *(int8x16_t *)&self->_anon_d0[16], 0xCuLL), v10, 8uLL);
  v32[0] = v9;
  v32[1] = v11;
  v33 = v10.i32[2];
  objc_msgSend(v4, "encodeBytes:length:forKey:", v32, 36, CFSTR("camera_intrinsics"));
  v31 = *(_QWORD *)self->_radialDistortion;
  objc_msgSend(v4, "encodeBytes:length:forKey:", &v31, 8, CFSTR("radial_distortion"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("exposure_target_offset"), self->_exposureTargetOffset);
  statistics = self->_statistics;
  if (statistics)
    objc_msgSend(v4, "encodeObject:forKey:", statistics, CFSTR("statistics"));
  if (self->_hasResultPose)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("result_location_x"), *(double *)self->_anon_1b0);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("result_location_y"), *(double *)&self->_anon_1b0[8]);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("result_location_z"), *(double *)&self->_anon_1b0[16]);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("result_location_accuracy"), *(double *)&self->_anon_1b0[32]);
    v13 = *(_OWORD *)&self->_anon_130[80];
    v26 = *(_OWORD *)&self->_anon_130[64];
    v27 = v13;
    v14 = *(_OWORD *)&self->_anon_130[112];
    v28 = *(_OWORD *)&self->_anon_130[96];
    v29 = v14;
    v15 = *(_OWORD *)&self->_anon_130[16];
    v22 = *(_OWORD *)self->_anon_130;
    v23 = v15;
    v16 = *(_OWORD *)&self->_anon_130[48];
    v24 = *(_OWORD *)&self->_anon_130[32];
    v25 = v16;
    objc_msgSend(v4, "_vl_encodeSimdDouble4x4:forKey:", &v22, CFSTR("result_transform"));
    *(float *)&v17 = self->_resultConfidence;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("result_confidence"), v17);
    v18 = *(_OWORD *)&self->_resultCovariance.v[4][4];
    v28 = *(_OWORD *)&self->_resultCovariance.v[4][0];
    v29 = v18;
    v30 = *(_OWORD *)&self->_resultCovariance.v[5][2];
    v19 = *(_OWORD *)&self->_resultCovariance.v[2][0];
    v24 = *(_OWORD *)&self->_resultCovariance.v[1][2];
    v25 = v19;
    v20 = *(_OWORD *)&self->_resultCovariance.v[3][2];
    v26 = *(_OWORD *)&self->_resultCovariance.v[2][4];
    v27 = v20;
    v21 = *(_OWORD *)&self->_resultCovariance.v[0][4];
    v22 = *(_OWORD *)&self->_resultCovariance.v[0][0];
    v23 = v21;
    objc_msgSend(v4, "_vl_encodeFloat6x6:forKey:", &v22, CFSTR("result_covariance"));
  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_resultStatus, CFSTR("status"));

}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  VLLocalizationDebugInfo *v4;
  VLLocalizationDebugInfo *v5;
  char v6;

  v4 = (VLLocalizationDebugInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {

    return 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[NSUUID isEqual:](self->_identifier, "isEqual:", v5->_identifier);

      return v6;
    }
    else
    {

      return 0;
    }
  }
}

- (id)inputParameters
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unsigned int v30;
  double v31;
  double v33;
  __double2 v34;
  double v35;
  long double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int8x16_t v53;
  int8x16_t v54;
  __int128 v55;
  float32x2_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *__ya;
  long double __y;
  void *__yb;
  __int128 __yc;
  const __CFString *v78;
  void *v79;
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[7];
  _QWORD v86[7];
  _QWORD v87[2];
  _QWORD v88[9];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  float64x2_t v93;
  double v94;
  double v95[2];
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  double v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("timestamp"));

  v5 = (void *)MGCopyAnswer();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("device_name"));

  v89[0] = CFSTR("K");
  LODWORD(v6) = *(_DWORD *)self->_anon_d0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  __ya = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = __ya;
  LODWORD(v7) = *(_DWORD *)&self->_anon_d0[16];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v72;
  LODWORD(v8) = *(_DWORD *)&self->_anon_d0[32];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v69;
  LODWORD(v9) = *(_DWORD *)&self->_anon_d0[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v88[3] = v67;
  LODWORD(v10) = *(_DWORD *)&self->_anon_d0[20];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v88[4] = v66;
  LODWORD(v11) = *(_DWORD *)&self->_anon_d0[36];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v88[5] = v65;
  LODWORD(v12) = *(_DWORD *)&self->_anon_d0[8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v88[6] = v64;
  LODWORD(v13) = *(_DWORD *)&self->_anon_d0[24];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v88[7] = v14;
  LODWORD(v15) = *(_DWORD *)&self->_anon_d0[40];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v88[8] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = CFSTR("radial");
  v90[0] = v17;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", *(double *)self->_radialDistortion);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v18;
  LODWORD(v19) = *(_DWORD *)&self->_radialDistortion[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("lens"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_exposureTargetOffset);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("exposure_target_offset"));

  v25 = self->_location.pos_geoc[0];
  v24 = self->_location.pos_geoc[1];
  v26 = sqrt(v24 * v24 + v25 * v25);
  v27 = v26 * 0.99330562;
  v28 = 0.0;
  v29 = 1.57079633;
  v71 = v3;
  if (v26 * 0.99330562 != 0.0)
  {
    v68 = self->_location.pos_geoc[1];
    v30 = 0;
    __y = self->_location.pos_geoc[2];
    v29 = 0.0;
    v31 = 0.0;
    do
    {
      v33 = v29;
      v29 = atan2(__y, v27);
      v34 = __sincos_stret(v29);
      v35 = 6378137.0 / sqrt(v34.__sinval * -0.00669437999 * v34.__sinval + 1.0);
      v28 = v26 / v34.__cosval - v35;
      if (vabdd_f64(v33, v29) < 0.000001)
      {
        if (vabdd_f64(v31, v28) < 0.001 || v30 >= 9)
          goto LABEL_12;
      }
      else if (v30 > 8)
      {
        goto LABEL_12;
      }
      ++v30;
      v27 = v26 * (v35 / (v35 + v28) * -0.00669437999 + 1.0);
      v31 = v26 / v34.__cosval - v35;
    }
    while (v27 != 0.0);
    v29 = 1.57079633;
LABEL_12:
    v24 = v68;
  }
  v36 = atan2(v24, v25) / 0.0174532925;
  v85[0] = CFSTR("pos_geoc");
  v83[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v25);
  __yb = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = __yb;
  v83[1] = CFSTR("y");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_location.pos_geoc[1]);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v73;
  v83[2] = CFSTR("z");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_location.pos_geoc[2]);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v70;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v37;
  v85[1] = CFSTR("lat");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29 / 0.0174532925);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v38;
  v85[2] = CFSTR("lon");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v36);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v39;
  v85[3] = CFSTR("alt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v86[3] = v40;
  v85[4] = CFSTR("horz_accuracy");
  *(float *)&v41 = self->_location.horz_accuracy;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v86[4] = v42;
  v85[5] = CFSTR("is_vl_fused");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_location.is_vl_fused);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v86[5] = v43;
  v85[6] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_location.type);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v86[6] = v44;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 7);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v45, CFSTR("gps"));

  v81[0] = CFSTR("grav");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)self->_gravity);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v46;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&self->_gravity[8]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v47;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&self->_gravity[16]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v48;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v49;
  v81[1] = CFSTR("true_heading");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_heading.trueHeading, -1.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v50;
  v81[2] = CFSTR("heading_accuracy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_heading.accuracy);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v51;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v52, CFSTR("ori"));

  v78 = CFSTR("pose");
  v53 = *(int8x16_t *)self->_anon_90;
  v54 = *(int8x16_t *)&self->_anon_90[16];
  v55 = *(_OWORD *)&self->_anon_90[32];
  __yc = *(_OWORD *)&self->_anon_90[48];
  v95[0] = *(float *)v53.i32;
  v95[1] = *(float *)v54.i32;
  v56 = (float32x2_t)vzip2_s32(*(int32x2_t *)v54.i8, *(int32x2_t *)&v55);
  DWORD1(v55) = v53.i32[1];
  v96 = vcvtq_f64_f32(*(float32x2_t *)&v55);
  v97 = vcvtq_f64_f32(v56);
  v98 = vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(v53, v53, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(v54, v54, 8uLL)));
  v99 = *((float *)&v55 + 2);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v95, 72, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "base64EncodedStringWithOptions:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = vcvtq_f64_f32(*(float32x2_t *)&__yc);
  v94 = *((float *)&__yc + 2);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", &v93, 24, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "base64EncodedStringWithOptions:", 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v91[0] = CFSTR("R");
  v91[1] = CFSTR("t");
  v92[0] = v58;
  v92[1] = v60;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = v61;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v62, CFSTR("vio"));

  return v71;
}

- (id)results
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  $EA16241FF5FAACBBBC823CFA4C5CA9E3 *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  $EA16241FF5FAACBBBC823CFA4C5CA9E3 *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  uint64_t v38;
  uint64_t v39;
  int64x2_t v40;
  int64x2_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  float64x2_t v49;
  long double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  unsigned int v55;
  double v56;
  double v58;
  __double2 v59;
  double v60;
  long double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  int64x2_t v70;
  int64x2_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  float64x2_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v82;
  double v83;
  void *v84;
  __int128 __ya;
  long double __y;
  void *__yb;
  int64x2_t v88;
  int64x2_t v89;
  int64x2_t v90;
  int64x2_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  const __CFString *v96;
  void *v97;
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[4];
  _QWORD v101[4];
  _QWORD v102[2];
  _QWORD v103[2];
  __int128 v104;
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_resultStatus);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("status"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("duration"));

  if (self->_statistics)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[_VLStatistics stats](self->_statistics, "stats")[88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("num_inliers"));

    if ((int)-[_VLStatistics stats](self->_statistics, "stats")[88] >= 1)
    {
      v8 = (void *)MEMORY[0x24BDBCE50];
      v9 = (uint64_t)-[_VLStatistics stats](self->_statistics, "stats")[8];
      v10 = -[_VLStatistics stats](self->_statistics, "stats");
      objc_msgSend(v8, "dataWithBytesNoCopy:length:freeWhenDone:", v9, 8 * (v10->var12 & ~(v10->var12 >> 31)), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("points2D"));
      v13 = (void *)MEMORY[0x24BDBCE50];
      v14 = *(_QWORD *)-[_VLStatistics stats](self->_statistics, "stats");
      v15 = -[_VLStatistics stats](self->_statistics, "stats");
      objc_msgSend(v13, "dataWithBytesNoCopy:length:freeWhenDone:", v14, 24 * (v15->var12 & ~(v15->var12 >> 31)), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("points3D"));
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[_VLStatistics stats](self->_statistics, "stats")[92]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("num_keypoints"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[_VLStatistics stats](self->_statistics, "stats")[96]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("num_tracks"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[_VLStatistics stats](self->_statistics, "stats")[100]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("num_matches"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[_VLStatistics stats](self->_statistics, "stats")[56]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("status_ps"));

    if ((int)-[_VLStatistics stats](self->_statistics, "stats")[136] >= 1)
    {
      v22 = (uint64_t)-[_VLStatistics stats](self->_statistics, "stats")[104];
      v23 = v22 + 16 * (int)-[_VLStatistics stats](self->_statistics, "stats")[136];
      v24 = *(unsigned int *)(v23 - 16);
      v25 = *(unsigned int *)(v23 - 12);
      v27 = *(unsigned int *)(v23 - 8);
      v26 = *(unsigned int *)(v23 - 4);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("x"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, CFSTR("y"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v24);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("level"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, CFSTR("uncertainty"));

      objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("tile"));
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", (_QWORD)-[_VLStatistics stats](self->_statistics, "stats")[488]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("tracks_file_size"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("statistics"));
  }
  if (self->_hasResultPose)
  {
    v34 = *(int64x2_t *)&self->_anon_130[16];
    v36 = *(int64x2_t *)&self->_anon_130[32];
    v35 = *(int64x2_t *)&self->_anon_130[48];
    v37 = *(int64x2_t *)&self->_anon_130[64];
    v38 = *(_QWORD *)&self->_anon_130[80];
    v39 = *(_QWORD *)&self->_anon_130[112];
    v40 = vzip1q_s64(*(int64x2_t *)self->_anon_130, v36);
    v41 = vzip2q_s64(v36, v37);
    v37.i64[1] = *(_QWORD *)&self->_anon_130[8];
    __ya = *(_OWORD *)&self->_anon_130[96];
    v88 = v40;
    v89 = v37;
    v90 = v41;
    v91 = vzip1q_s64(v34, v35);
    *(_QWORD *)&v92 = v38;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", &v88, 72, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "base64EncodedStringWithOptions:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v104 = __ya;
    v105 = v39;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", &v104, 24, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "base64EncodedStringWithOptions:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v102[0] = CFSTR("R");
    v102[1] = CFSTR("t");
    v103[0] = v43;
    v103[1] = v45;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v103, v102, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("pose"));
    *(float *)&v47 = self->_resultConfidence;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("confidence"));

    v49 = *(float64x2_t *)self->_anon_1b0;
    v50 = *(double *)&self->_anon_1b0[8];
    v51 = sqrt(vmlad_n_f64(vmuld_lane_f64(v50, v49, 1), v49.f64[0], v49.f64[0]));
    v52 = v51 * 0.99330562;
    v53 = 0.0;
    v54 = 1.57079633;
    v83 = v49.f64[0];
    if (v51 * 0.99330562 != 0.0)
    {
      v82 = *(double *)&self->_anon_1b0[8];
      v55 = 0;
      __y = *(double *)&self->_anon_1b0[16];
      v54 = 0.0;
      v56 = 0.0;
      do
      {
        v58 = v54;
        v54 = atan2(__y, v52);
        v59 = __sincos_stret(v54);
        v60 = 6378137.0 / sqrt(v59.__sinval * -0.00669437999 * v59.__sinval + 1.0);
        v53 = v51 / v59.__cosval - v60;
        if (vabdd_f64(v58, v54) < 0.000001)
        {
          if (vabdd_f64(v56, v53) < 0.001 || v55 >= 9)
          {
LABEL_17:
            v49.f64[0] = v83;
            goto LABEL_19;
          }
        }
        else if (v55 > 8)
        {
          goto LABEL_17;
        }
        ++v55;
        v52 = v51 * (v60 / (v60 + v53) * -0.00669437999 + 1.0);
        v56 = v51 / v59.__cosval - v60;
      }
      while (v52 != 0.0);
      v49.f64[0] = v83;
      v54 = 1.57079633;
LABEL_19:
      v50 = v82;
    }
    v61 = atan2(v50, v49.f64[0]) / 0.0174532925;
    v100[0] = CFSTR("pos_geoc");
    v98[0] = CFSTR("x");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v83);
    __yb = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = __yb;
    v98[1] = CFSTR("y");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&self->_anon_1b0[8]);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v84;
    v98[2] = CFSTR("z");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&self->_anon_1b0[16]);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v99[2] = v62;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v99, v98, 3);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v101[0] = v63;
    v100[1] = CFSTR("lat");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v54 / 0.0174532925);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v101[1] = v64;
    v100[2] = CFSTR("lon");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v61);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v101[2] = v65;
    v100[3] = CFSTR("alt");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v53);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v101[3] = v66;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v101, v100, 4);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("location"));

    v96 = CFSTR("heading");
    v68 = *(_OWORD *)&self->_anon_130[80];
    v92 = *(_OWORD *)&self->_anon_130[64];
    v93 = v68;
    v69 = *(_OWORD *)&self->_anon_130[112];
    v94 = *(_OWORD *)&self->_anon_130[96];
    v95 = v69;
    v70 = *(int64x2_t *)&self->_anon_130[16];
    v88 = *(int64x2_t *)self->_anon_130;
    v89 = v70;
    v71 = *(int64x2_t *)&self->_anon_130[48];
    v90 = *(int64x2_t *)&self->_anon_130[32];
    v91 = v71;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)VLHeadingForTransform((uint64_t)&v88, *(double *)v90.i64, *(double *)v71.i64, v72, v73, v74, v75, v76));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v77;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("ori"));

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", &self->_resultCovariance, 144, 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "base64EncodedStringWithOptions:", 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("covariance"));
  }
  return v3;
}

- (id)analyticsInformationWithSessionStartMonotonicTime:(double)a3
{
  id v5;
  id v6;
  _VLStatistics *statistics;
  unint64_t resultStatus;
  uint64_t v9;
  uint64_t v10;
  id v11;
  $EA16241FF5FAACBBBC823CFA4C5CA9E3 *v12;
  $EA16241FF5FAACBBBC823CFA4C5CA9E3 *v13;
  unint64_t v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unsigned int v22;
  double v23;
  double v24;
  double v26;
  __double2 v27;
  double v28;
  id v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  unsigned int v46;
  double v47;
  double v48;
  double v49;
  __double2 v50;
  double v51;
  id v53;
  double v54;
  double v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  double v60;
  double v61;
  double v62;
  double v63;
  float64x2_t v64;
  double v65;
  _VLStatistics *v66;
  unint64_t v67;
  $EA16241FF5FAACBBBC823CFA4C5CA9E3 *v68;
  uint64_t v70;
  double v71;
  double v72;
  long double v73;
  double __x;
  float64x2_t __xa;
  long double __y;
  long double __ya;
  _OWORD v78[2];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;

  v5 = objc_alloc_init(MEMORY[0x24BE3D100]);
  objc_msgSend(v5, "setRelativeTimestampMs:", ((self->_monotonicTimestamp - a3) * 1000.0));
  objc_msgSend(v5, "setRunTimeMs:", (self->_duration * 1000.0));
  v6 = objc_alloc_init(MEMORY[0x24BE3D0E8]);
  objc_msgSend(v6, "setX:", *(double *)self->_gravity);
  objc_msgSend(v6, "setY:", *(double *)&self->_gravity[8]);
  objc_msgSend(v6, "setZ:", *(double *)&self->_gravity[16]);
  objc_msgSend(v5, "setGravityVector:", v6);
  objc_msgSend(v5, "setExposureTargetOffset:", self->_exposureTargetOffset);
  objc_msgSend(v5, "setLocation:", self->_analyticsLocation);
  statistics = self->_statistics;
  if (statistics)
  {
    resultStatus = self->_resultStatus;
    if (resultStatus > 0x10 || ((1 << resultStatus) & 0x10110) == 0)
    {
      v32 = (int)-[_VLStatistics stats](statistics, "stats")[136];
      statistics = self->_statistics;
      if (v32 >= 1)
      {
        v33 = (uint64_t)-[_VLStatistics stats](statistics, "stats")[104];
        v34 = v33 + 16 * (int)-[_VLStatistics stats](self->_statistics, "stats")[136];
        v35 = *(_DWORD *)(v34 - 12);
        v36 = *(_DWORD *)(v34 - 8);
        v37 = *(_DWORD *)(v34 - 4);
        v38 = objc_alloc_init(MEMORY[0x24BE3D128]);
        v39 = objc_alloc_init(MEMORY[0x24BE3D130]);
        objc_msgSend(v38, "setTileId:", v39);

        objc_msgSend(v38, "tileId");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setXCoordinate:", (double)v35);

        objc_msgSend(v38, "tileId");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setYCoordinate:", (double)v36);

        objc_msgSend(v38, "tileId");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setUncertainty:", (double)v37);

        objc_msgSend(v38, "setTileSizeBytes:", -[_VLStatistics stats](self->_statistics, "stats")[488]);
        objc_msgSend(v5, "setTileDetails:", v38);

        statistics = self->_statistics;
      }
    }
    if ((int)-[_VLStatistics stats](statistics, "stats")[136] < 1)
    {
      v10 = 0;
    }
    else
    {
      v9 = (uint64_t)-[_VLStatistics stats](self->_statistics, "stats")[24];
      v10 = *(__int16 *)(v9 + 2 * (int)-[_VLStatistics stats](self->_statistics, "stats")[136] - 2);
    }
    v11 = objc_alloc_init(MEMORY[0x24BE3D0F8]);
    objc_msgSend(v11, "setNumberOfInliers:", v10);
    v12 = -[_VLStatistics stats](self->_statistics, "stats");
    objc_msgSend(v11, "setNumberOfKeypoints:", v12->var13 & ~(v12->var13 >> 31));
    v13 = -[_VLStatistics stats](self->_statistics, "stats");
    objc_msgSend(v11, "setNumberOfMatches:", v13->var15 & ~(v13->var15 >> 31));
    if ((int)-[_VLStatistics stats](self->_statistics, "stats")[80] >= 1
      && (_DWORD)-[_VLStatistics stats](self->_statistics, "stats")[80])
    {
      v14 = 0;
      do
      {
        objc_msgSend(v11, "addSolverConfidence:", *(float *)((_QWORD)-[_VLStatistics stats](self->_statistics, "stats")[64] + 4 * v14));
        objc_msgSend(v11, "addFusedConfidence:", *(float *)((_QWORD)-[_VLStatistics stats](self->_statistics, "stats")[72] + 4 * v14++));
      }
      while (v14 < (int)-[_VLStatistics stats](self->_statistics, "stats")[80]);
    }
    objc_msgSend(v11, "setTKptsMs:", ((double)-[_VLStatistics stats](self->_statistics, "stats")[304] * 1000.0));
    objc_msgSend(v11, "setTMatchMs:", ((double)-[_VLStatistics stats](self->_statistics, "stats")[368] * 1000.0));
    objc_msgSend(v11, "setTPoseMs:", ((double)-[_VLStatistics stats](self->_statistics, "stats")[400] * 1000.0));
    objc_msgSend(v5, "setAlgorithmDetails:", v11);

  }
  if (self->_resultStatus != 1)
  {
    v29 = objc_alloc_init(MEMORY[0x24BE3D0D8]);
    v15 = v29;
    v30 = self->_resultStatus;
    if (v30 <= 1023)
    {
      if (v30 <= 63)
      {
        v31 = 1;
        switch(v30)
        {
          case 2:
            goto LABEL_74;
          case 4:
          case 8:
            v31 = 2;
            break;
          case 16:
            v31 = 3;
            break;
          case 32:
            v31 = 4;
            break;
          default:
            goto LABEL_62;
        }
        goto LABEL_74;
      }
      if (v30 > 255)
      {
        if (v30 == 256)
        {
          v31 = 7;
          goto LABEL_74;
        }
        if (v30 == 512)
        {
          v31 = 8;
          goto LABEL_74;
        }
      }
      else
      {
        if (v30 == 64)
        {
          v31 = 5;
          goto LABEL_74;
        }
        if (v30 == 128)
        {
          v31 = 6;
          goto LABEL_74;
        }
      }
    }
    else
    {
      if (v30 >= 0x2000)
      {
        switch(v30)
        {
          case 16384:
            v31 = 13;
            break;
          case 16385:
            v31 = 14;
            break;
          case 16386:
            v31 = 15;
            break;
          case 16387:
            v31 = 16;
            break;
          case 16388:
            v31 = 17;
            break;
          default:
            if (v30 != 0x2000)
              goto LABEL_62;
            v31 = 12;
            break;
        }
        goto LABEL_74;
      }
      switch(v30)
      {
        case 1024:
          v31 = 9;
          goto LABEL_74;
        case 2048:
          v31 = 10;
          goto LABEL_74;
        case 4096:
          v31 = 11;
LABEL_74:
          objc_msgSend(v29, "setFailureReason:", v31);
          objc_msgSend(v5, "setFailureDetails:", v15);
          goto LABEL_75;
      }
    }
LABEL_62:
    v31 = 0;
    goto LABEL_74;
  }
  v15 = objc_alloc_init(MEMORY[0x24BE3D120]);
  v17 = self->_location.pos_geoc[0];
  v16 = self->_location.pos_geoc[1];
  v18 = sqrt(v16 * v16 + v17 * v17);
  v19 = v18 * 0.99330562;
  v20 = 0.0;
  v21 = 0.0;
  if (v18 * 0.99330562 == 0.0)
    goto LABEL_41;
  v72 = self->_location.pos_geoc[1];
  __x = self->_location.pos_geoc[0];
  v22 = 0;
  __y = self->_location.pos_geoc[2];
  v23 = 0.0;
  v24 = 0.0;
  while (1)
  {
    v26 = v23;
    v23 = atan2(__y, v19);
    v27 = __sincos_stret(v23);
    v28 = 6378137.0 / sqrt(v27.__sinval * -0.00669437999 * v27.__sinval + 1.0);
    v21 = v18 / v27.__cosval - v28;
    if (vabdd_f64(v26, v23) < 0.000001)
      break;
    if (v22 > 8)
      goto LABEL_40;
LABEL_19:
    ++v22;
    v19 = v18 * (v28 / (v28 + v21) * -0.00669437999 + 1.0);
    v24 = v18 / v27.__cosval - v28;
    if (v19 == 0.0)
      goto LABEL_40;
  }
  if (vabdd_f64(v24, v21) >= 0.001 && v22 < 9)
    goto LABEL_19;
LABEL_40:
  v16 = v72;
  v17 = __x;
LABEL_41:
  v43 = atan2(v16, v17) / 0.0174532925;
  v73 = *(double *)&self->_anon_1b0[8];
  __xa = *(float64x2_t *)self->_anon_1b0;
  v44 = sqrt(vmlad_n_f64(vmuld_lane_f64(v73, __xa, 1), *(double *)self->_anon_1b0, *(double *)self->_anon_1b0));
  v45 = v44 * 0.99330562;
  if (v44 * 0.99330562 != 0.0)
  {
    v70 = 0x3F91DF46A2529D39;
    v71 = v43;
    v46 = 0;
    __ya = *(double *)&self->_anon_1b0[16];
    v47 = 0.0;
    v48 = 0.0;
    do
    {
      v49 = v47;
      v47 = atan2(__ya, v45);
      v50 = __sincos_stret(v47);
      v51 = 6378137.0 / sqrt(v50.__sinval * -0.00669437999 * v50.__sinval + 1.0);
      v20 = v44 / v50.__cosval - v51;
      if (vabdd_f64(v49, v47) >= 0.000001)
      {
        if (v46 > 8)
          break;
      }
      else if (vabdd_f64(v48, v20) < 0.001 || v46 >= 9)
      {
        break;
      }
      ++v46;
      v45 = v44 * (v51 / (v51 + v20) * -0.00669437999 + 1.0);
      v48 = v44 / v50.__cosval - v51;
    }
    while (v45 != 0.0);
  }
  atan2(v73, __xa.f64[0]);
  v53 = objc_alloc_init(MEMORY[0x24BE3D0D0]);
  GEOCalculateDistance();
  objc_msgSend(v53, "setLocationCorrectionMagnitude:", v54);
  v55 = v20 - v21;
  if (v20 - v21 < 0.0)
    v55 = -(v20 - v21);
  objc_msgSend(v53, "setAltitudeCorrectionMagnitude:", v55, v70, *(_QWORD *)&v71);
  v56 = *(_OWORD *)&self->_anon_130[80];
  v81 = *(_OWORD *)&self->_anon_130[64];
  v82 = v56;
  v57 = *(_OWORD *)&self->_anon_130[112];
  v83 = *(_OWORD *)&self->_anon_130[96];
  v84 = v57;
  v58 = *(_OWORD *)&self->_anon_130[16];
  v78[0] = *(_OWORD *)self->_anon_130;
  v78[1] = v58;
  v59 = *(_OWORD *)&self->_anon_130[48];
  v79 = *(_OWORD *)&self->_anon_130[32];
  v80 = v59;
  VLHeadingForTransform((uint64_t)v78, *(double *)&v79, *(double *)&v59, v60, v61, v62, v63, v64);
  GEOAngleDifferenceDegrees();
  objc_msgSend(v53, "setHeadingCorrectionMagnitude:", v65);
  objc_msgSend(v15, "setCorrection:", v53);
  objc_msgSend(v15, "setPoseConfidence:", self->_resultConfidence);
  v66 = self->_statistics;
  if (v66 && (int)-[_VLStatistics stats](v66, "stats")[88] >= 1)
  {
    v67 = 0;
    do
    {
      objc_msgSend(v15, "addInlierSuccessIndices:", *(unsigned int *)((_QWORD)-[_VLStatistics stats](self->_statistics, "stats")[16] + 4 * v67++));
      v68 = -[_VLStatistics stats](self->_statistics, "stats");
    }
    while (v67 < (v68->var12 & ~(v68->var12 >> 31)));
  }
  objc_msgSend(v5, "setSuccessDetails:", v15);

LABEL_75:
  return v5;
}

- (NSData)pngData
{
  return self->_imageData;
}

- (double)_timestamp
{
  return self->_timestamp;
}

- ($91CD28BF998EF1D34D1F6E7D57520290)_location
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[1];
  *(_OWORD *)&retstr->var0[2] = v3;
  *(double *)&retstr->var3 = self[2].var0[0];
  return self;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_heading
{
  double trueHeading;
  double accuracy;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  trueHeading = self->_heading.trueHeading;
  accuracy = self->_heading.accuracy;
  result.var1 = accuracy;
  result.var0 = trueHeading;
  return result;
}

- (__n128)_gravity
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 112);
  v3 = *(_OWORD *)(a1 + 128);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (__n128)_transform
{
  return a1[9];
}

- (__n128)_cameraIntrinsics
{
  return a1[13];
}

- (double)_radialDistortion
{
  return *(double *)(a1 + 256);
}

- (double)_exposureTargetOffset
{
  return self->_exposureTargetOffset;
}

- (unint64_t)_resultStatus
{
  return self->_resultStatus;
}

- (VLLocalizationCrowdsourcingDetails)crowdsourcingDetails
{
  return self->_crowdsourcingDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crowdsourcingDetails, 0);
  objc_storeStrong((id *)&self->_analyticsLocation, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
