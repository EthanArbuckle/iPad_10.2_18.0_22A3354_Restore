@implementation TLAlertPlaybackCompletionContext

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  NSError *error;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  NSStringFromTLAlertPlaybackCompletionType(self->_playbackCompletionType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; playbackCompletionType = %@"), v7);

  error = self->_error;
  if (error)
  {
    -[NSError tl_nonRedundantDescription](error, "tl_nonRedundantDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; error = %@"), v9);

  }
  if (self->_completionHandler)
    objc_msgSend(v6, "appendString:", CFSTR("; completionHandler != NULL"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)playbackCompletionType
{
  return self->_playbackCompletionType;
}

- (void)setPlaybackCompletionType:(int64_t)a3
{
  self->_playbackCompletionType = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
