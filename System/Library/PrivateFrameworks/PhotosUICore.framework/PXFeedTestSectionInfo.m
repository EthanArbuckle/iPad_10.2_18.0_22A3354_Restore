@implementation PXFeedTestSectionInfo

- (PXFeedTestSectionInfo)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXFeedTestSectionInfo *v6;
  PXFeedTestSectionInfo *v7;
  uint32_t v8;
  uint64_t v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXFeedTestSectionInfo;
  v6 = -[PXFeedTestSectionInfo init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = arc4random_uniform(5u);
    if (v8 <= 1)
      v9 = 1;
    else
      v9 = v8;
    v7->_countOfItems = v9;
  }

  return v7;
}

- (int64_t)sectionType
{
  return 0;
}

- (BOOL)isLoaded
{
  return 1;
}

- (id)date
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (id)albumTitle
{
  return CFSTR("Mock Album");
}

- (id)captionForItemAtIndex:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mock Caption %ld"), a3);
}

- (id)photoLibrary
{
  return self->_photoLibrary;
}

- (int64_t)countOfItems
{
  return self->_countOfItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
