@implementation PHRecentsTableViewController

+ (id)contactViewControllerForRecentCall:(id)a3 recentsController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHContactViewController descriptorForRequiredKeys](PHContactViewController, "descriptorForRequiredKeys"));
  v13 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactForRecentCall:keyDescriptors:", v5, v8));

  if (v9 || (v9 = objc_alloc_init((Class)CNContact)) != 0)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHRecentsTableViewController contactViewControllerForRecentCall:contact:recentsController:](PHRecentsTableViewController, "contactViewControllerForRecentCall:contact:recentsController:", v5, v9, v6));
  else
    v10 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageURL"));

  if (v11)
    objc_msgSend(v10, "setUsesBrandedCallHeaderFormat:", 1);

  return v10;
}

+ (id)contactViewControllerForRecentCall:(id)a3 contact:(id)a4 recentsController:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  MPRecentsContactHeaderViewController *v21;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  if (objc_msgSend(v9, "hasBeenPersisted"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHContactViewController viewControllerForContact:](PHContactViewController, "viewControllerForContact:", v9));

    objc_msgSend(v10, "setShouldShowLinkedContacts:", 1);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHContactViewController viewControllerForUnknownContact:](PHContactViewController, "viewControllerForUnknownContact:", v9));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "validRemoteParticipantHandles"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    objc_msgSend(v10, "setActions:", (unint64_t)objc_msgSend(v10, "actions") | 0x80);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "suggestedContactStore"));
    objc_msgSend(v10, "setContactStore:", v15);

    objc_msgSend(v10, "setRecentCall:", v7);
  }
  else
  {
    objc_msgSend(v10, "setAllowsActions:", 0);
    objc_msgSend(v10, "setAllowsEditing:", 0);
    v16 = objc_msgSend(v7, "callerIdIsBlocked");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = v17;
    if ((v16 & 1) != 0)
      v19 = CFSTR("NO_CALLER_ID");
    else
      v19 = CFSTR("UNKNOWN_CALLER");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_10008B240, CFSTR("PHRecents")));
    objc_msgSend(v10, "setAlternateName:", v20);

  }
  v21 = objc_alloc_init(MPRecentsContactHeaderViewController);
  -[MPRecentsContactHeaderViewController setRecentCall:](v21, "setRecentCall:", v7);
  objc_msgSend(v10, "setContactHeaderViewController:", v21);

  return v10;
}

@end
