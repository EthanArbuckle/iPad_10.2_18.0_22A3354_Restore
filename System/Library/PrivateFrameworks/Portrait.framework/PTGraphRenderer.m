@implementation PTGraphRenderer

- (PTGraphRenderer)initWithMetalContext:(id)a3 range:(int)a4 samples:(int)a5 sequences:(id)a6 title:
{
  id v8;
  PTGraphRenderer *v9;
  PTGraphRenderer *v10;
  PTGraphRenderer *v11;

  v8 = a3;
  v9 = -[PTGraphRenderer init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metalContext, a3);
    v11 = v10;
  }

  return v10;
}

- (void)updateWithSequenceId:(int)a3 value:(float)a4 frameIndex:(int)a5
{
  id v8;
  uint64_t v9;

  -[NSMutableArray objectAtIndexedSubscript:](self->_buffers, "objectAtIndexedSubscript:", a3);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "contents");

  *(float *)(v9 + 4 * (a5 % self->_samples)) = a4;
}

- (void)updateWithSequenceId:(int)a3 buffer:(id)a4 offset:(unint64_t)a5 frameIndex:(int)a6
{
  double v6;

  LODWORD(v6) = 1.0;
  -[PTGraphRenderer updateWithSequenceId:buffer:offset:scale:frameIndex:](self, "updateWithSequenceId:buffer:offset:scale:frameIndex:", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6, v6);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_updateGraphSequenceWithTextureSample, 0);
  objc_storeStrong((id *)&self->_updateGraphSequenceWithBuffer, 0);
  objc_storeStrong((id *)&self->_renderGraphToRegion, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
