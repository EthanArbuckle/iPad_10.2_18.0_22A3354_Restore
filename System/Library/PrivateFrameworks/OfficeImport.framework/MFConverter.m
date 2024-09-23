@implementation MFConverter

+ (id)play:(id)a3 frame:(CGRect)a4 colorMap:(id)a5 fillMap:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (width == 0.0 || height == 0.0)
  {
    objc_msgSend(a1, "boundsInPoints:", v13);
    v20 = NSNonNegativeSizeRect(v16, v17, v18, v19);
    width = v23;
    v24 = 0;
    if (v23 == 0.0)
      goto LABEL_10;
    height = v22;
    if (v22 == 0.0)
      goto LABEL_10;
    x = v20;
    y = v21;
  }
  v25 = (void *)MEMORY[0x22E2DDB58]();
  if (objc_msgSend(a1, "mapToPdf:", v13))
    objc_msgSend(a1, "playToPDF:frame:colorMap:fillMap:", v13, v14, v15, x, y, width, height);
  else
    objc_msgSend(a1, "playToBitmap:frame:colorMap:fillMap:", v13, v14, v15, x, y, width, height);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v25);
LABEL_10:

  return v24;
}

+ (BOOL)mapToPdf:(id)a3
{
  return 1;
}

+ (id)playToPDF:(id)a3 frame:(CGRect)a4 colorMap:(id)a5 fillMap:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  __CFData *v16;
  CGDataConsumer *v17;
  CGContext *v18;
  CGFloat MidY;
  CGFloat v20;
  CGRect v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (width > 1024.0)
  {
    height = height * (1024.0 / width);
    width = 1024.0;
  }
  if (height > 1024.0)
  {
    width = width * (1024.0 / height);
    height = 1024.0;
  }
  v16 = (__CFData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 0);
  if (!v16)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Failed to create target data"));
  v17 = CGDataConsumerCreateWithCFData(v16);
  if (!v17)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Failed to create data consumer"));
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v18 = CGPDFContextCreate(v17, &v22, 0);
  if (!v18)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Failed to create PDF context"));
  CGPDFContextBeginPage(v18, 0);
  MidY = CGRectGetMidY(v22);
  CGContextTranslateCTM(v18, 0.0, MidY);
  CGContextScaleCTM(v18, 1.0, -1.0);
  v20 = CGRectGetMidY(v22);
  CGContextTranslateCTM(v18, 0.0, -v20);
  TCGraphicsPushContext(v18);
  objc_msgSend(a1, "playInCurrentContext:frame:colorMap:fillMap:", v13, v14, v15, x, y, width, height);
  if (v18)
  {
    TCGraphicsPopContext();
    CGPDFContextEndPage(v18);
    CGPDFContextClose(v18);
    CFRelease(v18);
  }
  if (v17)
    CFRelease(v17);

  return v16;
}

+ (void)playInCurrentContext:(id)a3 frame:(CGRect)a4 colorMap:(id)a5 fillMap:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  MFGraphicsDevice *v14;
  int v15;
  EMFPlayer *v16;
  EMFReader *v17;
  EMFReader *v18;
  CGContext *CurrentContext;
  CGContext *v20;
  id v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v21 = a3;
  v12 = a5;
  v13 = a6;
  v14 = -[MFGraphicsDevice initWithCanvas:]([MFGraphicsDevice alloc], "initWithCanvas:", x, y, width, height);
  -[MFGraphicsDevice setColorMap:fillMap:](v14, "setColorMap:fillMap:", v12, v13);
  v15 = +[MFSniffer fileType:](MFSniffer, "fileType:", v21);
  if (v15)
  {
    if (v15 != 1)
    {
      v18 = 0;
      goto LABEL_7;
    }
    v16 = -[EMFPlayer initWithGraphicsDevice:]([EMFPlayer alloc], "initWithGraphicsDevice:", v14);
    v17 = -[EMFReader initWithEMFPlayer:]([EMFReader alloc], "initWithEMFPlayer:", v16);
  }
  else
  {
    v16 = -[WMFPlayer initWithGraphicsDevice:]([WMFPlayer alloc], "initWithGraphicsDevice:", v14);
    v17 = -[WMFReader initWithWMFPlayer:]([WMFReader alloc], "initWithWMFPlayer:", v16);
  }
  v18 = v17;

LABEL_7:
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  -[EMFReader play:](v18, "play:", v21);
  v20 = UIGraphicsGetCurrentContext();
  CGContextRestoreGState(v20);

}

+ (CGRect)boundsInPoints:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = a3;
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = +[MFSniffer fileType:](MFSniffer, "fileType:", v3);
  if (!v8)
  {
    +[WMFPlayer boundsInPoints:](WMFPlayer, "boundsInPoints:", v3);
    goto LABEL_5;
  }
  if (v8 == 1)
  {
    +[EMFPlayer boundsInPoints:](EMFPlayer, "boundsInPoints:", v3);
LABEL_5:
    v4 = v9;
    v5 = v10;
    v6 = v11;
    v7 = v12;
  }

  v13 = v4;
  v14 = v5;
  v15 = v6;
  v16 = v7;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (id)playToBitmap:(id)a3 frame:(CGRect)a4 colorMap:(id)a5 fillMap:(id)a6
{
  return 0;
}

+ (CGRect)boundsInLogicalUnits:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = a3;
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = +[MFSniffer fileType:](MFSniffer, "fileType:", v3);
  if (!v8)
  {
    +[WMFPlayer boundsInLogicalUnits:](WMFPlayer, "boundsInLogicalUnits:", v3);
    goto LABEL_5;
  }
  if (v8 == 1)
  {
    +[EMFPlayer boundsInLogicalUnits:](EMFPlayer, "boundsInLogicalUnits:", v3);
LABEL_5:
    v4 = v9;
    v5 = v10;
    v6 = v11;
    v7 = v12;
  }

  v13 = v4;
  v14 = v5;
  v15 = v6;
  v16 = v7;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (void)fromBinary:(id)a3 toXml:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v9, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("emf"));

  if (v8)
    +[EMFPlayer fromBinary:toXml:](EMFPlayer, "fromBinary:toXml:", v9, v5);

}

@end
