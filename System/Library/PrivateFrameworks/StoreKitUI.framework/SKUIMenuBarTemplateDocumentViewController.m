@implementation SKUIMenuBarTemplateDocumentViewController

- (SKUIMenuBarTemplateDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5;
  SKUIMenuBarTemplateDocumentViewController *v6;
  SKUIMenuBarTemplateDocumentViewController *v7;
  uint64_t v8;
  SKUIMenuBarViewElement *menuBarViewElement;
  uint64_t v10;
  SKUIMenuBarViewElementConfiguration *menuBarViewElementConfiguration;
  uint64_t v12;
  SKUIMenuItemViewElement *pendingSelectedMenuItemViewElement;
  objc_super v15;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuBarTemplateDocumentViewController initWithTemplateElement:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIMenuBarTemplateDocumentViewController;
  v6 = -[SKUIMenuBarTemplateDocumentViewController init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templateElement, a3);
    -[SKUIMenuBarTemplateElement menuBar](v7->_templateElement, "menuBar");
    v8 = objc_claimAutoreleasedReturnValue();
    menuBarViewElement = v7->_menuBarViewElement;
    v7->_menuBarViewElement = (SKUIMenuBarViewElement *)v8;

    -[SKUIMenuBarViewElement configuration](v7->_menuBarViewElement, "configuration");
    v10 = objc_claimAutoreleasedReturnValue();
    menuBarViewElementConfiguration = v7->_menuBarViewElementConfiguration;
    v7->_menuBarViewElementConfiguration = (SKUIMenuBarViewElementConfiguration *)v10;

    -[SKUIMenuBarViewElementConfiguration setDelegate:](v7->_menuBarViewElementConfiguration, "setDelegate:", v7);
    -[SKUIMenuBarViewElementConfiguration selectedMenuItemViewElement](v7->_menuBarViewElementConfiguration, "selectedMenuItemViewElement");
    v12 = objc_claimAutoreleasedReturnValue();
    pendingSelectedMenuItemViewElement = v7->_pendingSelectedMenuItemViewElement;
    v7->_pendingSelectedMenuItemViewElement = (SKUIMenuItemViewElement *)v12;

    v7->_scrollingTabAppearanceStatus.progress = 1.0;
    *(_QWORD *)&v7->_scrollingTabAppearanceStatus.isBouncingOffTheEdge = 0;
    -[SKUIMenuBarTemplateDocumentViewController _reloadContentViewController](v7, "_reloadContentViewController");
  }

  return v7;
}

- (void)dealloc
{
  SKUIScrollingSegmentedController *scrollingSegmentedController;
  SKUIHorizontalScrollingContainerViewController *horizontalScrollingContainerViewController;
  objc_super v5;

  scrollingSegmentedController = self->_scrollingSegmentedController;
  if (scrollingSegmentedController)
  {
    -[SKUIScrollingSegmentedController setDelegate:](scrollingSegmentedController, "setDelegate:", 0);
    -[SKUIMenuBarTemplateDocumentViewController _removeContentViewController:](self, "_removeContentViewController:", self->_scrollingSegmentedController);
  }
  horizontalScrollingContainerViewController = self->_horizontalScrollingContainerViewController;
  if (horizontalScrollingContainerViewController)
  {
    -[SKUIHorizontalScrollingContainerViewController setDelegate:](horizontalScrollingContainerViewController, "setDelegate:", 0);
    -[SKUIMenuBarTemplateDocumentViewController _removeContentViewController:](self, "_removeContentViewController:", self->_horizontalScrollingContainerViewController);
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUIMenuBarTemplateDocumentViewController;
  -[SKUIViewController dealloc](&v5, sel_dealloc);
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SKUIMenuBarTemplateDocumentViewController;
  -[SKUIMenuBarTemplateDocumentViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[SKUIHorizontalScrollingContainerViewController setPreferredContentSize:](self->_horizontalScrollingContainerViewController, "setPreferredContentSize:", width, height);
  -[SKUIScrollingSegmentedController setPreferredContentSize:](self->_scrollingSegmentedController, "setPreferredContentSize:", width, height);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIMenuBarTemplateDocumentViewController;
  -[SKUIMenuBarTemplateDocumentViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[SKUIMenuBarTemplateDocumentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIMenuBarTemplateDocumentViewController _contentViewController](self, "_contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v6, "setAutoresizingMask:", 18);
    objc_msgSend(v3, "addSubview:", v6);

  }
}

- (id)contentScrollView
{
  void *v2;
  void *v3;

  -[SKUIMenuBarTemplateDocumentViewController _contentViewController](self, "_contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setClientContext:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKUIMenuBarTemplateDocumentViewController;
  -[SKUIViewController setClientContext:](&v6, sel_setClientContext_, v4);
  -[SKUIViewController setClientContext:](self->_menuBarSectionsViewController, "setClientContext:", v4);
  v5 = self->_menuBarStyle - 1;
  if (v5 <= 2)
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *off_1E73A3418[v5]), "setClientContext:", v4);

}

- (void)setOperationQueue:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKUIMenuBarTemplateDocumentViewController;
  -[SKUIViewController setOperationQueue:](&v6, sel_setOperationQueue_, v4);
  -[SKUIViewController setOperationQueue:](self->_menuBarSectionsViewController, "setOperationQueue:", v4);
  v5 = self->_menuBarStyle - 1;
  if (v5 <= 2)
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *off_1E73A3418[v5]), "setOperationQueue:", v4);

}

