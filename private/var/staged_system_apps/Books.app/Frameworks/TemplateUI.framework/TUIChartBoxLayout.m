@implementation TUIChartBoxLayout

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", a4);
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chartType"));
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("bar-chart"));

  if (v11)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifier"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "title"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "footer"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v30 = objc_msgSend(v35, "columns");
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v34, "cornerRadius");
    v13 = v12;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v33, "progress");
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v16, "spacing");
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "color"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "backgroundColor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "shadowColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBarChartView renderModelWithIdentifier:title:footer:columns:cornerRadius:progress:spacing:color:backgroundColor:shadowColor:](TUIBarChartView, "renderModelWithIdentifier:title:footer:columns:cornerRadius:progress:spacing:color:backgroundColor:shadowColor:", v29, v32, v31, v30, v20, v22, v13, v15, v18, v24));

    v26 = (void *)v29;
    v27 = v37;

  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "chartType"));
    objc_msgSend(v26, "isEqualToString:", CFSTR("circle-chart"));
    v25 = 0;
  }

  objc_msgSend(v25, "setSize:", v6, v8);
  return v25;
}

- (double)computeIntrinsicAspectRatio
{
  return 1.0;
}

@end
