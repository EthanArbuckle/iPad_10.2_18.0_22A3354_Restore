@implementation SKUIReviewsHistogramViewController

- (UIControl)appSupportButton
{
  void *v2;
  void *v3;

  -[SKUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appSupportButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIControl *)v3;
}

- (int64_t)personalStarRating
{
  return -[SKUIReviewsHistogramView personalStarRating](self->_histogramView, "personalStarRating");
}

- (UIControl)segmentedControl
{
  void *v2;
  void *v3;

  -[SKUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "segmentedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIControl *)v3;
}

- (NSArray)segmentedControlTitles
{
  return -[SKUIReviewsHistogramView segmentedControlTitles](self->_histogramView, "segmentedControlTitles");
}

- (int64_t)selectedSegmentIndex
{
  SKUIReviewsHistogramView *histogramView;

  histogramView = self->_histogramView;
  if (histogramView)
    return -[SKUIReviewsHistogramView selectedSegmentIndex](histogramView, "selectedSegmentIndex");
  else
    return -1;
}

- (void)setPersonalStarRating:(int64_t)a3
{
  id v4;

  -[SKUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonalStarRating:", a3);

}

- (void)setReviewList:(id)a3
{
  SKUIReviewList *v5;
  SKUIReviewList *v6;

  v5 = (SKUIReviewList *)a3;
  if (self->_reviewList != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_reviewList, a3);
    -[SKUIReviewsHistogramViewController _reloadHistogram](self, "_reloadHistogram");
    v5 = v6;
  }

}

- (void)setSegmentedControlTitles:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SKUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSegmentedControlTitles:", v4);

}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  id v4;

  -[SKUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedSegmentIndex:", a3);

}

- (void)setVersionString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SKUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVersionString:", v4);

}

- (UIControl)starRatingControl
{
  void *v2;
  void *v3;

  -[SKUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "starRatingControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIControl *)v3;
}

- (NSString)versionString
{
  return -[SKUIReviewsHistogramView versionString](self->_histogramView, "versionString");
}

- (UIControl)writeAReviewButton
{
  void *v2;
  void *v3;

  -[SKUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeAReviewButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIControl *)v3;
}

- (void)loadView
{
  id v3;

  -[SKUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewsHistogramViewController setView:](self, "setView:", v3);

}

- (id)_histogramView
{
  SKUIReviewsHistogramView *histogramView;
  SKUIReviewsHistogramView *v4;
  SKUIReviewsHistogramView *v5;
  SKUIReviewsHistogramView *v6;
  SKUIClientContext *clientContext;
  const __CFString *v8;
  void *v9;

  histogramView = self->_histogramView;
  if (!histogramView)
  {
    v4 = -[SKUIReviewsHistogramView initWithClientContext:]([SKUIReviewsHistogramView alloc], "initWithClientContext:", self->_clientContext);
    v5 = self->_histogramView;
    self->_histogramView = v4;

    v6 = self->_histogramView;
    clientContext = self->_clientContext;
    if (SKUIUserInterfaceIdiom(clientContext) == 1)
      v8 = CFSTR("REVIEWS_HISTOGRAM_TITLE_IPAD");
    else
      v8 = CFSTR("REVIEWS_HISTOGRAM_TITLE_IPHONE");
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", v8, CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v8, 0, CFSTR("ProductPage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIReviewsHistogramView setTitle:](v6, "setTitle:", v9);

    -[SKUIReviewsHistogramViewController _reloadHistogram](self, "_reloadHistogram");
    histogramView = self->_histogramView;
  }
  return histogramView;
}

- (void)_reloadHistogram
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  float v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  SKUIReviewsHistogramView *v21;
  float v22;
  SKUIReviewsHistogramView *histogramView;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = -[SKUIReviewList ratingCount](self->_reviewList, "ratingCount");
  v8 = (float)v7;
  -[SKUIReviewsHistogramView setNumberOfUserRatings:](self->_histogramView, "setNumberOfUserRatings:", (uint64_t)(float)v7);
  histogramView = self->_histogramView;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    *(float *)&v10 = (float)-[SKUIReviewList oneStarRatingCount](self->_reviewList, "oneStarRatingCount") / v8;
    objc_msgSend(v9, "numberWithFloat:", v10);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v2;
    v11 = (void *)MEMORY[0x1E0CB37E8];
    *(float *)&v12 = (float)-[SKUIReviewList twoStarRatingCount](self->_reviewList, "twoStarRatingCount") / v8;
    objc_msgSend(v11, "numberWithFloat:", v12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v3;
    v13 = (void *)MEMORY[0x1E0CB37E8];
    *(float *)&v14 = (float)-[SKUIReviewList threeStarRatingCount](self->_reviewList, "threeStarRatingCount") / v8;
    objc_msgSend(v13, "numberWithFloat:", v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v4;
    v15 = (void *)MEMORY[0x1E0CB37E8];
    *(float *)&v16 = (float)-[SKUIReviewList fourStarRatingCount](self->_reviewList, "fourStarRatingCount") / v8;
    objc_msgSend(v15, "numberWithFloat:", v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v5;
    v17 = (void *)MEMORY[0x1E0CB37E8];
    *(float *)&v18 = (float)-[SKUIReviewList fiveStarRatingCount](self->_reviewList, "fiveStarRatingCount") / v8;
    objc_msgSend(v17, "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = &unk_1E749B6A8;
    v24 = &unk_1E749B6A8;
    v25 = &unk_1E749B6A8;
    v26 = &unk_1E749B6A8;
    v27 = &unk_1E749B6A8;
  }
  v28 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewsHistogramView setHistogramValues:](histogramView, "setHistogramValues:", v20);

  if (v7)
  {

  }
  v21 = self->_histogramView;
  -[SKUIReviewList userRating](self->_reviewList, "userRating");
  -[SKUIReviewsHistogramView setUserRating:](v21, "setUserRating:", (float)(v22 / 5.0));
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUIReviewList)reviewList
{
  return self->_reviewList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewList, 0);
  objc_storeStrong((id *)&self->_histogramView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
