@implementation _TVContentRatingBadgeDescriptor

- (_TVContentRatingBadgeDescriptor)initWithResourceName:(id)a3 isTemplatedImage:(BOOL)a4
{
  id v6;
  _TVContentRatingBadgeDescriptor *v7;
  uint64_t v8;
  NSString *resourceName;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_TVContentRatingBadgeDescriptor;
  v7 = -[_TVContentRatingBadgeDescriptor init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    resourceName = v7->_resourceName;
    v7->_resourceName = (NSString *)v8;

    v7->_templatedImage = a4;
  }

  return v7;
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (BOOL)isTemplatedImage
{
  return self->_templatedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceName, 0);
}

@end
