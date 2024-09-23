@implementation UGCPOIEnrichmentCoordinator

- (UGCPOIEnrichmentCoordinator)init
{
  UGCPOIEnrichmentCoordinator *v2;
  uint64_t v3;
  MKLocationManager *locationManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UGCPOIEnrichmentCoordinator;
  v2 = -[UGCPOIEnrichmentCoordinator init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MKLocationManager unretainedUGCInstance](MKLocationManager, "unretainedUGCInstance"));
    locationManager = v2->_locationManager;
    v2->_locationManager = (MKLocationManager *)v3;

  }
  return v2;
}

- (void)invokeSubmissionUpdate
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionStatusDelegate](self, "submissionStatusDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "poiEnrichmentCoordinatorDidUpdateUserSubmission:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionStatusDelegate](self, "submissionStatusDelegate"));
    objc_msgSend(v5, "poiEnrichmentCoordinatorDidUpdateUserSubmission:", self);

  }
}

- (void)invokeCompletion
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController"));
  v4 = sub_1002A8AA0(v3);

  if (v4 == 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator placeCardDismissalDelegate](self, "placeCardDismissalDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
    objc_msgSend(v5, "didDismissViewController:mapItem:", v6, v7);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "poiEnrichmentCoordinatorDidFinish:", self);

}

+ (id)ratingsAndPhotosCoordinatorWithMapItem:(id)a3 initialOverallState:(int64_t)a4 entryPoint:(int64_t)a5 originTarget:(id)a6
{
  id v9;
  void *v10;

  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator _addCoordinatorWithMapItem:entryPoint:](UGCPOIEnrichmentCoordinator, "_addCoordinatorWithMapItem:entryPoint:", a3, a5));
  objc_msgSend(v10, "setInitialOverallState:", a4);
  objc_msgSend(v10, "setOriginTarget:", v9);

  return v10;
}

+ (id)photoEmphasizedAddCoordinatorWithMapItem:(id)a3 originTarget:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator _addCoordinatorWithMapItem:entryPoint:](UGCPOIEnrichmentCoordinator, "_addCoordinatorWithMapItem:entryPoint:", a3, 0));
  objc_msgSend(v6, "setHasPhotoPickerEmphasis:", 1);
  objc_msgSend(v6, "setOriginTarget:", v5);

  return v6;
}

+ (id)photoEmphasizedAddCoordinatorWithMapItem:(id)a3 preferredSourceType:(int64_t)a4 originTarget:(id)a5 suppressRatings:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;

  v6 = a6;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator _addCoordinatorWithMapItem:entryPoint:](UGCPOIEnrichmentCoordinator, "_addCoordinatorWithMapItem:entryPoint:", a3, 0));
  objc_msgSend(v10, "setHasPhotoPickerEmphasis:", 1);
  objc_msgSend(v10, "setSuppressRatings:", v6);
  objc_msgSend(v10, "setPreferredSourceType:", a4);
  objc_msgSend(v10, "setOriginTarget:", v9);

  return v10;
}

+ (id)photoEmphasizedAddCoordinatorWithMapItem:(id)a3 preferredSourceType:(int64_t)a4 originTarget:(id)a5
{
  id v7;
  void *v8;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator _addCoordinatorWithMapItem:entryPoint:](UGCPOIEnrichmentCoordinator, "_addCoordinatorWithMapItem:entryPoint:", a3, 0));
  objc_msgSend(v8, "setHasPhotoPickerEmphasis:", 1);
  objc_msgSend(v8, "setPreferredSourceType:", a4);
  objc_msgSend(v8, "setOriginTarget:", v7);

  return v8;
}

+ (id)_addCoordinatorWithMapItem:(id)a3 entryPoint:(int64_t)a4
{
  id v5;
  UGCRatingsAndPhotosCoordinator *v6;

  v5 = a3;
  v6 = objc_alloc_init(UGCRatingsAndPhotosCoordinator);
  -[UGCPOIEnrichmentCoordinator setMapItem:](v6, "setMapItem:", v5);

  -[UGCPOIEnrichmentCoordinator setEntryPoint:](v6, "setEntryPoint:", a4);
  return v6;
}

+ (id)ratingsAndPhotosCoordinatorWithMapItem:(id)a3 entryPoint:(int64_t)a4 originTarget:(id)a5
{
  id v7;
  void *v8;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator _addCoordinatorWithMapItem:entryPoint:](UGCRatingsAndPhotosCoordinator, "_addCoordinatorWithMapItem:entryPoint:", a3, a4));
  objc_msgSend(v8, "setOriginTarget:", v7);

  return v8;
}

