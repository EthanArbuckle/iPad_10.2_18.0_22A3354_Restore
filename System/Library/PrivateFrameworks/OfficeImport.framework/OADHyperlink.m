@implementation OADHyperlink

- (OADHyperlink)init
{
  OADHyperlink *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADHyperlink;
  result = -[OADHyperlink init](&v3, sel_init);
  if (result)
  {
    result->mTargetMode = 0;
    *(_WORD *)&result->mDoEndSound = 0;
    result->mDoAddToHistory = 1;
  }
  return result;
}

- (void)setTargetLocation:(id)a3
{
  objc_storeStrong((id *)&self->mTargetLocation, a3);
}

- (void)setTargetMode:(int)a3
{
  self->mTargetMode = a3;
}

- (void)setTargetFrame:(id)a3
{
  objc_storeStrong((id *)&self->mTargetFrame, a3);
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->mAction, a3);
}

- (void)setTooltip:(id)a3
{
  objc_storeStrong((id *)&self->mTooltip, a3);
}

- (void)setInvalidUrl:(id)a3
{
  objc_storeStrong((id *)&self->mInvalidUrl, a3);
}

- (void)setDoEndSound:(BOOL)a3
{
  self->mDoEndSound = a3;
}

- (void)setIsVisited:(BOOL)a3
{
  self->mIsVisited = a3;
}

- (void)setDoAddToHistory:(BOOL)a3
{
  self->mDoAddToHistory = a3;
}

- (id)action
{
  return self->mAction;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSURL *mTargetLocation;
  void *v6;
  int mTargetMode;
  NSString *mAction;
  void *v9;
  NSString *mTooltip;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mTargetLocation = self->mTargetLocation;
    objc_msgSend(v4, "targetLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSURL isEqual:](mTargetLocation, "isEqual:", v6)
      && (mTargetMode = self->mTargetMode, mTargetMode == objc_msgSend(v4, "targetMode")))
    {
      mAction = self->mAction;
      objc_msgSend(v4, "action");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](mAction, "isEqualToString:", v9))
      {
        mTooltip = self->mTooltip;
        objc_msgSend(v4, "tooltip");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSString isEqualToString:](mTooltip, "isEqualToString:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)targetLocation
{
  return self->mTargetLocation;
}

- (int)targetMode
{
  return self->mTargetMode;
}

- (id)targetFrame
{
  return self->mTargetFrame;
}

- (id)tooltip
{
  return self->mTooltip;
}

- (id)invalidUrl
{
  return self->mInvalidUrl;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSURL hash](self->mTargetLocation, "hash") ^ self->mTargetMode;
  v4 = -[NSString hash](self->mAction, "hash");
  return v3 ^ v4 ^ -[NSString hash](self->mTooltip, "hash");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADHyperlink;
  -[OADHyperlink description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)doEndSound
{
  return self->mDoEndSound;
}

- (BOOL)isVisited
{
  return self->mIsVisited;
}

- (BOOL)doAddToHistory
{
  return self->mDoAddToHistory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mInvalidUrl, 0);
  objc_storeStrong((id *)&self->mTooltip, 0);
  objc_storeStrong((id *)&self->mAction, 0);
  objc_storeStrong((id *)&self->mTargetFrame, 0);
  objc_storeStrong((id *)&self->mTargetLocation, 0);
}

@end
