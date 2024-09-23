@implementation PKStoreKitReviewPromptHelper

- (void)requestReviewInScene:(id)a3 trigger:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a4;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Requesting Store Kit review for reason: %lu", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKSetLastReviewPromptDate();

  objc_msgSend(MEMORY[0x1E0CD8078], "requestReviewInScene:", v5);
}

- (void)requestReviewInSceneIfEligible:(id)a3 trigger:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a4;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Requesting Store Kit review if eligible for reason: %lu", (uint8_t *)&v8, 0xCu);
  }

  if (-[PKStoreKitReviewPromptHelper isEligibleForReviewPrompt](self, "isEligibleForReviewPrompt"))
    -[PKStoreKitReviewPromptHelper requestReviewInScene:trigger:](self, "requestReviewInScene:trigger:", v6, a4);

}

- (BOOL)isEligibleForReviewPrompt
{
  BOOL v3;

  v3 = -[PKStoreKitReviewPromptHelper _hasViewedFrontOfCard](self, "_hasViewedFrontOfCard");
  return v3 & !-[PKStoreKitReviewPromptHelper _hasBeenPromptedRecently](self, "_hasBeenPromptedRecently");
}

- (BOOL)_hasViewedFrontOfCard
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  PKLastViewedFrontOfCardDate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    v5 = v4 >= -2592000.0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_hasBeenPromptedRecently
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  PKLastReviewPromptDate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    v5 = v4 >= -604800.0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
