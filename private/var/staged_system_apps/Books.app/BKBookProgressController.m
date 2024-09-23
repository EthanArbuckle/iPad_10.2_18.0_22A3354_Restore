@implementation BKBookProgressController

+ (void)preWarmWithAnnotationProvider:(id)a3
{
  uint64_t v3;
  id v4;
  _QWORD block[4];
  id v6;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001036F4;
  block[3] = &unk_1008E72C0;
  v6 = a3;
  v3 = qword_1009F4F78;
  v4 = v6;
  if (v3 != -1)
    dispatch_once(&qword_1009F4F78, block);

}

- (double)_progressForAssetID:(id)a3 moc:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  float v27;
  double v28;
  float v29;
  id v31;
  _QWORD v32[2];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation predicateForGlobalAnnotationWithAssetID:](AEAnnotation, "predicateForGlobalAnnotationWithAssetID:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("AEAnnotation"), v5));
  v8 = objc_alloc_init((Class)NSFetchRequest);
  objc_msgSend(v8, "setEntity:", v7);
  v9 = kAEAnnotationReadingProgressHighWaterMark;
  v10 = kAEAnnotationReadingProgress;
  v32[0] = kAEAnnotationReadingProgressHighWaterMark;
  v32[1] = kAEAnnotationReadingProgress;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
  objc_msgSend(v8, "setPropertiesToFetch:", v11);

  objc_msgSend(v8, "setResultType:", 2);
  objc_msgSend(v8, "setPredicate:", v6);
  v31 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v8, &v31));

  v13 = v31;
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "logRecursively");
  v15 = 0.0;
  if (objc_msgSend(v12, "count") == (id)1)
  {
    v16 = objc_opt_class(NSDictionary);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 0));
    v18 = BUDynamicCast(v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v20 = objc_opt_class(NSString);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v10));
    v22 = BUDynamicCast(v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (v23
      || (v24 = objc_opt_class(NSString),
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v9)),
          v26 = BUDynamicCast(v24, v25),
          v23 = (void *)objc_claimAutoreleasedReturnValue(v26),
          v25,
          v23))
    {
      objc_msgSend(v23, "floatValue");
      v28 = fmin(v27, 1.0);
      if (v28 < 0.0)
        v28 = 0.0;
      v29 = v28;
      v15 = v29;

    }
    else
    {
      v15 = 1.79769313e308;
    }

  }
  return v15;
}

- (void)_progressStringForLibraryAsset:(id)a3 annotationMOC:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSNumberFormatter *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  __CFString *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  char v34;
  void *v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "isNew");
  if (objc_msgSend(v8, "isSample"))
  {
    v12 = (void (**)(id, void *))objc_retainBlock(v10);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Sample"), &stru_10091C438, 0));
      v12[2](v12, v14);

    }
    goto LABEL_19;
  }
  if (objc_msgSend(v8, "isAudiobook"))
  {
    v15 = objc_msgSend(v8, "isCloud");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKMediaLibraryCache sharedCache](BKMediaLibraryCache, "sharedCache"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
    v35 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100103D90;
    v32[3] = &unk_1008EAEE8;
    v34 = v11;
    v33 = v10;
    objc_msgSend(v16, "fetchAssetsWithIDs:type:completion:", v18, v15, v32);

    goto LABEL_19;
  }
  v19 = objc_opt_new(NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v19, "setNumberStyle:", 3);
  -[NSNumberFormatter setMaximumFractionDigits:](v19, "setMaximumFractionDigits:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
  -[BKBookProgressController _progressForAssetID:moc:](self, "_progressForAssetID:moc:", v20, v9);
  v22 = v21;

  if (v11)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = v23;
    v25 = CFSTR("New");
  }
  else
  {
    v26 = &stru_10091C438;
    if (v22 < 0.0 || v22 > 1.0)
      goto LABEL_16;
    if (v22 >= 0.01 && fabs(v22 + -0.01) >= 0.005)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = v23;
      if (fabs(v22 + -1.0) >= 0.005)
      {
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("%@ read"), &stru_10091C438, 0));

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v19, "stringFromNumber:", v30));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v31));

        v24 = (void *)v29;
        goto LABEL_15;
      }
      v25 = CFSTR("Finished");
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = v23;
      v25 = CFSTR("Just started");
    }
  }
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", v25, &stru_10091C438, 0));
LABEL_15:

LABEL_16:
  v27 = objc_retainBlock(v10);
  v28 = v27;
  if (v27)
    (*((void (**)(id, __CFString *))v27 + 2))(v27, v26);

LABEL_19:
}

+ (void)progressStringForLibraryAsset:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)qword_1009F4F70;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "annotationProvider"));
  v9 = objc_msgSend(v8, "newManagedObjectContext");

  objc_msgSend((id)qword_1009F4F70, "_progressStringForLibraryAsset:annotationMOC:completion:", v7, v9, v6);
}

+ (void)progressStringForLibraryAsset:(id)a3 annotationMOC:(id)a4 completion:(id)a5
{
  objc_msgSend((id)qword_1009F4F70, "_progressStringForLibraryAsset:annotationMOC:completion:", a3, a4, a5);
}

- (AEAnnotationProvider)annotationProvider
{
  return (AEAnnotationProvider *)objc_loadWeakRetained((id *)&self->_annotationProvider);
}

- (void)setAnnotationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_annotationProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_annotationProvider);
}

@end
