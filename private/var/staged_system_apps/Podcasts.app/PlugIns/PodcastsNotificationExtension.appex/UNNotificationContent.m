@implementation UNNotificationContent

- (id)mt_podcastUuid
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationContent userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("podcastUuid")));

  return v3;
}

- (id)mt_notificationEpisodes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationContent userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("notificationEpisodeDictionaryRepresentations")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mt_compactMap:", &stru_100028FA0));
  return v4;
}

+ (id)mt_imageAttachmentForCacheKey:(id)a3 imageURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("imageFor-%@"), a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAttachment attachmentWithIdentifier:URL:options:error:](UNNotificationAttachment, "attachmentWithIdentifier:URL:options:error:", v6, v5, 0, 0));

  return v7;
}

- (id)mt_attachedImageForCacheKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationContent attachments](self, "attachments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("imageFor-%@"), v4));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000DFF4;
  v15[3] = &unk_100028FC8;
  v7 = v6;
  v16 = v7;
  v8 = objc_msgSend(v5, "indexOfObjectPassingTest:", v15);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v8));
  v9 = v10;
  if (!v10)
    goto LABEL_5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
  objc_msgSend(v11, "startAccessingSecurityScopedResource");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v12));
  objc_msgSend(v11, "stopAccessingSecurityScopedResource");

LABEL_6:
  return v13;
}

@end
