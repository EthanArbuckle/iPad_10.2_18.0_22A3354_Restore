@implementation PXSurveyQuestionPersonConfiguration

- (PXSurveyQuestionPersonConfiguration)initWithTitle:(id)a3 person:(id)a4
{
  id v6;
  id v7;
  PXSurveyQuestionPersonConfiguration *v8;
  uint64_t v9;
  NSString *title;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSurveyQuestionPersonConfiguration;
  v8 = -[PXSurveyQuestionPersonConfiguration init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    objc_storeStrong((id *)&v8->_person, a4);
    v8->_isStale = 0;
  }

  return v8;
}

- (PXSurveyQuestionPersonConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionPersonConfiguration.m"), 35, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionPersonConfiguration init]");

  abort();
}

- (UIView)contentView
{
  PXPeopleScalableAvatarView *avatarView;
  PXPeopleScalableAvatarView *v4;
  PXPeopleScalableAvatarView *v5;
  void *v6;

  avatarView = self->_avatarView;
  if (!avatarView)
  {
    v4 = objc_alloc_init(PXPeopleScalableAvatarView);
    v5 = self->_avatarView;
    self->_avatarView = v4;

    -[PXSurveyQuestionPersonConfiguration person](self, "person");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleScalableAvatarView setPerson:](self->_avatarView, "setPerson:", v6);

    avatarView = self->_avatarView;
  }
  return (UIView *)avatarView;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  -[PXSmartScaleView setFrame:](self->_avatarView, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
  void *v3;
  char v4;

  objc_msgSend(a3, "changeDetailsForObject:", self->_person);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "objectWasDeleted");

  return v4;
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

- (PHPerson)person
{
  return self->_person;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
