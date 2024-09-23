@implementation NSString

+ (id)bk_localizedStringForDeleteAction:(int64_t)a3 deleteActionProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  char *v19;
  char *v20;

  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 0:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Delete Everywhere");
      goto LABEL_27;
    case 1:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Remove Everywhere");
      goto LABEL_27;
    case 2:
      v10 = objc_msgSend(v5, "countForActionItem:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v10 == (id)1)
        v9 = CFSTR("Remove Download");
      else
        v9 = CFSTR("Remove Downloads");
      goto LABEL_26;
    case 3:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Remove from Collection");
      goto LABEL_27;
    case 4:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollection titleForDefaultCollectionID:](BCCollection, "titleForDefaultCollectionID:", kBKCollectionDefaultIDSamples));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Remove from %@"), &stru_10091C438, 0));

      v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v8));
      goto LABEL_19;
    case 5:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Delete");
      goto LABEL_27;
    case 6:
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collection"));
      v8 = v15;
      if (v15 && objc_msgSend(v15, "isDefaultCollection"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Remove from %@"), &stru_10091C438, 0));

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v17));

      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Remove from Collection"), &stru_10091C438, 0));
LABEL_19:
        v14 = (__CFString *)v13;
      }

      goto LABEL_28;
    case 7:
      v18 = (char *)objc_msgSend(v5, "countForActionItem:", 7);
      v19 = (char *)objc_msgSend(v6, "localITSAudiobookCount");
      v20 = &v19[(_QWORD)objc_msgSend(v6, "cloudITSAudiobookCount")];
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v20 == v18)
      {
        if (v18 == (char *)1)
          v9 = CFSTR("Hide Audiobook");
        else
          v9 = CFSTR("Hide Audiobooks");
      }
      else if (v18 == (char *)1)
      {
        v9 = CFSTR("Hide Book");
      }
      else
      {
        v9 = CFSTR("Hide Books");
      }
LABEL_26:
      v7 = v8;
      goto LABEL_27;
    case 8:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Remove…");
LABEL_27:
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_10091C438, 0));
LABEL_28:

      break;
    default:
      v14 = &stru_10091C438;
      break;
  }

  return v14;
}

+ (id)bk_localizedWarningStringForProvider:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString bk_localizedWarningAndTitleStringsForProvider:](NSString, "bk_localizedWarningAndTitleStringsForProvider:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("warningString")));

  return v4;
}

