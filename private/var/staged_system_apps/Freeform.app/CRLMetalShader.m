@implementation CRLMetalShader

+ (id)p_blendingColorAttachmentWithContext:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  v5 = objc_msgSend(v3, "pixelFormat");

  objc_msgSend(v4, "setPixelFormat:", v5);
  objc_msgSend(v4, "setBlendingEnabled:", 1);
  objc_msgSend(v4, "setRgbBlendOperation:", 0);
  objc_msgSend(v4, "setAlphaBlendOperation:", 0);
  objc_msgSend(v4, "setSourceRGBBlendFactor:", 1);
  objc_msgSend(v4, "setSourceAlphaBlendFactor:", 1);
  objc_msgSend(v4, "setDestinationAlphaBlendFactor:", 5);
  objc_msgSend(v4, "setDestinationRGBBlendFactor:", 5);
  return v4;
}

+ (id)p_motionBlurVelocityColorAttachmentWithContext:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  v5 = objc_msgSend(v3, "pixelFormat");

  objc_msgSend(v4, "setPixelFormat:", v5);
  return v4;
}

+ (id)defaultTextureAndOpacityShaderWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241F80);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E08614();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241FA0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader defaultTextureAndOpacityShaderWithContext:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 92, 0, "invalid nil value for '%{public}s'", "context.device");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shaderManager"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "device"));

  if (v11 != v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241FC0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E08594();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241FE0);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader defaultTextureAndOpacityShaderWithContext:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 94, 0, "MTLDevice mismatch!");

  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001C389C;
  v20[3] = &unk_101242008;
  v21 = v4;
  v22 = a1;
  v16 = v4;
  v17 = objc_retainBlock(v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shaderWithName:initBlock:", CFSTR("Default Texture and Opacity Shader"), v17));

  return v18;
}

+ (id)defaultTextureAndOpacityShaderForMotionBlurWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242028);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E08720();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242048);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader defaultTextureAndOpacityShaderForMotionBlurWithContext:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 105, 0, "invalid nil value for '%{public}s'", "context.device");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shaderManager"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "device"));

  if (v10 != v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242068);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E086A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242088);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader defaultTextureAndOpacityShaderForMotionBlurWithContext:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 107, 0, "MTLDevice mismatch!");

  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001C3D04;
  v19[3] = &unk_1012420B0;
  v20 = v3;
  v15 = v3;
  v16 = objc_retainBlock(v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shaderWithName:initBlock:", CFSTR("Default Texture and Opacity Shader with Motion Blur"), v16));

  return v17;
}

+ (id)blendTextureShaderWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012420D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0882C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012420F0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader blendTextureShaderWithContext:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 119, 0, "invalid nil value for '%{public}s'", "context.device");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shaderManager"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "device"));

  if (v10 != v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242110);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E087AC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242130);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader blendTextureShaderWithContext:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 121, 0, "MTLDevice mismatch!");

  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001C418C;
  v19[3] = &unk_1012420B0;
  v20 = v3;
  v15 = v3;
  v16 = objc_retainBlock(v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shaderWithName:initBlock:", CFSTR("Default Texture Blending Shader"), v16));

  return v17;
}

+ (id)blendTextureShaderForMotionBlurWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242150);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E08938();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242170);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader blendTextureShaderForMotionBlurWithContext:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 132, 0, "invalid nil value for '%{public}s'", "context.device");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shaderManager"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "device"));

  if (v10 != v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242190);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E088B8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012421B0);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader blendTextureShaderForMotionBlurWithContext:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 134, 0, "MTLDevice mismatch!");

  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001C45FC;
  v19[3] = &unk_1012420B0;
  v20 = v3;
  v15 = v3;
  v16 = objc_retainBlock(v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shaderWithName:initBlock:", CFSTR("Default Texture Blending Shader with Motion Blur"), v16));

  return v17;
}

+ (id)defaultColorShaderWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012421D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E08A44();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012421F0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader defaultColorShaderWithContext:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 146, 0, "invalid nil value for '%{public}s'", "context.device");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shaderManager"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "device"));

  if (v10 != v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242210);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E089C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242230);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader defaultColorShaderWithContext:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 148, 0, "MTLDevice mismatch!");

  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001C4A84;
  v19[3] = &unk_1012420B0;
  v20 = v3;
  v15 = v3;
  v16 = objc_retainBlock(v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shaderWithName:initBlock:", CFSTR("Default Color Shader"), v16));

  return v17;
}

+ (id)linearClampToEdgeSamplerWithDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  MTLSamplerDescriptor *v7;
  id v8;

  v3 = a3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242250);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E08AD0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242270);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader linearClampToEdgeSamplerWithDevice:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 159, 0, "invalid nil value for '%{public}s'", "device");

  }
  v7 = objc_opt_new(MTLSamplerDescriptor);
  -[MTLSamplerDescriptor setMinFilter:](v7, "setMinFilter:", 1);
  -[MTLSamplerDescriptor setMagFilter:](v7, "setMagFilter:", 1);
  -[MTLSamplerDescriptor setMipFilter:](v7, "setMipFilter:", 2);
  -[MTLSamplerDescriptor setRAddressMode:](v7, "setRAddressMode:", 0);
  -[MTLSamplerDescriptor setSAddressMode:](v7, "setSAddressMode:", 0);
  -[MTLSamplerDescriptor setTAddressMode:](v7, "setTAddressMode:", 0);
  v8 = objc_msgSend(v3, "newSamplerStateWithDescriptor:", v7);

  return v8;
}

- (id)p_createPipelineStateWithRenderPipelineDescriptor:(id)a3 device:(id)a4 setupBindings:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  MTLRenderPipelineReflection *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  MTLRenderPipelineReflection *pipelineReflectionObject;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  CKRecordID v32;
  Swift::String v33;
  id v34;
  id v35;
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!a5)
  {
    v36 = 0;
    v11 = objc_msgSend(v9, "newRenderPipelineStateWithDescriptor:error:", v8, &v36);
    v13 = v36;
    if (v11)
      goto LABEL_15;
    goto LABEL_6;
  }
  v34 = 0;
  v35 = 0;
  v11 = objc_msgSend(v9, "newRenderPipelineStateWithDescriptor:options:reflection:error:", v8, 3, &v35, &v34);
  v12 = (MTLRenderPipelineReflection *)v35;
  v13 = v34;
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242290);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E08B5C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012422B0);
    v22 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v22);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Failed to create pipeline reflection object, error %@", v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[CRLMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupBindings:]");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupBindings:]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 193, 1, "Failed to create pipeline reflection object, error %@", v13, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m", 193, v13);

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v32, v33);
    abort();
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineReflection vertexBindings](v12, "vertexBindings"));
  self->_vertexUniformsIndex = -[CRLMetalShader p_indexOfUniformsFromMetalBindings:size:bufferIndex:](self, "p_indexOfUniformsFromMetalBindings:size:bufferIndex:", v14, &self->_vertexUniformsSize, &self->_bufferIndex);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineReflection fragmentBindings](v12, "fragmentBindings"));
  self->_fragmentUniformsIndex = -[CRLMetalShader p_indexOfUniformsFromMetalBindings:size:bufferIndex:](self, "p_indexOfUniformsFromMetalBindings:size:bufferIndex:", v15, &self->_fragmentUniformsSize, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineReflection fragmentBindings](v12, "fragmentBindings"));
  self->_samplerStateIndex = -[CRLMetalShader p_indexOfSamplerStateFromMetalBindings:](self, "p_indexOfSamplerStateFromMetalBindings:", v16);

  pipelineReflectionObject = self->_pipelineReflectionObject;
  self->_pipelineReflectionObject = v12;

  if (!v11)
  {
LABEL_6:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012422D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E08BE4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012422F0);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupBindings:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 203, 0, "Failed to create pipeline state, error %@", v13);

  }
LABEL_15:

  return v11;
}

- (int64_t)p_indexOfUniformsFromMetalBindings:(id)a3 size:(unint64_t *)a4 bufferIndex:(unint64_t *)a5
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  int64_t v23;
  unint64_t v27;
  int64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v5 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v13 = v6;
    v14 = 0;
    v15 = *(_QWORD *)v30;
    v27 = 0;
    v28 = -1;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v5);
        v17 = sub_100221DDC(*(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), 1, v7, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___MTLBufferBinding);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = v18;
        if (v18 && objc_msgSend(v18, "bufferDataType") == (id)1)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
          v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("uniforms"));

          v22 = objc_msgSend(v19, "index");
          v23 = (int64_t)v22;
          if (v21)
          {
            v14 = objc_msgSend(v19, "bufferDataSize");
            v28 = v23;
          }
          else
          {
            v27 = (unint64_t)v22;
          }
        }

      }
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
    v27 = 0;
    v28 = -1;
  }
  if (a5)
    *a5 = v27;
  *a4 = (unint64_t)v14;

  return v28;
}

