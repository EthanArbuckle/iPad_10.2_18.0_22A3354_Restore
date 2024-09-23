@implementation PXStoryDummyClip

- (PXStoryDummyClip)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDummyClip.m"), 22, CFSTR("%s is not available as initializer"), "-[PXStoryDummyClip init]");

  abort();
}

- (PXStoryDummyClip)initWithInfo:(id *)a3 resource:(id)a4 resourceOccurrenceIndex:(int64_t)a5
{
  id v9;
  PXStoryDummyClip *v10;
  PXStoryDummyClip *v11;
  uint64_t v12;
  NSString *resourceIdentifier;
  PFStoryRecipeDisplayAssetNormalization *colorNormalization;
  objc_super v16;

  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryDummyClip;
  v10 = -[PXStoryDummyClip init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_identifier = a3->var0;
    memcpy(&v10->_info, a3, 0x300uLL);
    objc_storeStrong((id *)&v11->_resource, a4);
    -[PXStoryResource px_storyResourceIdentifier](v11->_resource, "px_storyResourceIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    resourceIdentifier = v11->_resourceIdentifier;
    v11->_resourceIdentifier = (NSString *)v12;

    v11->_resourceOccurrenceIndex = a5;
    *(_OWORD *)&v11->_videoTimeRange.start.value = 0u;
    *(_OWORD *)&v11->_videoTimeRange.start.epoch = 0u;
    *(_OWORD *)&v11->_videoTimeRange.duration.timescale = 0u;
    colorNormalization = v11->_colorNormalization;
    v11->_colorNormalization = 0;

  }
  return v11;
}

- (BOOL)isEqualToClip:(id)a3
{
  PXStoryDummyClip *v4;
  PXStoryDummyClip *v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;

  v4 = (PXStoryDummyClip *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryDummyClip resourceIdentifier](self, "resourceIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryDummyClip resourceIdentifier](v5, "resourceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        v8 = -[PXStoryDummyClip resourceOccurrenceIndex](self, "resourceOccurrenceIndex");
        v9 = v8 == -[PXStoryDummyClip resourceOccurrenceIndex](v5, "resourceOccurrenceIndex");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXStoryDummyClip resourceIdentifier](self, "resourceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isVisuallyEqualToClip:(id)a3
{
  PXStoryDummyClip *v4;
  PXStoryDummyClip *v5;
  BOOL v6;
  char v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v4 = (PXStoryDummyClip *)a3;
  if (v4 == self)
  {
    v7 = 1;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_15;
  }
  v5 = v4;
  if (!-[PXStoryDummyClip isEqualToClip:](self, "isEqualToClip:", v5)
    || self->_info.playbackStyle != v5->_info.playbackStyle)
  {
    goto LABEL_11;
  }
  v6 = self->_info.clipSize.width == v5->_info.clipSize.width
    && self->_info.clipSize.height == v5->_info.clipSize.height;
  if (!v6 || ((LODWORD(v5->_info.options) ^ LODWORD(self->_info.options)) & 0xDLL) != 0)
    goto LABEL_11;
  v7 = 0;
  if (self->_info.assetContentInfo.size.width != v5->_info.assetContentInfo.size.width
    || self->_info.assetContentInfo.size.height != v5->_info.assetContentInfo.size.height)
  {
    goto LABEL_12;
  }
  x = self->_info.assetContentInfo.acceptableCropRect.origin.x;
  y = self->_info.assetContentInfo.acceptableCropRect.origin.y;
  width = self->_info.assetContentInfo.acceptableCropRect.size.width;
  height = self->_info.assetContentInfo.acceptableCropRect.size.height;
  v31 = self->_info.assetContentInfo.faceAreaRect.origin.y;
  v32 = self->_info.assetContentInfo.faceAreaRect.origin.x;
  v29 = self->_info.assetContentInfo.faceAreaRect.size.height;
  v30 = self->_info.assetContentInfo.faceAreaRect.size.width;
  v23 = self->_info.assetContentInfo.bestPlaybackRect.origin.y;
  v24 = self->_info.assetContentInfo.bestPlaybackRect.origin.x;
  v21 = self->_info.assetContentInfo.bestPlaybackRect.size.height;
  v22 = self->_info.assetContentInfo.bestPlaybackRect.size.width;
  v13 = v5->_info.assetContentInfo.acceptableCropRect.origin.x;
  v14 = v5->_info.assetContentInfo.acceptableCropRect.origin.y;
  v15 = v5->_info.assetContentInfo.acceptableCropRect.size.width;
  v16 = v5->_info.assetContentInfo.acceptableCropRect.size.height;
  v27 = v5->_info.assetContentInfo.faceAreaRect.origin.y;
  v28 = v5->_info.assetContentInfo.faceAreaRect.origin.x;
  v25 = v5->_info.assetContentInfo.faceAreaRect.size.height;
  v26 = v5->_info.assetContentInfo.faceAreaRect.size.width;
  v19 = v5->_info.assetContentInfo.bestPlaybackRect.origin.y;
  v20 = v5->_info.assetContentInfo.bestPlaybackRect.origin.x;
  v17 = v5->_info.assetContentInfo.bestPlaybackRect.size.height;
  v18 = v5->_info.assetContentInfo.bestPlaybackRect.size.width;
  if (!CGRectEqualToRect(self->_info.assetContentInfo.preferredCropRect, v5->_info.assetContentInfo.preferredCropRect))
    goto LABEL_11;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v36.origin.x = v13;
  v36.origin.y = v14;
  v36.size.width = v15;
  v36.size.height = v16;
  if (!CGRectEqualToRect(v33, v36))
    goto LABEL_11;
  v34.origin.y = v31;
  v34.origin.x = v32;
  v34.size.height = v29;
  v34.size.width = v30;
  v37.origin.y = v27;
  v37.origin.x = v28;
  v37.size.height = v25;
  v37.size.width = v26;
  if (!CGRectEqualToRect(v34, v37))
    goto LABEL_11;
  v35.origin.y = v23;
  v35.origin.x = v24;
  v35.size.height = v21;
  v35.size.width = v22;
  v38.origin.y = v19;
  v38.origin.x = v20;
  v38.size.height = v17;
  v38.size.width = v18;
  if (!CGRectEqualToRect(v35, v38) || !PXEdgeInsetsEqualToEdgeInsets())
    goto LABEL_11;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.sourceInsets.top.preRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.top.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.top.rotationAngle != v5->_info.clippingAnimationInfo.sourceInsets.top.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.top.postRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.top.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.sourceInsets.left.preRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.left.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.left.rotationAngle != v5->_info.clippingAnimationInfo.sourceInsets.left.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.left.postRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.left.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.sourceInsets.bottom.preRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.bottom.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.bottom.rotationAngle != v5->_info.clippingAnimationInfo.sourceInsets.bottom.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.bottom.postRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.bottom.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.sourceInsets.right.preRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.right.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.right.rotationAngle != v5->_info.clippingAnimationInfo.sourceInsets.right.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.right.postRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.right.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.targetInsets.top.preRotationInset != v5->_info.clippingAnimationInfo.targetInsets.top.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.targetInsets.top.rotationAngle != v5->_info.clippingAnimationInfo.targetInsets.top.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.targetInsets.top.postRotationInset != v5->_info.clippingAnimationInfo.targetInsets.top.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.targetInsets.left.preRotationInset != v5->_info.clippingAnimationInfo.targetInsets.left.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.targetInsets.left.rotationAngle != v5->_info.clippingAnimationInfo.targetInsets.left.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.targetInsets.left.postRotationInset != v5->_info.clippingAnimationInfo.targetInsets.left.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.targetInsets.bottom.preRotationInset != v5->_info.clippingAnimationInfo.targetInsets.bottom.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.targetInsets.bottom.rotationAngle != v5->_info.clippingAnimationInfo.targetInsets.bottom.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.targetInsets.bottom.postRotationInset != v5->_info.clippingAnimationInfo.targetInsets.bottom.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.targetInsets.right.preRotationInset != v5->_info.clippingAnimationInfo.targetInsets.right.preRotationInset
    || self->_info.clippingAnimationInfo.targetInsets.right.rotationAngle != v5->_info.clippingAnimationInfo.targetInsets.right.rotationAngle
    || self->_info.clippingAnimationInfo.targetInsets.right.postRotationInset != v5->_info.clippingAnimationInfo.targetInsets.right.postRotationInset)
  {
    goto LABEL_12;
  }
  if (PXStoryRectEqualToRect())
    v7 = PXStoryRectEqualToRect();
  else
LABEL_11:
    v7 = 0;
LABEL_12:

LABEL_15:
  return v7;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)playbackTimeRangeForClipDuration:(SEL)a3
{
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return self;
}

- (id)copyWithInfo:(id *)a3
{
  PXStoryDummyClip *v5;
  void *v6;
  int64_t v7;
  PXStoryDummyClip *v8;
  _BYTE v10[768];

  v5 = [PXStoryDummyClip alloc];
  -[PXStoryDummyClip resource](self, "resource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXStoryDummyClip resourceOccurrenceIndex](self, "resourceOccurrenceIndex");
  memcpy(v10, a3, sizeof(v10));
  v8 = -[PXStoryDummyClip initWithInfo:resource:resourceOccurrenceIndex:](v5, "initWithInfo:resource:resourceOccurrenceIndex:", v10, v6, v7);

  return v8;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (PXStoryResource)resource
{
  return self->_resource;
}

- ($C99EDD0FAA5CC172DE20AC79C6A499CF)info
{
  return ($C99EDD0FAA5CC172DE20AC79C6A499CF *)memcpy(retstr, &self->_info, 0x300uLL);
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)videoTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var1;
  return self;
}

- (PFStoryRecipeDisplayAssetNormalization)colorNormalization
{
  return self->_colorNormalization;
}

- (NSString)resourceIdentifier
{
  return self->_resourceIdentifier;
}

- (int64_t)resourceOccurrenceIndex
{
  return self->_resourceOccurrenceIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceIdentifier, 0);
  objc_storeStrong((id *)&self->_colorNormalization, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

@end
