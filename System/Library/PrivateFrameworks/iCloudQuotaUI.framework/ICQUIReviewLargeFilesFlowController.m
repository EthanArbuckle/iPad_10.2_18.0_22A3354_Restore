@implementation ICQUIReviewLargeFilesFlowController

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(MEMORY[0x24BEBDB08], "ICQUIUpsellPrefferredPresentationSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (RecommendationFlowControllerDelegate)cloudRecommendationsDelegate
{
  return (RecommendationFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_cloudRecommendationsDelegate);
}

- (void)setCloudRecommendationsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cloudRecommendationsDelegate, a3);
}

- (NSNumber)storageRecovered
{
  return self->_storageRecovered;
}

- (void)setStorageRecovered:(id)a3
{
  objc_storeStrong((id *)&self->_storageRecovered, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageRecovered, 0);
  objc_destroyWeak((id *)&self->_cloudRecommendationsDelegate);
}

- (void)viewDidLoad
{
  ICQUIReviewLargeFilesFlowController *v2;

  v2 = self;
  ICQUIReviewLargeFilesFlowController.viewDidLoad()();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  ICQUIReviewLargeFilesFlowController *v5;

  v4 = a3;
  v5 = self;
  _sSo35ICQUIReviewLargeFilesFlowControllerC13iCloudQuotaUIE012presentationE10DidDismissyySo014UIPresentationE0CF_0();

}

@end