- (void)documentDidUpdate:(id)a3
{
  SKUIMenuBarViewElementConfiguration *menuBarViewElementConfiguration;
  id v5;
  SKUIMenuBarTemplateElement *v6;
  SKUIMenuBarTemplateElement *templateElement;
  SKUIMenuBarViewElement *v8;
  SKUIMenuBarViewElement *menuBarViewElement;
  SKUIMenuBarViewElementConfiguration *v10;
  SKUIMenuBarViewElementConfiguration *v11;
  SKUIDynamicPageSectionIndexMapper *dynamicPageSectionIndexMapper;
  void *v13;

  menuBarViewElementConfiguration = self->_menuBarViewElementConfiguration;
  v5 = a3;
  -[SKUIMenuBarViewElementConfiguration setDelegate:](menuBarViewElementConfiguration, "setDelegate:", 0);
  objc_msgSend(v5, "templateElement");
  v6 = (SKUIMenuBarTemplateElement *)objc_claimAutoreleasedReturnValue();

  templateElement = self->_templateElement;
  self->_templateElement = v6;

  -[SKUIMenuBarTemplateElement menuBar](self->_templateElement, "menuBar");
  v8 = (SKUIMenuBarViewElement *)objc_claimAutoreleasedReturnValue();
  menuBarViewElement = self->_menuBarViewElement;
  self->_menuBarViewElement = v8;

  -[SKUIMenuBarViewElement configuration](self->_menuBarViewElement, "configuration");
  v10 = (SKUIMenuBarViewElementConfiguration *)objc_claimAutoreleasedReturnValue();
  v11 = self->_menuBarViewElementConfiguration;
  self->_menuBarViewElementConfiguration = v10;

  -[SKUIMenuBarViewElementConfiguration setDelegate:](self->_menuBarViewElementConfiguration, "setDelegate:", self);
  dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
  -[SKUIViewElement entityProvider](self->_menuBarViewElement, "entityProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIDynamicPageSectionIndexMapper setEntityProvider:](dynamicPageSectionIndexMapper, "setEntityProvider:", v13);

  -[SKUIMenuBarTemplateDocumentViewController _reloadContentViewController](self, "_reloadContentViewController");
}

- (void)documentMediaQueriesDidUpdate:(id)a3
{
  SKUIMenuBarSectionsViewController *menuBarSectionsViewController;
  void *v5;

  menuBarSectionsViewController = self->_menuBarSectionsViewController;
  -[SKUIMenuBarTemplateDocumentViewController _colorScheme](self, "_colorScheme", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSectionsViewController setColorScheme:](menuBarSectionsViewController, "setColorScheme:", v5);

  -[SKUIStorePageSectionsViewController invalidateAndReload](self->_menuBarSectionsViewController, "invalidateAndReload");
}

- (id)navigationPaletteView
{
  SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *v3;
  void *v4;
  SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *embeddedPaletteHost;
  SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *v6;
  double v7;
  SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *v8;
  SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *v9;
  void *v10;

  if (-[SKUIMenuBarTemplateDocumentViewController _isFirstViewControllerOnNavigationStack](self, "_isFirstViewControllerOnNavigationStack"))
  {
    -[SKUIMenuBarSectionsViewController view](self->_menuBarSectionsViewController, "view");
    v3 = (SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *)objc_claimAutoreleasedReturnValue();
    -[SKUIMenuBarSectionsViewController contentScrollView](self->_menuBarSectionsViewController, "contentScrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost layoutIfNeeded](v3, "layoutIfNeeded");
    objc_msgSend(v4, "layoutIfNeeded");
    objc_msgSend(v4, "contentSize");
    -[SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost frame](v3, "frame");
    -[SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost setFrame:](v3, "setFrame:");

  }
  else
  {
    embeddedPaletteHost = self->_embeddedPaletteHost;
    if (!embeddedPaletteHost)
    {
      v6 = [SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost alloc];
      -[SKUIMenuBarTemplateDocumentViewController titleViewHeight](self, "titleViewHeight");
      v8 = -[SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, 0.0, v7 + 7.0);
      v9 = self->_embeddedPaletteHost;
      self->_embeddedPaletteHost = v8;

      -[SKUIMenuBarTemplateDocumentViewController titleView](self, "titleView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sizeToFit");
      -[SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost setTitleView:](self->_embeddedPaletteHost, "setTitleView:", v10);

      embeddedPaletteHost = self->_embeddedPaletteHost;
    }
    v3 = embeddedPaletteHost;
  }
  return v3;
}

- (void)horizontalScrollingContainerViewController:(id)a3 willDisplayViewControllerAtIndex:(unint64_t)a4
{
  -[SKUIMenuBarTemplateDocumentViewController _willDisplayViewControllerAtIndex:](self, "_willDisplayViewControllerAtIndex:", a4);
}

- (void)menuBarViewElementConfiguration:(id)a3 didReplaceDocumentForEntityUniqueIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v17 = a3;
  v6 = a4;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_entityUniqueIdentifierToEntityIndex, "objectForKey:", v6, v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_3;
    -[SKUIMenuBarTemplateDocumentViewController _dynamicPageSectionIndexMapper](self, "_dynamicPageSectionIndexMapper");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_5;
    v10 = (void *)v11;
    -[SKUIViewElement entityProvider](self->_menuBarViewElement, "entityProvider");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "totalNumberOfEntities");
    if (!v18)
      goto LABEL_4;
    v7 = 0;
    for (i = 0; i != v18; ++i)
    {
      objc_msgSend(v10, "entityIndexPathForGlobalIndex:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "entityValueProviderAtIndexPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "entityUniqueIdentifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[SKUIMenuBarTemplateDocumentViewController _recordEntityUniqueIdentifier:forEntityIndex:](self, "_recordEntityUniqueIdentifier:forEntityIndex:", v15, i);
      if (v15 == v6 || objc_msgSend(v15, "isEqual:", v6))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v16 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v16;
      }

    }
    if (v7)
    {
LABEL_3:
      v8 = objc_msgSend(v7, "unsignedIntegerValue");
      v9 = -[SKUIMenuBarTemplateDocumentViewController _newChildViewControllerForEntityAtIndex:](self, "_newChildViewControllerForEntityAtIndex:", v8);
      -[SKUIMenuBarTemplateDocumentViewController _replaceViewControllerAtIndex:withViewController:](self, "_replaceViewControllerAtIndex:withViewController:", v8, v9);
      v10 = v7;
LABEL_4:

    }
  }