- (int64_t)p_indexOfSamplerStateFromMetalBindings:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned int v10;
  int64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "type", (_QWORD)v13) == (id)3)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("mainSampler"));

          if (v10)
          {
            v11 = (int64_t)objc_msgSend(v8, "index");
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = -1;
LABEL_12:

  return v11;
}

- (void)p_setupPipelineStateWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 vertexLibrary:(id)a6 fragmentLibrary:(id)a7 colorAttachment:(id)a8 velocityAttachment:(id)a9 setupBindings:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  MTLRenderPipelineState *v33;
  MTLRenderPipelineState *pipelineState;
  void *v35;
  void *v36;
  MTLSamplerState *v37;
  MTLSamplerState *defaultSamplerState;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = v22;
  v49 = v20;
  v50 = v21;
  if (v19 && v20)
  {
    v24 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
    v25 = v24;
    v48 = v16;
    if (v21)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "colorAttachments"));
      objc_msgSend(v26, "setObject:atIndexedSubscript:", v21, 0);

      if (v23)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "colorAttachments"));
        objc_msgSend(v27, "setObject:atIndexedSubscript:", v23, 1);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMetalShader name](self, "name"));

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMetalShader name](self, "name"));
        objc_msgSend(v25, "setLabel:", v29);

      }
      v30 = objc_msgSend(v19, "newFunctionWithName:", v16);
      if (!v30)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        v32 = v17;
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101242390);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E08CF8();
        v35 = v23;
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012423B0);
        v36 = v18;
        v42 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v42);
        v31 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:]"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v43, 283, 0, "invalid nil value for '%{public}s'", "vertexFunction");

        goto LABEL_51;
      }
      objc_msgSend(v25, "setVertexFunction:", v30);
      v31 = objc_msgSend(v20, "newFunctionWithName:", v17);
      if (v31)
      {
        v32 = v17;
        objc_msgSend(v25, "setFragmentFunction:", v31);
        v33 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue(-[CRLMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupBindings:](self, "p_createPipelineStateWithRenderPipelineDescriptor:device:setupBindings:", v25, v18, a10));
        pipelineState = self->_pipelineState;
        self->_pipelineState = v33;

        v35 = v23;
        if (!a10 || self->_samplerStateIndex < 0)
        {
          v36 = v18;
        }
        else
        {
          v36 = v18;
          v37 = (MTLSamplerState *)objc_claimAutoreleasedReturnValue(+[CRLMetalShader linearClampToEdgeSamplerWithDevice:](CRLMetalShader, "linearClampToEdgeSamplerWithDevice:", v18));
          defaultSamplerState = self->_defaultSamplerState;
          self->_defaultSamplerState = v37;

        }
        goto LABEL_51;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      v47 = v17;
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012423D0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E08D84();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012423F0);
      v35 = v23;
      v44 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v44);
      v36 = v18;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:]"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v45, v46, 291, 0, "invalid nil value for '%{public}s'", "fragmentFunction");

    }
    else
    {
      v47 = v17;
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242350);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E08C6C();
      v35 = v23;
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242370);
      v36 = v18;
      v41 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v41);
      v30 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:]"));
      v31 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 267, 0, "invalid nil value for '%{public}s'", "colorAttachment");
    }
    v32 = v47;
LABEL_51:

    v39 = v48;
    goto LABEL_52;
  }
  v35 = v22;
  v36 = v18;
  v32 = v17;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  v39 = v16;
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101242310);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E08E10();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101242330);
  v40 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v40);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:]"));
  v30 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v30, 259, 0, "Can't load shaders from nil library");
LABEL_52:

}

- (CRLMetalShader)initWithDefaultVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7 label:(id)a8 setupBindings:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CRLMetalShader *v21;
  void *v22;
  uint64_t v24;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CRLMetalShader;
  v21 = -[CRLMetalShader init](&v25, "init");
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMetalShaderLibraryLoader loadDefaultLibraryWithDevice:](CRLMetalShaderLibraryLoader, "loadDefaultLibraryWithDevice:", v17));
    objc_storeStrong((id *)&v21->_name, a8);
    v21->_vertexUniformsIndex = -1;
    v21->_fragmentUniformsIndex = -1;
    v21->_samplerStateIndex = -1;
    LOBYTE(v24) = a9;
    -[CRLMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:](v21, "p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:", v15, v16, v17, v22, v22, v18, v19, v24);

  }
  return v21;
}

