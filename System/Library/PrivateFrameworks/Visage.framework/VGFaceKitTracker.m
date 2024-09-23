@implementation VGFaceKitTracker

- (VGFaceKitTracker)initWithOptions:(const VGFaceKitTrackerOptions *)a3
{
  VGFaceKitTracker *v4;
  VGFaceKitTracker *v5;
  void *v6;
  int v7;
  NSObject *v8;
  VGFaceKitTracker *v9;
  objc_super v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)VGFaceKitTracker;
  v4 = -[VGFaceKitTracker init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_options = *a3;
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_251B34AD8, *MEMORY[0x24BE05A18]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE05A68]);
    if (v5->_options.useInternalFaceDetector)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE05A60]);
    if (v5->_options.forceCPU)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE059F8]);
    v7 = CVAFaceTrackingCreate();
    if (v7)
    {
      __VGLogSharedInstance();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v13 = v7;
        _os_log_impl(&dword_249CAD000, v8, OS_LOG_TYPE_ERROR, " Error initializing FaceKit: %d ", buf, 8u);
      }

    }
    else if (-[VGFaceKitTracker loadFaceKitSemantics](v5, "loadFaceKitSemantics")
           && -[VGFaceKitTracker loadQuadFaceKitSemantics](v5, "loadQuadFaceKitSemantics"))
    {
      v9 = v5;
LABEL_15:

      goto LABEL_16;
    }
    v9 = 0;
    goto LABEL_15;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (VGFaceKitTracker)init
{
  __int16 v3;

  v3 = 0;
  return -[VGFaceKitTracker initWithOptions:](self, "initWithOptions:", &v3);
}

- (void)dealloc
{
  CVAFaceTracking *faceKit;
  __CFDictionary *semantics;
  __CFDictionary *quadSemantics;
  objc_super v6;

  faceKit = self->_faceKit;
  if (faceKit)
  {
    CFRelease(faceKit);
    self->_faceKit = 0;
  }
  semantics = self->_semantics;
  if (semantics)
  {
    CFRelease(semantics);
    self->_semantics = 0;
  }
  quadSemantics = self->_quadSemantics;
  if (quadSemantics)
  {
    CFRelease(quadSemantics);
    self->_quadSemantics = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VGFaceKitTracker;
  -[VGFaceKitTracker dealloc](&v6, sel_dealloc);
}

- (BOOL)loadFaceKitSemantics
{
  int v3;
  NSObject *v4;
  uint8_t buf[16];
  _BYTE v7[16];

  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v7);
  cva::ItemHandler::createValue<BOOL>();
  cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v7, (const __CFString *)*MEMORY[0x24BE05970], (const cva::ItemHandler *)buf);
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)buf);
  cva::ItemHandler::createValue<BOOL>();
  cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v7, (const __CFString *)*MEMORY[0x24BE05A58], (const cva::ItemHandler *)buf);
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)buf);
  self->_semantics = 0;
  cva::DictionaryHandler::getDictionary((cva::DictionaryHandler *)v7);
  v3 = CVAFaceTrackingCopySemantics();
  if (v3)
  {
    __VGLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_249CAD000, v4, OS_LOG_TYPE_ERROR, " couldn't get FaceKit semantics data ", buf, 2u);
    }

  }
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v7);
  return v3 == 0;
}

- (BOOL)loadQuadFaceKitSemantics
{
  int v3;
  NSObject *v4;
  uint8_t buf[16];
  _BYTE v7[16];

  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v7);
  cva::ItemHandler::createValue<BOOL>();
  cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v7, (const __CFString *)*MEMORY[0x24BE05970], (const cva::ItemHandler *)buf);
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)buf);
  self->_quadSemantics = 0;
  cva::DictionaryHandler::getDictionary((cva::DictionaryHandler *)v7);
  v3 = CVAFaceTrackingCopySemantics();
  if (v3)
  {
    __VGLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_249CAD000, v4, OS_LOG_TYPE_ERROR, " couldn't get FaceKit quad semantics data ", buf, 2u);
    }

  }
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v7);
  return v3 == 0;
}

- (__CFDictionary)semantics
{
  return self->_semantics;
}

- (__CFDictionary)quadSemantics
{
  return self->_quadSemantics;
}

