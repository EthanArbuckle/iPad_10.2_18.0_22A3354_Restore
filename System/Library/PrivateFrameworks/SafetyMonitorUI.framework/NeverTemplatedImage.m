@implementation NeverTemplatedImage

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithContentsOfFile:(id)a3
{
  void *v4;
  _TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *v5;
  objc_super v7;

  sub_2456FA840();
  v4 = (void *)sub_2456FA834();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NeverTemplatedImage();
  v5 = -[NeverTemplatedImage initWithContentsOfFile:](&v7, sel_initWithContentsOfFile_, v4);

  if (v5)
  return v5;
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithData:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  _TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *v9;
  _TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *v10;
  objc_super v12;

  v4 = a3;
  v5 = sub_2456F9454();
  v7 = v6;

  v8 = (void *)sub_2456F9448();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for NeverTemplatedImage();
  v9 = -[NeverTemplatedImage initWithData:](&v12, sel_initWithData_, v8);
  sub_2455C694C(v5, v7);
  v10 = v9;

  if (v10)
  return v10;
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithData:(id)a3 scale:(double)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  _TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *v11;
  _TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *v12;
  objc_super v14;

  v6 = a3;
  v7 = sub_2456F9454();
  v9 = v8;

  v10 = (void *)sub_2456F9448();
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for NeverTemplatedImage();
  v11 = -[NeverTemplatedImage initWithData:scale:](&v14, sel_initWithData_scale_, v10, a4);
  sub_2455C694C(v7, v9);
  v12 = v11;

  if (v12)
  return v12;
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCGImage:(CGImage *)a3
{
  return (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_24567FE20(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCGImage_);
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  return (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_24567FE7C(self, a4, (uint64_t)a2, (uint64_t)a3, a5, (SEL *)&selRef_initWithCGImage_scale_orientation_);
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCIImage:(id)a3
{
  return (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_24567FE20(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCIImage_);
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCIImage:(id)a3 scale:(double)a4 orientation:(int64_t)a5
{
  return (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_24567FE7C(self, a4, (uint64_t)a2, (uint64_t)a3, a5, (SEL *)&selRef_initWithCIImage_scale_orientation_);
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NeverTemplatedImage();
  return -[NeverTemplatedImage init](&v3, sel_init);
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCoder:(id)a3
{
  return (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_24567FE20(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *v11;

  v6 = a3;
  v7 = a4;
  v8 = sub_2456F9454();
  v10 = v9;

  sub_2456FA840();
  v11 = (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_245685B04();
  sub_2455C694C(v8, v10);
  return v11;
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithContentsOfFile:(id)a3 cache:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  _TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *v7;
  objc_super v9;

  v4 = a4;
  if (a3)
  {
    sub_2456FA840();
    v6 = (void *)sub_2456FA834();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for NeverTemplatedImage();
  v7 = -[NeverTemplatedImage initWithContentsOfFile:cache:](&v9, sel_initWithContentsOfFile_cache_, v6, v4);

  if (v7)
  return v7;
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCGImage:(CGImage *)a3 imageOrientation:(int64_t)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NeverTemplatedImage();
  return -[NeverTemplatedImage initWithCGImage:imageOrientation:](&v7, sel_initWithCGImage_imageOrientation_, a3, a4);
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithIOSurface:(__IOSurface *)a3
{
  return (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_24567FE20(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithIOSurface_);
}

@end
