@implementation _TUIMicaPlayerBoxLayout

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _TUIMicaPlayerLayerConfig *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  TUIRenderModelLayer *v36;
  void *v37;
  void *v38;
  void *v40;
  unsigned int v41;
  _TUIMicaPlayerLayerConfig *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v6 = a4;
  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v6);
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "urlString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "baseURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:", v12, v14));

  if (a3 < 3)
  {
    v36 = 0;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    v52 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "manager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resourceRegistry"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "resourceKind"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fileProviderForKind:", v20));

    v21 = [_TUIMicaPlayerLayerConfig alloc];
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "gravity"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "textKey"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "textValue"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v41 = objc_msgSend(v46, "shouldStartAtEnd");
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "triggerName"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v24 = objc_msgSend(v44, "targetTriggerState");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v25, "triggerDelay");
    v27 = v26;
    v48 = v6;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environment"));
    objc_msgSend(v28, "contentsScale");
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v31, "opacity");
    v33 = v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fontSpec"));
    v42 = -[_TUIMicaPlayerLayerConfig initWithURL:gravity:textKey:textValue:shouldStartAtEnd:triggerName:targetTriggerState:triggerDelay:contentScale:opacity:fontSpec:fileProvider:](v21, "initWithURL:gravity:textKey:textValue:shouldStartAtEnd:triggerName:targetTriggerState:triggerDelay:contentScale:opacity:fontSpec:fileProvider:", v52, v22, v23, v43, v41, v40, v27, v30, v33, v24, v35, v51);

    v6 = v48;
    v36 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v42, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifier"));
    -[TUIRenderModelLayer setIdentifier:](v36, "setIdentifier:", v38);

    v15 = v52;
    -[TUIRenderModelLayer setSize:](v36, "setSize:", v8, v10);

  }
  return v36;
}

- (double)computeIntrinsicAspectRatio
{
  return 1.0;
}

@end
