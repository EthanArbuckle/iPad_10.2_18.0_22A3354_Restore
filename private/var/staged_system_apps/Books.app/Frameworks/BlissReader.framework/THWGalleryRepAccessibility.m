@implementation THWGalleryRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  return -[THWGalleryRepAccessibility thaxGalleryTitle](self, "thaxGalleryTitle");
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  return -[THWGalleryRepAccessibility thaxStageCanvasView](self, "thaxStageCanvasView") != 0;
}

- (BOOL)thaxShouldPreventPageScrolledNotificationForScrollView:(id)a3
{
  return 1;
}

- (void)thaxAnnounceCurrentGalleryItem
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableString *v11;

  v3 = -[THWGalleryRepAccessibility thaxItemCountDescriptionForCurrentItem](self, "thaxItemCountDescriptionForCurrentItem");
  v4 = -[THWGalleryRepAccessibility thaxCaptionForCurrentItem](self, "thaxCaptionForCurrentItem");
  v11 = __TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  TSAccessibilityPostAnnouncementNotification(0, (uint64_t)v11);
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWGalleryRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (NSString)thaxGalleryTitle
{
  NSString *v2;

  v2 = (NSString *)objc_msgSend(-[TSDRepAccessibility tsaxInfo](self, "tsaxInfo"), "tsaxValueForKey:", CFSTR("titleString"));
  if (-[NSString length](v2, "length"))
    return v2;
  else
    return THAccessibilityLocalizedString((uint64_t)CFSTR("gallery"));
}

- (NSString)thaxCaptionForCurrentItem
{
  return -[THWGalleryItemAccessibility thaxDescription](-[THWGalleryRepAccessibility _thaxCurrentItem](self, "_thaxCurrentItem"), "thaxDescription");
}

- (NSString)thaxItemCountDescriptionForCurrentItem
{
  return (NSString *)-[THWGalleryRepAccessibility _thaxItemOrderDescriptionForItemAtIndex:](self, "_thaxItemOrderDescriptionForItemAtIndex:", -[THWGalleryRepAccessibility _thaxCurrentItemIndex](self, "_thaxCurrentItemIndex"));
}

- (THTSDCanvasViewAccessibility)thaxStageCanvasView
{
  return -[THWPagedCanvasControllerAccessibility thaxCanvasView](-[THWGalleryRepAccessibility _thaxStageCanvasController](self, "_thaxStageCanvasController"), "thaxCanvasView");
}

- (THTSDCanvasViewAccessibility)thaxThumbnailCanvasView
{
  return -[THWPagedCanvasControllerAccessibility thaxCanvasView](-[THWGalleryRepAccessibility _thaxThumbnailTrackCanvasController](self, "_thaxThumbnailTrackCanvasController"), "thaxCanvasView");
}

- (unint64_t)thaxTotalItemCount
{
  return -[NSArray count](-[THWGalleryRepAccessibility _thaxItems](self, "_thaxItems"), "count");
}

- (void)p_goToPage:(unint64_t)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWGalleryRepAccessibility;
  -[THWGalleryRepAccessibility p_goToPage:](&v5, "p_goToPage:", a3);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_25D928;
  v4[3] = &unk_426DD0;
  v4[4] = self;
  TSAccessibilityPerformBlockOnMainThreadAfterDelay(v4, 0.5);
}

- (id)thaxLabelForButtonControlRep:(id)a3
{
  return -[THWGalleryRepAccessibility _thaxItemOrderDescriptionForItemAtIndex:](self, "_thaxItemOrderDescriptionForItemAtIndex:", objc_msgSend(a3, "thaxIndex"));
}

- (BOOL)thaxButtonControlRepIsIgnored:(id)a3
{
  return 0;
}

- (BOOL)thaxButtonControlRepIsSelected:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "thaxIndex");
  return v4 == (id)-[THWGalleryRepAccessibility _thaxCurrentItemIndex](self, "_thaxCurrentItemIndex");
}

- (THWPagedCanvasControllerAccessibility)_thaxStageCanvasController
{
  void *v3;
  THWPagedCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWPagedCanvasControllerAccessibility);
  result = (THWPagedCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("stageCanvasController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THWPagedCanvasControllerAccessibility)_thaxThumbnailTrackCanvasController
{
  void *v3;
  THWPagedCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWPagedCanvasControllerAccessibility);
  result = (THWPagedCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("thumbnailTrackCanvasController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (unint64_t)_thaxCurrentItemIndex
{
  return (unint64_t)-[THWPagedCanvasControllerAccessibility tsaxUnsignedIntegerValueForKey:](-[THWGalleryRepAccessibility _thaxStageCanvasController](self, "_thaxStageCanvasController"), "tsaxUnsignedIntegerValueForKey:", CFSTR("pageIndex"));
}

- (id)_thaxItemOrderDescriptionForItemAtIndex:(unint64_t)a3
{
  uint64_t v4;
  NSString *v5;
  id v6;

  v4 = -[THWGalleryRepAccessibility thaxTotalItemCount](self, "thaxTotalItemCount");
  v5 = THAccessibilityLocalizedString((uint64_t)CFSTR("gallery.item.number.of.number %@ %@"));
  v6 = TSAccessibilityLocalizedUnsignedInteger(a3 + 1);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6, TSAccessibilityLocalizedUnsignedInteger(v4));
}

- (NSArray)_thaxItems
{
  objc_class *v3;
  NSArray *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)objc_msgSend(-[TSDRepAccessibility tsaxInfo](self, "tsaxInfo"), "tsaxValueForKey:", CFSTR("items")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THWGalleryItemAccessibility)_thaxCurrentItem
{
  void *v3;
  THWGalleryItemAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWGalleryItemAccessibility);
  result = (THWGalleryItemAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("currentItem")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
