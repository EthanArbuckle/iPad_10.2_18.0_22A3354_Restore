@implementation PXStoryRelatedResult

- (PXStoryRelatedResult)initWithStoryConfigurations:(id)a3 debugInfo:(id)a4
{
  id v6;
  id v7;
  PXStoryRelatedResult *v8;
  uint64_t v9;
  NSArray *storyConfigurations;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryRelatedResult;
  v8 = -[PXStoryRelatedResult init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    storyConfigurations = v8->_storyConfigurations;
    v8->_storyConfigurations = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_debugInfo, a4);
  }

  return v8;
}

- (NSArray)storyConfigurations
{
  return self->_storyConfigurations;
}

- (NSString)debugInfo
{
  return self->_debugInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_storyConfigurations, 0);
}

@end