LABEL_5:

}

- (void)menuBarViewElementConfiguration:(id)a3 didReplaceDocumentForMenuItemAtIndex:(unint64_t)a4
{
  id v6;

  v6 = -[SKUIMenuBarTemplateDocumentViewController _newChildViewControllerForEntityAtIndex:](self, "_newChildViewControllerForEntityAtIndex:", a4);
  -[SKUIMenuBarTemplateDocumentViewController _replaceViewControllerAtIndex:withViewController:](self, "_replaceViewControllerAtIndex:withViewController:", a4, v6);

}

- (void)menuBarViewElementConfiguration:(id)a3 selectMenuItemViewElement:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  if (self->_scrollingSegmentedController)
  {
    v9 = objc_msgSend(v10, "indexOfMenuItemViewElement:", v8);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      -[SKUIScrollingSegmentedController selectViewControllerAtIndex:animated:](self->_scrollingSegmentedController, "selectViewControllerAtIndex:animated:", v9, v5);
  }
  else
  {
    objc_storeStrong((id *)&self->_pendingSelectedMenuItemViewElement, a4);
  }

}

- (id)navigationBarControllerWithViewElement:(id)a3
{
  id v4;
  SKUIMenuBarNavigationBarController *v5;
  void *v6;

  v4 = a3;
  v5 = -[SKUINavigationBarController initWithNavigationBarViewElement:]([SKUIMenuBarNavigationBarController alloc], "initWithNavigationBarViewElement:", v4);

  if (-[SKUIMenuBarTemplateDocumentViewController _isFirstViewControllerOnNavigationStack](self, "_isFirstViewControllerOnNavigationStack"))
  {
    -[SKUIMenuBarTemplateDocumentViewController titleView](self, "titleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMenuBarNavigationBarController setTitleView:](v5, "setTitleView:", v6);

  }
  return v5;
}

- (void)scrollingSegmentedController:(id)a3 willDisplayViewControllerAtIndex:(unint64_t)a4
{
  -[SKUIMenuBarTemplateDocumentViewController _willDisplayViewControllerAtIndex:](self, "_willDisplayViewControllerAtIndex:", a4);
}

- (void)scrollingTabAppearanceStatusWasUpdated:(id)a3
{
  self->_scrollingTabAppearanceStatus = ($D35E09B864CB17FEE2308AEA3FA0107F)a3;
  -[SKUIScrollingSegmentedController scrollingTabAppearanceStatusWasUpdated:](self->_scrollingSegmentedController, "scrollingTabAppearanceStatusWasUpdated:");
}

- (UIScrollView)scrollingTabNestedPagingScrollView
{
  return -[SKUIScrollingSegmentedController scrollingTabNestedPagingScrollView](self->_scrollingSegmentedController, "scrollingTabNestedPagingScrollView");
}

- (id)scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3
{
  return -[SKUIScrollingSegmentedController scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:](self->_scrollingSegmentedController, "scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:", a3);
}

- (UIView)titleView
{
  return (UIView *)-[SKUIScrollingSegmentedController navigationBarTitleView](self->_scrollingSegmentedController, "navigationBarTitleView");
}

- (double)titleViewHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  -[SKUIScrollingSegmentedController navigationBarTitleView](self->_scrollingSegmentedController, "navigationBarTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  v7 = v6;

  -[SKUIScrollingSegmentedController navigationBarTitleView](self->_scrollingSegmentedController, "navigationBarTitleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "segmentedControlMinimumHeight");
  v10 = v9;

  return v7 + v5 + v10;
}

- (void)_addContentViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SKUIMenuBarTemplateDocumentViewController addChildViewController:](self, "addChildViewController:", v7);
    if (-[SKUIMenuBarTemplateDocumentViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SKUIMenuBarTemplateDocumentViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      objc_msgSend(v6, "setFrame:");
      objc_msgSend(v6, "setAutoresizingMask:", 18);
      objc_msgSend(v5, "addSubview:", v6);

    }
    objc_msgSend(v7, "didMoveToParentViewController:", self);
  }

}

