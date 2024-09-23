@implementation PSDESPlugin

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.PeopleSuggester.dodML", "Plugin");
    v3 = (void *)sLog_1;
    sLog_1 = (uint64_t)v2;

  }
}

- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5
{
  return 1;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end
