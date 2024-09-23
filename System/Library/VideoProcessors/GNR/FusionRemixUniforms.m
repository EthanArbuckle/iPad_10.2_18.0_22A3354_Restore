@implementation FusionRemixUniforms

- (FusionRemixUniforms)initWithMetal:(id)a3
{
  id v4;
  void *v5;
  MTLBuffer *v6;
  MTLBuffer *fragUniBufSBP;
  void *v8;
  MTLBuffer *v9;
  MTLBuffer *fragUniBufInt;
  void *v11;
  MTLBuffer *v12;
  MTLBuffer *vertexUniBufSBP;
  FusionRemixUniforms *v14;
  FusionRemixUniforms *v15;
  int v17;

  v4 = a3;
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (MTLBuffer *)objc_msgSend(v5, "newBufferWithLength:options:", 368, 0);
  fragUniBufSBP = self->_fragUniBufSBP;
  self->_fragUniBufSBP = v6;

  if (!self->_fragUniBufSBP)
    goto LABEL_7;
  objc_msgSend(v4, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (MTLBuffer *)objc_msgSend(v8, "newBufferWithLength:options:", 96, 0);
  fragUniBufInt = self->_fragUniBufInt;
  self->_fragUniBufInt = v9;

  if (!self->_fragUniBufInt)
    goto LABEL_7;
  objc_msgSend(v4, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (MTLBuffer *)objc_msgSend(v11, "newBufferWithLength:options:", 256, 0);
  vertexUniBufSBP = self->_vertexUniBufSBP;
  self->_vertexUniBufSBP = v12;

  if (self->_vertexUniBufSBP)
  {
    self->_ptr2FragBufSBP = (FusionRemixStageUniformsSBP *)-[MTLBuffer contents](self->_fragUniBufSBP, "contents");
    self->_ptr2FragBufInt = (FusionRemixStageUniformsInternal *)-[MTLBuffer contents](self->_fragUniBufInt, "contents");
    self->_ptr2VertBufSBP = (FusionRemixStageUniformsVertex *)-[MTLBuffer contents](self->_vertexUniBufSBP, "contents");
  }
  else
  {
LABEL_7:
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = FigSignalErrorAt();
    v14 = 0;
    if (v17)
      goto LABEL_6;
  }
  v14 = self;
LABEL_6:
  v15 = v14;

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragUniBufInt, 0);
  objc_storeStrong((id *)&self->_vertexUniBufSBP, 0);
  objc_storeStrong((id *)&self->_fragUniBufSBP, 0);
}

@end