- (id)_childViewControllersForMenuItems
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SKUIMenuBarTemplateDocumentViewController _dynamicPageSectionIndexMapper](self, "_dynamicPageSectionIndexMapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "totalNumberOfEntities");
  else
    v6 = -[SKUIMenuBarViewElementConfiguration numberOfMenuItems](self->_menuBarViewElementConfiguration, "numberOfMenuItems");
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    do
    {
      v9 = -[SKUIMenuBarTemplateDocumentViewController _newChildViewControllerForEntityAtIndex:](self, "_newChildViewControllerForEntityAtIndex:", v8);
      objc_msgSend(v3, "addObject:", v9);

      ++v8;
    }
    while (v7 != v8);
  }

  return v3;
}

- (id)_colorScheme
{
  void *v2;
  void *v3;
  void *v4;
  SKUIColorScheme *v5;

  -[SKUIMenuBarTemplateElement style](self->_templateElement, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ikBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_alloc_init(SKUIColorScheme);
  -[SKUIColorScheme setBackgroundColor:](v5, "setBackgroundColor:", v4);

  return v5;
}

- (id)_contentViewController
{
  unint64_t v2;

  v2 = self->_menuBarStyle - 1;
  if (v2 > 2)
    return 0;
  else
    return objc_autoreleaseReturnValue(objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                                                         + *off_1E73A3418[v2])));
}

- (id)_dynamicPageSectionIndexMapper
{
  SKUIDynamicPageSectionIndexMapper *v3;
  SKUIDynamicPageSectionIndexMapper *dynamicPageSectionIndexMapper;
  SKUIDynamicPageSectionIndexMapper *v5;
  void *v6;

  if (!self->_dynamicPageSectionIndexMapper
    && -[SKUIViewElement isDynamicContainer](self->_menuBarViewElement, "isDynamicContainer"))
  {
    v3 = objc_alloc_init(SKUIDynamicPageSectionIndexMapper);
    dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    self->_dynamicPageSectionIndexMapper = v3;

    v5 = self->_dynamicPageSectionIndexMapper;
    -[SKUIViewElement entityProvider](self->_menuBarViewElement, "entityProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDynamicPageSectionIndexMapper setEntityProvider:](v5, "setEntityProvider:", v6);

  }
  return self->_dynamicPageSectionIndexMapper;
}

- (unint64_t)_menuItemIndexForEntityIndex:(unint64_t)a3 entityValueProvider:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SKUIMenuBarTemplateDocumentViewController _dynamicPageSectionIndexMapper](self, "_dynamicPageSectionIndexMapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v10 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[SKUIViewElement entityProvider](self->_menuBarViewElement, "entityProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entityIndexPathForGlobalIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entityValueProviderAtIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  a3 = 0;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v10);
LABEL_4:

  return a3;
}

