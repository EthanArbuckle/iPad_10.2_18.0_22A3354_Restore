@implementation CACGestureLivePreviewViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CACGestureLivePreviewViewController;
  -[CACGestureLivePreviewViewController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACGestureLivePreviewViewController setMappedPathEffectViews:](self, "setMappedPathEffectViews:", v3);

}

- (void)addPointsToLiveRecordingGesturePreviewByFingerIdentifier:(id)a3 forces:(id)a4 atTime:(double)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v27;
    *(_QWORD *)&v10 = 138412290;
    v25 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
        -[CACGestureLivePreviewViewController mappedPathEffectViews](self, "mappedPathEffectViews", v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          -[CACGestureLivePreviewViewController mappedPathEffectViews](self, "mappedPathEffectViews");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[CACGestureLivePreviewViewController newPathEffectView](self, "newPathEffectView");
          objc_msgSend(v17, "setObject:forKey:", v18, v14);

          CACLogGestureRecording();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v25;
            v31 = v14;
            _os_log_debug_impl(&dword_229A40000, v19, OS_LOG_TYPE_DEBUG, "Creating new path view for finger %@", buf, 0xCu);
          }

        }
        objc_msgSend(v7, "objectForKey:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "CGPointValue");
        v22 = v21;
        v24 = v23;

        objc_msgSend(v16, "addPoint:force:timestamp:", v22, v24, 1.0, a5);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v11);
  }

}

- (void)removeTrackingForFingerIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  CACLogGestureRecording();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CACGestureLivePreviewViewController removeTrackingForFingerIdentifier:].cold.1((uint64_t)v4, v5);

  -[CACGestureLivePreviewViewController mappedPathEffectViews](self, "mappedPathEffectViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "buildOut");
  -[CACGestureLivePreviewViewController mappedPathEffectViews](self, "mappedPathEffectViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v4);

}

- (id)newPathEffectView
{
  CACGestureLivePreviewPathEffectView *v3;
  CACGestureLivePreviewPathEffectView *v4;
  _BOOL4 v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  v3 = [CACGestureLivePreviewPathEffectView alloc];
  v4 = -[CACGestureLivePreviewPathEffectView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[CACGestureLivePreviewPathEffectView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = CACIsInDarkMode();
  v6 = 0.6;
  if (v5)
    v6 = 0.7;
  -[CACGestureLivePreviewPathEffectView setAlpha:](v4, "setAlpha:", v6);
  -[CACGestureLivePreviewViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v4);
  v17 = (void *)MEMORY[0x24BDD1628];
  -[CACGestureLivePreviewPathEffectView leftAnchor](v4, "leftAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  -[CACGestureLivePreviewPathEffectView rightAnchor](v4, "rightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  -[CACGestureLivePreviewPathEffectView bottomAnchor](v4, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v11;
  -[CACGestureLivePreviewPathEffectView topAnchor](v4, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v15);

  return v4;
}

- (BOOL)isOverlay
{
  return 1;
}

- (int64_t)zOrder
{
  return 4;
}

- (NSMutableDictionary)mappedPathEffectViews
{
  return self->_mappedPathEffectViews;
}

- (void)setMappedPathEffectViews:(id)a3
{
  objc_storeStrong((id *)&self->_mappedPathEffectViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappedPathEffectViews, 0);
}

- (void)removeTrackingForFingerIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_229A40000, a2, OS_LOG_TYPE_DEBUG, "Removing path view for finger %@", (uint8_t *)&v2, 0xCu);
}

@end
