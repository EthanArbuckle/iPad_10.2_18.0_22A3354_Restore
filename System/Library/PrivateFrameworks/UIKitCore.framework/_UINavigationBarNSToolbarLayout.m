@implementation _UINavigationBarNSToolbarLayout

- (id)_initWithLayout:(id)a3
{
  id v4;
  _UINavigationBarNSToolbarLayout *v5;
  _UINavigationBarNSToolbarLayout *v6;
  uint64_t v7;
  NSString *customizationIdentifier;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSURL *representedURL;
  uint64_t v13;
  id representedDragItemsProvider;
  uint64_t v15;
  NSArray *leadingGroups;
  uint64_t v17;
  NSArray *centerGroups;
  uint64_t v19;
  NSArray *trailingGroups;
  uint64_t v21;
  NSString *backButtonTitle;
  uint64_t v23;
  id backButtonHandler;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_UINavigationBarNSToolbarLayout;
  v5 = -[_UINavigationBarNSToolbarLayout init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_style = *((_QWORD *)v4 + 2);
    v5->_location = *((_QWORD *)v4 + 3);
    v7 = objc_msgSend(*((id *)v4 + 4), "copy");
    customizationIdentifier = v6->_customizationIdentifier;
    v6->_customizationIdentifier = (NSString *)v7;

    v9 = objc_msgSend(*((id *)v4 + 5), "copy");
    title = v6->_title;
    v6->_title = (NSString *)v9;

    v11 = objc_msgSend(*((id *)v4 + 6), "copy");
    representedURL = v6->_representedURL;
    v6->_representedURL = (NSURL *)v11;

    v13 = objc_msgSend(*((id *)v4 + 7), "copy");
    representedDragItemsProvider = v6->_representedDragItemsProvider;
    v6->_representedDragItemsProvider = (id)v13;

    v15 = objc_msgSend(*((id *)v4 + 8), "copy");
    leadingGroups = v6->_leadingGroups;
    v6->_leadingGroups = (NSArray *)v15;

    v17 = objc_msgSend(*((id *)v4 + 9), "copy");
    centerGroups = v6->_centerGroups;
    v6->_centerGroups = (NSArray *)v17;

    v19 = objc_msgSend(*((id *)v4 + 10), "copy");
    trailingGroups = v6->_trailingGroups;
    v6->_trailingGroups = (NSArray *)v19;

    v21 = objc_msgSend(*((id *)v4 + 12), "copy");
    backButtonTitle = v6->_backButtonTitle;
    v6->_backButtonTitle = (NSString *)v21;

    objc_storeStrong((id *)&v6->_backButtonImage, *((id *)v4 + 13));
    v23 = objc_msgSend(*((id *)v4 + 14), "copy");
    backButtonHandler = v6->_backButtonHandler;
    v6->_backButtonHandler = (id)v23;

    objc_storeStrong((id *)&v6->_inlineSearchTextField, *((id *)v4 + 15));
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithLayout:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  id representedDragItemsProvider;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UINavigationBarNSToolbarLayout;
  -[_UINavigationBarNSToolbarLayout description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = self->_location - 1;
  if (v5 <= 2)
    objc_msgSend(v4, "appendString:", off_1E16C8408[v5]);
  if (self->_customizationIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR(" customizationIdentifier='%@'"), self->_customizationIdentifier);
  if (self->_title)
    objc_msgSend(v4, "appendFormat:", CFSTR(" title='%@'"), self->_title);
  if (self->_representedURL)
    objc_msgSend(v4, "appendFormat:", CFSTR(" representedURL='%@'"), self->_representedURL);
  representedDragItemsProvider = self->_representedDragItemsProvider;
  if (representedDragItemsProvider)
  {
    v7 = _Block_copy(representedDragItemsProvider);
    objc_msgSend(v4, "appendFormat:", CFSTR(" representedDragItemsProvider='%@'"), v7);

  }
  return v4;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (NSString)customizationIdentifier
{
  return self->_customizationIdentifier;
}

- (void)setCustomizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)representedURL
{
  return self->_representedURL;
}

- (void)setRepresentedURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)representedDragItemsProvider
{
  return self->_representedDragItemsProvider;
}

- (void)setRepresentedDragItemsProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)leadingGroups
{
  return self->_leadingGroups;
}

- (void)setLeadingGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)centerGroups
{
  return self->_centerGroups;
}

- (void)setCenterGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)trailingGroups
{
  return self->_trailingGroups;
}

- (void)setTrailingGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIBarButtonItemGroup)pinnedTrailingGroup
{
  return self->_pinnedTrailingGroup;
}

- (void)setPinnedTrailingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedTrailingGroup, a3);
}

- (BOOL)showSidebarToggle
{
  return self->_showSidebarToggle;
}

- (void)setShowSidebarToggle:(BOOL)a3
{
  self->_showSidebarToggle = a3;
}

- (NSString)backButtonTitle
{
  return self->_backButtonTitle;
}

- (void)setBackButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIImage)backButtonImage
{
  return self->_backButtonImage;
}

- (void)setBackButtonImage:(id)a3
{
  objc_storeStrong((id *)&self->_backButtonImage, a3);
}

- (id)backButtonHandler
{
  return self->_backButtonHandler;
}

- (void)setBackButtonHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (UISearchTextField)inlineSearchTextField
{
  return self->_inlineSearchTextField;
}

- (void)setInlineSearchTextField:(id)a3
{
  objc_storeStrong((id *)&self->_inlineSearchTextField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineSearchTextField, 0);
  objc_storeStrong(&self->_backButtonHandler, 0);
  objc_storeStrong((id *)&self->_backButtonImage, 0);
  objc_storeStrong((id *)&self->_backButtonTitle, 0);
  objc_storeStrong((id *)&self->_pinnedTrailingGroup, 0);
  objc_storeStrong((id *)&self->_trailingGroups, 0);
  objc_storeStrong((id *)&self->_centerGroups, 0);
  objc_storeStrong((id *)&self->_leadingGroups, 0);
  objc_storeStrong(&self->_representedDragItemsProvider, 0);
  objc_storeStrong((id *)&self->_representedURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_customizationIdentifier, 0);
}

@end
