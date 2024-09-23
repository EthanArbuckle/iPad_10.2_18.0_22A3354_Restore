@implementation VisionCoreSparseOpticalFlowResult

- (VisionCoreSparseOpticalFlowResult)initWithQuadUUID:(id)a3 srcKeypoints:(id)a4 dstKeypoints:(id)a5
{
  id v9;
  id v10;
  id v11;
  VisionCoreSparseOpticalFlowResult *v12;
  VisionCoreSparseOpticalFlowResult *v13;
  uint64_t v14;
  NSArray *srcPts;
  uint64_t v16;
  NSArray *dstPts;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VisionCoreSparseOpticalFlowResult;
  v12 = -[VisionCoreSparseOpticalFlowResult init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    v14 = objc_msgSend(v10, "copy");
    srcPts = v13->_srcPts;
    v13->_srcPts = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    dstPts = v13->_dstPts;
    v13->_dstPts = (NSArray *)v16;

  }
  return v13;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSArray)srcPts
{
  return self->_srcPts;
}

- (NSArray)dstPts
{
  return self->_dstPts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dstPts, 0);
  objc_storeStrong((id *)&self->_srcPts, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
