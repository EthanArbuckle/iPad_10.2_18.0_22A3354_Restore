@implementation FTTextToSpeechStreamingStreamingContext

- (FTTextToSpeechStreamingStreamingContext)initWithGRPCStreamingCallContext:(id)a3
{
  id v5;
  FTTextToSpeechStreamingStreamingContext *v6;
  FTTextToSpeechStreamingStreamingContext *v7;
  FTTextToSpeechStreamingStreamingContext *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FTTextToSpeechStreamingStreamingContext;
  v6 = -[FTTextToSpeechStreamingStreamingContext init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_grpcContext, a3);
    v8 = v7;
  }

  return v7;
}

- (void)sendTextToSpeechStreamingStreamingRequest:(id)a3
{
  id v4;

  objc_msgSend(a3, "flatbuffData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OspreyClientStreamingContext writeFrame:](self->_grpcContext, "writeFrame:");

}

- (void)closeStream
{
  -[OspreyClientStreamingContext finishWriting](self->_grpcContext, "finishWriting");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grpcContext, 0);
}

@end