- (id)initDefaultShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  CRLMetalShader *v17;
  uint64_t v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("_")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
  v16 = objc_msgSend(v15, "copy");

  LOBYTE(v19) = 1;
  v17 = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", v13, v12, v11, v10, 0, v16, v19);

  return v17;
}

- (id)initDefaultTextureShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  CRLMetalShader *v4;
  CRLMetalShader *v5;
  uint64_t v7;

  LOBYTE(v7) = 0;
  v4 = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", CFSTR("CRLMetalShaderDefaultTexture_VertexShader"), CFSTR("CRLMetalShaderDefaultTexture_FragmentShader"), a3, a4, 0, CFSTR("Default Texture Shader"), v7);
  v5 = v4;
  if (v4)
    -[CRLMetalShader p_setDefaultVertexUniforms](v4, "p_setDefaultVertexUniforms");
  return v5;
}

- (id)initDefaultTextureAndOpacityShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  id v6;
  CRLMetalShader *v7;
  CRLMetalShader *v8;
  uint64_t v9;
  MTLSamplerState *defaultSamplerState;
  uint64_t v12;

  v6 = a3;
  LOBYTE(v12) = 0;
  v7 = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", CFSTR("CRLMetalShaderDefaultTexture_VertexShader"), CFSTR("CRLMetalShaderDefaultOpacityTexture_FragmentShader"), v6, a4, 0, CFSTR("Default Texture and Opacity Shader"), v12);
  v8 = v7;
  if (v7)
  {
    -[CRLMetalShader p_setDefaultVertexUniforms](v7, "p_setDefaultVertexUniforms");
    *(_OWORD *)&v8->_fragmentUniformsIndex = xmmword_100EEE2D0;
    v8->_samplerStateIndex = 0;
    v9 = objc_claimAutoreleasedReturnValue(+[CRLMetalShader linearClampToEdgeSamplerWithDevice:](CRLMetalShader, "linearClampToEdgeSamplerWithDevice:", v6));
    defaultSamplerState = v8->_defaultSamplerState;
    v8->_defaultSamplerState = (MTLSamplerState *)v9;

  }
  return v8;
}

- (id)initDefaultTextureAndColorShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  id v6;
  CRLMetalShader *v7;
  CRLMetalShader *v8;
  uint64_t v9;
  MTLSamplerState *defaultSamplerState;
  uint64_t v12;

  v6 = a3;
  LOBYTE(v12) = 0;
  v7 = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", CFSTR("CRLMetalShaderDefaultTexture_VertexShader"), CFSTR("CRLMetalShaderDefaultTextureAndColor_FragmentShader"), v6, a4, 0, CFSTR("Default Texture and Color Shader"), v12);
  v8 = v7;
  if (v7)
  {
    -[CRLMetalShader p_setDefaultVertexUniforms](v7, "p_setDefaultVertexUniforms");
    *(_OWORD *)&v8->_fragmentUniformsIndex = xmmword_100EEE2E0;
    v8->_samplerStateIndex = 0;
    v9 = objc_claimAutoreleasedReturnValue(+[CRLMetalShader linearClampToEdgeSamplerWithDevice:](CRLMetalShader, "linearClampToEdgeSamplerWithDevice:", v6));
    defaultSamplerState = v8->_defaultSamplerState;
    v8->_defaultSamplerState = (MTLSamplerState *)v9;

  }
  return v8;
}

- (id)initDefaultMaskedTextureShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  CRLMetalShader *v4;
  CRLMetalShader *v5;
  uint64_t v7;

  LOBYTE(v7) = 0;
  v4 = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", CFSTR("CRLMetalShaderDefaultTexture_VertexShader"), CFSTR("CRLMetalShaderDefaultMaskedTexture_FragmentShader"), a3, a4, 0, CFSTR("Default Masked Texture Shader"), v7);
  v5 = v4;
  if (v4)
  {
    -[CRLMetalShader p_setDefaultVertexUniforms](v4, "p_setDefaultVertexUniforms");
    *(_OWORD *)&v5->_fragmentUniformsIndex = xmmword_100EEE2F0;
  }
  return v5;
}

