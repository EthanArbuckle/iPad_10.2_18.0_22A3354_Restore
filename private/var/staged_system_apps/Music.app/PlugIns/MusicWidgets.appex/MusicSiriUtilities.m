@implementation MusicSiriUtilities

+ (NSString)preferredTriggerPhrase
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void **v12;
  uint64_t v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v2 = (void *)qword_10058D850;
  v20 = qword_10058D850;
  if (!qword_10058D850)
  {
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_10041A684;
    v15 = &unk_100526F70;
    v16 = &v17;
    sub_10041A684((uint64_t)&v12);
    v2 = (void *)v18[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v17, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharedPreferences"));
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v5 = (void *)qword_10058D860;
  v20 = qword_10058D860;
  if (!qword_10058D860)
  {
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_10041A760;
    v15 = &unk_100526F70;
    v16 = &v17;
    sub_10041A760((uint64_t)&v12);
    v5 = (void *)v18[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v17, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedPreferences"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "languageCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedTriggerPhraseForLanguageCode:", v8));
  v10 = objc_msgSend(v9, "copy");

  return (NSString *)v10;
}

@end
