@implementation MTFeedUpdatePreProcessResult

- (MTFeedUpdatePreProcessResult)initWithShouldContinue:(BOOL)a3 createdPodcastUUID:(id)a4
{
  id v7;
  MTFeedUpdatePreProcessResult *v8;
  MTFeedUpdatePreProcessResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTFeedUpdatePreProcessResult;
  v8 = -[MTFeedUpdatePreProcessResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_shouldContinue = a3;
    objc_storeStrong((id *)&v8->_createdPodcastUUID, a4);
  }

  return v9;
}

+ (MTFeedUpdatePreProcessResult)shouldNotContinueResult
{
  return -[MTFeedUpdatePreProcessResult initWithShouldContinue:createdPodcastUUID:]([MTFeedUpdatePreProcessResult alloc], "initWithShouldContinue:createdPodcastUUID:", 0, 0);
}

- (BOOL)shouldContinue
{
  return self->_shouldContinue;
}

- (NSString)createdPodcastUUID
{
  return self->_createdPodcastUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdPodcastUUID, 0);
}

@end