+ (id)bk_localizedWarningAndTitleStringsForProvider:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  void *v24;
  char *v25;
  void *v26;
  const __CFString *v27;
  id v28;
  id v29;
  char *v30;
  char *v31;
  int v32;
  int v33;
  int v34;
  int v35;
  id v36;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  id v43;

  v3 = a3;
  if (objc_msgSend(v3, "sampleCount"))
  {
    v4 = &stru_10091C438;
    goto LABEL_73;
  }
  if (!objc_msgSend(v3, "nonStoreAudiobookCount"))
  {
    if (objc_msgSend(v3, "localUbiquityCount"))
    {
      v8 = +[BCDevice deviceClass](BCDevice, "deviceClass");
      if (v8 == (id)3)
      {
        v13 = objc_msgSend(v3, "pdfCount");
        v14 = objc_msgSend(v3, "localUbiquityCount");
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        if (v13)
        {
          if ((unint64_t)v14 >= 2)
            v7 = CFSTR("These items were downloaded to this iPad. Delete them from iCloud or remove the downloads from this iPad.");
          else
            v7 = CFSTR("This item was downloaded to this iPad. Delete it from iCloud or remove the download from this iPad.");
        }
        else if ((unint64_t)v14 >= 2)
        {
          v7 = CFSTR("These books were downloaded to this iPad. Delete them from iCloud or remove the downloads from this iPad.");
        }
        else
        {
          v7 = CFSTR("This book was downloaded to this iPad. Delete it from iCloud or remove the download from this iPad.");
        }
      }
      else if (v8 == (id)2)
      {
        v15 = objc_msgSend(v3, "pdfCount");
        v16 = objc_msgSend(v3, "localUbiquityCount");
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        if (v15)
        {
          if ((unint64_t)v16 >= 2)
            v7 = CFSTR("These items were downloaded to this iPod touch. Delete them from iCloud or remove the downloads from this iPod touch.");
          else
            v7 = CFSTR("This item was downloaded to this iPod touch. Delete it from iCloud or remove the download from this iPod touch.");
        }
        else if ((unint64_t)v16 >= 2)
        {
          v7 = CFSTR("These books were downloaded to this iPod touch. Delete them from iCloud or remove the downloads from this iPod touch.");
        }
        else
        {
          v7 = CFSTR("This book was downloaded to this iPod touch. Delete it from iCloud or remove the download from this iPod touch.");
        }
      }
      else if (v8 == (id)1)
      {
        v9 = objc_msgSend(v3, "pdfCount");
        v10 = objc_msgSend(v3, "localUbiquityCount");
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        if (v9)
        {
          if ((unint64_t)v10 >= 2)
            v7 = CFSTR("These items were downloaded to this iPhone. Delete them from iCloud or remove the downloads from this iPhone.");
          else
            v7 = CFSTR("This item was downloaded to this iPhone. Delete it from iCloud or remove the download from this iPhone.");
        }
        else if ((unint64_t)v10 >= 2)
        {
          v7 = CFSTR("These books were downloaded to this iPhone. Delete them from iCloud or remove the downloads from this iPhone.");
        }
        else
        {
          v7 = CFSTR("This book was downloaded to this iPhone. Delete it from iCloud or remove the download from this iPhone.");
        }
      }
      else
      {
        v17 = objc_msgSend(v3, "pdfCount");
        v18 = objc_msgSend(v3, "localUbiquityCount");
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        if (v17)
        {
          if ((unint64_t)v18 >= 2)
            v7 = CFSTR("These items were downloaded to this device. Delete them from iCloud or remove the downloads from this device.");
          else
            v7 = CFSTR("This item was downloaded to this device. Delete it from iCloud or remove the download from this device.");
        }
        else if ((unint64_t)v18 >= 2)
        {
          v7 = CFSTR("These books were downloaded to this device. Delete them from iCloud or remove the downloads from this device.");
        }
        else
        {
          v7 = CFSTR("This book was downloaded to this device. Delete it from iCloud or remove the download from this device.");
        }
      }
LABEL_70:
      v5 = v6;
      goto LABEL_71;
    }
    if (objc_msgSend(v3, "nonlocalUbiquityCount"))
    {
      v11 = objc_msgSend(v3, "pdfCount");
      v12 = objc_msgSend(v3, "nonlocalUbiquityCount");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v11)
      {
        if ((unint64_t)v12 >= 2)
          v7 = CFSTR("Do you want to delete items from iCloud and all your iCloud devices?");
        else
          v7 = CFSTR("Do you want to delete this item from iCloud and all your iCloud devices?");
      }
      else if ((unint64_t)v12 >= 2)
      {
        v7 = CFSTR("Do you want to delete books from iCloud and all your iCloud devices?");
      }
      else
      {
        v7 = CFSTR("Do you want to delete this book from iCloud and all your iCloud devices?");
      }
      goto LABEL_70;
    }
    if (objc_msgSend(v3, "ubiquityErrorCount"))
    {
      v19 = objc_msgSend(v3, "pdfCount");
      v20 = objc_msgSend(v3, "ubiquityErrorCount");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v19)
      {
        if ((unint64_t)v20 >= 2)
          v7 = CFSTR("These items weren’t uploaded to iCloud. Do you want to delete them?");
        else
          v7 = CFSTR("This item wasn’t uploaded to iCloud. Do you want to delete it?");
      }
      else if ((unint64_t)v20 >= 2)
      {
        v7 = CFSTR("These books weren’t uploaded to iCloud. Do you want to delete them?");
      }
      else
      {
        v7 = CFSTR("This book wasn’t uploaded to iCloud. Do you want to delete it?");
      }
      goto LABEL_70;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionItems"));
    v21 = objc_msgSend(v6, "containsObject:", &off_10092EE68);
    v22 = objc_msgSend(v6, "containsObject:", &off_10092EE80);
    if ((objc_msgSend(v6, "containsObject:", &off_10092EE98) & 1) != 0)
      v23 = 1;
    else
      v23 = objc_msgSend(v6, "containsObject:", &off_10092EEB0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "booksToDelete"));
    v25 = (char *)objc_msgSend(v24, "count");

    if (((v21 | v22) & 1) == 0 && !v23)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v25 == (char *)1)
        v27 = CFSTR("It will be permanently deleted from this device.");
      else
        v27 = CFSTR("They will be permanently deleted from this device.");
LABEL_77:
      v38 = v26;
LABEL_85:
      v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", v27, &stru_10091C438, 0));
