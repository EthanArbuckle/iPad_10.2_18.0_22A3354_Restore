@implementation PUFeedViewControllerRestorableState

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedViewControllerRestorableState.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));

  }
  -[PUFeedViewControllerRestorableState date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("date"));

  objc_msgSend(v10, "encodeBool:forKey:", -[PUFeedViewControllerRestorableState scrolledToNewest](self, "scrolledToNewest"), CFSTR("scrolledToNewest"));
  -[PUFeedViewControllerRestorableState centerAssetUUIDs](self, "centerAssetUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("centerAssetUUIDs"));

  -[PUFeedViewControllerRestorableState centerAssetFrames](self, "centerAssetFrames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("centerAssetFrames"));

  -[PUFeedViewControllerRestorableState centerSectionEntryURIRepresentation](self, "centerSectionEntryURIRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("centerSectionEntryURIRepresentation"));

  -[PUFeedViewControllerRestorableState centerSectionFrame](self, "centerSectionFrame");
  objc_msgSend(v10, "encodeCGRect:forKey:", CFSTR("centerSectionFrame"));
  -[PUFeedViewControllerRestorableState collectionViewSize](self, "collectionViewSize");
  objc_msgSend(v10, "encodeCGSize:forKey:", CFSTR("collectionViewSize"));

}

- (PUFeedViewControllerRestorableState)initWithCoder:(id)a3
{
  id v5;
  PUFeedViewControllerRestorableState *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  objc_super v19;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedViewControllerRestorableState.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));

  }
  v19.receiver = self;
  v19.super_class = (Class)PUFeedViewControllerRestorableState;
  v6 = -[PUFeedViewControllerRestorableState init](&v19, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewControllerRestorableState setDate:](v6, "setDate:", v7);

    -[PUFeedViewControllerRestorableState setScrolledToNewest:](v6, "setScrolledToNewest:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("scrolledToNewest")));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("centerAssetUUIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewControllerRestorableState setCenterAssetUUIDs:](v6, "setCenterAssetUUIDs:", v11);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v14, CFSTR("centerAssetFrames"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewControllerRestorableState setCenterAssetFrames:](v6, "setCenterAssetFrames:", v15);

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("centerSectionEntryURIRepresentation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewControllerRestorableState setCenterSectionEntryURIRepresentation:](v6, "setCenterSectionEntryURIRepresentation:", v16);

    objc_msgSend(v5, "decodeCGRectForKey:", CFSTR("centerSectionFrame"));
    -[PUFeedViewControllerRestorableState setCenterSectionFrame:](v6, "setCenterSectionFrame:");
    objc_msgSend(v5, "decodeCGSizeForKey:", CFSTR("collectionViewSize"));
    -[PUFeedViewControllerRestorableState setCollectionViewSize:](v6, "setCollectionViewSize:");
  }

  return v6;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)scrolledToNewest
{
  return self->_scrolledToNewest;
}

- (void)setScrolledToNewest:(BOOL)a3
{
  self->_scrolledToNewest = a3;
}

- (NSArray)centerAssetUUIDs
{
  return self->_centerAssetUUIDs;
}

- (void)setCenterAssetUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)centerAssetFrames
{
  return self->_centerAssetFrames;
}

- (void)setCenterAssetFrames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)centerSectionEntryURIRepresentation
{
  return self->_centerSectionEntryURIRepresentation;
}

- (void)setCenterSectionEntryURIRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CGRect)centerSectionFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_centerSectionFrame.origin.x;
  y = self->_centerSectionFrame.origin.y;
  width = self->_centerSectionFrame.size.width;
  height = self->_centerSectionFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCenterSectionFrame:(CGRect)a3
{
  self->_centerSectionFrame = a3;
}

- (CGSize)collectionViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_collectionViewSize.width;
  height = self->_collectionViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCollectionViewSize:(CGSize)a3
{
  self->_collectionViewSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerSectionEntryURIRepresentation, 0);
  objc_storeStrong((id *)&self->_centerAssetFrames, 0);
  objc_storeStrong((id *)&self->_centerAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
