@implementation CRLAVPlayerControllerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLAVPlayerController");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLAVPlayerControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)crlaxIsPlaying
{
  return -[CRLAVPlayerControllerAccessibility crlaxBoolValueForKey:](self, "crlaxBoolValueForKey:", CFSTR("isPlaying"));
}

- (void)crlaxTogglePlayback
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v3, "setPlaying:", -[CRLAVPlayerControllerAccessibility crlaxIsPlaying](self, "crlaxIsPlaying") ^ 1);

}

@end
