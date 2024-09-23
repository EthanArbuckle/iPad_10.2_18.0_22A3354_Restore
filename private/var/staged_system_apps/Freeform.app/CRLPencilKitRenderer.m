@implementation CRLPencilKitRenderer

+ (void)drawStrokes:(id)a3 inContext:(CGContext *)a4 overTransparentCanvas:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  uint64_t v42;
  char v43;
  void *v44;
  _QWORD v45[11];
  char v46;
  char v47;
  char v48;
  char v49;
  CGAffineTransform v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect ClipBoundingBox;

  v5 = a5;
  v7 = a3;
  v8 = objc_autoreleasePoolPush();
  v9 = objc_alloc((Class)PKDrawing);
  v10 = objc_alloc_init((Class)PKDrawing);
  v11 = objc_msgSend(v9, "initWithStrokes:fromDrawing:", v7, v10);

  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  ClipBoundingBox = CGContextGetClipBoundingBox(a4);
  v51.origin.x = v13;
  v51.origin.y = v15;
  v51.size.width = v17;
  v51.size.height = v19;
  v52 = CGRectIntersection(v51, ClipBoundingBox);
  x = v52.origin.x;
  y = v52.origin.y;
  width = v52.size.width;
  height = v52.size.height;
  if (!CGRectIsEmpty(v52) && sub_1000617E8(x, y, width, height))
  {
    v24 = sub_1004121D0((uint64_t)a4);
    v25 = v24;
    if (v24 <= 0.0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257C78);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2AC84();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257C98);
      v26 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPencilKitRenderer drawStrokes:inContext:overTransparentCanvas:]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPencilKitRenderer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 330, 0, "CGContext has an invalid associated screen scale.");

      v25 = 1.0;
    }
    if (sub_100411FB8((uint64_t)a4))
      v24 = 3.0;
    CGContextGetCTM(&v50, a4);
    v29 = v24 * (sub_10007922C(&v50.a) / v25);
    if (v29 > 0.0)
    {
      v53.origin.x = sub_1000636FC(x, y, width, height, v29);
      v54 = CGRectInset(v53, -1.0 / v29, -1.0 / v29);
      v30 = v54.origin.x;
      v31 = v54.origin.y;
      v32 = v54.size.width;
      v33 = v54.size.height;
      v34 = sub_1000603DC(v54.size.width, v54.size.height, v29);
      v36 = v35;
      v37 = sub_100411FB8((uint64_t)a4);
      v38 = sub_100411964((uint64_t)a4);
      v39 = sub_100411A70((uint64_t)a4);
      v40 = sub_100411B7C((uint64_t)a4);
      v41 = v5 & ~(v38 | v39);
      v42 = (v40 | v37 | v41) ^ 1u;
      if (v40 | v37)
        v43 = v40;
      else
        v43 = v41;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKImageRendererPool sharedPool](CRLPKImageRendererPool, "sharedPool"));
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1003A6938;
      v45[3] = &unk_101257DD0;
      *(CGFloat *)&v45[6] = v30;
      *(CGFloat *)&v45[7] = v31;
      *(CGFloat *)&v45[8] = v32;
      *(CGFloat *)&v45[9] = v33;
      v46 = v43;
      v45[4] = v11;
      v45[5] = a4;
      *(double *)&v45[10] = v29;
      v47 = v37;
      v48 = v38;
      v49 = v39;
      objc_msgSend(v44, "provideImageRendererOfMinimumSize:sixChannelBlending:inBlock:", v42, v45, v34, v36);

    }
  }

  objc_autoreleasePoolPop(v8);
}

@end