- (id)initDefaultGaussianBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 halfSizedRadius:(BOOL)a5
{
  const __CFString *v6;
  const __CFString *v7;
  CRLMetalShader *v8;
  CRLMetalShader *v9;
  uint64_t v11;

  if (a5)
    v6 = CFSTR("CRLMetalShaderDefaultHalfSizedRadiusGaussianBlur_FragmentShader");
  else
    v6 = CFSTR("CRLMetalShaderDefaultGaussianBlur_FragmentShader");
  if (a5)
    v7 = CFSTR("Default Gaussain Blur Shader with Radius 5");
  else
    v7 = CFSTR("Default Gaussian Blur Shader with Radius 9");
  LOBYTE(v11) = 0;
  v8 = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", CFSTR("CRLMetalShaderDefaultTexture_VertexShader"), v6, a3, a4, 0, v7, v11);
  v9 = v8;
  if (v8)
  {
    -[CRLMetalShader p_setDefaultVertexUniforms](v8, "p_setDefaultVertexUniforms");
    *(_OWORD *)&v9->_fragmentUniformsIndex = xmmword_100EEE300;
  }
  return v9;
}

- (id)initDefaultTextureMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5
{
  id result;
  uint64_t v6;

  LOBYTE(v6) = 0;
  result = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", CFSTR("CRLMetalShaderDefaultMotionBlurTexture_VertexShader"), CFSTR("CRLMetalShaderDefaultMotionBlurTexture_FragmentShader"), a3, a4, a5, CFSTR("Default Texture Shader with Motion Blur"), v6);
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_100EEE310;
    *((_QWORD *)result + 9) = 1;
  }
  return result;
}

- (id)initDefaultTextureAndOpacityMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5 motionBlur:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  CRLMetalShader *v13;
  CRLMetalShader *v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  MTLSamplerState *defaultSamplerState;
  uint64_t v20;

  v6 = a6;
  v10 = a3;
  if (v6)
    v11 = CFSTR("CRLMetalShaderDefaultMotionBlurTexture_VertexShader");
  else
    v11 = CFSTR("CRLMetalShaderDefaultTexture_VertexShader");
  if (v6)
    v12 = CFSTR("CRLMetalShaderDefaultMotionBlurOpacityTexture_FragmentShader");
  else
    v12 = CFSTR("CRLMetalShaderDefaultOpacityTexture_FragmentShader");
  LOBYTE(v20) = 0;
  v13 = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", v11, v12, v10, a4, a5, CFSTR("Default Texture and Opacity Shader with Motion Blur"), v20);
  v14 = v13;
  if (v13)
  {
    v15 = 64;
    if (v6)
      v15 = 192;
    v16 = !v6;
    v13->_vertexUniformsIndex = v16;
    v13->_vertexUniformsSize = v15;
    v13->_fragmentUniformsIndex = v16;
    v13->_bufferIndex = v6;
    *(_OWORD *)&v13->_fragmentUniformsSize = xmmword_100EEE320;
    v17 = objc_claimAutoreleasedReturnValue(+[CRLMetalShader linearClampToEdgeSamplerWithDevice:](CRLMetalShader, "linearClampToEdgeSamplerWithDevice:", v10));
    defaultSamplerState = v14->_defaultSamplerState;
    v14->_defaultSamplerState = (MTLSamplerState *)v17;

  }
  return v14;
}