- (id)_newChildViewControllerForEntityAtIndex:(unint64_t)a3
{
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SKUIDocumentContainerViewController *v11;
  void *v12;
  SKUIDocumentContainerViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v18 = 0;
  v5 = -[SKUIMenuBarTemplateDocumentViewController _menuItemIndexForEntityIndex:entityValueProvider:](self, "_menuItemIndexForEntityIndex:entityValueProvider:", a3, &v18);
  v6 = v18;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "entityUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMenuBarTemplateDocumentViewController _recordEntityUniqueIdentifier:forEntityIndex:](self, "_recordEntityUniqueIdentifier:forEntityIndex:", v8, a3);
    -[SKUIMenuBarViewElementConfiguration documentForEntityUniqueIdentifier:](self->_menuBarViewElementConfiguration, "documentForEntityUniqueIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMenuBarViewElementConfiguration documentOptionsForEntityUniqueIdentifier:](self->_menuBarViewElementConfiguration, "documentOptionsForEntityUniqueIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
LABEL_5:
    v11 = [SKUIDocumentContainerViewController alloc];
    -[SKUIViewController clientContext](self, "clientContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SKUIDocumentContainerViewController initWithDocument:options:clientContext:](v11, "initWithDocument:options:clientContext:", v9, v10, v12);

    if (v13)
      goto LABEL_7;
    goto LABEL_6;
  }
  -[SKUIMenuBarViewElementConfiguration documentForMenuItemAtIndex:](self->_menuBarViewElementConfiguration, "documentForMenuItemAtIndex:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIMenuBarViewElementConfiguration documentOptionsForMenuItemAtIndex:](self->_menuBarViewElementConfiguration, "documentOptionsForMenuItemAtIndex:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_5;
LABEL_6:
  v13 = (SKUIDocumentContainerViewController *)objc_alloc_init(MEMORY[0x1E0DC3F20]);
LABEL_7:
  if (self->_menuBarStyle == 1)
  {
    -[SKUIMenuBarViewElement titleForMenuItemAtIndex:](self->_menuBarViewElement, "titleForMenuItemAtIndex:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDocumentContainerViewController setTitle:](v13, "setTitle:", v16);

  }
  return v13;
}

- (void)_recordEntityUniqueIdentifier:(id)a3 forEntityIndex:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *entityUniqueIdentifierToEntityIndex;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v6 = a3;
  if (v6)
  {
    v11 = v6;
    entityUniqueIdentifierToEntityIndex = self->_entityUniqueIdentifierToEntityIndex;
    if (!entityUniqueIdentifierToEntityIndex)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_entityUniqueIdentifierToEntityIndex;
      self->_entityUniqueIdentifierToEntityIndex = v8;

      entityUniqueIdentifierToEntityIndex = self->_entityUniqueIdentifierToEntityIndex;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](entityUniqueIdentifierToEntityIndex, "setObject:forKey:", v10, v11);

    v6 = v11;
  }

}

- (void)_reloadContentViewController
{
  int64_t v3;
  int64_t menuBarStyle;
  SKUIScrollingSegmentedController **p_scrollingSegmentedController;
  uint64_t v6;
  SKUIScrollingSegmentedController *v7;
  SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *embeddedPaletteHost;
  SKUIScrollingSegmentedController *scrollingSegmentedController;
  void *pendingSelectedMenuItemViewElement;
  void *v11;
  SKUILoadingDocumentViewController *v12;
  SKUILoadingDocumentViewController *loadingDocumentViewController;
  SKUILoadingDocumentViewController *v14;
  void *v15;
  SKUILoadingDocumentViewController *v16;
  void *v17;
  SKUILoadingDocumentViewController *v18;
  SKUIHorizontalScrollingContainerViewController *horizontalScrollingContainerViewController;
  SKUIHorizontalScrollingContainerViewController *v20;
  SKUIHorizontalScrollingContainerViewController *v21;
  void *v22;
  SKUIMenuBarSectionsViewController *menuBarSectionsViewController;
  SKUIMenuBarSectionsViewController *v24;
  SKUIMenuBarSectionsViewController *v25;
  SKUIMenuBarSectionsViewController *v26;
  void *v27;
  SKUIMenuBarSectionsViewController *v28;
  void *v29;
  SKUIMenuBarSectionsViewController *v30;
  void *v31;
  SKUIScrollingSegmentedController *v32;
  SKUIScrollingSegmentedController *v33;
  SKUIScrollingSegmentedController *v34;
  void *v35;
  SKUIScrollingSegmentedController *v36;
  void *v37;
  SKUIScrollingSegmentedController *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  float v46;
  void *v47;
  void *v48;
  SKUIMenuBarSectionsViewController *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  CGRect v56;

  v3 = -[SKUIMenuBarViewElementConfiguration menuBarStyle](self->_menuBarViewElementConfiguration, "menuBarStyle");
  menuBarStyle = self->_menuBarStyle;
  if (menuBarStyle != v3)
  {
    switch(menuBarStyle)
    {
      case 3:
        v6 = 1072;
        break;
      case 2:
        -[SKUIHorizontalScrollingContainerViewController setDelegate:](self->_horizontalScrollingContainerViewController, "setDelegate:", 0);
        -[SKUIMenuBarTemplateDocumentViewController _removeContentViewController:](self, "_removeContentViewController:", self->_horizontalScrollingContainerViewController);
        v6 = 1080;
        break;
      case 1:
        p_scrollingSegmentedController = &self->_scrollingSegmentedController;
        -[SKUIScrollingSegmentedController setDelegate:](self->_scrollingSegmentedController, "setDelegate:", 0);
LABEL_9:
        -[SKUIMenuBarTemplateDocumentViewController _removeContentViewController:](self, "_removeContentViewController:", *p_scrollingSegmentedController);
        v7 = *p_scrollingSegmentedController;
        *p_scrollingSegmentedController = 0;

        goto LABEL_10;
      default:
LABEL_10:
        embeddedPaletteHost = self->_embeddedPaletteHost;
        self->_embeddedPaletteHost = 0;

        goto LABEL_11;
    }
    p_scrollingSegmentedController = (SKUIScrollingSegmentedController **)((char *)self + v6);
    goto LABEL_9;
  }
LABEL_11:
  self->_menuBarStyle = v3;
  if (v3 == 3)
  {
    if (self->_loadingDocumentViewController)
      return;
    -[SKUIViewElement firstChildForElementType:](self->_menuBarViewElement, "firstChildForElementType:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SKUILoadingDocumentViewController initWithActivityIndicatorElement:]([SKUILoadingDocumentViewController alloc], "initWithActivityIndicatorElement:", v11);
    loadingDocumentViewController = self->_loadingDocumentViewController;
    self->_loadingDocumentViewController = v12;

    v14 = self->_loadingDocumentViewController;
    -[SKUIViewController clientContext](self, "clientContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewController setClientContext:](v14, "setClientContext:", v15);

    v16 = self->_loadingDocumentViewController;
    -[SKUIViewController operationQueue](self, "operationQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewController setOperationQueue:](v16, "setOperationQueue:", v17);

    v18 = self->_loadingDocumentViewController;
LABEL_36:

    if (!v18)
      return;
    goto LABEL_37;
  }
  if (v3 != 2)
  {
    if (v3 != 1)
      return;
    scrollingSegmentedController = self->_scrollingSegmentedController;
    if (scrollingSegmentedController)
    {
      -[SKUIMenuBarTemplateDocumentViewController _childViewControllersForMenuItems](self, "_childViewControllersForMenuItems");
      pendingSelectedMenuItemViewElement = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIScrollingSegmentedController setViewControllers:](scrollingSegmentedController, "setViewControllers:", pendingSelectedMenuItemViewElement);
    }
    else
    {
      v32 = objc_alloc_init(SKUIScrollingSegmentedController);
      v33 = self->_scrollingSegmentedController;
      self->_scrollingSegmentedController = v32;

      v34 = self->_scrollingSegmentedController;
      -[SKUIViewController clientContext](self, "clientContext");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIScrollingSegmentedController setClientContext:](v34, "setClientContext:", v35);

      v36 = self->_scrollingSegmentedController;
      -[SKUIViewController operationQueue](self, "operationQueue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIViewController setOperationQueue:](v36, "setOperationQueue:", v37);

      -[SKUIScrollingSegmentedController setDelegate:](self->_scrollingSegmentedController, "setDelegate:", self);
      -[SKUIScrollingSegmentedController scrollingTabAppearanceStatusWasUpdated:](self->_scrollingSegmentedController, "scrollingTabAppearanceStatusWasUpdated:", *(_QWORD *)&self->_scrollingTabAppearanceStatus.progress, *(_QWORD *)&self->_scrollingTabAppearanceStatus.isBouncingOffTheEdge);
      v38 = self->_scrollingSegmentedController;
      -[SKUIMenuBarTemplateDocumentViewController _childViewControllersForMenuItems](self, "_childViewControllersForMenuItems");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIScrollingSegmentedController setViewControllers:](v38, "setViewControllers:", v39);

      if (!self->_pendingSelectedMenuItemViewElement)
        goto LABEL_29;
      v40 = -[SKUIMenuBarViewElementConfiguration indexOfMenuItemViewElement:](self->_menuBarViewElementConfiguration, "indexOfMenuItemViewElement:");
      if (v40 != 0x7FFFFFFFFFFFFFFFLL)
        -[SKUIScrollingSegmentedController selectViewControllerAtIndex:animated:](self->_scrollingSegmentedController, "selectViewControllerAtIndex:animated:", v40, 0);
      pendingSelectedMenuItemViewElement = self->_pendingSelectedMenuItemViewElement;
      self->_pendingSelectedMenuItemViewElement = 0;
    }

LABEL_29:
    -[SKUIMenuBarViewElement style](self->_menuBarViewElement, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForStyle:", *MEMORY[0x1E0D3A5A8]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIScrollingSegmentedController navigationBarTitleView](self->_scrollingSegmentedController, "navigationBarTitleView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v41)
    {
      objc_msgSend(v42, "setLayoutStyle:", 1);
      objc_msgSend(v41, "UIEdgeInsetsValue");
    }
    else
    {
      objc_msgSend(v42, "setLayoutStyle:", 0);
      v55 = 0;
      v44 = SKUIViewElementPaddingForStyle(v11, &v55);
      if (!v55)
      {
LABEL_33:
        objc_msgSend(v11, "valueForStyle:", *MEMORY[0x1E0D3A5A0], v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v45, "length"))
        {
          objc_msgSend(v45, "floatValue");
          objc_msgSend(v43, "setSegmentedControlMinimumHeight:", v46);
        }
        v18 = self->_scrollingSegmentedController;

        goto LABEL_36;
      }
    }
    objc_msgSend(v43, "setLayoutMargins:");
    goto LABEL_33;
  }
  horizontalScrollingContainerViewController = self->_horizontalScrollingContainerViewController;
  if (!horizontalScrollingContainerViewController)
  {
    v20 = objc_alloc_init(SKUIHorizontalScrollingContainerViewController);
    v21 = self->_horizontalScrollingContainerViewController;
    self->_horizontalScrollingContainerViewController = v20;

    -[SKUIHorizontalScrollingContainerViewController setDelegate:](self->_horizontalScrollingContainerViewController, "setDelegate:", self);
    horizontalScrollingContainerViewController = self->_horizontalScrollingContainerViewController;
  }
  -[SKUIMenuBarTemplateDocumentViewController _childViewControllersForMenuItems](self, "_childViewControllersForMenuItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIHorizontalScrollingContainerViewController setViewControllers:](horizontalScrollingContainerViewController, "setViewControllers:", v22);

  menuBarSectionsViewController = self->_menuBarSectionsViewController;
  if (!menuBarSectionsViewController)
  {
    v24 = -[SKUIMenuBarSectionsViewController initWithLayoutStyle:]([SKUIMenuBarSectionsViewController alloc], "initWithLayoutStyle:", 0);
    v25 = self->_menuBarSectionsViewController;
    self->_menuBarSectionsViewController = v24;

    v26 = self->_menuBarSectionsViewController;
    -[SKUIViewController clientContext](self, "clientContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewController setClientContext:](v26, "setClientContext:", v27);

    v28 = self->_menuBarSectionsViewController;
    -[SKUIViewController operationQueue](self, "operationQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewController setOperationQueue:](v28, "setOperationQueue:", v29);

    v30 = self->_menuBarSectionsViewController;
    -[SKUIMenuBarTemplateDocumentViewController preferredContentSize](self, "preferredContentSize");
    -[SKUIMenuBarSectionsViewController setPreferredContentSize:](v30, "setPreferredContentSize:");
    -[SKUIMenuBarSectionsViewController view](self->_menuBarSectionsViewController, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "frame");
    if (CGRectIsEmpty(v56))
    {
      if (-[SKUIMenuBarTemplateDocumentViewController isViewLoaded](self, "isViewLoaded"))
        -[SKUIMenuBarTemplateDocumentViewController view](self, "view");
      else
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bounds");
      objc_msgSend(v31, "setFrame:");

    }
    menuBarSectionsViewController = self->_menuBarSectionsViewController;
  }
  -[SKUIMenuBarTemplateDocumentViewController _colorScheme](self, "_colorScheme");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSectionsViewController setColorScheme:](menuBarSectionsViewController, "setColorScheme:", v48);

  -[SKUIMenuBarSectionsViewController setNumberOfIterationsForShelfPageSections:](self->_menuBarSectionsViewController, "setNumberOfIterationsForShelfPageSections:", 1);
  -[SKUIStorePageSectionsViewController _setRendersWithPerspective:](self->_menuBarSectionsViewController, "_setRendersWithPerspective:", -[SKUIViewElement rendersWithPerspective](self->_templateElement, "rendersWithPerspective"));
  -[SKUIStorePageSectionsViewController _setRendersWithParallax:](self->_menuBarSectionsViewController, "_setRendersWithParallax:", -[SKUIViewElement rendersWithParallax](self->_templateElement, "rendersWithParallax"));
  v49 = self->_menuBarSectionsViewController;
  -[SKUIMenuBarTemplateDocumentViewController _zoomingShelfPageSplitsDescription](self, "_zoomingShelfPageSplitsDescription");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSectionsViewController setSectionsWithSplitsDescription:](v49, "setSectionsWithSplitsDescription:", v50);

  -[SKUIStorePageSectionsViewController sections](self->_menuBarSectionsViewController, "sections");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "firstObject");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v52, "configuration");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "shelfCollectionView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIHorizontalScrollingContainerViewController setMenuBarCollectionView:](self->_horizontalScrollingContainerViewController, "setMenuBarCollectionView:", v54);
  v18 = self->_horizontalScrollingContainerViewController;

  if (v18)
  {
LABEL_37:
    -[SKUIMenuBarTemplateDocumentViewController _addContentViewController:](self, "_addContentViewController:", v18);

  }
}

