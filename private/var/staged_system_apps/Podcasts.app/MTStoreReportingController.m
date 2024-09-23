@implementation MTStoreReportingController

+ (id)reportingStringForPlayReason:(unint64_t)a3
{
  if (a3 > 0xF)
    return CFSTR("unknown");
  else
    return *(&off_1004A7460 + a3);
}

- (void)reportWithType:(int)a3 userInfo:(id)a4 location:(id)a5 reason:(unint64_t)a6
{
  uint64_t v8;
  __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  unsigned __int8 v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  unsigned __int8 v56;
  const __CFString *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  unsigned int v77;
  void *v78;
  unsigned int v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  void *v84;
  uint64_t v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  id v93;

  v8 = *(_QWORD *)&a3;
  v93 = a4;
  v10 = (__CFString *)a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", CFSTR("3"), CFSTR("v")));
  v12 = v11;
  if (v10)
    v13 = v10;
  else
    v13 = &stru_1004C6D40;
  objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("pageLocation"));

  objc_msgSend(v12, "setObject:forKey:", CFSTR("1"), CFSTR("podcastType"));
  switch((int)v8)
  {
    case 0:
    case 1:
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kPodcastStoreCollectionId));
      if (objc_msgSend(v14, "unsignedLongLongValue"))
        objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("podcastId"));
      v15 = kPodcastTitle;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kPodcastTitle));
      v17 = objc_msgSend(v16, "length");

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", v15));
        objc_msgSend(v12, "setObject:forKey:", v18, CFSTR("podcastName"));

      }
      v19 = kPodcastUpdatedFeedUrl;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kPodcastUpdatedFeedUrl));
      v21 = objc_msgSend(v20, "length");

      if (v21
        || (v19 = kPodcastFeedUrl,
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kPodcastFeedUrl)),
            v23 = objc_msgSend(v22, "length"),
            v22,
            v23))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", v19));
        objc_msgSend(v12, "setObject:forKey:", v24, CFSTR("feedUrl"));

      }
      v25 = kEpisodeGuid;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kEpisodeGuid));
      v27 = objc_msgSend(v26, "length");

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", v25));
        objc_msgSend(v12, "setObject:forKey:", v28, CFSTR("episodeGuid"));

      }
      v29 = kEpisodeEnclosureUrl;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kEpisodeEnclosureUrl));
      v31 = objc_msgSend(v30, "length");

      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", v29));
        objc_msgSend(v12, "setObject:forKey:", v32, CFSTR("episodeUrl"));

      }
      v33 = kEpisodeUti;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kEpisodeUti));
      v35 = objc_msgSend(v34, "length");

      if (v35)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", v33));
        objc_msgSend(v12, "setObject:forKey:", v36, CFSTR("episodeType"));

      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kMTEpisodeRestoreResultKey));
      v38 = objc_msgSend(v37, "length");

      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kMTEpisodeRestoreResultKey));
        objc_msgSend(v12, "setObject:forKey:", v39, kMTEpisodeRestoreResultKey);

      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kMTEpisodeRestoreTypeKey));
      v41 = objc_msgSend(v40, "length");

      if (v41)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kMTEpisodeRestoreTypeKey));
        objc_msgSend(v12, "setObject:forKey:", v42, kMTEpisodeRestoreTypeKey);

      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", v33));
      v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("audio"));

      if ((v44 & 1) != 0)
      {
        v45 = CFSTR("episode");
      }
      else
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", v33));
        v77 = objc_msgSend(v76, "isEqualToString:", CFSTR("video"));

        if (!v77)
          goto LABEL_57;
        v45 = CFSTR("movie");
      }
      objc_msgSend(v12, "setObject:forKey:", v45, CFSTR("episodeKind"));
      goto LABEL_57;
    case 2:
    case 3:
      v46 = kEpisodeGuid;
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kEpisodeGuid));
      v48 = objc_msgSend(v47, "length");

      if (v48)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", v46));
        objc_msgSend(v12, "setObject:forKey:", v49, CFSTR("episodeGuid"));

      }
      v50 = kEpisodeEnclosureUrl;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kEpisodeEnclosureUrl));
      v52 = objc_msgSend(v51, "length");

      if (v52)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", v50));
        objc_msgSend(v12, "setObject:forKey:", v53, CFSTR("episodeUrl"));

      }
      v54 = kEpisodeUti;
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kEpisodeUti));
      v56 = objc_msgSend(v55, "isEqualToString:", kUTTypeAudio);

      if ((v56 & 1) != 0)
      {
        v57 = CFSTR("episode");
      }
      else
      {
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", v54));
        v79 = objc_msgSend(v78, "isEqualToString:", kUTTypeMovie);

        if (!v79)
          goto LABEL_49;
        v57 = CFSTR("movie");
      }
      objc_msgSend(v12, "setObject:forKey:", v57, CFSTR("episodeKind"));
