@implementation WBSRecentHistoryTopicTagController

- (WBSRecentHistoryTopicTagController)initWithHistory:(id)a3
{
  id v5;
  WBSRecentHistoryTopicTagController *v6;
  WBSRecentHistoryTopicTagController *v7;
  WBSRecentHistoryTopicTagController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSRecentHistoryTopicTagController;
  v6 = -[WBSRecentHistoryTopicTagController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_history, a3);
    v7->_timeIntervalBeforeNowForFetchingTags = 604800.0;
    v8 = v7;
  }

  return v7;
}

- (void)loadTopicsWithCompletionHandler:(id)a3
{
  WBSHistory *history;
  void *v5;
  double v6;
  id v7;
  void *v8;
  id v9;

  history = self->_history;
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = -self->_timeIntervalBeforeNowForFetchingTags;
  v7 = a3;
  objc_msgSend(v5, "dateWithTimeIntervalSinceNow:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistory fetchTopicsFromStartDate:toEndDate:limit:minimumItemCount:sortOrder:completionHandler:](history, "fetchTopicsFromStartDate:toEndDate:limit:minimumItemCount:sortOrder:completionHandler:", v9, v8, self->_maximumNumberOfTopics, 1, 2, v7);

}

- (unint64_t)maximumNumberOfTopics
{
  return self->_maximumNumberOfTopics;
}

- (void)setMaximumNumberOfTopics:(unint64_t)a3
{
  self->_maximumNumberOfTopics = a3;
}

- (double)timeIntervalBeforeNowForFetchingTags
{
  return self->_timeIntervalBeforeNowForFetchingTags;
}

- (void)setTimeIntervalBeforeNowForFetchingTags:(double)a3
{
  self->_timeIntervalBeforeNowForFetchingTags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
}

@end
