@implementation ICDeleteAlert

+ (BOOL)suppressesAlerts
{
  return byte_1005DDD98;
}

+ (void)setSuppressesAlerts:(BOOL)a3
{
  byte_1005DDD98 = a3;
}

+ (void)showAlertForDeletingObjectsWithType:(unint64_t)a3 count:(unint64_t)a4 window:(id)a5 sender:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "titleForAlertType:count:", a3, a4));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "messageForAlertType:count:", a3, a4));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "confirmationForAlertType:count:sender:", a3, a4, v13));
  objc_msgSend(a1, "showDeleteAlertWithTitle:message:confirmation:canCancel:window:sender:completion:", v17, v15, v16, objc_msgSend(a1, "canCancelAlertType:", a3), v14, v13, v12);

}

+ (void)showDeleteAlertWithTitle:(id)a3 message:(id)a4 confirmation:(id)a5 canCancel:(BOOL)a6 window:(id)a7 sender:(id)a8 completion:(id)a9
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, uint64_t);
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(id, uint64_t);
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  void (**v43)(id, uint64_t);
  _QWORD v44[4];
  id v45;
  void (**v46)(id, uint64_t);
  _QWORD v47[4];
  void (**v48)(id, uint64_t);

  v11 = a6;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = (void (**)(id, uint64_t))a9;
  if (objc_msgSend((id)objc_opt_class(a1), "suppressesAlerts"))
  {
    if (v20)
      v20[2](v20, 1);
  }
  else
  {
    v39 = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1005704B8, 0));

    v40 = v15;
    if (objc_msgSend(a1, "shouldShowAsAlertWithSender:canCancel:", v19, v11))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICAlertController alertControllerWithTitle:message:preferredStyle:](ICAlertController, "alertControllerWithTitle:message:preferredStyle:", v15, v16, 1));
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICAlertController alertControllerWithTitle:message:preferredStyle:](ICAlertController, "alertControllerWithTitle:message:preferredStyle:", v16, 0, 0));
      v24 = objc_opt_class(UIView);
      v25 = ICDynamicCast(v24, v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = objc_opt_class(UIBarButtonItem);
      v28 = ICDynamicCast(v27, v19);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "popoverPresentationController"));
      objc_msgSend(v30, "setSourceView:", v26);

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "popoverPresentationController"));
      objc_msgSend(v31, "setBarButtonItem:", v29);

    }
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100070E08;
    v47[3] = &unk_10054FFA8;
    v32 = v20;
    v48 = v32;
    objc_msgSend(v23, "setDismissWithoutActionBlock:", v47);
    if (v11)
    {
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100070E18;
      v44[3] = &unk_100550B38;
      v33 = v23;
      v45 = v33;
      v46 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v22, 1, v44));
      objc_msgSend(v33, "addAction:", v34);

      v35 = 2;
    }
    else
    {
      v35 = 0;
    }
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100070E4C;
    v41[3] = &unk_100550B38;
    v42 = v23;
    v43 = v32;
    v36 = v23;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, v35, v41));
    objc_msgSend(v36, "addAction:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "rootViewController"));
    objc_msgSend(v38, "presentViewController:animated:completion:", v36, 1, 0);

    v18 = v39;
    v15 = v40;
  }

}

+ (BOOL)canCancelAlertType:(unint64_t)a3
{
  return a3 != 15;
}

+ (id)titleForAlertType:(unint64_t)a3 count:(unint64_t)a4
{
  __CFString *v4;
  unsigned __int8 v5;
  void *v6;
  const __CFString *v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;

  v4 = &stru_1005704B8;
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
    case 8uLL:
      v8 = +[ICDeviceSupport deviceIsMac](ICDeviceSupport, "deviceIsMac");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if ((v8 & 1) != 0)
        v7 = CFSTR("Are you sure you want to delete this shared note?");
      else
        v7 = CFSTR("Delete Shared Note?");
      goto LABEL_27;
    case 1uLL:
    case 2uLL:
    case 5uLL:
    case 6uLL:
    case 9uLL:
      v5 = +[ICDeviceSupport deviceIsMac](ICDeviceSupport, "deviceIsMac");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if ((v5 & 1) != 0)
        v7 = CFSTR("Are you sure you want to delete these shared notes?");
      else
        v7 = CFSTR("Delete Shared Notes?");
      goto LABEL_27;
    case 3uLL:
    case 7uLL:
    case 0xAuLL:
      v9 = +[ICDeviceSupport deviceIsMac](ICDeviceSupport, "deviceIsMac");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if ((v9 & 1) != 0)
        v7 = CFSTR("Are you sure you want to delete this shared folder?");
      else
        v7 = CFSTR("Delete Shared Folder?");
      goto LABEL_27;
    case 0xBuLL:
      v10 = +[ICDeviceSupport deviceIsMac](ICDeviceSupport, "deviceIsMac");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if ((v10 & 1) != 0)
        v7 = CFSTR("Are you sure you want to delete the selected notes?");
      else
        v7 = CFSTR("Delete Notes?");
      goto LABEL_27;
    case 0xCuLL:
      v17 = +[ICDeviceSupport deviceIsMac](ICDeviceSupport, "deviceIsMac");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if ((v17 & 1) != 0)
        v7 = CFSTR("Are you sure you want to delete the selected note?");
      else
        v7 = CFSTR("Delete Note?");
      goto LABEL_27;
    case 0xDuLL:
      v11 = +[ICDeviceSupport deviceIsMac](ICDeviceSupport, "deviceIsMac");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if ((v11 & 1) != 0)
        v7 = CFSTR("Are you sure you want to delete this folder?");
      else
        v7 = CFSTR("Delete Folder?");
LABEL_27:
      v16 = v6;
      goto LABEL_28;
    case 0xEuLL:
      v13 = +[ICDeviceSupport deviceIsMac](ICDeviceSupport, "deviceIsMac");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v14;
      if ((v13 & 1) != 0)
        v15 = CFSTR("Are you sure you want to delete the %lu notes permanently?");
      else
        v15 = CFSTR("Delete %lu Notes?");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1005704B8, 0));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, a4));

      goto LABEL_29;
    case 0xFuLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v16;
      v7 = CFSTR("Deleted notes are moved to the Recently Deleted folder.");
      goto LABEL_28;
    case 0x11uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v16;
      v7 = CFSTR("Delete Smart Folder?");
