@implementation VUIJSBookmarkInterface

- (id)cachedElapsedTimeForReferenceId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v7;

  v3 = a3;
  +[VUIStreamingBookmarkCache sharedInstance](VUIStreamingBookmarkCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v4, "resumeTimeInfoForReferenceID:outAbsoluteResumeTime:outAbsoluteTimestamp:outMainContentRelativeResumeTime:outMainContentRelativeTimestamp:", v3, &v7, 0, 0, 0);

  v5 = v7;
  return v5;
}

@end
