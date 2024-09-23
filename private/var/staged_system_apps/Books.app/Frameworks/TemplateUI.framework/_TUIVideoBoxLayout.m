@implementation _TUIVideoBoxLayout

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  _TUIVideoBoxLayout *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  unsigned int v38;
  unsigned int v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;

  if (a3 < 4)
    return 0;
  v42 = a4;
  v5 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "urlString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "baseUrl"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v7, v8));

  -[TUILayout computedNaturalSize](v5, "computedNaturalSize");
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](v5, "controller"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "manager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageResourceCache"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v5, "box"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "posterFrameUrlString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v5, "box"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "baseUrl"));
  objc_msgSend(v42, "contentsScale");
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageResourceForTemplatedURL:baseURL:naturalSize:contentsScale:", v17, v19, v10, v12, v20));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "videoId"));
  v39 = objc_msgSend(v6, "loop");
  v38 = objc_msgSend(v6, "muted");
  v37 = objc_msgSend(v6, "allowFullScreen");
  LOBYTE(v19) = objc_msgSend(v6, "autoPlay");
  LOBYTE(v13) = objc_msgSend(v6, "showPlaybackControls");
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gravity"));
  objc_msgSend(v6, "cornerRadius");
  v23 = v22;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topTriggerName"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomTriggerName"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leftTriggerName"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rightTriggerName"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionHandler"));
  BYTE2(v34) = (_BYTE)v13;
  BYTE1(v34) = (_BYTE)v19;
  LOBYTE(v34) = v37;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[TUIVideoView renderModelWithIdentifier:url:posterFrameResource:videoId:loop:muted:allowFullScreen:autoPlay:showPlaybackControls:gravity:cornerRadius:topTriggerName:bottomTriggerName:leftTriggerName:rightTriggerName:actionHandler:](TUIVideoView, "renderModelWithIdentifier:url:posterFrameResource:videoId:loop:muted:allowFullScreen:autoPlay:showPlaybackControls:gravity:cornerRadius:topTriggerName:bottomTriggerName:leftTriggerName:rightTriggerName:actionHandler:", v21, v43, v41, v40, v39, v38, v23, v34, v36, v35, v24, v25, v26, v27));

  -[TUILayout renderModelSizeWithContext:](v5, "renderModelSizeWithContext:", v42);
  v30 = v29;
  v32 = v31;

  objc_msgSend(v28, "setSize:", v30, v32);
  return v28;
}

- (void)appendAnchorsToSet:(id)a3 inRoot:(id)a4
{
  id v6;
  id v7;
  char *v8;
  double y;
  double v10;
  double v11;
  double v12;
  TUITrigger *v13;
  void *v14;
  void *v15;
  TUITrigger *v16;
  TUITrigger *v17;
  void *v18;
  void *v19;
  TUITrigger *v20;
  double v21;
  double v22;
  double v23;
  TUITrigger *v24;
  void *v25;
  void *v26;
  TUITrigger *v27;
  TUITrigger *v28;
  void *v29;
  void *v30;
  TUITrigger *v31;
  objc_super v32;

  v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_TUIVideoBoxLayout;
  v7 = a4;
  -[TUILayout appendAnchorsToSet:inRoot:](&v32, "appendAnchorsToSet:inRoot:", v6, v7);
  v8 = (char *)objc_msgSend(v6, "axis");
  -[TUILayout computedTransformInAncestorLayout:](self, "computedTransformInAncestorLayout:", v7);

  y = CGPointZero.y;
  v10 = y * 0.0 + 0.0 * CGPointZero.x + 0.0;
  -[TUILayout computeHeight](self, "computeHeight");
  v12 = v10 + v11;
  v13 = [TUITrigger alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topTriggerName"));
  v16 = -[TUITrigger initWithName:](v13, "initWithName:", v15);

  v17 = [TUITrigger alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomTriggerName"));
  v20 = -[TUITrigger initWithName:](v17, "initWithName:", v19);

  objc_msgSend(v6, "appendTriggerAnchorWithOffset:trigger:axis:", v16, 2, v10);
  objc_msgSend(v6, "appendTriggerAnchorWithOffset:trigger:axis:", v20, 2, v12);
  if (v8 == (_BYTE *)&dword_0 + 1)
  {
    v21 = y * 0.0 + 0.0 * CGPointZero.x + 0.0;
    -[TUILayout computeWidth](self, "computeWidth");
    v23 = v21 + v22;
    v24 = [TUITrigger alloc];
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leftTriggerName"));
    v27 = -[TUITrigger initWithName:](v24, "initWithName:", v26);

    v28 = [TUITrigger alloc];
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "rightTriggerName"));
    v31 = -[TUITrigger initWithName:](v28, "initWithName:", v30);

    objc_msgSend(v6, "appendTriggerAnchorWithOffset:trigger:axis:", v27, 1, v21);
    objc_msgSend(v6, "appendTriggerAnchorWithOffset:trigger:axis:", v31, 1, v23);

  }
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TUIVideoBoxLayout;
  v6 = -[TUILayout axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:](&v9, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", a3, a4, a6, a5.x, a5.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "setShouldVendControlView:", 1);
  return v7;
}

@end
