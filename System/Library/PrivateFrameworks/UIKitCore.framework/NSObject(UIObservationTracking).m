@implementation NSObject(UIObservationTracking)

- (void)_ui_setObservationTrackingDictionary:()UIObservationTracking
{
  objc_setAssociatedObject(a1, &_UIObservationTrackingDictionaryKey, a3, (void *)1);
}

- (id)_ui_observationTrackingDictionary
{
  return objc_getAssociatedObject(a1, &_UIObservationTrackingDictionaryKey);
}

@end
