@implementation VFXMovieExportOperation

- (VFXMovieExportOperation)initWithRenderer:(id)a3 size:(CGSize)a4 attributes:(id)a5 outputURL:(id)a6
{
  double height;
  double width;
  VFXMovieExportOperation *v11;
  const char *v12;
  uint64_t v13;
  VFXMovieExportOperation *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  float v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  id v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t *v96;
  id v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  id v104;
  const char *v105;
  AVAssetWriter *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  AVAssetWriter *assetWriter;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  _QWORD v158[3];
  uint64_t v159;
  objc_super v160;

  height = a4.height;
  width = a4.width;
  v160.receiver = self;
  v160.super_class = (Class)VFXMovieExportOperation;
  v11 = -[VFXMovieExportOperation init](&v160, sel_init);
  v14 = v11;
  if (v11)
  {
    objc_msgSend_setAntialiasingMode_(v11, v12, 2, v13);
    v20 = (id)objc_msgSend_mutableCopy(a5, v15, v16, v17);
    if (!v20)
      v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend_removeObjectForKey_(v20, v18, (uint64_t)CFSTR("kExportPointOfViewAttribute"), v19);
    v23 = (void *)objc_msgSend_valueForKey_(v20, v21, (uint64_t)CFSTR("rate"), v22);
    objc_msgSend_floatValue(v23, v24, v25, v26);
    v14->_rate = v27;
    objc_msgSend_removeObjectForKey_(v20, v28, (uint64_t)CFSTR("rate"), v29);
    if (v14->_rate == 0.0)
      v14->_rate = 0.033333;
    v32 = (void *)objc_msgSend_valueForKey_(v20, v30, (uint64_t)CFSTR("VFXExportMovieFrameRate"), v31);
    v36 = objc_msgSend_intValue(v32, v33, v34, v35);
    objc_msgSend_removeObjectForKey_(v20, v37, (uint64_t)CFSTR("VFXExportMovieFrameRate"), v38);
    if (v36)
      v14->_rate = 1.0 / (float)v36;
    v41 = (void *)objc_msgSend_valueForKey_(v20, v39, (uint64_t)CFSTR("VFXExportMovieMirrored"), v40);
    v14->_mirrored = objc_msgSend_BOOLValue(v41, v42, v43, v44);
    objc_msgSend_removeObjectForKey_(v20, v45, (uint64_t)CFSTR("VFXExportMovieMirrored"), v46);
    v49 = (void *)objc_msgSend_valueForKey_(v20, v47, (uint64_t)CFSTR("VFXExportMovieSupersamplingFactor"), v48);
    objc_msgSend_floatValue(v49, v50, v51, v52);
    v14->_supersampling = v53;
    objc_msgSend_removeObjectForKey_(v20, v54, (uint64_t)CFSTR("VFXExportMovieSupersamplingFactor"), v55);
    if (v14->_supersampling == 0.0)
      v14->_supersampling = 1.0;
    objc_msgSend_removeObjectForKey_(v20, v56, (uint64_t)CFSTR("QTAddImageCodecType"), v57);
    objc_msgSend_removeObjectForKey_(v20, v58, (uint64_t)CFSTR("QTMovieRateAttribute"), v59);
    v60 = *MEMORY[0x1E0C8AE68];
    if (!objc_msgSend_objectForKey_(v20, v61, *MEMORY[0x1E0C8AE68], v62))
      objc_msgSend_setValue_forKey_(v20, v63, *MEMORY[0x1E0C8AE58], v60);
    v65 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v63, (int)width, v64);
    objc_msgSend_setValue_forKey_(v20, v66, v65, *MEMORY[0x1E0C8AF60]);
    v69 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v67, (int)height, v68);
    objc_msgSend_setValue_forKey_(v20, v70, v69, *MEMORY[0x1E0C8AEF0]);
    v71 = objc_alloc(MEMORY[0x1E0C8B020]);
    v14->_assetWriterInput = (AVAssetWriterInput *)objc_msgSend_initWithMediaType_outputSettings_(v71, v72, *MEMORY[0x1E0C8A808], (uint64_t)v20);
    v76 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v73, v74, v75);
    objc_msgSend_setExpectsMediaDataInRealTime_(v14->_assetWriterInput, v77, 0, v78);
    v81 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v79, 1111970369, v80);
    objc_msgSend_setObject_forKey_(v76, v82, v81, *MEMORY[0x1E0CA9040]);
    v85 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v83, (int)width, v84);
    objc_msgSend_setObject_forKey_(v76, v86, v85, *MEMORY[0x1E0CA90E0]);
    v89 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v87, (int)height, v88);
    objc_msgSend_setObject_forKey_(v76, v90, v89, *MEMORY[0x1E0CA8FD8]);
    v94 = objc_msgSend_device(a3, v91, v92, v93);
    v96 = (uint64_t *)MEMORY[0x1E0CA8F78];
    if (v94)
      v96 = (uint64_t *)MEMORY[0x1E0CA9010];
    objc_msgSend_setObject_forKey_(v76, v95, MEMORY[0x1E0C9AAB0], *v96);
    v97 = objc_alloc(MEMORY[0x1E0C8B038]);
    v14->_avAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)objc_msgSend_initWithAssetWriterInput_sourcePixelBufferAttributes_(v97, v98, (uint64_t)v14->_assetWriterInput, (uint64_t)v76);
    v159 = 0;
    v102 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v99, v100, v101);
    objc_msgSend_removeItemAtURL_error_(v102, v103, (uint64_t)a6, 0);
    v104 = objc_alloc(MEMORY[0x1E0C8B018]);
    v106 = (AVAssetWriter *)objc_msgSend_initWithURL_fileType_error_(v104, v105, (uint64_t)a6, *MEMORY[0x1E0C8A2E8], &v159);
    v14->_assetWriter = v106;
    if (objc_msgSend_status(v106, v107, v108, v109) == 3)
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: AVAssetWriter can't create a movie at %@ (error:%@)"), v111, v112, v113, v114, v115, v116, (uint64_t)a6);

      return 0;
    }
    else
    {
      objc_msgSend_addInput_(v14->_assetWriter, v110, (uint64_t)v14->_assetWriterInput, v112);
      objc_msgSend_startWriting(v14->_assetWriter, v117, v118, v119);
      assetWriter = v14->_assetWriter;
      v158[0] = 0;
      v158[1] = 0x100000001;
      v158[2] = 0;
      objc_msgSend_startSessionAtSourceTime_(assetWriter, v121, (uint64_t)v158, v122);
      objc_msgSend_setRenderer_(v14, v123, (uint64_t)a3, v124);
      objc_msgSend_setSize_(v14, v125, v126, v127, width, height);
      objc_msgSend_setAttributes_(v14, v128, (uint64_t)v20, v129);
      v133 = (void *)objc_msgSend_world(a3, v130, v131, v132);
      objc_msgSend_startTime(v133, v134, v135, v136);
      objc_msgSend_setStartTime_(v14, v137, v138, v139);
      v143 = (void *)objc_msgSend_world(a3, v140, v141, v142);
      objc_msgSend_endTime(v143, v144, v145, v146);
      objc_msgSend_setEndTime_(v14, v147, v148, v149);
      objc_msgSend_setOutputURL_(v14, v150, (uint64_t)a6, v151);
      v154 = objc_msgSend_objectForKey_(a5, v152, (uint64_t)CFSTR("kExportPointOfViewAttribute"), v153);
      objc_msgSend_setPointOfView_(v14, v155, v154, v156);

    }
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMovieExportOperation;
  -[_VFXExportOperation dealloc](&v3, sel_dealloc);
}

