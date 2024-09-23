@implementation PFStoryConcreteRecipeClip

- (PFStoryConcreteRecipeClip)initWithAssetIdentifier:(id)a3 playbackStyle:(int64_t)a4 minimumDuration:(id *)a5 idealDuration:(id *)a6 maximumDuration:(id *)a7 videoCueOffset:(id *)a8 motionStyle:(int64_t)a9 transition:(int64_t)a10
{
  id v16;
  char *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  int64_t var3;
  objc_super v24;

  v16 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PFStoryConcreteRecipeClip;
  v17 = -[PFStoryConcreteRecipeClip init](&v24, sel_init);
  v18 = (void *)*((_QWORD *)v17 + 1);
  *((_QWORD *)v17 + 1) = v16;

  *((_QWORD *)v17 + 2) = a4;
  v19 = *(_OWORD *)&a5->var0;
  *((_QWORD *)v17 + 5) = a5->var3;
  *(_OWORD *)(v17 + 24) = v19;
  v20 = *(_OWORD *)&a6->var0;
  *((_QWORD *)v17 + 8) = a6->var3;
  *((_OWORD *)v17 + 3) = v20;
  v21 = *(_OWORD *)&a7->var0;
  *((_QWORD *)v17 + 11) = a7->var3;
  *(_OWORD *)(v17 + 72) = v21;
  var3 = a8->var3;
  *((_OWORD *)v17 + 6) = *(_OWORD *)&a8->var0;
  *((_QWORD *)v17 + 14) = var3;
  *((_QWORD *)v17 + 15) = a9;
  *((_QWORD *)v17 + 16) = a10;
  return (PFStoryConcreteRecipeClip *)v17;
}

- (NSString)diagnosticDescription
{
  PFStoryRecipeArchiver *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(PFStoryRecipeArchiver);
  -[PFStoryRecipeArchiver archivedJSONObjectWithClip:](v3, "archivedJSONObjectWithClip:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqualToClip:(id)a3
{
  PFStoryConcreteRecipeClip *v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  BOOL v9;
  int64_t v10;
  int64_t v11;
  CMTime v13;
  CMTime v14;
  CMTime v15;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  CMTime time2;
  CMTime time1;

  v4 = (PFStoryConcreteRecipeClip *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    -[PFStoryConcreteRecipeClip assetIdentifier](self, "assetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFStoryConcreteRecipeClip assetIdentifier](v4, "assetIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (!v7)
      goto LABEL_23;
    v8 = -[PFStoryConcreteRecipeClip playbackStyle](self, "playbackStyle");
    if (v8 != -[PFStoryConcreteRecipeClip playbackStyle](v4, "playbackStyle"))
      goto LABEL_23;
    -[PFStoryConcreteRecipeClip minimumDuration](self, "minimumDuration");
    if (v4)
      -[PFStoryConcreteRecipeClip minimumDuration](v4, "minimumDuration");
    else
      memset(&time2, 0, sizeof(time2));
    if (CMTimeCompare(&time1, &time2))
      goto LABEL_23;
    -[PFStoryConcreteRecipeClip idealDuration](self, "idealDuration");
    if (v4)
      -[PFStoryConcreteRecipeClip idealDuration](v4, "idealDuration");
    else
      memset(&v17, 0, sizeof(v17));
    if (CMTimeCompare(&v18, &v17))
      goto LABEL_23;
    -[PFStoryConcreteRecipeClip maximumDuration](self, "maximumDuration");
    if (v4)
      -[PFStoryConcreteRecipeClip maximumDuration](v4, "maximumDuration");
    else
      memset(&v15, 0, sizeof(v15));
    if (CMTimeCompare(&v16, &v15))
      goto LABEL_23;
    -[PFStoryConcreteRecipeClip videoCueOffset](self, "videoCueOffset");
    if (v4)
      -[PFStoryConcreteRecipeClip videoCueOffset](v4, "videoCueOffset");
    else
      memset(&v13, 0, sizeof(v13));
    if (CMTimeCompare(&v14, &v13)
      || (v10 = -[PFStoryConcreteRecipeClip motionStyle](self, "motionStyle"),
          v10 != -[PFStoryConcreteRecipeClip motionStyle](v4, "motionStyle")))
    {
LABEL_23:
      v9 = 0;
    }
    else
    {
      v11 = -[PFStoryConcreteRecipeClip transition](self, "transition");
      v9 = v11 == -[PFStoryConcreteRecipeClip transition](v4, "transition");
    }
  }

  return v9;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)idealDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoCueOffset
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (int64_t)motionStyle
{
  return self->_motionStyle;
}

- (int64_t)transition
{
  return self->_transition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end
