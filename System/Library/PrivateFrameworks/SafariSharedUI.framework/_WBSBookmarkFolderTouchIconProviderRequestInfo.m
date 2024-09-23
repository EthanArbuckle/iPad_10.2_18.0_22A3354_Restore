@implementation _WBSBookmarkFolderTouchIconProviderRequestInfo

- (_WBSBookmarkFolderTouchIconProviderRequestInfo)init
{
  _WBSBookmarkFolderTouchIconProviderRequestInfo *v2;
  uint64_t v3;
  NSMutableArray *thumbnailImages;
  uint64_t v5;
  NSMutableArray *backgroundColors;
  _WBSBookmarkFolderTouchIconProviderRequestInfo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_WBSBookmarkFolderTouchIconProviderRequestInfo;
  v2 = -[_WBSBookmarkFolderTouchIconProviderRequestInfo init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    thumbnailImages = v2->_thumbnailImages;
    v2->_thumbnailImages = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    backgroundColors = v2->_backgroundColors;
    v2->_backgroundColors = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)setThumbnailImage:(id)a3 atIndex:(unint64_t)a4
{
  NSMutableArray *thumbnailImages;
  void *v6;
  id v7;
  id v8;

  thumbnailImages = self->_thumbnailImages;
  v6 = (void *)MEMORY[0x1E0C99E38];
  v7 = a3;
  objc_msgSend(v6, "null");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray safari_setObject:atIndex:withPaddingObject:](thumbnailImages, "safari_setObject:atIndex:withPaddingObject:", v7, a4, v8);

}

- (void)setBackgroundColor:(id)a3 atIndex:(unint64_t)a4
{
  NSMutableArray *backgroundColors;
  void *v6;
  id v7;
  id v8;

  backgroundColors = self->_backgroundColors;
  v6 = (void *)MEMORY[0x1E0C99E38];
  v7 = a3;
  objc_msgSend(v6, "null");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray safari_setObject:atIndex:withPaddingObject:](backgroundColors, "safari_setObject:atIndex:withPaddingObject:", v7, a4, v8);

}

- (NSArray)thumbnailImages
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_thumbnailImages, "copy");
}

- (NSArray)backgroundColors
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_backgroundColors, "copy");
}

- (NSArray)subrequests
{
  return self->_subrequests;
}

- (void)setSubrequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)subrequestTokens
{
  return self->_subrequestTokens;
}

- (void)setSubrequestTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)hasScheduledCoalescedUpdate
{
  return self->_hasScheduledCoalescedUpdate;
}

- (void)setHasScheduledCoalescedUpdate:(BOOL)a3
{
  self->_hasScheduledCoalescedUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subrequestTokens, 0);
  objc_storeStrong((id *)&self->_subrequests, 0);
  objc_storeStrong((id *)&self->_backgroundColors, 0);
  objc_storeStrong((id *)&self->_thumbnailImages, 0);
}

@end