- (CGImage)_copySnapshot:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  double height;
  double width;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double systemTime;
  CFTimeInterval v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CGImage *v21;

  height = a3.height;
  width = a3.width;
  v11 = (void *)objc_msgSend_renderer(self, a2, v3, v4);
  systemTime = self->super._systemTime;
  if (systemTime == 0.0)
    v13 = CACurrentMediaTime();
  else
    v13 = systemTime + self->_rate;
  self->super._systemTime = v13;
  objc_msgSend_updateAtTime_(v11, v8, v9, v10);
  v17 = (void *)objc_msgSend_snapshotWithSize_(v11, v14, v15, v16, width, height);
  v21 = (CGImage *)objc_msgSend_CGImage(v17, v18, v19, v20);
  return CGImageRetain(v21);
}

- (void)_finishedExport
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  if (!objc_msgSend_error(self, a2, v2, v3))
    objc_msgSend_setSucceded_(self, v5, 1, v7);
  v8 = (void *)objc_msgSend_delegate(self, v5, v6, v7);
  objc_msgSend_didEndSelector(self, v9, v10, v11);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = (const char *)objc_msgSend_didEndSelector(self, v12, v13, v14);
    objc_msgSend(v8, v15, self, objc_msgSend_userInfo(self, v16, v17, v18));
  }
}