- (id)initDefaultBlendShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5 motionBlur:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  CRLMetalShader *v14;
  CRLMetalShader *v15;
  uint64_t v16;
  MTLSamplerState *defaultSamplerState;
  uint64_t v19;

  v6 = a6;
  v10 = a3;
  if (v6)
    v11 = CFSTR("CRLMetalShaderDefaultMotionBlurTexture_VertexShader");
  else
    v11 = CFSTR("CRLMetalShaderDefaultTexture_VertexShader");
  if (v6)
    v12 = CFSTR("CRLMetalShaderDefaultMotionBlurBlendTexture_FragmentShader");
  else
    v12 = CFSTR("CRLMetalShaderDefaultBlendTexture_FragmentShader");
  if (v6)
    v13 = CFSTR("Default Texture Blending Shader with Motion Blur");
  else
    v13 = CFSTR("Default Texture Blending Shader");
  LOBYTE(v19) = 0;
  v14 = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", v11, v12, v10, a4, a5, v13, v19);
  v15 = v14;
  if (v14)
  {
    if (v6)
    {
      *(_OWORD *)&v14->_vertexUniformsIndex = xmmword_100EEE310;
      v14->_bufferIndex = 1;
    }
    else
    {
      -[CRLMetalShader p_setDefaultVertexUniforms](v14, "p_setDefaultVertexUniforms");
    }
    *(_OWORD *)&v15->_fragmentUniformsIndex = xmmword_100EEE330;
    v15->_samplerStateIndex = 0;
    v16 = objc_claimAutoreleasedReturnValue(+[CRLMetalShader linearClampToEdgeSamplerWithDevice:](CRLMetalShader, "linearClampToEdgeSamplerWithDevice:", v10));
    defaultSamplerState = v15->_defaultSamplerState;
    v15->_defaultSamplerState = (MTLSamplerState *)v16;

  }
  return v15;
}

- (id)initDefaultColorShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  id v6;
  CRLMetalShader *v7;
  CRLMetalShader *v8;
  uint64_t v9;
  MTLSamplerState *defaultSamplerState;
  uint64_t v12;

  v6 = a3;
  LOBYTE(v12) = 0;
  v7 = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", CFSTR("CRLMetalShaderDefaultTexture_VertexShader"), CFSTR("CRLMetalShaderDefaultColor_FragmentShader"), v6, a4, 0, CFSTR("Default Color Shader"), v12);
  v8 = v7;
  if (v7)
  {
    -[CRLMetalShader p_setDefaultVertexUniforms](v7, "p_setDefaultVertexUniforms");
    *(_OWORD *)&v8->_fragmentUniformsIndex = xmmword_100EEE2E0;
    v8->_samplerStateIndex = 0;
    v9 = objc_claimAutoreleasedReturnValue(+[CRLMetalShader linearClampToEdgeSamplerWithDevice:](CRLMetalShader, "linearClampToEdgeSamplerWithDevice:", v6));
    defaultSamplerState = v8->_defaultSamplerState;
    v8->_defaultSamplerState = (MTLSamplerState *)v9;

  }
  return v8;
}

- (id)initDefaultVelocityCollectionShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  id result;
  uint64_t v5;

  LOBYTE(v5) = 0;
  result = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", CFSTR("CRLMetalMotionBlurEffect_Collection_Vertex"), CFSTR("CRLMetalMotionBlurEffect_Collection_Fragment"), a3, a4, 0, CFSTR("Default Velocity Collection Shader"), v5);
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_100EEE340;
    *(_OWORD *)((char *)result + 24) = xmmword_100EEE350;
    *((_QWORD *)result + 9) = 1;
  }
  return result;
}

- (id)initDefaultVelocityVisualizerShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  CRLMetalShader *v4;
  CRLMetalShader *v5;
  uint64_t v7;

  LOBYTE(v7) = 0;
  v4 = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", CFSTR("CRLMetalShaderDefaultTexture_VertexShader"), CFSTR("CRLMetalMotionBlurEffect_Visualizer_Fragment"), a3, a4, 0, CFSTR("Default Velocity Visualizer Shader"), v7);
  v5 = v4;
  if (v4)
    -[CRLMetalShader p_setDefaultVertexUniforms](v4, "p_setDefaultVertexUniforms");
  return v5;
}

- (id)initDefaultNeighborMaxBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  CRLMetalShader *v4;
  CRLMetalShader *v5;
  uint64_t v7;

  LOBYTE(v7) = 0;
  v4 = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", CFSTR("CRLMetalShaderDefaultTexture_VertexShader"), CFSTR("CRLMetalMotionBlurEffect_Neighbor_Fragment"), a3, a4, 0, CFSTR("Default Neighbor Max Shader"), v7);
  v5 = v4;
  if (v4)
  {
    -[CRLMetalShader p_setDefaultVertexUniforms](v4, "p_setDefaultVertexUniforms");
    *(_OWORD *)&v5->_fragmentUniformsIndex = xmmword_100EEE340;
  }
  return v5;
}

