@implementation VIStreamingParseRequest

- (VIStreamingParseRequest)initWithFrame:(id)a3
{
  id v5;
  VIStreamingParseRequest *v6;
  VIStreamingParseRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIStreamingParseRequest;
  v6 = -[VIStreamingParseRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_frame, a3);

  return v7;
}

- (VIStreamingFrame)frame
{
  return self->_frame;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frame, 0);
}

@end
