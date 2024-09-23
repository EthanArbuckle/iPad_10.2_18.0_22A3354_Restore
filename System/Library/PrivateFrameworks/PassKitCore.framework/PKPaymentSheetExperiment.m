@implementation PKPaymentSheetExperiment

- (id)namespaceName
{
  return CFSTR("WALLET_APP_ECOM_PAYMENT_SHEET");
}

- (BOOL)isAA
{
  return -[PKExperiment BOOLeanForFactor:](self, "BOOLeanForFactor:", CFSTR("AA"));
}

- (BOOL)isTaggedForHideDoubleClickToPay
{
  if (PKExperimentationOverrideEnabled())
    return PKExperimentationOverrideHideDoubleClickToPayEnabled();
  else
    return -[PKExperiment isTaggedForFactor:](self, "isTaggedForFactor:", CFSTR("hideDoubleClickToPay"));
}

- (BOOL)shouldHideDoubleClickToPay
{
  if (PKExperimentationOverrideEnabled())
    return PKExperimentationOverrideHideDoubleClickToPayEnabled();
  else
    return -[PKExperiment BOOLeanForFactor:](self, "BOOLeanForFactor:", CFSTR("hideDoubleClickToPay"));
}

- (double)timeIntervalToShowDoubleClickToPay
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;

  if (PKExperimentationOverrideEnabled())
  {
    PKExperimentationOverrideHideDoubleClickToPaySecondsEnabled();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    -[PKExperiment metadataForFactor:](self, "metadataForFactor:", CFSTR("hideDoubleClickToPay"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("showAfterSeconds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5 = v7;

  }
  return v5;
}

- (BOOL)isTaggedForAllowInAppPaymentFailureRetry
{
  if (PKExperimentationOverrideEnabled())
    return PKExperimentationOverrideAllowInAppPaymentFailureRetryEnabled();
  else
    return -[PKExperiment isTaggedForFactor:](self, "isTaggedForFactor:", CFSTR("allowInAppPaymentFailureRetry"));
}

- (BOOL)shouldAllowInAppPaymentFailureRetry
{
  if (PKExperimentationOverrideEnabled())
    return PKExperimentationOverrideAllowInAppPaymentFailureRetryEnabled();
  else
    return -[PKExperiment BOOLeanForFactor:](self, "BOOLeanForFactor:", CFSTR("allowInAppPaymentFailureRetry"));
}

- (BOOL)isTaggedForLineItemsInMainPaymentSheet
{
  if (PKExperimentationOverrideEnabled())
    return PKExperimentationOverrideShowLineItemsInMainPaymentSheetEnabled();
  else
    return -[PKExperiment isTaggedForFactor:](self, "isTaggedForFactor:", CFSTR("showLineItemsInMainSheet"));
}

- (BOOL)shouldShowLineItemsInMainPaymentSheet
{
  if (PKExperimentationOverrideEnabled())
    return PKExperimentationOverrideShowLineItemsInMainPaymentSheetEnabled();
  else
    return -[PKExperiment BOOLeanForFactor:](self, "BOOLeanForFactor:", CFSTR("showLineItemsInMainSheet"));
}

@end
