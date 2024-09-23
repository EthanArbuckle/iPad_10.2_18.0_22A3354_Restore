@implementation MTDiagnosticExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  +[MTDebugDataManager setup](MTDebugDataManager, "setup", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDebugDataManager writeDebugData](IMDebugDataManager, "writeDebugData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, 0));

  v8 = objc_msgSend(v7, "fileSize");
  v9 = objc_alloc((Class)DEAttachmentItem);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v8));
  v12 = objc_msgSend(v9, "initWithPath:withDisplayName:modificationDate:andFilesize:", v4, CFSTR("Podcast Database"), v10, v11);

  objc_msgSend(v12, "setAttachmentType:", CFSTR("com.apple.DiagnosticExtensions.other"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  objc_msgSend(v12, "setShouldCompress:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/mobile/Library/Logs/CrashReporter")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("^Podcasts(.*).ips"), 1, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTDiagnosticExtension filesInDir:matchingPattern:excludingPattern:](self, "filesInDir:matchingPattern:excludingPattern:", v14, v15, 0));
  v20 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v16));

  return v18;
}

@end
