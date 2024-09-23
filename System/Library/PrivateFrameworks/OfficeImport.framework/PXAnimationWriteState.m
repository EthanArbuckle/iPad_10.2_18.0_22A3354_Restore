@implementation PXAnimationWriteState

- (PXAnimationWriteState)initWithWriteState:(id)a3 file:(id)a4
{
  id v7;
  id v8;
  PXAnimationWriteState *v9;
  PXAnimationWriteState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXAnimationWriteState;
  v9 = -[PXAnimationWriteState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mWriteState, a3);
    objc_storeStrong((id *)&v10->mFile, a4);
    v10->mCommonTimeNodeDataId = 0;
  }

  return v10;
}

- (unint64_t)newCommonTimeNodeDataId
{
  unint64_t v2;

  v2 = self->mCommonTimeNodeDataId + 1;
  self->mCommonTimeNodeDataId = v2;
  return v2;
}

- (BOOL)hasMainSeqTimeNodeId
{
  return self->mHasMainSeqTimeNodeId;
}

- (void)setMainSeqTimeNodeId:(unint64_t)a3
{
  self->mHasMainSeqTimeNodeId = 1;
  self->mMainSeqTimeNodeId = a3;
}

- (unint64_t)mainSeqTimeNodeId
{
  return self->mMainSeqTimeNodeId;
}

- (OCXWriteState)writeState
{
  return self->mWriteState;
}

- (void)setWriteState:(id)a3
{
  objc_storeStrong((id *)&self->mWriteState, a3);
}

- (TCXmlPrefixStreamWriter)file
{
  return self->mFile;
}

- (void)setFile:(id)a3
{
  objc_storeStrong((id *)&self->mFile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFile, 0);
  objc_storeStrong((id *)&self->mWriteState, 0);
}

@end
