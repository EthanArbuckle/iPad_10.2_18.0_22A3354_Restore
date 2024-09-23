@implementation TSADocumentManagerDocumentCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSADocumentManagerDocumentCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (unint64_t)_tsaxPendingSyncState
{
  return (unint64_t)__TSAccessibilityGetAssociatedUnsignedInteger(self, &unk_5439B2);
}

- (void)_tsaxSetPendingSyncState:(unint64_t)a3
{
  __TSAccessibilitySetAssociatedUnsignedInteger(self, &unk_5439B2, (id)a3);
}

- (BOOL)_axShouldOutputTransferProgress
{
  id v3;

  v3 = -[TSADocumentManagerDocumentCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("progressBarView"));
  if (v3)
    LOBYTE(v3) = -[TSADocumentManagerDocumentCellAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isProgressBarShowable"));
  return (char)v3;
}

- (id)_axCurrentTransferProgressState
{
  id result;

  objc_msgSend(-[TSADocumentManagerDocumentCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("info")), "tsaxDoubleValueForKey:", CFSTR("transferProgress"));
  result = TSAccessibilityLocalizedString((uint64_t)CFSTR("sync.progress.status %@"));
  if (result)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", result, TSAccessibilityLocalizedPercent());
  return result;
}

- (id)accessibilityValue
{
  unint64_t v3;
  const __CFString *v4;

  v3 = -[TSADocumentManagerDocumentCellAccessibility _tsaxPendingSyncState](self, "_tsaxPendingSyncState");
  if (v3 == 1)
  {
    v4 = CFSTR("pending.sync.state.download");
    return TSAccessibilityLocalizedString((uint64_t)v4);
  }
  if (v3 == 2)
  {
    v4 = CFSTR("pending.sync.state.upload");
    return TSAccessibilityLocalizedString((uint64_t)v4);
  }
  if (-[TSADocumentManagerDocumentCellAccessibility _axShouldOutputTransferProgress](self, "_axShouldOutputTransferProgress"))
  {
    return -[TSADocumentManagerDocumentCellAccessibility _axCurrentTransferProgressState](self, "_axCurrentTransferProgressState");
  }
  else
  {
    return 0;
  }
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSADocumentManagerDocumentCellAccessibility;
  return UIAccessibilityTraitUpdatesFrequently | -[TSADocumentManagerDocumentCellAccessibility accessibilityTraits](&v3, "accessibilityTraits");
}

- (void)_setupBadge
{
  id v3;
  uint64_t v4;
  int ShouldPerformValidationChecks;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSADocumentManagerDocumentCellAccessibility;
  -[TSADocumentManagerDocumentCellAccessibility _setupBadge](&v12, "_setupBadge");
  v3 = objc_msgSend(objc_msgSend(-[TSADocumentManagerDocumentCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_imageLayer")), "tsaxValueForKey:", CFSTR("badge")), "accessibilityIdentifier");
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("sf_dm_statusbadge_download")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("sf_dm_statusbadge_upload")) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
    v4 = 0;
    if (v3 && ShouldPerformValidationChecks)
    {
      if ((objc_msgSend(v3, "hasPrefix:", CFSTR("sf_dm_statusbadge_share")) & 1) == 0)
      {
        ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Unknown badge name for TSADocumentManagerDocumentCell: %@."), v7, v8, v9, v10, v11, (uint64_t)v3))abort();
      }
      v4 = 0;
    }
  }
  -[TSADocumentManagerDocumentCellAccessibility _tsaxSetPendingSyncState:](self, "_tsaxSetPendingSyncState:", v4);
}

@end
