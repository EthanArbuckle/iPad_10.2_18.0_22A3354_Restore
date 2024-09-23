@implementation VIStreamingSignalExtractionRequest

- (VIStreamingSignalExtractionRequest)initWithObjectUUID:(id)a3 highResolutionFrame:(id)a4 queryContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  VIStreamingSignalExtractionRequest *v11;
  uint64_t v12;
  NSUUID *objectUUID;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VIStreamingSignalExtractionRequest;
  v11 = -[VIStreamingSignalExtractionRequest init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    objectUUID = v11->_objectUUID;
    v11->_objectUUID = (NSUUID *)v12;

    objc_storeStrong((id *)&v11->_highResolutionFrame, a4);
    objc_storeStrong((id *)&v11->_queryContext, a5);
  }

  return v11;
}

- (NSUUID)objectUUID
{
  return self->_objectUUID;
}

- (VIStreamingFrame)highResolutionFrame
{
  return self->_highResolutionFrame;
}

- (VIQueryContext)queryContext
{
  return self->_queryContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_highResolutionFrame, 0);
  objc_storeStrong((id *)&self->_objectUUID, 0);
}

@end
