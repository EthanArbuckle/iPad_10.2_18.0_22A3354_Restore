@implementation PUVideoEditReviewAsset

- (PUVideoEditReviewAsset)initWithReviewAsset:(id)a3 trimmedVideoPath:(id)a4
{
  id v7;
  PUVideoEditReviewAsset *v8;
  PUVideoEditReviewAsset *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUVideoEditReviewAsset;
  v8 = -[PUReviewAsset initWithReviewAsset:](&v11, sel_initWithReviewAsset_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_trimmedVideoPath, a4);

  return v9;
}

- (id)pathForTrimmedVideoFile
{
  return self->_trimmedVideoPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trimmedVideoPath, 0);
}

@end