- (void)appendImage:(CGImage *)a3 withPresentationTime:(id *)a4 usingAdaptor:(id)a5
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CVPixelBufferPool *v17;
  unint64_t Width;
  unint64_t Height;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CGColorSpace *ColorSpace;
  void *BaseAddress;
  size_t BytesPerRow;
  CGContext *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  __int128 v36;
  int64_t var3;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v39;
  CGRect v40;
  CGRect v41;

  pixelBufferOut = 0;
  v10 = objc_msgSend_pixelBufferPool(a5, a2, (uint64_t)a3, (uint64_t)a4);
  if (v10)
  {
    v17 = (__CVPixelBufferPool *)v10;
    Width = CGImageGetWidth(a3);
    Height = CGImageGetHeight(a3);
    if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v17, &pixelBufferOut))
    {
      v34 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21, v22);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, (uint64_t)self, CFSTR("VFXExport.m"), 372, CFSTR("VFX: Couldn't create pixel buffer"));
    }
    ColorSpace = CGImageGetColorSpace(a3);
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
    BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
    v26 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, ColorSpace, 0x2006u);
    v40.origin.x = 0.0;
    v40.origin.y = 0.0;
    v40.size.width = (double)Width;
    v40.size.height = (double)Height;
    CGContextClearRect(v26, v40);
    v41.origin.x = 0.0;
    v41.origin.y = 0.0;
    v41.size.width = (double)Width;
    v41.size.height = (double)Height;
    CGContextDrawImage(v26, v41, a3);
    CGContextFlush(v26);
    CFRelease(v26);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    v36 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    if ((objc_msgSend_appendPixelBuffer_withPresentationTime_(a5, v27, (uint64_t)pixelBufferOut, (uint64_t)&v36) & 1) == 0)
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: append pixel buffer failed"), v28, v29, v30, v31, v32, v33, v36);
    CFRelease(pixelBufferOut);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: appendImage: failed to get a pixelBuffer from CVPixelBufferPoolRef"), v11, v12, v13, v14, v15, v16, v39);
  }
}

