@implementation AEAssetMetadataCache

- (id)coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_817F8;
  v8[3] = &unk_1C0A88;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "readableBookInfoForDatabaseKey_sync:block:", v3, v8);

  return v6;
}

- (void)saveTitle:(id)a3 author:(id)a4 genre:(id)a5 language:(id)a6 pageProgressionDirection:(id)a7 forAssetID:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_819FC;
  v25[3] = &unk_1C0AB0;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v17;
  v30 = v16;
  v20 = v16;
  v21 = v17;
  v22 = v15;
  v23 = v14;
  v24 = v13;
  objc_msgSend(v19, "writableBookInfoForDatabaseKey_sync:block:", v18, v25);

}

@end
