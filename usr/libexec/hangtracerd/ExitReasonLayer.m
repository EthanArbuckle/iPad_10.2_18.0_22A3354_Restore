@implementation ExitReasonLayer

- (ExitReasonLayer)initWithNamespaceLayer:(id)a3 codeLayer:(id)a4
{
  id v7;
  id v8;
  ExitReasonLayer *v9;
  ExitReasonLayer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ExitReasonLayer;
  v9 = -[ExitReasonLayer init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_exitReasonNamespaceTextLayer, a3);
    objc_storeStrong((id *)&v10->_exitReasonCodeTextLayer, a4);
    -[ExitReasonLayer addSublayer:](v10, "addSublayer:", v10->_exitReasonNamespaceTextLayer);
    -[ExitReasonLayer addSublayer:](v10, "addSublayer:", v10->_exitReasonCodeTextLayer);
    v10->_spaceBetweenTextLayers = sub_100027DE4();
  }

  return v10;
}

- (void)nilifyCALayers
{
  CATextLayer *exitReasonNamespaceTextLayer;
  CATextLayer *exitReasonCodeTextLayer;

  exitReasonNamespaceTextLayer = self->_exitReasonNamespaceTextLayer;
  self->_exitReasonNamespaceTextLayer = 0;

  exitReasonCodeTextLayer = self->_exitReasonCodeTextLayer;
  self->_exitReasonCodeTextLayer = 0;

}

- (CGSize)preferredFrameSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  CGSize result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = &unk_10003C0FF;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExitReasonLayer sublayers](self, "sublayers"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014DE4;
  v8[3] = &unk_10004D540;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  v4 = v10[4];
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSublayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ExitReasonLayer;
  -[ExitReasonLayer layoutSublayers](&v17, "layoutSublayers");
  -[CATextLayer preferredFrameSize](self->_exitReasonNamespaceTextLayer, "preferredFrameSize");
  v4 = v3 + self->_spaceBetweenTextLayers;
  -[CATextLayer preferredFrameSize](self->_exitReasonCodeTextLayer, "preferredFrameSize");
  v6 = v4 + v5;
  -[ExitReasonLayer frame](self, "frame");
  v8 = fmax(v7 - v6, 0.0);
  -[CATextLayer preferredFrameSize](self->_exitReasonNamespaceTextLayer, "preferredFrameSize");
  v10 = v9;
  -[ExitReasonLayer frame](self, "frame");
  -[CATextLayer setFrame:](self->_exitReasonNamespaceTextLayer, "setFrame:", v8, 0.0, v10);
  -[CATextLayer frame](self->_exitReasonNamespaceTextLayer, "frame");
  v12 = v11;
  -[CATextLayer frame](self->_exitReasonNamespaceTextLayer, "frame");
  v14 = self->_spaceBetweenTextLayers + v12 + v13;
  -[CATextLayer preferredFrameSize](self->_exitReasonCodeTextLayer, "preferredFrameSize");
  v16 = v15;
  -[ExitReasonLayer frame](self, "frame");
  -[CATextLayer setFrame:](self->_exitReasonCodeTextLayer, "setFrame:", v14, 0.0, v16);
}

- (double)spaceBetweenTextLayers
{
  return self->_spaceBetweenTextLayers;
}

- (CATextLayer)exitReasonNamespaceTextLayer
{
  return self->_exitReasonNamespaceTextLayer;
}

- (CATextLayer)exitReasonCodeTextLayer
{
  return self->_exitReasonCodeTextLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitReasonCodeTextLayer, 0);
  objc_storeStrong((id *)&self->_exitReasonNamespaceTextLayer, 0);
}

@end