- (void)renderAndAppendWithPresentationTime:(id *)a3 usingAdaptor:(id)a4 metalTextureCache:(__CVMetalTextureCache *)a5 cvQueue:(id)a6 completionBlock:(id)a7
{
  __CVPixelBufferPool *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFAllocator *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t WidthOfPlane;
  unint64_t HeightOfPlane;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  id Texture;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  double systemTime;
  CFTimeInterval v177;
  double v178;
  double v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  id v212;
  _QWORD v213[11];
  __int128 v214;
  int64_t var3;
  double v216;
  double v217;
  double v218;
  double v219;
  CVMetalTextureRef textureOut;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v222;

  pixelBufferOut = 0;
  v14 = (__CVPixelBufferPool *)objc_msgSend_pixelBufferPool(a4, a2, (uint64_t)a3, (uint64_t)a4);
  if (v14)
  {
    v212 = a7;
    v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, &pixelBufferOut))
    {
      v210 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v22, v23, v24);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v210, v211, (uint64_t)a2, (uint64_t)self, CFSTR("VFXExport.m"), 412, CFSTR("VFX: Couldn't create pixel buffer"));
    }
    textureOut = 0;
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBufferOut, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBufferOut, 0);
    CVMetalTextureCacheCreateTextureFromImage(v21, a5, pixelBufferOut, 0, MTLPixelFormatBGRA8Unorm_sRGB, WidthOfPlane, HeightOfPlane, 0, &textureOut);
    v30 = (void *)objc_msgSend_renderPassDescriptor(MEMORY[0x1E0CC6B50], v27, v28, v29);
    v34 = (void *)objc_msgSend_colorAttachments(v30, v31, v32, v33);
    v37 = (void *)objc_msgSend_objectAtIndexedSubscript_(v34, v35, 0, v36);
    objc_msgSend_setLoadAction_(v37, v38, 2, v39);
    v43 = (void *)objc_msgSend_renderer(self, v40, v41, v42);
    v47 = (void *)objc_msgSend_world(v43, v44, v45, v46);
    v51 = (void *)objc_msgSend_background(v47, v48, v49, v50);
    v55 = (void *)objc_msgSend_contents(v51, v52, v53, v54);
    objc_opt_class();
    v59 = 1.0;
    v60 = 1.0;
    v61 = 1.0;
    v62 = 1.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v218 = 0.0;
      v219 = 0.0;
      v216 = 0.0;
      v217 = 0.0;
      objc_msgSend_getRed_green_blue_alpha_(v55, v56, (uint64_t)&v219, (uint64_t)&v218, &v217, &v216);
      v60 = v218;
      v59 = v219;
      v62 = v216;
      v61 = v217;
    }
    v63 = (void *)objc_msgSend_colorAttachments(v30, v56, v57, v58);
    v66 = (void *)objc_msgSend_objectAtIndexedSubscript_(v63, v64, 0, v65);
    objc_msgSend_setClearColor_(v66, v67, v68, v69, v59, v60, v61, v62);
    v71 = (void *)objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E0CC6BB0], v70, 81, WidthOfPlane, HeightOfPlane, 0);
    v75 = (void *)objc_msgSend_renderer(self, v72, v73, v74);
    v79 = (void *)objc_msgSend_device(v75, v76, v77, v78);
    if (j__objc_msgSend_supportsMemorylessRenderTargets(v79, v80, v81, v82))
      objc_msgSend_setStorageMode_(v71, v83, 3, v84);
    else
      objc_msgSend_setStorageMode_(v71, v83, 2, v84);
    objc_msgSend_setUsage_(v71, v85, 5, v86);
    if (objc_msgSend_antialiasingMode(self, v87, v88, v89))
    {
      v93 = objc_msgSend_antialiasingMode(self, v90, v91, v92);
      objc_msgSend_setSampleCount_(v71, v94, 1 << v93, v95);
      objc_msgSend_setTextureType_(v71, v96, 4, v97);
      v101 = (void *)objc_msgSend_renderer(self, v98, v99, v100);
      v105 = (void *)objc_msgSend_device(v101, v102, v103, v104);
      v108 = (void *)objc_msgSend_newTextureWithDescriptor_(v105, v106, (uint64_t)v71, v107);
      v112 = (void *)objc_msgSend_colorAttachments(v30, v109, v110, v111);
      v115 = (void *)objc_msgSend_objectAtIndexedSubscript_(v112, v113, 0, v114);
      objc_msgSend_setTexture_(v115, v116, (uint64_t)v108, v117);
      Texture = CVMetalTextureGetTexture(textureOut);
      v122 = (void *)objc_msgSend_colorAttachments(v30, v119, v120, v121);
      v125 = (void *)objc_msgSend_objectAtIndexedSubscript_(v122, v123, 0, v124);
      objc_msgSend_setResolveTexture_(v125, v126, (uint64_t)Texture, v127);
      v131 = (void *)objc_msgSend_colorAttachments(v30, v128, v129, v130);
      v134 = (void *)objc_msgSend_objectAtIndexedSubscript_(v131, v132, 0, v133);
      objc_msgSend_setStoreAction_(v134, v135, 2, v136);

    }
    else
    {
      v140 = CVMetalTextureGetTexture(textureOut);
      v144 = (void *)objc_msgSend_colorAttachments(v30, v141, v142, v143);
      v147 = (void *)objc_msgSend_objectAtIndexedSubscript_(v144, v145, 0, v146);
      objc_msgSend_setTexture_(v147, v148, (uint64_t)v140, v149);
    }
    v150 = (void *)objc_msgSend_renderer(self, v137, v138, v139);
    v154 = (void *)objc_msgSend_commandQueue(v150, v151, v152, v153);
    v158 = (void *)objc_msgSend_commandBuffer(v154, v155, v156, v157);
    objc_msgSend_lock(VFXTransaction, v159, v160, v161);
    v165 = (void *)objc_msgSend_renderer(self, v162, v163, v164);
    v169 = (void *)objc_msgSend_world(v165, v166, v167, v168);
    objc_msgSend_lock(v169, v170, v171, v172);
    systemTime = self->super._systemTime;
    if (systemTime == 0.0)
      v177 = CACurrentMediaTime();
    else
      v177 = systemTime + self->_rate;
    self->super._systemTime = v177;
    objc_msgSend_startTime(v169, v173, v174, v175);
    v179 = v178 + (float)((float)a3->var0 / (float)a3->var1);
    v183 = (void *)objc_msgSend_clock(v169, v180, v181, v182);
    objc_msgSend_setTime_(v183, v184, v185, v186, v179);
    v190 = (void *)objc_msgSend_renderer(self, v187, v188, v189);
    objc_msgSend_updateAtTime_(v190, v191, v192, v193, self->super._systemTime);
    v197 = (void *)objc_msgSend_renderer(self, v194, v195, v196);
    objc_msgSend_renderWithViewport_commandBuffer_passDescriptor_(v197, v198, (uint64_t)v158, (uint64_t)v30, 0.0, 0.0, (double)WidthOfPlane, (double)HeightOfPlane);
    objc_msgSend_unlock(v169, v199, v200, v201);
    objc_msgSend_unlock(VFXTransaction, v202, v203, v204);
    v213[0] = MEMORY[0x1E0C809B0];
    v213[1] = 3221225472;
    v213[2] = sub_1B1991BD0;
    v213[3] = &unk_1E63DA210;
    v213[4] = a6;
    v213[5] = self;
    v214 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v213[8] = pixelBufferOut;
    v213[9] = textureOut;
    v213[10] = a5;
    v213[6] = a4;
    v213[7] = v212;
    objc_msgSend_addCompletedHandler_(v158, v205, (uint64_t)v213, v206);
    objc_msgSend_commit(v158, v207, v208, v209);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: appendImage: failed to get a pixelBuffer from CVPixelBufferPoolRef"), v15, v16, v17, v18, v19, v20, v222);
  }
}

