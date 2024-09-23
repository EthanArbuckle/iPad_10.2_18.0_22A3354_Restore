@implementation PDAnimationInfo

- (void)setEntranceData:(id)a3
{
  objc_storeStrong((id *)&self->mEntrance, a3);
}

- (id)entranceData
{
  return self->mEntrance;
}

- (void)setExitData:(id)a3
{
  objc_storeStrong((id *)&self->mExit, a3);
}

- (id)exitData
{
  return self->mExit;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDAnimationInfo;
  -[PDAnimationInfo description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PDAnimationInfoData)mediaData
{
  return self->mMedia;
}

- (void)setMediaData:(id)a3
{
  objc_storeStrong((id *)&self->mMedia, a3);
}

- (PDMediaNode)mediaNode
{
  return self->mediaNode;
}

- (void)setMediaNode:(id)a3
{
  objc_storeStrong((id *)&self->mediaNode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mediaNode, 0);
  objc_storeStrong((id *)&self->mMedia, 0);
  objc_storeStrong((id *)&self->mExit, 0);
  objc_storeStrong((id *)&self->mEntrance, 0);
}

@end
