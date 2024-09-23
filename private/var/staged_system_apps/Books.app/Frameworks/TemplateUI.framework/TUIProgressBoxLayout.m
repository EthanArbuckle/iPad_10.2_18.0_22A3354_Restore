@implementation TUIProgressBoxLayout

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", a4);
  if (a3 < 4)
    return 0;
  v8 = v6;
  v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "progressMode"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("activityIndicator"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUISpinnerView renderModelWithIdentifier:](TUISpinnerView, "renderModelWithIdentifier:", v14));
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "progressId"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "progressMode"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v25, "progress");
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dynamicProgress"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v21 = objc_msgSend(v20, "paused");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "color"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUIProgressView renderModelWithIdentifier:progressId:mode:value:dynamicProgress:paused:color:](TUIProgressView, "renderModelWithIdentifier:progressId:mode:value:dynamicProgress:paused:color:", v14, v28, v26, v19, v21, v23, v17));

  }
  objc_msgSend(v15, "setSize:", v8, v9);
  return v15;
}

- (double)computeIntrinsicAspectRatio
{
  return 1.0;
}

@end
