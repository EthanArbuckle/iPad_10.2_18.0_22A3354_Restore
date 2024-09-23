@implementation UGCInlinePOIEnrichmentViewController

- (UGCInlinePOIEnrichmentViewController)initWithPOIEnrichmentForm:(id)a3
{
  id v5;
  UGCInlinePOIEnrichmentViewController *v6;
  UGCInlinePOIEnrichmentViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UGCInlinePOIEnrichmentViewController;
  v6 = -[UGCInlinePOIEnrichmentViewController init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_poiEnrichmentForm, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentForm ratingsForm](v7->_poiEnrichmentForm, "ratingsForm"));
    objc_msgSend(v8, "addObserver:", v7);

  }
  return v7;
}

- (void)viewDidLoad
{
  UGCPOIEnrichmentViewController *v3;
  UGCPOIEnrichmentViewController *contentVC;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v13;
  id v14;

  v13.receiver = self;
  v13.super_class = (Class)UGCInlinePOIEnrichmentViewController;
  -[UGCInlinePOIEnrichmentViewController viewDidLoad](&v13, "viewDidLoad");
  -[UGCInlinePOIEnrichmentViewController _mapsui_resetViewLayoutMargins](self, "_mapsui_resetViewLayoutMargins");
  v3 = -[UGCPOIEnrichmentViewController initWithPOIEnrichmentForm:presentationContext:]([UGCPOIEnrichmentViewController alloc], "initWithPOIEnrichmentForm:presentationContext:", self->_poiEnrichmentForm, 1);
  contentVC = self->_contentVC;
  self->_contentVC = v3;

  -[UGCPOIEnrichmentViewController setIsInlineMode:](self->_contentVC, "setIsInlineMode:", 1);
  -[UGCPOIEnrichmentViewController setFormInteractionEnabled:](self->_contentVC, "setFormInteractionEnabled:", self->_formInteractionEnabled);
  -[UGCPOIEnrichmentViewController setDelegate:](self->_contentVC, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentVC, "view"));
  objc_msgSend(v5, "setPreservesSuperviewLayoutMargins:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentVC, "view"));
  objc_msgSend(v6, "addSubview:", v7);

  -[UGCInlinePOIEnrichmentViewController addChildViewController:](self, "addChildViewController:", self->_contentVC);
  -[UGCPOIEnrichmentViewController didMoveToParentViewController:](self->_contentVC, "didMoveToParentViewController:", self);
  v8 = objc_alloc((Class)MUEdgeLayout);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentVC, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentViewController view](self, "view"));
  v11 = objc_msgSend(v8, "initWithItem:container:", v9, v10);

  v14 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v12);

}

- (void)setFormInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_formInteractionEnabled != a3)
  {
    v3 = a3;
    self->_formInteractionEnabled = a3;
    if (-[UGCInlinePOIEnrichmentViewController isViewLoaded](self, "isViewLoaded"))
      -[UGCPOIEnrichmentViewController setFormInteractionEnabled:](self->_contentVC, "setFormInteractionEnabled:", v3);
  }
}

- (void)formDidChange:(id)a3
{
  unsigned int v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;

  v3 = -[UGCPOIEnrichmentForm isComplete](self->_poiEnrichmentForm, "isComplete", a3);
  if (qword_1014D3BC0 != -1)
    dispatch_once(&qword_1014D3BC0, &stru_1011DD898);
  v4 = (id)qword_1014D3BB8;
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v9 = 0;
      v6 = "POI enrichement form is complete";
      v7 = (uint8_t *)&v9;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    v8 = 0;
    v6 = "POI enrichement form is not complete";
    v7 = (uint8_t *)&v8;
    goto LABEL_8;
  }

}

- (void)poiEnrichmentViewController:(id)a3 presentInformedConsentIfNeededWithCompletion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentViewController enrichmentController](self, "enrichmentController"));
  objc_msgSend(v6, "presentInformedConsentIfNeededWithCompletion:", v5);

}

- (void)poiEnrichmentViewController:(id)a3 didSelectAddPhotosUsingSourceType:(int64_t)a4 presentationOptions:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentViewController enrichmentController](self, "enrichmentController"));
  objc_msgSend(v8, "requestAddPhotosWithSourceType:presentationOptions:", a4, v7);

}

- (void)poiEnrichmentViewController:(id)a3 captureUserActionForRatingCategoryState:(int64_t)a4 value:(id)a5 target:(int)a6
{
  uint64_t v6;
  id v9;
  id v10;

  v6 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentViewController enrichmentController](self, "enrichmentController"));
  objc_msgSend(v10, "captureUserActionForRatingState:value:target:", a4, v9, v6);

}

- (void)poiEnrichmentViewController:(id)a3 captureUserAction:(int)a4 value:(id)a5 target:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a4;
  v9 = a5;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentViewController enrichmentController](self, "enrichmentController"));
  objc_msgSend(v10, "captureUserAction:value:target:", v7, v9, v6);

}

- (void)poiEnrichmentViewController:(id)a3 didSelectTermsOfServiceURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentViewController enrichmentController](self, "enrichmentController"));
  objc_msgSend(v6, "openTermsOfServiceURL:", v5);

}

- (UGCInlinePOIEnrichmentController)enrichmentController
{
  return (UGCInlinePOIEnrichmentController *)objc_loadWeakRetained((id *)&self->_enrichmentController);
}

- (void)setEnrichmentController:(id)a3
{
  objc_storeWeak((id *)&self->_enrichmentController, a3);
}

- (BOOL)formInteractionEnabled
{
  return self->_formInteractionEnabled;
}

- (UGCPOIEnrichmentForm)poiEnrichmentForm
{
  return self->_poiEnrichmentForm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiEnrichmentForm, 0);
  objc_destroyWeak((id *)&self->_enrichmentController);
  objc_storeStrong((id *)&self->_contentVC, 0);
}

@end