- (id)initDefaultTileMaxBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  id result;
  uint64_t v5;

  LOBYTE(v5) = 0;
  result = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", CFSTR("CRLMetalMotionBlurEffect_Tile_Vertex"), CFSTR("CRLMetalMotionBlurEffect_Tile_Fragment"), a3, a4, 0, CFSTR("Default Tile Max Shader"), v5);
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_100EEE360;
    *(_OWORD *)((char *)result + 24) = xmmword_100EEE370;
    *((_QWORD *)result + 9) = 1;
  }
  return result;
}

- (id)initDefaultSingleDirectionMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  id result;
  uint64_t v5;

  LOBYTE(v5) = 0;
  result = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", CFSTR("CRLMetalShaderMotionBlurSingleDirection_VertexShader"), CFSTR("CRLMetalShaderMotionBlurSingleDirection_FragmentShader"), a3, a4, 0, CFSTR("Default Single Direction Motion Blur Shader"), v5);
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_100EEE380;
    *(_OWORD *)((char *)result + 24) = xmmword_100EEE2D0;
    *((_QWORD *)result + 9) = 0;
  }
  return result;
}

- (void)p_setDefaultVertexUniforms
{
  *(_OWORD *)&self->_vertexUniformsIndex = xmmword_100EEE2F0;
  self->_bufferIndex = 0;
}

- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 bundle:(id)a6 colorAttachment:(id)a7 velocityAttachment:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CRLMetalShader *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  NSString *name;
  uint64_t v27;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)CRLMetalShader;
  v20 = -[CRLMetalShader init](&v28, "init");
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMetalShaderLibraryLoader loadLibraryWithDevice:bundle:](CRLMetalShaderLibraryLoader, "loadLibraryWithDevice:bundle:", v16, v17));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("_")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", 0));
    v24 = (NSString *)objc_msgSend(v23, "copy");
    name = v20->_name;
    v20->_name = v24;

    v20->_vertexUniformsIndex = -1;
    v20->_fragmentUniformsIndex = -1;
    v20->_samplerStateIndex = -1;
    LOBYTE(v27) = 1;
    -[CRLMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:](v20, "p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:", v14, v15, v16, v21, v21, v18, v19, v27);

  }
  return v20;
}

- (id)initQuadTextureShaderWithFragmentShader:(id)a3 device:(id)a4 bundle:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CRLMetalShader *v17;
  void *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *name;
  uint64_t v29;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)CRLMetalShader;
  v17 = -[CRLMetalShader init](&v30, "init");
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMetalShaderLibraryLoader loadLibraryWithDevice:bundle:](CRLMetalShaderLibraryLoader, "loadLibraryWithDevice:bundle:", v13, v14));
    *(_QWORD *)&v20 = objc_opt_class(v17, v19).n128_u64[0];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v21, v20));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMetalShaderLibraryLoader loadLibraryWithDevice:bundle:](CRLMetalShaderLibraryLoader, "loadLibraryWithDevice:bundle:", v13, v22));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("_")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 0));
    v26 = (NSString *)objc_msgSend(v25, "copy");
    name = v17->_name;
    v17->_name = v26;

    v17->_vertexUniformsIndex = -1;
    v17->_fragmentUniformsIndex = -1;
    v17->_samplerStateIndex = -1;
    LOBYTE(v29) = 1;
    -[CRLMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:](v17, "p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:", CFSTR("CRLMetalShaderDefaultTexture_VertexShader"), v12, v13, v23, v18, v15, v16, v29);

  }
  return v17;
}

- (id)initQuadMotionBlurTextureShaderWithFragmentShader:(id)a3 device:(id)a4 bundle:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CRLMetalShader *v17;
  void *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *name;
  uint64_t v29;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)CRLMetalShader;
  v17 = -[CRLMetalShader init](&v30, "init");
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMetalShaderLibraryLoader loadLibraryWithDevice:bundle:](CRLMetalShaderLibraryLoader, "loadLibraryWithDevice:bundle:", v13, v14));
    *(_QWORD *)&v20 = objc_opt_class(v17, v19).n128_u64[0];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v21, v20));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMetalShaderLibraryLoader loadLibraryWithDevice:bundle:](CRLMetalShaderLibraryLoader, "loadLibraryWithDevice:bundle:", v13, v22));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("_")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 0));
    v26 = (NSString *)objc_msgSend(v25, "copy");
    name = v17->_name;
    v17->_name = v26;

    v17->_vertexUniformsIndex = -1;
    v17->_fragmentUniformsIndex = -1;
    v17->_samplerStateIndex = -1;
    LOBYTE(v29) = 1;
    -[CRLMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:](v17, "p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:", CFSTR("CRLMetalShaderDefaultMotionBlurTexture_VertexShader"), v12, v13, v23, v18, v15, v16, v29);

  }
  return v17;
}

- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  CRLMetalShader *v20;
  uint64_t v22;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("_")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
  v19 = objc_msgSend(v18, "copy");
  LOBYTE(v22) = 1;
  v20 = -[CRLMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupBindings:", v16, v15, v14, v13, v12, v19, v22);

  return v20;
}

- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6
{
  return -[CRLMetalShader initCustomShaderWithVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:](self, "initCustomShaderWithVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:", a3, a4, a5, a6, 0);
}

- (id)initQuadTextureShaderWithFragmentShader:(id)a3 device:(id)a4 bundle:(id)a5 colorAttachment:(id)a6
{
  return -[CRLMetalShader initQuadTextureShaderWithFragmentShader:device:bundle:colorAttachment:velocityAttachment:](self, "initQuadTextureShaderWithFragmentShader:device:bundle:colorAttachment:velocityAttachment:", a3, a4, a5, a6, 0);
}

- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 bundle:(id)a6 colorAttachment:(id)a7
{
  return -[CRLMetalShader initCustomShaderWithVertexShader:fragmentShader:device:bundle:colorAttachment:velocityAttachment:](self, "initCustomShaderWithVertexShader:fragmentShader:device:bundle:colorAttachment:velocityAttachment:", a3, a4, a5, a6, a7, 0);
}

- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4 fragmentBytes:(const void *)a5 samplerState:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = a3;
  v11 = a6;
  objc_msgSend(v10, "setRenderPipelineState:", self->_pipelineState);
  if (a4)
  {
    if ((self->_vertexUniformsIndex & 0x8000000000000000) == 0)
      objc_msgSend(v10, "setVertexBytes:length:atIndex:", a4, self->_vertexUniformsSize);
    if (a5)
      goto LABEL_5;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242410);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E08F9C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242430);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:samplerState:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 765, 0, "invalid nil value for '%{public}s'", "vertexBytes");

    if (a5)
    {
LABEL_5:
      if ((self->_fragmentUniformsIndex & 0x8000000000000000) == 0)
        objc_msgSend(v10, "setFragmentBytes:length:atIndex:", a5, self->_fragmentUniformsSize);
      if (!v11)
        goto LABEL_37;
LABEL_27:
      if (self->_samplerStateIndex < 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101242490);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E08E90();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012424B0);
        v18 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:samplerState:]"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 775, 0, "Sampler state given but not used.");

      }
      goto LABEL_37;
    }
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101242450);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E08F10();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101242470);
  v15 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:samplerState:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 770, 0, "invalid nil value for '%{public}s'", "fragmentBytes");

  if (v11)
    goto LABEL_27;
LABEL_37:
  if ((self->_samplerStateIndex & 0x8000000000000000) == 0)
    objc_msgSend(v10, "setFragmentSamplerState:atIndex:", v11);

}

- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4 fragmentBytes:(const void *)a5
{
  -[CRLMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:samplerState:](self, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:samplerState:", a3, a4, a5, self->_defaultSamplerState);
}

- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4
{
  -[CRLMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", a3, a4, 0);
}

- (void)setPipelineStateWithEncoder:(id)a3 fragmentBytes:(const void *)a4
{
  -[CRLMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", a3, 0, 0);
}

- (void)setPipelineStateWithEncoder:(id)a3
{
  objc_msgSend(a3, "setRenderPipelineState:", self->_pipelineState);
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLMetalShader;
  v3 = -[CRLMetalShader description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_claimAutoreleasedReturnValue(-[CRLMetalShader name](self, "name"));
  v6 = (void *)v5;
  v7 = CFSTR("Unnamed");
  if (v5)
    v7 = (const __CFString *)v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v4, v7));

  return v8;
}

- (MTLRenderPipelineState)pipelineState
{
  return self->_pipelineState;
}

- (MTLRenderPipelineReflection)pipelineReflectionObject
{
  return self->_pipelineReflectionObject;
}

- (unint64_t)bufferIndex
{
  return self->_bufferIndex;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pipelineReflectionObject, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_defaultSamplerState, 0);
}

@end
