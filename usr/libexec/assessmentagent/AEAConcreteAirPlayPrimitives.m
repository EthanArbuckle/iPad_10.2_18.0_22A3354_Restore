@implementation AEAConcreteAirPlayPrimitives

- (AEAConcreteAirPlayPrimitives)init
{
  AEAConcreteAirPlayPrimitives *v2;
  uint64_t v3;
  AVOutputContext *outputContext;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEAConcreteAirPlayPrimitives;
  v2 = -[AEAConcreteAirPlayPrimitives init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[AVOutputContext sharedSystemScreenContext](AVOutputContext, "sharedSystemScreenContext"));
    outputContext = v2->_outputContext;
    v2->_outputContext = (AVOutputContext *)v3;

  }
  return v2;
}

- (void)stopAirPlayingWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (self)
    self = (AEAConcreteAirPlayPrimitives *)self->_outputContext;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000042D0;
  v6[3] = &unk_1000817B0;
  v7 = v4;
  v5 = v4;
  -[AEAConcreteAirPlayPrimitives setOutputDevice:options:completionHandler:](self, "setOutputDevice:options:completionHandler:", 0, 0, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContext, 0);
}

@end
