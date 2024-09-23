@implementation RAPCorrectionsStorage

+ (id)basePathForCorrections
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFileManager baseSubmissionFilePath](RAPFileManager, "baseSubmissionFilePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("rap_corrections"), 1));

  return v3;
}

+ (id)pathForFeedbackRequestForSubmissionIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCorrectionsStorage basePathForCorrections](RAPCorrectionsStorage, "basePathForCorrections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", v3));

  return v5;
}

- (BOOL)saveCorrections:(id)a3 forSubmissionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCorrectionsStorage basePathForCorrections](RAPCorrectionsStorage, "basePathForCorrections"));
  v8 = +[RAPFileManager saveData:toDirectory:filename:](RAPFileManager, "saveData:toDirectory:filename:", v6, v7, v5);

  return v8;
}

- (BOOL)removeCorrectionDataForSubmissionIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCorrectionsStorage pathForFeedbackRequestForSubmissionIdentifier:](RAPCorrectionsStorage, "pathForFeedbackRequestForSubmissionIdentifier:", a3));
  v4 = +[RAPFileManager removeItemAtFilePath:](RAPFileManager, "removeItemAtFilePath:", v3);

  return v4;
}

- (id)correctionsDataForSubmissionIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCorrectionsStorage pathForFeedbackRequestForSubmissionIdentifier:](RAPCorrectionsStorage, "pathForFeedbackRequestForSubmissionIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFileManager dataAtFileURL:](RAPFileManager, "dataAtFileURL:", v3));

  return v4;
}

@end
