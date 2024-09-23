@implementation ICThumbnailDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (ICThumbnailDescription)initWithConfiguration:(id)a3
{
  id v5;
  ICThumbnailDescription *v6;
  ICThumbnailDescription *v7;
  uint64_t v8;
  NSDate *creationDate;
  void *v10;
  void *v11;
  uint64_t v12;
  NSSet *associatedObjectIdentifiers;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICThumbnailDescription;
  v6 = -[ICThumbnailDescription init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = objc_claimAutoreleasedReturnValue();
    creationDate = v7->_creationDate;
    v7->_creationDate = (NSDate *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "associatedObjectIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ic_setFromNonNilObject:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    associatedObjectIdentifiers = v7->_associatedObjectIdentifiers;
    v7->_associatedObjectIdentifiers = (NSSet *)v12;

  }
  return v7;
}

- (void)setFetchDuration:(double)a3
{
  self->_fetchDuration = a3;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImage)image
{
  return self->_image;
}

- (ICThumbnailConfiguration)configuration
{
  return self->_configuration;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setThumbnailDecorationType:(int64_t)a3
{
  self->_thumbnailDecorationType = a3;
}

- (void)setImageScaling:(unint64_t)a3
{
  self->_imageScaling = a3;
}

- (void)setAssociatedObjectIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_associatedObjectIdentifiers, a3);
}

- (int64_t)preferredContentMode
{
  unint64_t v2;
  int64_t v3;

  v2 = -[ICThumbnailDescription imageScaling](self, "imageScaling");
  v3 = 1;
  if (v2 != 2)
    v3 = 2;
  if (v2)
    return v3;
  else
    return 4;
}

- (unint64_t)imageScaling
{
  return self->_imageScaling;
}

- (NSSet)associatedObjectIdentifiers
{
  return self->_associatedObjectIdentifiers;
}

- (int64_t)thumbnailDecorationType
{
  return self->_thumbnailDecorationType;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)isCached
{
  return self->_cached;
}

- (void)setCached:(BOOL)a3
{
  self->_cached = a3;
}

- (double)fetchDuration
{
  return self->_fetchDuration;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

@end
