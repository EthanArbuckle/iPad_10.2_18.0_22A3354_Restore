@implementation UITableViewCell

- (id)accessibilitySharedViaICloudStringForNote:(id)a3
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = objc_msgSend(v3, "isSharedViaICloud");
  v5 = objc_msgSend(v3, "isSharedViaICloudFolder");
  if (v4 && !v5)
  {
    v6 = objc_msgSend(v3, "isOwnedByCurrentUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    if ((v6 & 1) != 0)
      v9 = CFSTR("Shared by me via iCloud");
    else
      v9 = CFSTR("Shared with me via iCloud");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1000DAF38, 0));
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v3, "isSharedViaICloudFolder"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "folder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "folder"));
    v12 = objc_msgSend(v11, "isOwnedByCurrentUser");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = v13;
    if (v12)
      v15 = CFSTR("In a folder shared by me called %@");
    else
      v15 = CFSTR("In a folder shared with me called %@");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1000DAF38, 0));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v8));
    goto LABEL_13;
  }
  v17 = 0;
LABEL_14:

  return v17;
}

@end
