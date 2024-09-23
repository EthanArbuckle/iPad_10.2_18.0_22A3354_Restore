@implementation PXStoryTransitionClip

- (PXStoryTransitionClip)initWithClipInfo:(id *)a3 originalClip:(id)a4
{
  id v7;
  PXStoryTransitionClip *v8;
  PXStoryTransitionClip *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryTransitionClip;
  v8 = -[PXStoryTransitionClip init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    memcpy(&v8->_clipInfo, a3, 0x300uLL);
    objc_storeStrong((id *)&v9->_originalClip, a4);
  }

  return v9;
}

- (int64_t)identifier
{
  int64_t v3;

  -[PXStoryTransitionClip clipInfo](self, "clipInfo");
  return v3;
}

- (PXStoryResource)resource
{
  void *v2;
  void *v3;

  -[PXStoryTransitionClip originalClip](self, "originalClip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXStoryResource *)v3;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)videoTimeRange
{
  void *v4;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  void *v6;

  -[PXStoryTransitionClip originalClip](self, "originalClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "videoTimeRange");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (PFStoryRecipeDisplayAssetNormalization)colorNormalization
{
  void *v2;
  void *v3;

  -[PXStoryTransitionClip originalClip](self, "originalClip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorNormalization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PFStoryRecipeDisplayAssetNormalization *)v3;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)playbackTimeRangeForClipDuration:(SEL)a3
{
  void *v6;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  void *v8;

  -[PXStoryTransitionClip originalClip](self, "originalClip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v6, "playbackTimeRangeForClipDuration:", a4);
    v6 = v8;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (BOOL)isEqualToClip:(id)a3
{
  PXStoryTransitionClip *v4;
  PXStoryTransitionClip *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXStoryTransitionClip *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryTransitionClip originalClip](self, "originalClip");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryTransitionClip originalClip](v5, "originalClip");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToClip:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isVisuallyEqualToClip:(id)a3
{
  PXStoryTransitionClip *v4;
  PXStoryTransitionClip *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXStoryTransitionClip *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[PXStoryTransitionClip isEqualToClip:](self, "isEqualToClip:", v5))
      {
        -[PXStoryTransitionClip originalClip](self, "originalClip");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryTransitionClip originalClip](v5, "originalClip");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v6, "isVisuallyEqualToClip:", v7);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithInfo:(id *)a3
{
  PXStoryTransitionClip *v5;
  void *v6;
  PXStoryTransitionClip *v7;
  _BYTE v9[768];

  v5 = [PXStoryTransitionClip alloc];
  -[PXStoryTransitionClip originalClip](self, "originalClip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(v9, a3, sizeof(v9));
  v7 = -[PXStoryTransitionClip initWithClipInfo:originalClip:](v5, "initWithClipInfo:originalClip:", v9, v6);

  return v7;
}

- ($C99EDD0FAA5CC172DE20AC79C6A499CF)clipInfo
{
  return ($C99EDD0FAA5CC172DE20AC79C6A499CF *)memcpy(retstr, &self->_clipInfo, 0x300uLL);
}

- (PXStoryClip)originalClip
{
  return self->_originalClip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalClip, 0);
}

@end
