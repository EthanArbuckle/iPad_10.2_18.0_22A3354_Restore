@implementation RCPVizualizerView

- (void)setRecapMovie:(id)a3
{
  id v5;
  id v6;
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
  void *v17;
  void *v18;
  RCPTraceLayer *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  objc_storeStrong((id *)&self->_recapMovie, a3);
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0C8B300]);
  -[RCPVizualizerView recapMovie](self, "recapMovie");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screenRecording");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v6, "initWithAsset:", v8);

  objc_msgSend(MEMORY[0x1E0C8B2E8], "playerWithPlayerItem:", v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPVizualizerView setPlayer:](self, "setPlayer:", v9);

  v10 = (void *)MEMORY[0x1E0C8B330];
  -[RCPVizualizerView player](self, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playerLayerWithPlayer:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPVizualizerView setPlayerLayer:](self, "setPlayerLayer:", v12);

  -[RCPVizualizerView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPVizualizerView playerLayer](self, "playerLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSublayer:", v14);

  -[RCPVizualizerView player](self, "player");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pause");

  v16 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  -[RCPVizualizerView setScreenshotLayer:](self, "setScreenshotLayer:", v16);

  -[RCPVizualizerView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPVizualizerView screenshotLayer](self, "screenshotLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", v18);

  v19 = objc_alloc_init(RCPTraceLayer);
  -[RCPVizualizerView setTraceLayer:](self, "setTraceLayer:", v19);

  -[RCPVizualizerView recapMovie](self, "recapMovie");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "eventStream");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPVizualizerView traceLayer](self, "traceLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEventStream:", v21);

  -[RCPVizualizerView recapMovie](self, "recapMovie");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "interfaceOrientation");
  -[RCPVizualizerView traceLayer](self, "traceLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setInterfaceOrientation:", v24);

  -[RCPVizualizerView layer](self, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPVizualizerView traceLayer](self, "traceLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSublayer:", v27);

  -[RCPVizualizerView recapMovie](self, "recapMovie");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPVizualizerView setTime:](self, "setTime:", objc_msgSend(v28, "startTimestamp"));

}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCPVizualizerView;
  -[RCPVizualizerView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[RCPVizualizerView layout](self, "layout");
}

- (void)layout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[RCPVizualizerView screenRect](self, "screenRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[RCPVizualizerView traceLayer](self, "traceLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[RCPVizualizerView screenshotLayer](self, "screenshotLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  -[RCPVizualizerView playerLayer](self, "playerLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)timelineView:(id)a3 didSetTime:(unint64_t)a4
{
  -[RCPVizualizerView setTime:](self, "setTime:", a4);
}

- (void)setTime:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
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
  int32_t v21;
  unint64_t v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unint64_t time;
  void *v31;
  unint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  CMTime v42;
  CMTime v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  self->_time = a3;
  -[RCPVizualizerView traceLayer](self, "traceLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTime:", a3);

  -[RCPVizualizerView recapMovie](self, "recapMovie");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "startTimestamp");
  -[RCPVizualizerView recapMovie](self, "recapMovie");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    v10 = objc_msgSend(v8, "startTimestamp");
  }
  else
  {
    objc_msgSend(v8, "eventStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "events");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "timestamp");

  }
  -[RCPVizualizerView recapMovie](self, "recapMovie");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "environment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[RCPVizualizerView player](self, "player");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "asset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "duration");
    v21 = v45;
  }
  else
  {
    v21 = 0;
    v44 = 0;
    v45 = 0;
    v46 = 0;
  }

  v22 = a3 - v10;
  if (a3 < v10)
    v22 = 0;
  memset(&v43, 0, sizeof(v43));
  v23 = (double)v22;
  objc_msgSend(v16, "timeScale");
  CMTimeMakeWithSeconds(&v43, v24 * v23 / 1000000000.0, v21);
  -[RCPVizualizerView player](self, "player");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "currentItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v43;
  v40 = *MEMORY[0x1E0CA2E68];
  v41 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v38 = v40;
  v39 = v41;
  objc_msgSend(v26, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v42, &v40, &v38, 0);

  -[RCPVizualizerView recapMovie](self, "recapMovie");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "screenshot");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
  {

    goto LABEL_13;
  }
  v29 = (void *)v28;
  time = self->_time;
  -[RCPVizualizerView recapMovie](self, "recapMovie");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "endTimestamp");

  if (time < v32)
  {
LABEL_13:
    -[RCPVizualizerView screenshotLayer](self, "screenshotLayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setContents:", 0);
    goto LABEL_14;
  }
  -[RCPVizualizerView recapMovie](self, "recapMovie");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "screenshot");
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v35 = objc_msgSend(v34, "CGImage");
  -[RCPVizualizerView screenshotLayer](self, "screenshotLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setContents:", v35);

LABEL_14:
  -[RCPVizualizerView traceLayer](self, "traceLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setNeedsDisplay");

}

- (BOOL)isFlipped
{
  return 1;
}

- (CGRect)screenRect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  -[RCPVizualizerView recapMovie](self, "recapMovie");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  v9 = v8;
  v11 = v10;

  -[RCPVizualizerView recapMovie](self, "recapMovie");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "interfaceOrientation"))
  {
    -[RCPVizualizerView recapMovie](self, "recapMovie");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "interfaceOrientation");

    if (v14 == 1)
      v15 = v11;
    else
      v15 = v9;
    if (v14 != 1)
      v9 = v11;
    v11 = v15;
  }
  else
  {

  }
  -[RCPVizualizerView bounds](self, "bounds");
  v18 = v17 / v9;
  if (v17 / v9 >= v16 / v11)
    v18 = v16 / v11;
  v19 = v9 * v18;
  v20 = v11 * v18;
  -[RCPVizualizerView bounds](self, "bounds");
  v25 = DKDCenterRectOverRect(0.0, 0.0, v19, v20, v21, v22, v23, v24);
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (unint64_t)time
{
  return self->_time;
}

- (RCPMovie)recapMovie
{
  return self->_recapMovie;
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_playerLayer, a3);
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (RCPTraceLayer)traceLayer
{
  return self->_traceLayer;
}

- (void)setTraceLayer:(id)a3
{
  objc_storeStrong((id *)&self->_traceLayer, a3);
}

- (CALayer)screenshotLayer
{
  return self->_screenshotLayer;
}

- (void)setScreenshotLayer:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshotLayer, 0);
  objc_storeStrong((id *)&self->_traceLayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_recapMovie, 0);
}

@end