- (id)buildInputDictionaryWithCaptureData:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  CMTime time;
  _QWORD v47[2];
  _QWORD v48[2];
  void *v49;
  _QWORD v50[10];
  _QWORD v51[10];
  _QWORD v52[2];
  _QWORD v53[2];
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[4];
  CGRect v59;

  v58[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v44 = a4;
  v57[0] = *MEMORY[0x24BE05A20];
  objc_msgSend(MEMORY[0x24BDBCE30], "vg_arrayWithRowMajorNumbersFromFloat3x3:", *MEMORY[0x24BDAEDF8], *(double *)(MEMORY[0x24BDAEDF8] + 16), *(double *)(MEMORY[0x24BDAEDF8] + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = *MEMORY[0x24BE05A50];
  v58[0] = v7;
  v58[1] = &unk_251B34970;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = *MEMORY[0x24BE05A10];
  v8 = v54;
  v9 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(v6, "videoIntrinsics");
  objc_msgSend(v9, "vg_arrayWithRowMajorNumbersFromFloat3x3:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = *MEMORY[0x24BE059E0];
  v11 = v55;
  v56[0] = v10;
  v56[1] = v45;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, &v54, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v52[0] = v8;
  v12 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(v6, "depthIntrinsics");
  objc_msgSend(v12, "vg_arrayWithRowMajorNumbersFromFloat3x3:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v11;
  v53[0] = v13;
  v53[1] = v45;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_options.useInternalFaceDetector)
  {
    v14 = 0;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
  }
  else
  {
    objc_msgSend(v6, "face");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v18 = v20;
    v17 = v21;
    v15 = v22;
    v16 = v23;

    objc_msgSend(v6, "face");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v24, "faceID");

  }
  v59.origin.x = v18;
  v59.origin.y = v17;
  v59.size.width = v15;
  v59.size.height = v16;
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v59);
  v50[0] = *MEMORY[0x24BE05A38];
  if (v6)
    objc_msgSend(v6, "timestamp");
  else
    memset(&time, 0, sizeof(time));
  v26 = CMTimeCopyAsDictionary(&time, 0);
  v27 = *MEMORY[0x24BE05998];
  v51[0] = v26;
  v51[1] = v43;
  v28 = *MEMORY[0x24BE059A8];
  v50[1] = v27;
  v50[2] = v28;
  v29 = objc_msgSend(v6, "yuvRectified");
  v30 = *MEMORY[0x24BE059A0];
  v51[2] = v29;
  v51[3] = v42;
  v31 = *MEMORY[0x24BE059B0];
  v50[3] = v30;
  v50[4] = v31;
  v32 = objc_msgSend(v6, "depth");
  v33 = *MEMORY[0x24BE059B8];
  v51[4] = v32;
  v51[5] = &unk_251B347E8;
  v34 = *MEMORY[0x24BE059F0];
  v35 = MEMORY[0x24BDBD1C8];
  v50[5] = v33;
  v50[6] = v34;
  v51[6] = MEMORY[0x24BDBD1C8];
  v50[7] = *MEMORY[0x24BE05990];
  v36 = (void *)MEMORY[0x24BD03294](v44);
  v51[7] = v36;
  v50[8] = *MEMORY[0x24BE059D8];
  v47[0] = *MEMORY[0x24BE059C0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = *MEMORY[0x24BE059C8];
  v48[0] = v37;
  v48[1] = DictionaryRepresentation;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = *MEMORY[0x24BE05970];
  v51[8] = v39;
  v51[9] = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 10);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (BOOL)processWithCaptureData:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __52__VGFaceKitTracker_processWithCaptureData_callback___block_invoke;
  v14[3] = &unk_251B22F38;
  v8 = v7;
  v15 = v8;
  v9 = (void *)MEMORY[0x24BD03294](v14);
  -[VGFaceKitTracker buildInputDictionaryWithCaptureData:callback:](self, "buildInputDictionaryWithCaptureData:callback:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CVAFaceTrackingProcess();
  if (v11)
  {
    __VGLogSharedInstance();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v11;
      _os_log_impl(&dword_249CAD000, v12, OS_LOG_TYPE_ERROR, " Error running face kit: %d ", buf, 8u);
    }

  }
  return v11 == 0;
}

uint64_t __52__VGFaceKitTracker_processWithCaptureData_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id).cxx_construct
{
  *((_WORD *)self + 16) = 0;
  return self;
}

@end
