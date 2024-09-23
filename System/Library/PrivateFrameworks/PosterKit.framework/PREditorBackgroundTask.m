@implementation PREditorBackgroundTask

- (PREditorBackgroundTask)initWithReason:(id)a3
{
  id v4;
  PREditorBackgroundTask *v5;
  uint64_t v6;
  NSString *reason;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PREditorBackgroundTask;
  v5 = -[PREditorBackgroundTask init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

  }
  return v5;
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  if (!-[PREditorBackgroundTask isInvalidated](self, "isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must end a background task using -[PREditor endBackgroundTask:completionStatus:]"), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)PREditorBackgroundTask;
  -[PREditorBackgroundTask dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[PREditorBackgroundTask reason](self, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "appendObject:withName:", v4, CFSTR("reason"));

}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
