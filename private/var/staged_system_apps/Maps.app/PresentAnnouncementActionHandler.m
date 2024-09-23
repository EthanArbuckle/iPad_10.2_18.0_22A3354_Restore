@implementation PresentAnnouncementActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  void *v4;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(PresentAnnouncementAction);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "announcement"));
    v10 = objc_msgSend(v9, "hasTitle");
    if (v10
      && (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title")), objc_msgSend(v23, "length")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      v12 = 0;
      v13 = 1;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Maps Announcement"), CFSTR("localized string not found"), 0));
      v13 = 0;
      v12 = 1;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userMessage"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v11, v14, 1));

    if (v12)
    {

    }
    if (v13)

    if (v10)
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chrome"));
    if ((objc_msgSend(v9, "hasButtonOneMessage") & 1) != 0
      || objc_msgSend(v9, "hasButtonOneAppURI"))
    {
      if ((objc_msgSend(v9, "hasButtonOneMessage") & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buttonOneMessage"));
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK [announcement-alert]"), CFSTR("localized string not found"), 0));

      }
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100448EDC;
      v27[3] = &unk_1011B0210;
      v28 = v9;
      v29 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 0, v27));
      objc_msgSend(v15, "addAction:", v19);

    }
    if ((objc_msgSend(v9, "hasButtonTwoMessage") & 1) != 0
      || objc_msgSend(v9, "hasButtonTwoAppURI"))
    {
      if ((objc_msgSend(v9, "hasButtonTwoMessage") & 1) != 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buttonTwoMessage"));
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Dismiss [announcement-alert]"), CFSTR("localized string not found"), 0));

      }
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100448FE4;
      v24[3] = &unk_1011B0210;
      v25 = v9;
      v26 = v16;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, v24));
      objc_msgSend(v15, "addAction:", v22);

    }
    objc_msgSend(v16, "presentViewController:animated:completion:", v15, 1, 0);

  }
}

@end