- (void)main
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  float v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  float rate;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const void *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  float v49;
  AVAssetWriterInput *assetWriterInput;
  uint64_t v51;
  AVAssetWriter *assetWriter;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[5];
  _QWORD v83[12];
  float v84;
  float v85;
  float v86;
  BOOL v87;
  CVMetalTextureCacheRef cacheOut;
  _QWORD v89[3];
  int v90;
  _QWORD v91[4];
  _QWORD v92[3];
  float v93;

  v3 = (void *)MEMORY[0x1B5E23520](self, a2);
  if (!objc_msgSend_renderer(self, v4, v5, v6))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v8, v9, v10, v11, v12, v13, (uint64_t)"renderer");
  objc_msgSend_startTime(self, v7, v8, v9);
  v15 = v14;
  objc_msgSend_endTime(self, v16, v17, v18);
  v20 = v19;
  rate = self->_rate;
  v22 = dispatch_queue_create("serial assetwriter input queue", 0);
  v23 = dispatch_semaphore_create(0);
  v24 = dispatch_semaphore_create(0);
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x2020000000;
  v93 = v15;
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x2020000000;
  v91[3] = 0;
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x2020000000;
  v90 = 0;
  v28 = (void *)objc_msgSend_renderer(self, v25, v26, v27);
  v32 = objc_msgSend_device(v28, v29, v30, v31);
  v36 = v32 != 0;
  cacheOut = 0;
  if (v32)
  {
    v37 = (void *)objc_msgSend_renderer(self, v33, v34, v35);
    v41 = (void *)objc_msgSend_device(v37, v38, v39, v40);
    CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v41, 0, &cacheOut);
    v45 = (const void *)objc_msgSend__copySnapshot_(self, v42, v43, v44, 1.0, 1.0);
    CFRelease(v45);
  }
  v46 = objc_msgSend_currentProgress(MEMORY[0x1E0CB38A8], v33, v34, v35);
  v49 = v20;
  if (v46)
    v46 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v47, (int)vcvtps_s32_f32((float)(v49 - v15) / rate), v48);
  assetWriterInput = self->_assetWriterInput;
  v51 = MEMORY[0x1E0C809B0];
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = sub_1B1992028;
  v83[3] = &unk_1E63DA238;
  v83[4] = v46;
  v83[5] = self;
  v84 = rate;
  v85 = v49;
  v87 = v36;
  v83[8] = v92;
  v83[9] = v89;
  v83[10] = v91;
  v83[11] = cacheOut;
  v86 = v15;
  v83[6] = v22;
  v83[7] = v23;
  objc_msgSend_requestMediaDataWhenReadyOnQueue_usingBlock_(assetWriterInput, v47, (uint64_t)v22, (uint64_t)v83);
  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  assetWriter = self->_assetWriter;
  v82[0] = v51;
  v82[1] = 3221225472;
  v82[2] = sub_1B1992310;
  v82[3] = &unk_1E63D6D80;
  v82[4] = v24;
  objc_msgSend_finishWritingWithCompletionHandler_(assetWriter, v53, (uint64_t)v82, v54);
  dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v23);
  dispatch_release(v24);
  dispatch_release(v22);
  if (cacheOut)
    CFRelease(cacheOut);
  if (objc_msgSend_error(self->_assetWriter, v55, v56, v57))
  {
    v62 = objc_msgSend_error(self->_assetWriter, v58, v59, v60);
    objc_msgSend_setError_(self, v63, v62, v64);
    v68 = (void *)objc_msgSend_error(self->_assetWriter, v65, v66, v67);
    v72 = objc_msgSend_localizedDescription(v68, v69, v70, v71);
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: error while exporting movie: %@"), v73, v74, v75, v76, v77, v78, v72);
  }
  LODWORD(v61) = 1.0;
  objc_msgSend_setProgress_(self, v58, v59, v60, v61);
  _Block_object_dispose(v89, 8);
  _Block_object_dispose(v91, 8);
  _Block_object_dispose(v92, 8);
  objc_autoreleasePoolPop(v3);
  objc_msgSend__finishedExport(self, v79, v80, v81);
}

@end