- (void)_removeContentViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v6, "willMoveToParentViewController:", 0);
  if (objc_msgSend(v6, "isViewLoaded"))
  {
    objc_msgSend(v6, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v4, "removeFromSuperview");

  }
  if (v3)
    objc_msgSend(v6, "removeFromParentViewController");

}

- (void)_replaceViewControllerAtIndex:(unint64_t)a3 withViewController:(id)a4
{
  id v6;
  int64_t menuBarStyle;
  int *v8;
  id v9;

  v6 = a4;
  menuBarStyle = self->_menuBarStyle;
  if (menuBarStyle == 1)
  {
    v8 = &OBJC_IVAR___SKUIMenuBarTemplateDocumentViewController__scrollingSegmentedController;
    goto LABEL_5;
  }
  if (menuBarStyle == 2)
  {
    v8 = &OBJC_IVAR___SKUIMenuBarTemplateDocumentViewController__horizontalScrollingContainerViewController;
LABEL_5:
    v9 = v6;
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v8), "replaceViewControllerAtIndex:withViewController:", a3, v6);
    v6 = v9;
  }

}

- (BOOL)_isFirstViewControllerOnNavigationStack
{
  SKUIMenuBarTemplateDocumentViewController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[SKUIMenuBarTemplateDocumentViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = SKUIViewControllerIsDescendent(v2, v5);

  return (char)v2;
}

- (void)_willDisplayViewControllerAtIndex:(unint64_t)a3
{
  unint64_t v4;
  SKUIMenuBarViewElementConfiguration *menuBarViewElementConfiguration;
  id v6;
  void *v7;
  id v8;

  v8 = 0;
  v4 = -[SKUIMenuBarTemplateDocumentViewController _menuItemIndexForEntityIndex:entityValueProvider:](self, "_menuItemIndexForEntityIndex:entityValueProvider:", a3, &v8);
  menuBarViewElementConfiguration = self->_menuBarViewElementConfiguration;
  v6 = v8;
  -[SKUIViewController clientContext](self, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIMenuBarViewElementConfiguration contentWillAppearForMenuItemAtIndex:withEntityValueProvider:clientContext:](menuBarViewElementConfiguration, "contentWillAppearForMenuItemAtIndex:withEntityValueProvider:clientContext:", v4, v6, v7);

}

- (id)_zoomingShelfPageSplitsDescription
{
  SKUIStorePageSplitsDescription *v3;
  SKUIMenuBarViewElement *v4;
  objc_class *v5;
  void *v6;
  SKUIStorePageSplit *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (self->_menuBarStyle == 2)
  {
    v3 = objc_alloc_init(SKUIStorePageSplitsDescription);
    v4 = self->_menuBarViewElement;
    v5 = (objc_class *)SKUIPageComponentClassForComponentType(-[SKUIViewElement pageComponentType](v4, "pageComponentType"));
    if (v5)
    {
      v6 = (void *)objc_msgSend([v5 alloc], "initWithViewElement:", v4);
      v7 = objc_alloc_init(SKUIStorePageSplit);
      v10[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIStorePageSplit setPageComponents:](v7, "setPageComponents:", v8);

      -[SKUIStorePageSplitsDescription setTopSplit:](v3, "setTopSplit:", v7);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_scrollingSegmentedController, 0);
  objc_storeStrong((id *)&self->_pendingSelectedMenuItemViewElement, 0);
  objc_storeStrong((id *)&self->_menuBarViewElementConfiguration, 0);
  objc_storeStrong((id *)&self->_menuBarViewElement, 0);
  objc_storeStrong((id *)&self->_menuBarSectionsViewController, 0);
  objc_storeStrong((id *)&self->_loadingDocumentViewController, 0);
  objc_storeStrong((id *)&self->_horizontalScrollingContainerViewController, 0);
  objc_storeStrong((id *)&self->_entityUniqueIdentifierToEntityIndex, 0);
  objc_storeStrong((id *)&self->_dynamicPageSectionIndexMapper, 0);
  objc_storeStrong((id *)&self->_embeddedPaletteHost, 0);
}

- (void)initWithTemplateElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMenuBarTemplateDocumentViewController initWithTemplateElement:]";
}

@end
