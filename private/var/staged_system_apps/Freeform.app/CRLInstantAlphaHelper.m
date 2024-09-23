@implementation CRLInstantAlphaHelper

+ (id)newInstantAlphaImageWithCGImage:(CGImage *)a3 ofSize:(CGSize)a4
{
  double v5;
  double v6;
  double v7;
  CRLInstantAlphaImage *v8;
  CGColorSpace *v9;
  CGColorSpace *ColorSpace;
  CGContext *v11;
  CRLInstantAlphaImage *v12;
  CGRect v14;

  v5 = sub_100063090(a4.width);
  v7 = v6;
  v8 = -[CRLInstantAlphaImage initWithWidth:height:]([CRLInstantAlphaImage alloc], "initWithWidth:height:", (uint64_t)v5, (uint64_t)v6);
  if (v8)
  {
    v9 = (CGColorSpace *)sub_100011A10();
    ColorSpace = CGImageGetColorSpace(a3);
    if (CGColorSpaceIsWideGamutRGB(ColorSpace))
      v9 = (CGColorSpace *)sub_100011BA0();
    v11 = CGBitmapContextCreate(v8->mImageData, (unint64_t)v5, (unint64_t)v7, 8uLL, 4 * (unint64_t)v5, v9, 0x2001u);
    v14.origin.x = sub_10005FDDC();
    CGContextDrawImage(v11, v14, a3);
    CGContextRelease(v11);
    v12 = v8;
  }

  return v8;
}

+ (id)newMaskBitmapWithPoint:(CGPoint)a3 image:(id)a4 tolerance:(unint64_t)a5 oldMaskBitmap:(id)a6
{
  double y;
  double x;
  _QWORD *v10;
  id v11;
  CRLInstantAlphaBinaryBitmap *v12;
  int v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  size_t v16;
  CRLInstantAlphaBinaryBitmap *v17;
  id v18;
  _QWORD *v19;
  CRLInstantAlphaBinaryBitmap *v20;
  CRLInstantAlphaBinaryBitmap *v21;
  _QWORD block[4];
  id v24;
  id v25;
  CRLInstantAlphaBinaryBitmap *v26;
  unint64_t v27;
  int v28;

  y = a3.y;
  x = a3.x;
  v10 = a4;
  v11 = a6;
  v12 = -[CRLInstantAlphaBinaryBitmap initWithWidth:height:]([CRLInstantAlphaBinaryBitmap alloc], "initWithWidth:height:", v10[1], v10[2]);
  v13 = sub_1000BC3B8(v10, (uint64_t)x, (uint64_t)y);
  global_queue = dispatch_get_global_queue(0, 0);
  v15 = objc_claimAutoreleasedReturnValue(global_queue);
  v16 = v10[2];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BC64C;
  block[3] = &unk_101234A98;
  v24 = v10;
  v25 = v11;
  v17 = v12;
  v28 = v13;
  v26 = v17;
  v27 = a5;
  v18 = v11;
  v19 = v10;
  dispatch_apply(v16, v15, block);
  v20 = v26;
  v21 = v17;

  return v21;
}

+ (id)newMaskSeedFillWithPoint:(CGPoint)a3 inImage:(id)a4 tolerance:(unint64_t)a5 oldFill:(id)a6
{
  double y;
  double x;
  double v10;
  id v11;
  _QWORD *v12;
  double v13;
  double v14;
  id v15;
  _QWORD v17[2];

  y = a3.y;
  x = a3.x;
  v17[0] = 0;
  v10 = (double)(*((_QWORD *)a4 + 1) - 1);
  v11 = a6;
  v12 = a4;
  v13 = sub_1003C65EC(x, 0.0, v10);
  v14 = sub_1003C65EC(y, 0.0, (double)(v12[2] - 1));
  v17[0] = sub_1000BC3B8(v12, (uint64_t)v13, (uint64_t)v14);
  v17[1] = a5;
  v15 = +[CRLInstantAlphaSeedFill newSeedFillWithImage:seedPoint:context:oldFill:](CRLInstantAlphaSeedFill, "newSeedFillWithImage:seedPoint:context:oldFill:", v12, v17, v11, v13, v14);

  return v15;
}

+ (id)removeBackgroundFromCGImage:(CGImage *)a3
{
  id v3;
  void (*v6)(CGImage *, uint64_t, _QWORD *);
  NSObject *v7;
  _QWORD *v8;
  dispatch_time_t v9;
  intptr_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v18[8];
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  CGImage *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  CRLRemoveImageBackgroundData *v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1000BD0E8;
  v27 = sub_1000BD0F8;
  v28 = objc_alloc_init(CRLRemoveImageBackgroundData);
  v6 = (void (*)(CGImage *, uint64_t, _QWORD *))objc_msgSend(a1, "p_loadVKCGImageRemoveBackground");
  if (!v6)
    goto LABEL_9;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000BD100;
  v19[3] = &unk_101234B00;
  v21 = &v23;
  v22 = a3;
  v7 = dispatch_group_create();
  v20 = v7;
  v8 = objc_retainBlock(v19);
  dispatch_group_enter(v7);
  v6(a3, 1, v8);
  v9 = dispatch_time(0, 5000000000);
  v10 = dispatch_group_wait(v7, v9);
  if (v10)
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101234B20);
    v11 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Remove background from image timed out.", v18, 2u);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Can’t Remove Background"), 0, 0));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("The background can’t be removed from this image."), 0, 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_errorWithDomain:code:alertTitle:alertMessage:](NSError, "crl_errorWithDomain:code:alertTitle:alertMessage:", CFSTR("com.apple.freeform"), 2, v13, v15));
    objc_msgSend((id)v24[5], "setError:", v16);
    v3 = (id)v24[5];

  }
  if (!v10)
LABEL_9:
    v3 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v3;
}

+ (void)p_loadVKCGImageRemoveBackground
{
  if (qword_101414D78 != -1)
    dispatch_once(&qword_101414D78, &stru_101234B40);
  return (void *)qword_101414D80;
}

@end
