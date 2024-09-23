@implementation IMDebugDownloadReportDataProvider

- (IMDebugDownloadReportDataProvider)init
{
  IMDebugDownloadReportDataProvider *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  PFDownloadsStateReportCollector *v8;
  PFDownloadsStateReportCollector *collector;
  objc_super v11;
  _QWORD v12[4];
  _QWORD v13[3];

  v11.receiver = self;
  v11.super_class = (Class)IMDebugDownloadReportDataProvider;
  v2 = -[IMDebugDownloadReportDataProvider init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "privateQueueContext"));

    v5 = objc_alloc((Class)PFDownloadsStateReportCollector);
    v13[0] = kEpisodeUuid;
    v13[1] = kEpisodeDownloadBehavior;
    v13[2] = kEpisodeTitle;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 3));
    v12[0] = kPodcastUuid;
    v12[1] = kPodcastEpisodeLimit;
    v12[2] = kPodcastTitle;
    v12[3] = kPodcastDownloadedEpisodesCount;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 4));
    v8 = (PFDownloadsStateReportCollector *)objc_msgSend(v5, "initWithManagedObjectContext:episodePropertiesToReport:showPropertiesToReport:allEpisodes:", v4, v6, v7, 0);
    collector = v2->_collector;
    v2->_collector = v8;

  }
  return v2;
}

- (void)createDebugDataWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  PFDownloadsStateReportCollector *collector;
  void *v7;
  _QWORD v8[4];
  __CFString *v9;
  id v10;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  collector = self->_collector;
  if (collector)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __67__IMDebugDownloadReportDataProvider_createDebugDataWithCompletion___block_invoke;
    v8[3] = &unk_10598;
    v9 = CFSTR("download-state-report.json");
    v10 = v4;
    -[PFDownloadsStateReportCollector generateReportWithCompletionHandler:](collector, "generateReportWithCompletionHandler:", v8);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Cannot open database"), "dataUsingEncoding:", 4));
    ((void (**)(_QWORD, void *, const __CFString *))v5)[2](v5, v7, CFSTR("download-state-report.json"));

  }
}

uint64_t __67__IMDebugDownloadReportDataProvider_createDebugDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collector, 0);
}

@end
