@implementation OspreyMessageProducer

- (OspreyMessageProducer)initWithMessageSerializer:(id)a3 streamingContext:(id)a4
{
  id v6;
  id v7;
  OspreyMessageProducer *v8;
  uint64_t v9;
  id serializer;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OspreyMessageProducer;
  v8 = -[OspreyMessageProducer init](&v12, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x1BCCC5138](v6);
    serializer = v8->_serializer;
    v8->_serializer = (id)v9;

    objc_storeStrong((id *)&v8->_streamingContext, a4);
  }

  return v8;
}

- (void)produceMessage:(id)a3
{
  id v4;

  (*((void (**)(void))self->_serializer + 2))();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OspreyClientStreamingContext writeFrame:](self->_streamingContext, "writeFrame:", v4);

}

- (void)produceMessage:(id)a3 compressed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  (*((void (**)(void))self->_serializer + 2))();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[OspreyClientStreamingContext writeFrame:compressed:](self->_streamingContext, "writeFrame:compressed:", v6, v4);

}

- (void)finishProducing
{
  -[OspreyClientStreamingContext finishWriting](self->_streamingContext, "finishWriting");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingContext, 0);
  objc_storeStrong(&self->_serializer, 0);
}

@end
