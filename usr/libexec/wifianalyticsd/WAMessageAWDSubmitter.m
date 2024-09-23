@implementation WAMessageAWDSubmitter

- (id)submitMessage:(id)a3
{
  NSString *v3;
  void *v4;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Abstract. You must override %@ in a subclass"), v4);

  return 0;
}

- (WAMessageAWDSubmissionDelegate)submissionDelegate
{
  return (WAMessageAWDSubmissionDelegate *)objc_loadWeakRetained((id *)&self->_submissionDelegate);
}

- (void)setSubmissionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_submissionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_submissionDelegate);
}

@end
