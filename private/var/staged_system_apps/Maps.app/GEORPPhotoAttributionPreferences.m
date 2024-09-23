@implementation GEORPPhotoAttributionPreferences

+ (id)photoAttributionPreferencesFromResponse:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10047F954;
  v11 = sub_10047F964;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10047F96C;
  v6[3] = &unk_1011B7F88;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateFeedbackInfosUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

@end
