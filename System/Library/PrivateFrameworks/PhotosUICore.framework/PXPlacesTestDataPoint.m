@implementation PXPlacesTestDataPoint

- (PXPlacesTestDataPoint)initWithName:(id)a3 location:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v8;
  PXPlacesTestDataPoint *v9;
  PXPlacesTestDataPoint *v10;
  objc_super v12;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPlacesTestDataPoint;
  v9 = -[PXPlacesTestDataPoint init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v10->_coordinate.latitude = latitude;
    v10->_coordinate.longitude = longitude;
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Datapoint: <%p>, coordinate: %g, %g"), self, *(_QWORD *)&self->_coordinate.latitude, *(_QWORD *)&self->_coordinate.longitude);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (int64_t)compareTo:(id)a3
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
  int64_t v14;
  uint64_t v15;

  v4 = a3;
  -[PXPlacesTestDataPoint coordinate](self, "coordinate");
  v6 = v5;
  objc_msgSend(v4, "coordinate");
  v8 = v7;
  -[PXPlacesTestDataPoint coordinate](self, "coordinate");
  v10 = v9;
  objc_msgSend(v4, "coordinate");
  v12 = v11;

  if (v6 > v8)
    return 1;
  v14 = 1;
  if (v10 <= v12)
    v15 = 0;
  else
    v15 = -1;
  if (v10 >= v12)
    v14 = v15;
  if (v6 >= v8)
    return v14;
  else
    return -1;
}

- (CGImage)image
{
  CGColorSpace *DeviceRGB;
  CGContext *v4;
  __int128 v5;
  CGPath *Mutable;
  __CFAttributedString *v7;
  __CFString *v8;
  CGColorSpace *v9;
  CGColorRef v10;
  NSUInteger v11;
  unint64_t v12;
  CTFontRef v13;
  void *v14;
  CFIndex v15;
  uint64_t v16;
  const __CFDictionary *v17;
  const __CTFramesetter *v18;
  const __CTFrame *Frame;
  CGImageRef Image;
  _QWORD v22[2];
  _QWORD v23[2];
  CGAffineTransform v24;
  uint64_t v25;
  CFRange v26;
  CFRange v27;
  CFRange v28;
  CGRect v29;

  v25 = *MEMORY[0x1E0C80C00];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v4 = CGBitmapContextCreate(0, 0x20uLL, 0x20uLL, 8uLL, 0x80uLL, DeviceRGB, 2u);
  CFRelease(DeviceRGB);
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v24.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v24.c = v5;
  *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGContextSetTextMatrix(v4, &v24);
  Mutable = CGPathCreateMutable();
  v29.size.width = 32.0;
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.height = 32.0;
  CGPathAddRect(Mutable, 0, v29);
  v7 = CFAttributedStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  -[PXPlacesTestDataPoint name](self, "name");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26.location = 0;
  v26.length = 0;
  CFAttributedStringReplaceString(v7, v26, v8);

  v9 = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)&v24.a = xmmword_1A7C0BCD0;
  *(_OWORD *)&v24.c = unk_1A7C0BCE0;
  v10 = CGColorCreate(v9, &v24.a);
  CGColorSpaceRelease(v9);
  v11 = -[NSString length](self->_name, "length");
  v12 = 18;
  if (v11 > 3)
    v12 = 14;
  v13 = CTFontCreateWithName(CFSTR("Helvetica"), (double)v12, 0);
  -[PXPlacesTestDataPoint name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");
  v16 = *MEMORY[0x1E0CA8188];
  v22[0] = *MEMORY[0x1E0CA8550];
  v22[1] = v16;
  v23[0] = v10;
  v23[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v27.location = 0;
  v27.length = v15;
  CFAttributedStringSetAttributes(v7, v27, v17, 0);

  v18 = CTFramesetterCreateWithAttributedString(v7);
  CFRelease(v7);
  v28.location = 0;
  v28.length = 0;
  Frame = CTFramesetterCreateFrame(v18, v28, Mutable, 0);
  CTFrameDraw(Frame, v4);
  CFRelease(Frame);
  CFRelease(Mutable);
  CFRelease(v18);
  Image = CGBitmapContextCreateImage(v4);
  CFRelease(v4);
  if (Image)
    CFAutorelease(Image);
  return Image;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