LABEL_49:
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kEpisodePodcastUuid));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreReportingController _dictionaryForPodcastUuid:](self, "_dictionaryForPodcastUuid:", v80));

      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", kPodcastStoreCollectionId));
      if (objc_msgSend(v67, "unsignedLongLongValue"))
        objc_msgSend(v12, "setObject:forKey:", v67, CFSTR("podcastId"));
      v81 = kPodcastTitle;
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", kPodcastTitle));
      v83 = objc_msgSend(v82, "length");

      if (v83)
      {
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v81));
        objc_msgSend(v12, "setObject:forKey:", v84, CFSTR("podcastName"));

      }
      v85 = kPodcastUpdatedFeedUrl;
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", kPodcastUpdatedFeedUrl));
      v87 = objc_msgSend(v86, "length");

      if (v87
        || (v85 = kPodcastFeedUrl,
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", kPodcastFeedUrl)),
            v89 = objc_msgSend(v88, "length"),
            v88,
            v89))
      {
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v85));
        objc_msgSend(v12, "setObject:forKey:", v90, CFSTR("feedUrl"));

      }
LABEL_56:

LABEL_57:
LABEL_58:
      if (a6)
      {
        v91 = objc_msgSend((id)objc_opt_class(self), "reportingStringForPlayReason:", a6);
        v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
        objc_msgSend(v12, "setObject:forKey:", v92, CFSTR("play_source"));

      }
      -[MTStoreReportingController recordMetricsEventForType:withData:](self, "recordMetricsEventForType:withData:", v8, v12);

      return;
    case 4:
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kPodcastStoreCollectionId));
      if (objc_msgSend(v14, "unsignedLongLongValue"))
        objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("podcastId"));
      v58 = kPodcastTitle;
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kPodcastTitle));
      v60 = objc_msgSend(v59, "length");

      if (v60)
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", v58));
        objc_msgSend(v12, "setObject:forKey:", v61, CFSTR("podcastName"));

      }
      v62 = kPodcastUpdatedFeedUrl;
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kPodcastUpdatedFeedUrl));
      v64 = objc_msgSend(v63, "length");

      if (!v64)
      {
        v62 = kPodcastFeedUrl;
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kPodcastFeedUrl));
        v66 = objc_msgSend(v65, "length");

        if (!v66)
          goto LABEL_57;
      }
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", v62));
      objc_msgSend(v12, "setObject:forKey:", v67, CFSTR("feedUrl"));
      goto LABEL_56;
    case 6:
      v68 = kEpisodeRestoredCount;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kEpisodeRestoredCount));
      if (objc_msgSend(v14, "unsignedLongLongValue"))
        objc_msgSend(v12, "setObject:forKey:", v14, v68);
      v69 = kEpisodeRestoreRequested;
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kEpisodeRestoreRequested));
      v71 = objc_msgSend(v70, "BOOLValue");

      v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v71));
      objc_msgSend(v12, "setObject:forKey:", v72, v69);

      v73 = kEpisodeRestoreIsRetry;
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", kEpisodeRestoreIsRetry));
      if (objc_msgSend(v74, "BOOLValue"))
        v75 = &__kCFBooleanTrue;
      else
        v75 = &__kCFBooleanFalse;
      objc_msgSend(v12, "setObject:forKey:", v75, v73);

      goto LABEL_57;
    default:
      goto LABEL_58;
  }
}

- (void)reportPlaybackFromStore:(id)a3 reason:(unint64_t)a4
{
  id v5;

  if (a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dictionaryByDecomposingQueryStringWithURLDecode:", 1, a4));
    -[MTStoreReportingController recordMetricsEventForType:withData:](self, "recordMetricsEventForType:withData:", 2, v5);

  }
}

- (void)reportBrowse:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dictionaryByDecomposingQueryStringWithURLDecode:", 1));
    -[MTStoreReportingController recordMetricsEventForType:withData:](self, "recordMetricsEventForType:withData:", 5, v4);

  }
}

- (id)_dictionaryForPodcastUuid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000465F4;
  v18 = sub_10004697C;
  v19 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100066218;
  v10[3] = &unk_1004A6F10;
  v13 = &v14;
  v6 = v5;
  v11 = v6;
  v7 = v3;
  v12 = v7;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)recordMetricsEventForType:(int)a3 withData:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_opt_new(IMAMSMetricsEvent);
  objc_msgSend(v7, "setEventType:", CFSTR("reporting_event"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreReportingController pageTypeForReportType:](self, "pageTypeForReportType:", v4));
  objc_msgSend(v7, "setPageType:", v8);

  objc_msgSend(v7, "im_addPropertiesWithDictionary:", v6);
  v9 = (void *)objc_opt_new(IMAMSMetricsEvent);
  objc_msgSend(v9, "setEventType:", CFSTR("reporting_event"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreReportingController pageTypeForReportType:](self, "pageTypeForReportType:", v4));
  objc_msgSend(v9, "setPageType:", v10);

  objc_msgSend(v9, "im_addPropertiesWithDictionary:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AnalyticsIdentifierManager sharedInstance](_TtC18PodcastsFoundation26AnalyticsIdentifierManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifierPromise"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000663D0;
  v14[3] = &unk_1004A7410;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "addFinishBlock:", v14);

}

- (id)pageTypeForReportType:(int)a3
{
  if ((a3 - 1) > 5)
    return CFSTR("download");
  else
    return *(&off_1004A7430 + a3 - 1);
}

@end
