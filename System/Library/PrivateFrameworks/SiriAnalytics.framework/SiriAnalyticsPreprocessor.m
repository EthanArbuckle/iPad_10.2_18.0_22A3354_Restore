@implementation SiriAnalyticsPreprocessor

- (SiriAnalyticsPreprocessor)initWithMetastore:(id)a3 metastoreQueue:(id)a4 fbf:(id)a5 telemetry:(id)a6 messageTailing:(id)a7 messageStaging:(id)a8 localStorage:(id)a9 uspUploadQueue:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SiriAnalyticsPreprocessor *result;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  PreprocessorShim.init(metastore:metastoreQueue:fbf:telemetry:messageTailing:messageStaging:localStorage:uspUploadQueue:)(v15, v16, v17, a6, a7, (char *)a8, a9, (char *)a10);
  return result;
}

- (void)triggerWithReason:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  SiriAnalyticsPreprocessor *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1A0276DB8;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1A0276338(a3, (uint64_t)v6, v7);
  sub_1A0276D84((uint64_t)v6);

}

- (SiriAnalyticsPreprocessor)init
{
  PreprocessorShim.init()();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
