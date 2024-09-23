@implementation PXSurveyQuestionPersonGroupConfiguration

- (PXSurveyQuestionPersonGroupConfiguration)initWithTitle:(id)a3 personGroup:(id)a4
{
  id v6;
  id v7;
  PXSurveyQuestionPersonGroupConfiguration *v8;
  uint64_t v9;
  NSString *title;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSurveyQuestionPersonGroupConfiguration;
  v8 = -[PXSurveyQuestionPersonGroupConfiguration init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    objc_storeStrong((id *)&v8->_personGroup, a4);
    v8->_isStale = 0;
  }

  return v8;
}

- (PXSurveyQuestionPersonGroupConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionPersonGroupConfiguration.m"), 35, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionPersonGroupConfiguration init]");

  abort();
}

- (UIView)contentView
{
  return self->_personGroupContentView;
}

- (id)contentViewForDisplayScale:(double)a3
{
  void *v5;
  UIView *v6;
  UIView *personGroupContentView;

  -[PXSurveyQuestionPersonGroupConfiguration personGroup](self, "personGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleSocialGroupViewGenerator generateViewForSocialGroup:withSize:displayScale:](PXPeopleSocialGroupViewGenerator, "generateViewForSocialGroup:withSize:displayScale:", v5, 50.0, 50.0, a3);
  v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  personGroupContentView = self->_personGroupContentView;
  self->_personGroupContentView = v6;

  return self->_personGroupContentView;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  CGFloat v4;

  v4 = a3.size.height * 0.75;
  -[UIView setFrame:](self->_personGroupContentView, "setFrame:", (a3.size.width - a3.size.height * 0.75) * 0.5, (a3.size.height - a3.size.height * 0.75) * 0.75, a3.size.height * 0.75, a3.size.height * 0.75);
  +[PXPeopleSocialGroupViewGenerator resizeThumbnailSizeForSocialGroupView:withSize:](PXPeopleSocialGroupViewGenerator, "resizeThumbnailSizeForSocialGroupView:withSize:", self->_personGroupContentView, v4, v4);
}

- (UIImage)contentImageForOneUp
{
  return 0;
}

- (CGRect)contentRectForOneUp
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)needsQuestionInvalidationForChange:(id)a3
{
  void *v4;
  NSArray *personGroup;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;

  if (!-[NSArray count](self->_personGroup, "count", a3))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  personGroup = self->_personGroup;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PXSurveyQuestionPersonGroupConfiguration_needsQuestionInvalidationForChange___block_invoke;
  v14[3] = &unk_1E5131250;
  v15 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](personGroup, "enumerateObjectsUsingBlock:", v14);
  -[NSArray firstObject](self->_personGroup, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPersonContext:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = v11 != -[NSArray count](self->_personGroup, "count");

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (NSArray)personGroup
{
  return self->_personGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personGroup, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_personGroupContentView, 0);
}

void __79__PXSurveyQuestionPersonGroupConfiguration_needsQuestionInvalidationForChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
