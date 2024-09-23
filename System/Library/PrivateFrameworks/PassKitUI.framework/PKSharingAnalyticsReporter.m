@implementation PKSharingAnalyticsReporter

- (PKSharingAnalyticsReporter)init
{

  return 0;
}

- (PKSharingAnalyticsReporter)initWithSubject:(id)a3 sessionToken:(id)a4 reuseExistingSession:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  PKSharingAnalyticsReporter *v11;
  PKSharingAnalyticsReporter *v12;
  void *v13;
  objc_super v15;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKSharingAnalyticsReporter;
  v11 = -[PKSharingAnalyticsReporter init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_subject, a3);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:withArchivedParent:", v9, v10);
    }
    else if (!v5
           || (objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", v12->_subject),
               v13 = (void *)objc_claimAutoreleasedReturnValue(),
               v13,
               !v13))
    {
      v12->_isSessionOwned = 1;
      objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v12->_subject);
    }
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_isSessionOwned)
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", self->_subject);
  v3.receiver = self;
  v3.super_class = (Class)PKSharingAnalyticsReporter;
  -[PKSharingAnalyticsReporter dealloc](&v3, sel_dealloc);
}

- (void)sendEvent:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", self->_subject, a3);
}

- (NSData)sessionToken
{
  return (NSData *)objc_msgSend(MEMORY[0x1E0D66A58], "archivedSessionTokenForSubject:", self->_subject);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
}

@end
