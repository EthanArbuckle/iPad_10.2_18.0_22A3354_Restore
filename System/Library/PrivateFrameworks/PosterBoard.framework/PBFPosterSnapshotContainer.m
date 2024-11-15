@implementation PBFPosterSnapshotContainer

- (PBFPosterSnapshotContainer)initWithPosterSnapshot:(id)a3 imageBlockSet:(CGImageBlockSet *)a4
{
  id v7;
  PBFPosterSnapshotContainer *v8;
  PBFPosterSnapshotContainer *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PBFPosterSnapshotContainer;
  v8 = -[PBFPosterSnapshotContainer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_posterSnapshot, a3);
    if (a4)
    {
      CGImageBlockSetRetain();
      v9->_imageBlockSet = a4;
    }
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_imageBlockSet)
    CGImageBlockSetRelease();
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterSnapshotContainer;
  -[PBFPosterSnapshotContainer dealloc](&v3, sel_dealloc);
}

- (PRSPosterSnapshot)posterSnapshot
{
  return self->_posterSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterSnapshot, 0);
}

@end