LABEL_28:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v7, &stru_1005704B8, 0));
LABEL_29:

      break;
    default:
      return v4;
  }
  return v4;
}

+ (id)messageForAlertType:(unint64_t)a3 count:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v10;

  v4 = 0;
  switch(a3)
  {
    case 0uLL:
    case 8uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("If you delete this note, other people will no longer have access to it and it will be deleted from all of their devices.");
      goto LABEL_15;
    case 1uLL:
    case 9uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("If you delete these notes, other people will no longer have access to them and they will be deleted from all of their devices.");
      goto LABEL_15;
    case 2uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("One or more notes are shared. If you delete these notes, other people will no longer have access to them and they will be deleted from all of their devices.");
      goto LABEL_15;
    case 3uLL:
    case 0xAuLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("If you delete this folder, other people will no longer have access to it and it will be deleted from all of their devices.");
      goto LABEL_15;
    case 4uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("It will be deleted on all of your devices. To reopen the note, click the link you were invited with.");
      goto LABEL_15;
    case 5uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("They will be deleted on all of your devices. To reopen the notes, click the links you were invited with.");
      goto LABEL_15;
    case 6uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("One or more notes are shared. They will be deleted on all of your devices. To reopen the notes, click the links you were invited with.");
      goto LABEL_15;
    case 7uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("It will be deleted from all of your devices. To rejoin this shared folder, click the link you were invited with.");
      goto LABEL_15;
    case 0xDuLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("All notes and any subfolders will be deleted.");
      goto LABEL_15;
    case 0xEuLL:
      if ((+[ICDeviceSupport deviceIsMac](ICDeviceSupport, "deviceIsMac") & 1) != 0)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("You cannot undo this action.");
LABEL_15:
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1005704B8, 0));
      }
      else
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("These %lu notes will be deleted. This action cannot be undone."), &stru_1005704B8, 0));
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, a4));

      }
      return v4;
    case 0xFuLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("You can recover or remove from Recently Deleted within 30 days.");
      goto LABEL_15;
    case 0x11uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Deleting this Smart Folder won’t affect its notes, which will remain in their folders.");
      goto LABEL_15;
    default:
      return v4;
  }
}

+ (id)confirmationForAlertType:(unint64_t)a3 count:(unint64_t)a4 sender:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;

  v8 = a5;
  v9 = objc_msgSend(a1, "canCancelAlertType:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = v10;
  if ((_DWORD)v9)
    v12 = CFSTR("Delete");
  else
    v12 = CFSTR("OK");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1005704B8, 0));

  v14 = objc_msgSend(a1, "shouldShowAsAlertWithSender:canCancel:", v8, v9);
  if (v14 && (+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    a4 = v13;
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
      case 4uLL:
      case 8uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = v15;
        v17 = CFSTR("Delete Shared Note");
        goto LABEL_18;
      case 1uLL:
      case 2uLL:
      case 5uLL:
      case 6uLL:
      case 9uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = v15;
        v17 = CFSTR("Delete Shared Notes");
        goto LABEL_18;
      case 3uLL:
      case 7uLL:
      case 0xAuLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = v15;
        v17 = CFSTR("Delete Shared Folder");
        goto LABEL_18;
      case 0xBuLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = v15;
        v17 = CFSTR("Delete Notes");
        goto LABEL_18;
      case 0xCuLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = v15;
        v17 = CFSTR("Delete Note");
        goto LABEL_18;
      case 0xDuLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = v15;
        v17 = CFSTR("Delete Folder");
        goto LABEL_18;
      case 0xEuLL:
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Delete %lu Notes"), &stru_1005704B8, 0));
        a4 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, a4));

        break;
      case 0xFuLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = v15;
        v17 = CFSTR("OK");
        goto LABEL_18;
      case 0x10uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = v15;
        v17 = CFSTR("Delete All");
        goto LABEL_18;
      case 0x11uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = v15;
        v17 = CFSTR("Delete Smart Folder");
LABEL_18:
        a4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1005704B8, 0));

        break;
      default:
        break;
    }
  }

  return (id)a4;
}

+ (BOOL)shouldShowAsAlertWithSender:(id)a3 canCancel:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v4 = a4;
  v5 = a3;
  v6 = objc_opt_class(UIView);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0
    || (v7 = objc_opt_class(UIBarButtonItem), (objc_opt_isKindOfClass(v5, v7) & 1) != 0))
  {
    if (!v4)
    {
      v8 = 1;
      goto LABEL_8;
    }
LABEL_7:
    v8 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
    goto LABEL_8;
  }
  v8 = 1;
  if ((+[UIDevice ic_isiPad](UIDevice, "ic_isiPad") & 1) == 0 && v4)
    goto LABEL_7;
LABEL_8:

  return v8;
}

@end