LABEL_86:
      v4 = (__CFString *)v39;

      goto LABEL_72;
    }
    v28 = objc_msgSend(v3, "countForActionItem:", 2);
    v29 = objc_msgSend(v3, "countForActionItem:", 7);
    v30 = (char *)objc_msgSend(v3, "localITSAudiobookCount");
    v31 = &v30[(_QWORD)objc_msgSend(v3, "cloudITSAudiobookCount")];
    v32 = v21 ^ 1 | v22;
    if (((v32 | v23) & 1) != 0)
    {
      v33 = v21 | v22 ^ 1;
      if (((v33 | v23) & 1) == 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        if (v29 == (id)1)
        {
          if (v25 == v31)
            v27 = CFSTR("Hide this audiobook on devices using this account. To unhide purchases, tap your Account icon in Home, then tap Manage Hidden Purchases.");
          else
            v27 = CFSTR("Hide this book on devices using this account. To unhide purchases, tap your Account icon in Home, then tap Manage Hidden Purchases.");
        }
        else if (v25 == v31)
        {
          v27 = CFSTR("Hide these audiobooks on devices using this account. To unhide purchases, tap your Account icon in Home, then tap Manage Hidden Purchases.");
        }
        else
        {
          v27 = CFSTR("Hide these books on devices using this account. To unhide purchases, tap your Account icon in Home, then tap Manage Hidden Purchases.");
        }
        goto LABEL_77;
      }
      v34 = v23 ^ 1;
      if (((v21 | v22 | v23 ^ 1) & 1) == 0)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v26 = v38;
        v27 = CFSTR("Remove from this collection.");
        goto LABEL_85;
      }
      v35 = v21 ^ 1 | v22 ^ 1;
      if (((v35 | v23) & 1) == 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        if (v25 == (char *)1)
          v27 = CFSTR("Remove the download or hide it on devices using this account.");
        else
          v27 = CFSTR("Remove the downloads or hide them on devices using this account.");
        goto LABEL_77;
      }
      if (((v32 | v34) & 1) == 0)
      {
        if (v31)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v41 = v40;
          v42 = CFSTR("REMOVE_DOWNLOAD(S)_MESSAGE_ACCOUNT");
        }
        else
        {
          v43 = +[BCDevice deviceClass](BCDevice, "deviceClass");
          if (v43 == (id)3)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v41 = v40;
            v42 = CFSTR("REMOVE_DOWNLOAD(S)_MESSAGE_IPAD");
          }
          else if (v43 == (id)2)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v41 = v40;
            v42 = CFSTR("REMOVE_DOWNLOAD(S)_MESSAGE_IPOD");
          }
          else if (v43 == (id)1)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v41 = v40;
            v42 = CFSTR("REMOVE_DOWNLOAD(S)_MESSAGE_IPHONE");
          }
          else
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v41 = v40;
            v42 = CFSTR("REMOVE_DOWNLOAD(S)_MESSAGE_DEVICE");
          }
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", v42, &stru_10091C438, 0));

        v39 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v28));
        goto LABEL_86;
      }
      if (((v33 | v34) & 1) == 0)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v26 = v38;
        v27 = CFSTR("Remove from this collection or hide on devices using this account.");
        goto LABEL_85;
      }
      if (((v35 | v34) & 1) == 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        if (v25 == (char *)1)
        {
          if (v31 == (char *)1)
            v27 = CFSTR("Remove from collection, remove download, or hide on devices using this account.");
          else
            v27 = CFSTR("Remove from this collection, remove the download, or hide this book on devices using this account.");
        }
        else if (v25 == v31)
        {
          v27 = CFSTR("Remove from collection, remove downloads, or hide on devices using this account.");
        }
        else
        {
          v27 = CFSTR("Remove from this collection, remove the downloads, or hide these books on devices using this account.");
        }
        goto LABEL_77;
      }
    }
    else if (v31)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = v38;
      v27 = CFSTR("You can redownload audiobooks from your account.");
      goto LABEL_85;
    }
    v4 = &stru_10091C438;
    goto LABEL_72;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  v7 = CFSTR("Audiobooks not purchased from the Audiobook Store will be permanently deleted.");
LABEL_71:
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_10091C438, 0));
LABEL_72:

LABEL_73:
  v36 = objc_alloc_init((Class)NSMutableDictionary);
  if (-[__CFString length](v4, "length"))
    objc_msgSend(v36, "setObject:forKey:", v4, CFSTR("warningString"));

  return v36;
}

@end
