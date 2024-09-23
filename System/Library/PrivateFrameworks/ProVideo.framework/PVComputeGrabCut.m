@implementation PVComputeGrabCut

- (PVComputeGrabCut)init
{
  PVComputeGrabCut *v2;
  HFGrabCutInterface *v3;
  const __CFUUID *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PVComputeGrabCut;
  v2 = -[PVComputeGrabCut init](&v6, sel_init);
  if (v2)
  {
    v3 = (HFGrabCutInterface *)operator new();
    v4 = CFUUIDGetConstantUUIDWithBytes(0, 0x98u, 0xC8u, 0x63u, 0xDAu, 0x94u, 0x17u, 0x43u, 0xDAu, 0x85u, 1u, 0xC5u, 0xA2u, 0xCCu, 0xAEu, 0x87u, 0x8Cu);
    HFGrabCutInterface::HFGrabCutInterface(v3, v4);
    v2->_module = v3;
  }
  return v2;
}

- (void)dealloc
{
  HFGrabCutInterface *module;
  objc_super v4;

  module = self->_module;
  if (module)
    (*((void (**)(HFGrabCutInterface *, SEL))module->var0 + 1))(module, a2);
  v4.receiver = self;
  v4.super_class = (Class)PVComputeGrabCut;
  -[PVComputeGrabCut dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  HFGrabCutInterface::Reset(self->_module);
}

- (BOOL)processImage:(id)a3 trimap:(id)a4 roi:(CGRect)a5 clusters:(int)a6 gamma:(float)a7 iterations:(int)a8 mask:(id)a9
{
  id v15;
  id v16;
  id v17;
  __CVBuffer *v18;
  OSType PixelFormatType;
  int v20;
  __CVBuffer *v21;
  int v22;
  __CVBuffer *v23;
  int v24;
  double v25;
  double v26;
  __n128 v27;
  HGBitmap *v29;
  HGCVBitmap *v30;
  HGCVBitmap *v31;

  v15 = a3;
  v16 = a4;
  v17 = a9;
  v18 = (__CVBuffer *)objc_msgSend(v15, "cvPixelBuffer");
  PixelFormatType = CVPixelBufferGetPixelFormatType(v18);
  if (PixelFormatType == 1111970369)
  {
    v20 = 23;
  }
  else if (PixelFormatType == 1380401729)
  {
    v20 = 24;
  }
  else
  {
    NSLog(CFSTR("Error: Image pixel format must be RGBA or BGRA"));
    v20 = 0;
  }
  HGCVBitmap::create((HGCVPixelBuffer *)v18, v20, 0, &v31);
  v21 = (__CVBuffer *)objc_msgSend(v16, "cvPixelBuffer");
  if (CVPixelBufferGetPixelFormatType(v21) == 1278226488)
  {
    v22 = 1;
  }
  else
  {
    NSLog(CFSTR("Error: Tripmap pixel format must be 8-bit single channel"));
    v22 = 0;
  }
  HGCVBitmap::create((HGCVPixelBuffer *)v21, v22, 0, &v30);
  v23 = (__CVBuffer *)objc_msgSend(v17, "cvPixelBuffer");
  if (CVPixelBufferGetPixelFormatType(v23) == 1278226488)
  {
    v24 = 1;
  }
  else
  {
    NSLog(CFSTR("Error: Mask pixel format must be 8-bit single channel"));
    v24 = 0;
  }
  HGCVBitmap::create((HGCVPixelBuffer *)v23, v24, 0, &v29);
  HGCVBitmap::lock(v31, 1uLL);
  HGCVBitmap::lock(v30, 0);
  HGCVBitmap::lock((HGCVBitmap *)v29, 0);
  HFGrabCutInterface::InitDataModels(self->_module, (HGBitmap *)v31, (HGBitmap *)v30, a6);
  *(float *)&v25 = a7;
  HFGrabCutInterface::GenerateMask(self->_module, (HGBitmap *)v31, (HGBitmap *)v30, v29, v25, a8, v26, v27);
  HGCVBitmap::unlock(v31, 1uLL);
  HGCVBitmap::unlock(v30, 0);
  HGCVBitmap::unlock((HGCVBitmap *)v29, 0);
  if (v29)
    (*(void (**)(HGBitmap *))(*(_QWORD *)v29 + 24))(v29);
  if (v30)
    (*(void (**)(HGCVBitmap *))(*(_QWORD *)v30 + 24))(v30);
  if (v31)
    (*(void (**)(HGCVBitmap *))(*(_QWORD *)v31 + 24))(v31);

  return 1;
}

@end
