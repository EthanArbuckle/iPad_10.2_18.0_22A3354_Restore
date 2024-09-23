@implementation UIAction(IC)

+ (uint64_t)ic_actionWithTitle:()IC imageName:handler:
{
  return objc_msgSend(a1, "ic_actionWithTitle:imageName:attributes:handler:", a3, a4, 0, a5);
}

+ (uint64_t)ic_actionWithTitle:()IC handler:
{
  return objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", a3, 0, a4);
}

+ (uint64_t)ic_actionWithTitle:()IC imageName:attributes:handler:
{
  return objc_msgSend(a1, "ic_actionWithTitle:subtitle:imageName:attributes:handler:", a3, 0, a4, a5, a6);
}

+ (id)ic_actionWithTitle:()IC subtitle:imageName:attributes:handler:
{
  id v11;
  id v12;
  id v13;
  void *v14;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_systemImageNamed:textStyle:scale:", a5, *MEMORY[0x1E0DC4A88], -1);
    a5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", v11, a5, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDiscoverabilityTitle:", v12);
  objc_msgSend(v14, "setAttributes:", a6);

  return v14;
}

- (unint64_t)ic_isDestructive
{
  return ((unint64_t)objc_msgSend(a1, "attributes") >> 1) & 1;
}

- (uint64_t)setIc_destructive:()IC
{
  unint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend(a1, "attributes") & 0xFFFFFFFFFFFFFFFDLL;
  v6 = 2;
  if (!a3)
    v6 = 0;
  return objc_msgSend(a1, "setAttributes:", v5 | v6);
}

- (uint64_t)ic_isDisabled
{
  return objc_msgSend(a1, "attributes") & 1;
}

- (uint64_t)setIc_disabled:()IC
{
  return objc_msgSend(a1, "setAttributes:", objc_msgSend(a1, "attributes") & 0xFFFFFFFFFFFFFFFELL | a3);
}

+ (uint64_t)ic_actionWithTitle:()IC subtitle:imageName:handler:
{
  return objc_msgSend(a1, "ic_actionWithTitle:subtitle:imageName:attributes:handler:", a3, a4, a5, 0, a6);
}

+ (uint64_t)ic_actionWithImageName:()IC handler:
{
  return objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", &stru_1E5C2F8C0, a3, a4);
}

+ (uint64_t)ic_actionWithImage:()IC handler:
{
  return objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", &stru_1E5C2F8C0, a3, 0, a4);
}

+ (id)ic_actionWithAttributedTitle:()IC handler:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0DC3428];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAttributedTitle:", v7);
  return v9;
}

+ (id)ic_pinNoteActionPinned:()IC withHandler:
{
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0D64218];
  v7 = a4;
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Unpin Note"), CFSTR("Unpin Note"), 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("pin.slash");
  }
  else
  {
    objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Pin Note"), CFSTR("Pin Note"), 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("pin");
  }
  objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ic_pinNoteActionPinned:()IC numberOfElements:withHandler:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  v8 = a5;
  if (a4 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "ic_pinNoteActionPinned:withHandler:", a3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((_DWORD)a3)
      v13 = CFSTR("Unpin %lu Notes");
    else
      v13 = CFSTR("Pin %lu Notes");
    if ((_DWORD)a3)
      v14 = CFSTR("pin.slash");
    else
      v14 = CFSTR("pin");
    objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E5C2F8C0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v15, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v16, v14, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)ic_lockNoteActionLocked:()IC withHandler:
{
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0D64218];
  v7 = a4;
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Remove Lock"), CFSTR("Remove Lock"), 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("lock.slash");
  }
  else
  {
    objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Lock Note"), CFSTR("Lock Note"), 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("lock");
  }
  objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ic_collaborateManageActionWithCloudSyncingObject:()IC withHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "shareViaICloudManageActionTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shareViaICloudSystemImageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ic_collaborateShareActionWithCloudSyncingObject:()IC withHandler:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "shareViaICloudAddPeopleActionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v7, CFSTR("square.and.arrow.up"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ic_showActivityStreamActionWithCloudSyncingObject:()IC withHandler:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0D64218];
  v6 = a4;
  objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Show Folder Activity"), CFSTR("Show Folder Activity"), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v7, CFSTR("bubble.left.and.bubble.right"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ic_sendActionWithHandler:()IC
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Send a Copy"), CFSTR("Send a Copy"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, CFSTR("square.and.arrow.up"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ic_moveActionWithHandler:()IC
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Move"), CFSTR("Move"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, CFSTR("folder"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ic_moveActionWithWithNumberOfElements:()IC handler:
{
  id v5;
  void *v6;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  if (a3 == 1)
  {
    v5 = a4;
    objc_msgSend((id)objc_opt_class(), "ic_moveActionWithHandler:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (void *)MEMORY[0x1E0CB34D0];
    v10 = a4;
    objc_msgSend(v9, "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Move %lu Notes"), &stru_1E5C2F8C0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v12, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v5, CFSTR("folder"), v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)ic_removeActionWithHandler:()IC
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Remove"), CFSTR("Remove"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_actionWithTitle:imageName:attributes:handler:", v6, CFSTR("minus.circle"), 2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ic_deleteActionWithHandler:()IC
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Delete"), CFSTR("Delete"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_actionWithTitle:imageName:attributes:handler:", v6, CFSTR("trash"), 2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ic_deleteActionWithNumberOfElements:()IC handler:
{
  id v5;
  void *v6;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  if (a3 == 1)
  {
    v5 = a4;
    objc_msgSend((id)objc_opt_class(), "ic_deleteActionWithHandler:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (void *)MEMORY[0x1E0CB34D0];
    v10 = a4;
    objc_msgSend(v9, "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Delete %lu Notes"), &stru_1E5C2F8C0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v12, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "ic_actionWithTitle:imageName:attributes:handler:", v5, CFSTR("trash"), 2, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)ic_renameActionWithHandler:()IC
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Rename"), CFSTR("Rename"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, CFSTR("pencil"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ic_editSmartFolderActionWithHandler:()IC
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Edit Smart Folder"), CFSTR("Edit Smart Folder"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, CFSTR("pencil"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ic_importArchiveActionWithHandler:()IC
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Import Archive…"), CFSTR("Import Archive…"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, CFSTR("square.and.arrow.down.on.square"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ic_exportArchiveActionWithHandler:()IC
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Export Archive…"), CFSTR("Export Archive…"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, CFSTR("square.and.arrow.up.on.square"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ic_replyActionWithHandler:()IC
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Reply"), CFSTR("Reply"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, CFSTR("arrowshape.turn.up.left"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ic_centerWindowActionWithAppURL:()IC activationRequestOptions:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3FA8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__UIAction_IC__ic_centerWindowActionWithAppURL_activationRequestOptions___block_invoke;
  v12[3] = &unk_1E5C1F6C0;
  v13 = v5;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "actionWithIdentifier:alternateAction:configurationProvider:", 0, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