+ (id)photoThumbnailGalleryCoordinatorWithMapItem:(id)a3 withStartingIndex:(unint64_t)a4
{
  id v5;
  UGCPhotoGalleryCoordinator *v6;

  v5 = a3;
  v6 = objc_alloc_init(UGCPhotoGalleryCoordinator);
  -[UGCPOIEnrichmentCoordinator setMapItem:](v6, "setMapItem:", v5);

  -[UGCPhotoGalleryCoordinator setSelectedIndex:](v6, "setSelectedIndex:", a4);
  return v6;
}

+ (id)photoThumbnailGalleryCoordinatorWithMapItem:(id)a3 albumIndex:(unint64_t)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "photoThumbnailGalleryCoordinatorWithMapItem:withStartingIndex:", a3, 0));
  objc_msgSend(v5, "setAlbumIndex:", a4);
  return v5;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UGCPOIEnrichmentCoordinatorDelegate)delegate
{
  return (UGCPOIEnrichmentCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UGCPOIEnrichmentSubmissionStatusDelegate)submissionStatusDelegate
{
  return (UGCPOIEnrichmentSubmissionStatusDelegate *)objc_loadWeakRetained((id *)&self->_submissionStatusDelegate);
}

- (void)setSubmissionStatusDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_submissionStatusDelegate, a3);
}

- (UGCPOIEnrichmentPresentationDelegate)presentationDelegate
{
  return (UGCPOIEnrichmentPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (UIBarButtonItem)anchoringBarButtonItem
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_anchoringBarButtonItem);
}

- (void)setAnchoringBarButtonItem:(id)a3
{
  objc_storeWeak((id *)&self->_anchoringBarButtonItem, a3);
}

- (UIView)anchoringView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_anchoringView);
}

- (void)setAnchoringView:(id)a3
{
  objc_storeWeak((id *)&self->_anchoringView, a3);
}

- (MUActivityObserving)submissionLookupObserver
{
  return (MUActivityObserving *)objc_loadWeakRetained((id *)&self->_submissionLookupObserver);
}

- (void)setSubmissionLookupObserver:(id)a3
{
  objc_storeWeak((id *)&self->_submissionLookupObserver, a3);
}

- (PlaceCardDismissable)placeCardDismissalDelegate
{
  return (PlaceCardDismissable *)objc_loadWeakRetained((id *)&self->_placeCardDismissalDelegate);
}

- (void)setPlaceCardDismissalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeCardDismissalDelegate, a3);
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(int64_t)a3
{
  self->_presentationContext = a3;
}

- (int64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int64_t)a3
{
  self->_entryPoint = a3;
}

- (NSString)originTarget
{
  return self->_originTarget;
}

- (void)setOriginTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)entryPointRequiresARPPrivacyScreenIfNeeded
{
  return self->_entryPointRequiresARPPrivacyScreenIfNeeded;
}

- (void)setEntryPointRequiresARPPrivacyScreenIfNeeded:(BOOL)a3
{
  self->_entryPointRequiresARPPrivacyScreenIfNeeded = a3;
}

- (BOOL)prefersDefaultPresentationOverContainee
{
  return self->_prefersDefaultPresentationOverContainee;
}

- (void)setPrefersDefaultPresentationOverContainee:(BOOL)a3
{
  self->_prefersDefaultPresentationOverContainee = a3;
}

- (ContainerViewController)containerViewController
{
  return (ContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (ContaineeViewControllerDelegate)containeeDelegate
{
  return (ContaineeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_containeeDelegate);
}

- (void)setContaineeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_containeeDelegate, a3);
}

- (UGCSubmissionLookupResult)submissionLookupResult
{
  return self->_submissionLookupResult;
}

- (void)setSubmissionLookupResult:(id)a3
{
  objc_storeStrong((id *)&self->_submissionLookupResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionLookupResult, 0);
  objc_destroyWeak((id *)&self->_containeeDelegate);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_originTarget, 0);
  objc_destroyWeak((id *)&self->_placeCardDismissalDelegate);
  objc_destroyWeak((id *)&self->_submissionLookupObserver);
  objc_destroyWeak((id *)&self->_anchoringView);
  objc_destroyWeak((id *)&self->_anchoringBarButtonItem);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_destroyWeak((id *)&self->_submissionStatusDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
