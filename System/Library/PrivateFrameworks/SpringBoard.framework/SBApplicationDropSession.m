@implementation SBApplicationDropSession

+ (BOOL)canHandleUIDragDropSession:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13[0] = *MEMORY[0x1E0DAB500];
  v13[1] = CFSTR("com.apple.springboard.private.windowdrag");
  v13[2] = *MEMORY[0x1E0DC6128];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    SBFSafeProtocolCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CEA578], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sessionForDropSession:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if ((objc_msgSend(v8, "canLoadObjectsOfClass:", objc_opt_class()) & 1) != 0
          || (objc_msgSend(v8, "canLoadObjectsOfClass:", objc_opt_class()) & 1) != 0)
        {
          v7 = 1;
        }
        else
        {
          SBApplicationDropSessionGetDragItem(v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(a1, "_dragItemRepresentsAcceptableFileDrag:", v11);

        }
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

+ (SBApplicationDropSession)dropSessionWithWindowUIDragSession:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBApplicationDropSession *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v5, "localContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBApplicationDropSession.m"), 145, CFSTR("A window drag session must have a local context."));

  }
  if (objc_msgSend(v8, "startLocation") != 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBApplicationDropSession.m"), 146, CFSTR("A window drag session must have the start location SBSAppDragLocalContextStartLocationWindow."));

  }
  objc_msgSend(v8, "draggedSceneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBApplicationDropSession.m"), 147, CFSTR("A window drag session must have a draggedSceneIdentifier."));

  }
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationWithBundleIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:localContext:activity:activityData:]([SBApplicationDropSession alloc], "initWithUIDragDropSession:systemSession:application:targetContentIdentifier:localContext:activity:activityData:", v5, 0, v12, 0, v8, 0, 0);
  objc_msgSend(v8, "draggedSceneIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationDropSession setSceneIdentity:](v13, "setSceneIdentity:", v15);

  }
  return v13;
}

+ (void)getDropSessionWithUIDropSession:(id)a3 sceneProvider:(id)a4 defaultToSourceApplication:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  int v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  SBApplicationDropSession *v75;
  SBApplicationDropSession *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  _BOOL4 v83;
  _QWORD v84[4];
  id v85;
  id v86;
  void (**v87)(_QWORD, _QWORD, _QWORD);
  _OWORD v88[2];
  _QWORD v89[4];
  id v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[4];

  v7 = a5;
  v94[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke;
  v89[3] = &unk_1E8EB8318;
  v13 = v12;
  v91 = v13;
  v14 = v11;
  v90 = v14;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v89);
  SBApplicationDropSessionGetDragItem(v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(v10, "items");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v17, "count");
    SBApplicationDropSessionErrorCreate(1, CFSTR("Incorrect number of drag items: %ld [expected 1]"), v29, v30, v31, v32, v33, v34, v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v19);
    goto LABEL_31;
  }
  v83 = v7;
  SBFSafeProtocolCast();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA578], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sessionForDropSession:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v94[0] = *MEMORY[0x1E0DAB500];
  v94[1] = CFSTR("com.apple.springboard.private.windowdrag");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v10, "hasItemsConformingToTypeIdentifiers:", v20);

  if (!v21)
  {
    if (!v19)
    {
      SBApplicationDropSessionErrorCreate(3, CFSTR("Dragging system monitor did not return a system session."), v22, v23, v24, v25, v26, v27, v78);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v50);

      goto LABEL_31;
    }
    v82 = a1;
    objc_msgSend(v16, "itemProvider");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "sbui_preferredApplicationBundleIdentifier");
    v36 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "itemProvider");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sbui_requiredApplicationBundleIdentifier");
    v38 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v38;
    if (v36 | v38)
    {
      if (v38)
        v40 = v38;
      else
        v40 = v36;
      objc_msgSend(v82, "_applicationForIconLeafIdentifier:", v40);
      v41 = objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        v48 = 0x1E0C99000;
        if (!v41)
        {
          SBApplicationDropSessionErrorCreate(7, CFSTR("Missing required application for drag item: %@"), v42, v43, v44, v45, v46, v47, (uint64_t)v39);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v49);
LABEL_30:

          goto LABEL_31;
        }
LABEL_16:
        v79 = (void *)v41;
        v80 = v39;
        v81 = v36;
        v93 = *MEMORY[0x1E0DAC8B0];
        objc_msgSend(*(id *)(v48 + 3360), "arrayWithObjects:count:", &v93, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v10, "hasItemsConformingToTypeIdentifiers:", v51);

        if (v52)
        {
          v53 = (void *)MEMORY[0x1E0D22990];
          objc_msgSend(v19, "info");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v54;
          if (v54)
            objc_msgSend(v54, "auditToken");
          else
            memset(v88, 0, sizeof(v88));
          v56 = objc_msgSend(v53, "authenticateAuditToken:forEntitlement:error:", v88, CFSTR("com.apple.springboard.applicationDrag"), 0);

          if ((v56 & 1) == 0)
          {
            SBApplicationDropSessionErrorCreate(8, CFSTR("Preventing application from initiating app icon drag without entitlement."), v57, v58, v59, v60, v61, v62, v78);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v65);

            v49 = v79;
            v39 = v80;
            goto LABEL_29;
          }
          v84[0] = MEMORY[0x1E0C809B0];
          v84[1] = 3221225472;
          v84[2] = __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke_4;
          v84[3] = &unk_1E8EB8340;
          v87 = v15;
          v85 = v10;
          v86 = v19;
          objc_msgSend(v86, "loadUserActivityForItem:completion:", v16, v84);

        }
        v92 = *MEMORY[0x1E0DC6128];
        objc_msgSend(*(id *)(v48 + 3360), "arrayWithObjects:count:", &v92, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v10, "hasItemsConformingToTypeIdentifiers:", v63);

        if (v64)
        {
          objc_msgSend(v82, "_getUserNotificationDropSessionWithUIDragDropSession:systemSession:dragItem:completion:", v10, v19, v16, v15);
LABEL_24:
          v39 = v80;
          v36 = v81;
LABEL_25:
          v49 = v79;
          goto LABEL_30;
        }
        v39 = v80;
        if (!objc_msgSend(v10, "canLoadObjectsOfClass:", objc_opt_class()))
        {
          v36 = v81;
          if (objc_msgSend(v82, "_dragItemRepresentsAcceptableFileDrag:", v16))
          {
            v49 = v79;
            objc_msgSend(v82, "_getFileDropSessionWithUIDragDropSession:dragItem:systemSession:targetApplication:completion:", v10, v16, v19, v79, v15);
            goto LABEL_30;
          }
          if (objc_msgSend(v10, "canLoadObjectsOfClass:", objc_opt_class()))
          {
            v49 = v79;
            objc_msgSend(v82, "_getURLDropSessionWithUIDragDropSession:dragItem:systemSession:targetApplication:completion:", v10, v16, v19, v79, v15);
            goto LABEL_30;
          }
          if (v83)
          {
            objc_msgSend(v19, "info");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "applicationWithPid:", objc_msgSend(v72, "processIdentifier"));
            v74 = (void *)objc_claimAutoreleasedReturnValue();

            v75 = -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:]([SBApplicationDropSession alloc], "initWithUIDragDropSession:systemSession:application:targetContentIdentifier:", v10, v19, v74, 0);
            if (v75)
            {
              v76 = v75;
              ((void (**)(_QWORD, SBApplicationDropSession *, _QWORD))v15)[2](v15, v75, 0);

              goto LABEL_24;
            }

            v39 = v80;
            v36 = v81;
          }
          SBApplicationDropSessionErrorCreate(6, CFSTR("Drag item did not contain any conforming type identifiers"), v66, v67, v68, v69, v70, v71, v78);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v77);

          goto LABEL_25;
        }
        v49 = v79;
        objc_msgSend(v82, "_getUserActivityDropSessionWithUIDragDropSession:dragItem:systemSession:targetApplication:completion:", v10, v16, v19, v79, v15);
LABEL_29:
        v36 = v81;
        goto LABEL_30;
      }
    }
    else
    {
      v41 = 0;
    }
    v48 = 0x1E0C99000uLL;
    goto LABEL_16;
  }
  objc_msgSend(a1, "_getLocalAppDropSessionWithUIDragDropSession:dragItem:systemSession:completion:", v10, v16, v19, v15);
LABEL_31:

}

void __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v8 = a3;
  v10 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v6 = v8;
  v7 = v5;
  BSDispatchMain();

}

void __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v10 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    if (v9)
    {
      v11 = *(_QWORD *)(a1 + 56);
LABEL_5:
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);
      return;
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke_3;
    v15[3] = &unk_1E8E9F688;
    v12 = *(_QWORD *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v10, "calculateSceneIdentityWithSceneProvider:completion:", v12, v15);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 56);
    if (v9)
      goto LABEL_5;
    SBApplicationDropSessionErrorCreate(5, CFSTR("dropSession completed without a drop session or error. Assuming application was not found."), 0, a4, a5, a6, a7, a8, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v14);

  }
}

uint64_t __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
}

void __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  SBApplicationDropSession *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  SBApplicationDropSession *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  v3 = a2;
  v28 = v3;
  if (v3)
  {
    objc_msgSend(v3, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DAC878]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "applicationWithBundleIdentifier:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = [SBApplicationDropSession alloc];
      v21 = a1[4];
      v22 = a1[5];
      objc_msgSend(v28, "targetContentIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:](v20, "initWithUIDragDropSession:systemSession:application:targetContentIdentifier:", v21, v22, v19, v23);

      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      v26 = a1[6];
      SBApplicationDropSessionErrorCreate(5, CFSTR("Bundle identifier missing from user activity user info."), v12, v13, v14, v15, v16, v17, v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v19);
    }

  }
  else
  {
    v25 = a1[6];
    SBApplicationDropSessionErrorCreate(4, CFSTR("System session did not provide a user activity"), v4, v5, v6, v7, v8, v9, v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v25 + 16))(v25, 0, v11);
  }

}

+ (void)_getLocalAppDropSessionWithUIDragDropSession:(id)a3 dragItem:(id)a4 systemSession:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  SBApplicationDropSession *v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a4, "sbh_appDragLocalContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v13;
  if (v13)
  {
    objc_msgSend(v13, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_applicationForIconLeafIdentifier:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      if (objc_msgSend(v20, "isSourceLocal"))
        v29 = 0;
      else
        v29 = v11;
      v30 = v29;
      objc_msgSend(v20, "userActivity");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __107__SBApplicationDropSession__getLocalAppDropSessionWithUIDragDropSession_dragItem_systemSession_completion___block_invoke;
        v34[3] = &unk_1E8EB8368;
        v35 = v10;
        v36 = v30;
        v37 = v28;
        v38 = v20;
        v39 = v31;
        v40 = v12;
        objc_msgSend(v39, "_createUserActivityDataWithOptions:completionHandler:", MEMORY[0x1E0C9AA70], v34);

      }
      else
      {
        v32 = -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:localContext:activity:activityData:]([SBApplicationDropSession alloc], "initWithUIDragDropSession:systemSession:application:targetContentIdentifier:localContext:activity:activityData:", v10, v30, v28, 0, v20, 0, 0);
        (*((void (**)(id, SBApplicationDropSession *, _QWORD))v12 + 2))(v12, v32, 0);

      }
    }
    else
    {
      SBApplicationDropSessionErrorCreate(2, CFSTR("Drag item contains app drag local context, but missing icon identifier."), v22, v23, v24, v25, v26, v27, v33);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v30);
    }

  }
  else
  {
    SBApplicationDropSessionErrorCreate(2, CFSTR("Drag item contains app drag private type identifier, but missing SBAppDragLocalContext"), v14, v15, v16, v17, v18, v19, v33);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v21);
  }

}

void __107__SBApplicationDropSession__getLocalAppDropSessionWithUIDragDropSession_dragItem_systemSession_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  SBApplicationDropSession *v4;

  v3 = a2;
  v4 = -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:localContext:activity:activityData:]([SBApplicationDropSession alloc], "initWithUIDragDropSession:systemSession:application:targetContentIdentifier:localContext:activity:activityData:", a1[4], a1[5], a1[6], 0, a1[7], a1[8], v3);

  (*(void (**)(void))(a1[9] + 16))();
}

+ (void)_getUserNotificationDropSessionWithUIDragDropSession:(id)a3 systemSession:(id)a4 dragItem:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, SBApplicationDropSession *, _QWORD);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SBApplicationDropSession *v36;
  uint64_t v37;
  void *v38;
  id v39;

  v39 = a3;
  v10 = a4;
  v11 = (void (**)(id, SBApplicationDropSession *, _QWORD))a6;
  objc_msgSend(a5, "sbh_appDragLocalContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v12;
  if (v12)
  {
    objc_msgSend(v12, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_applicationForIconLeafIdentifier:", v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v19, "launchActions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "anyObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "response");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "notification");
      v38 = v27;
      v31 = v10;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "request");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "content");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "targetContentIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v31;
      v27 = v38;

      v36 = -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:localContext:activity:activityData:]([SBApplicationDropSession alloc], "initWithUIDragDropSession:systemSession:application:targetContentIdentifier:localContext:activity:activityData:", v39, v10, v38, v35, v19, 0, 0);
      v11[2](v11, v36, 0);

    }
    else
    {
      SBApplicationDropSessionErrorCreate(2, CFSTR("Drag item contains app drag local context, but missing icon identifier."), v21, v22, v23, v24, v25, v26, v37);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, SBApplicationDropSession *, void *))v11)[2](v11, 0, v29);
    }

  }
  else
  {
    SBApplicationDropSessionErrorCreate(2, CFSTR("Drag item contains app drag private type identifier, but missing SBAppDragLocalContext"), v13, v14, v15, v16, v17, v18, v37);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, SBApplicationDropSession *, void *))v11)[2](v11, 0, v20);
  }

}

+ (id)_applicationForIconLeafIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWithBundleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leafIconForIdentifier:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isBookmarkIcon"))
    {
      objc_msgSend(v8, "applicationToLaunch");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v8, "isApplicationIcon"))
      {
        v5 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v8, "application");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v9;
LABEL_8:

  }
  return v5;
}

+ (BOOL)_dragItemRepresentsAcceptableFileDrag:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "itemProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = 1;
    objc_msgSend(v3, "registeredTypeIdentifiersWithFileOptions:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      objc_msgSend(v3, "registeredTypeIdentifiers", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
      {
        v8 = *(_QWORD *)v12;
        while (2)
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v7);
            if ((objc_msgSend(v3, "isDataAvailableImmediatelyForTypeIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
            {
              LOBYTE(v4) = 1;
              goto LABEL_14;
            }
          }
          v4 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v4)
            continue;
          break;
        }
      }
LABEL_14:

    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

+ (BOOL)_itemProviderRequiresOpenInPlace:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "registeredTypeIdentifiersWithFileOptions:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

+ (id)_applicationProxyForIdentifiers:(id)a3 forURL:(id)a4 passingTest:(id)a5 error:(id *)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t (**v26)(id, void *);
  id v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v27 = a4;
  v26 = (uint64_t (**)(id, void *))a5;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    v13 = *MEMORY[0x1E0CA59C8];
    v14 = v27;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1E0CA58C8];
        objc_msgSend(v14, "lastPathComponent", v26);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "documentProxyForName:type:MIMEType:", v18, v16, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        objc_msgSend(v19, "applicationsAvailableForOpeningWithHandlerRanks:error:", v20, &v29);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v29;

        if (v22)
        {
          if (a6)
            *a6 = objc_retainAutorelease(v22);
        }
        else
        {
          objc_msgSend(v21, "objectForKeyedSubscript:", v13);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v26[2](v26, v24) & 1) != 0)
          {

            goto LABEL_16;
          }

          v14 = v27;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v11)
        continue;
      break;
    }
    v24 = 0;
  }
  else
  {
    v24 = 0;
LABEL_16:
    v14 = v27;
  }

  return v24;
}

+ (id)_applicationForHandlingDragItem:(id)a3 URL:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  void *v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a3, "itemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registeredTypeIdentifiersWithFileOptions:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(a1, "_applicationProxyForIdentifiers:forURL:passingTest:error:", v10, v8, &__block_literal_global_129, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "registeredTypeIdentifiers");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v13)
    {
      v14 = v13;
      v22 = v10;
      v23 = v8;
      v15 = 0;
      v16 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v12);
          v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v9, "isDataAvailableImmediatelyForTypeIdentifier:", v18, v22))
          {
            v28 = v18;
            v15 = 1;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
            v19 = v12;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_applicationProxyForIdentifiers:forURL:passingTest:error:", v20, v23, &__block_literal_global_130_0, a5);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = v19;
            if (v11)
            {
              v10 = v22;
              v8 = v23;
              goto LABEL_16;
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v14)
          continue;
        break;
      }

      if ((v15 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.DocumentsApp"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      v10 = v22;
      v8 = v23;
    }
    else
    {
      v11 = 0;
LABEL_16:

    }
  }

  return v11;
}

uint64_t __70__SBApplicationDropSession__applicationForHandlingDragItem_URL_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsOpenInPlace");
}

uint64_t __70__SBApplicationDropSession__applicationForHandlingDragItem_URL_error___block_invoke_2()
{
  return 1;
}

+ (void)_getFileDropSessionWithUIDragDropSession:(id)a3 dragItem:(id)a4 systemSession:(id)a5 targetApplication:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __121__SBApplicationDropSession__getFileDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke;
  v22[3] = &unk_1E8EB8418;
  v23 = v12;
  v24 = v14;
  v27 = v16;
  v28 = a1;
  v25 = v13;
  v26 = v15;
  v17 = v15;
  v18 = v13;
  v19 = v14;
  v20 = v12;
  v21 = v16;
  objc_msgSend(v19, "loadURLForItem:completion:", v18, v22);

}

void __121__SBApplicationDropSession__getFileDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;

  v3 = a2;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __121__SBApplicationDropSession__getFileDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_2;
  v34[3] = &unk_1E8EB83F0;
  v39 = *(id *)(a1 + 64);
  v4 = v3;
  v35 = v4;
  v36 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 72);
  v37 = v5;
  v40 = v6;
  v38 = *(id *)(a1 + 48);
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v34);
  if (v4)
  {
    v14 = *(void **)(a1 + 56);
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CA5860];
      objc_msgSend(v14, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "applicationProxyForIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v16) = objc_msgSend(v17, "supportsOpenInPlace");
      objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier");
      v18 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v18;
      if ((_DWORD)v16)
      {
        v13[2](v13, v18, 0);
LABEL_13:

        goto LABEL_14;
      }
      v32 = v18;
      v30 = CFSTR("Provided application (%@) does not support opening file URL in place.");
      v31 = 9;
    }
    else
    {
      v26 = *(void **)(a1 + 72);
      v27 = *(_QWORD *)(a1 + 48);
      v33 = 0;
      objc_msgSend(v26, "_applicationForHandlingDragItem:URL:error:", v27, v4, &v33);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v33;
      v17 = v28;
      if (v25)
      {
        objc_msgSend(v25, "bundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v29, 0);
LABEL_10:

        goto LABEL_13;
      }
      if (v28)
      {
        ((void (**)(_QWORD, _QWORD, id))v13)[2](v13, 0, v28);
        goto LABEL_13;
      }
      v30 = CFSTR("LaunchServices could not find an application to open file URL in place.");
      v31 = 5;
    }
    SBApplicationDropSessionErrorCreate(v31, v30, v19, v20, v21, v22, v23, v24, v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v29);
    goto LABEL_10;
  }
  SBApplicationDropSessionErrorCreate(4, CFSTR("System session did not provide a URL"), v7, v8, v9, v10, v11, v12, v32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v17);
LABEL_14:

}

void __121__SBApplicationDropSession__getFileDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  SBApplicationDropSession *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  SBApplicationDropSession *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a2;
  v11 = a3;
  if (!v24 || v11)
  {
    v22 = *(_QWORD *)(a1 + 64);
    if (v11)
    {
      (*(void (**)(_QWORD, _QWORD, id))(v22 + 16))(*(_QWORD *)(a1 + 64), 0, v11);
    }
    else
    {
      SBApplicationDropSessionErrorCreate(5, CFSTR("LaunchServices did not find app for URL: %@"), v5, v6, v7, v8, v9, v10, *(_QWORD *)(a1 + 32));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v23);

    }
  }
  else
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applicationWithBundleIdentifier:", v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = [SBApplicationDropSession alloc];
    v16 = *(_QWORD *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 56), "itemProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:URL:requiresOpenInPlace:](v14, "initWithUIDragDropSession:systemSession:application:targetContentIdentifier:URL:requiresOpenInPlace:", v16, v15, v13, v17, v18, objc_msgSend(v19, "_itemProviderRequiresOpenInPlace:", v20));

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

+ (void)_getURLDropSessionWithUIDragDropSession:(id)a3 dragItem:(id)a4 systemSession:(id)a5 targetApplication:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke;
  v19[3] = &unk_1E8EB8490;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v14;
  objc_msgSend(v16, "loadURLForItem:completion:", a4, v19);

}

void __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22[4];
  id v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_2;
  v25[3] = &unk_1E8EB8440;
  v29 = *(id *)(a1 + 56);
  v5 = v3;
  v26 = v5;
  v27 = *(id *)(a1 + 32);
  v28 = *(id *)(a1 + 40);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v25);
  if (v5)
  {
    v13 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLOverrideForURL:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v15, "isEqual:", v13) & 1) == 0)
    {
      SBLogMedusaDropDestination();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v13, "absoluteString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "absoluteString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v17;
        v32 = 2114;
        v33 = v18;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "SBAppDrop: LaunchServices rewrote URL: %{public}@ -> %{public}@", buf, 0x16u);

      }
    }
    v19 = *(void **)(a1 + 48);
    if (v19)
    {
      objc_msgSend(v19, "bundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v12)[2](v12, v20, 0);
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CA5838];
      v22[0] = v4;
      v22[1] = 3221225472;
      v22[2] = (uint64_t)__120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_144;
      v22[3] = (uint64_t)&unk_1E8EB8468;
      v24 = v12;
      v23 = v15;
      objc_msgSend(v21, "getAppLinkWithURL:completionHandler:", v23, v22);

      v20 = v24;
    }

  }
  else
  {
    SBApplicationDropSessionErrorCreate(4, CFSTR("System session did not provide a URL"), v6, v7, v8, v9, v10, v11, v22[0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v13);
    v15 = 0;
  }

}

void __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_2(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  SBApplicationDropSession *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  SBApplicationDropSession *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a2;
  v11 = a3;
  if (!v21 || v11)
  {
    v19 = a1[7];
    if (v11)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v19 + 16))(a1[7], 0, v11);
    }
    else
    {
      SBApplicationDropSessionErrorCreate(5, CFSTR("LaunchServices did not find app for URL: %@"), v5, v6, v7, v8, v9, v10, a1[4]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v20);

    }
  }
  else
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applicationWithBundleIdentifier:", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = [SBApplicationDropSession alloc];
    v16 = a1[5];
    v15 = a1[6];
    objc_msgSend((id)a1[4], "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:URL:requiresOpenInPlace:](v14, "initWithUIDragDropSession:systemSession:application:targetContentIdentifier:URL:requiresOpenInPlace:", v16, v15, v13, v17, a1[4], 0);

    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a2, "targetApplicationProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v8, 0);

  }
  else
  {
    SBLogMedusaDropDestination();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_144_cold_1(a1, (uint64_t)v5, v9);

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationsAvailableForOpeningURL:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v12, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v14, 0);

  }
}

+ (void)_getUserActivityDropSessionWithUIDragDropSession:(id)a3 dragItem:(id)a4 systemSession:(id)a5 targetApplication:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke;
  v19[3] = &unk_1E8EB8508;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v14;
  objc_msgSend(v16, "loadUserActivityForItem:completion:", a4, v19);

}

void __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;

  v3 = a2;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_2;
  v32[3] = &unk_1E8EB8440;
  v36 = *(id *)(a1 + 56);
  v4 = v3;
  v33 = v4;
  v34 = *(id *)(a1 + 32);
  v35 = *(id *)(a1 + 40);
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v32);
  if (v4)
  {
    v12 = *(void **)(a1 + 48);
    if (v12)
    {
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v13, 0);
    }
    else
    {
      objc_msgSend(v4, "_determineMatchingApplicationBundleIdentifierWithOptions:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:placeholder:", v13, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          goto LABEL_10;
      }
      objc_msgSend(*(id *)(a1 + 40), "info");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
        objc_msgSend(v16, "auditToken");

      v18 = (void *)MEMORY[0x1E0CA5860];
      BSBundleIDForAuditToken();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "applicationProxyForIdentifier:placeholder:", v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "teamID");
      objc_msgSend(v4, "activityType");
      v21 = (void *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType();
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "applicationForUserActivityType:", v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
LABEL_10:
        objc_msgSend(v15, "bundleIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v23, 0);
      }
      else
      {
        v24 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v4, "activityType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        SBApplicationDropSessionErrorCreate(5, CFSTR("LaunchServices did not find an application for user activity type: %@"), v25, v26, v27, v28, v29, v30, (uint64_t)v15);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v23);
      }

    }
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 56);
    SBApplicationDropSessionErrorCreate(4, CFSTR("System session did not provide a user activity"), v5, v6, v7, v8, v9, v10, v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v13);
  }

}

void __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationWithBundleIdentifier:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = a1[4];
    v22 = a1[7];
    v20 = a1[5];
    v21 = a1[6];
    v10 = v9;
    BSDispatchMain();

LABEL_7:
    goto LABEL_8;
  }
  v11 = (void (**)(id, _QWORD, void *))a1[7];
  if (!v6)
  {
    objc_msgSend(a1[4], "activityType");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    SBApplicationDropSessionErrorCreate(5, CFSTR("LaunchServices did not find an application for user activity type: %@"), v12, v13, v14, v15, v16, v17, (uint64_t)v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v18);

    goto LABEL_7;
  }
  v11[2](a1[7], 0, v6);
LABEL_8:

}

void __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_3(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = a1[4];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_4;
  v3[3] = &unk_1E8EB84B8;
  v8 = a1[8];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[4];
  objc_msgSend(v2, "_createUserActivityDataWithOptions:completionHandler:", MEMORY[0x1E0C9AA70], v3);

}

void __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_4(_QWORD *a1, void *a2, uint64_t a3)
{
  SBApplicationDropSession *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    v5 = -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:activity:activityData:]([SBApplicationDropSession alloc], "initWithUIDragDropSession:systemSession:application:activity:activityData:", a1[4], a1[5], a1[6], a1[7], v6);
    (*(void (**)(void))(a1[8] + 16))();

  }
}

- (BOOL)_isApplicationBoundToVisibleIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBApplication isWebApplication](self->_application, "isWebApplication"))
  {
    -[SBApplicationDropSession localContext](self, "localContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "draggedSceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:](SBWebApplication, "_webClipIdentifierFromWebAppIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leafIconForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBApplication bundleIdentifier](self->_application, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationIconForBundleIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8 != 0;
}

- (id)_initWithUIDragDropSession:(id)a3 application:(id)a4 targetContentIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBApplicationDropSession *v12;
  SBApplicationDropSession *v13;
  uint64_t v14;
  NSString *targetContentIdentifier;
  SBApplicationDropSession *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBApplicationDropSession;
  v12 = -[SBApplicationDropSession init](&v18, sel_init);
  v13 = v12;
  if (v12
    && (objc_storeStrong((id *)&v12->_uiDragDropSession, a3),
        objc_storeStrong((id *)&v13->_application, a4),
        v14 = objc_msgSend(v11, "copy"),
        targetContentIdentifier = v13->_targetContentIdentifier,
        v13->_targetContentIdentifier = (NSString *)v14,
        targetContentIdentifier,
        !v10))
  {
    v16 = 0;
  }
  else
  {
    v16 = v13;
  }

  return v16;
}

- (SBApplicationDropSession)initWithUIDragDropSession:(id)a3 systemSession:(id)a4 application:(id)a5 targetContentIdentifier:(id)a6
{
  id v11;
  id *v12;
  id *v13;
  uint64_t v14;
  id v15;
  SBApplicationDropSession *v16;
  NSObject *v17;

  v11 = a4;
  v12 = -[SBApplicationDropSession _initWithUIDragDropSession:application:targetContentIdentifier:](self, "_initWithUIDragDropSession:application:targetContentIdentifier:", a3, a5, a6);
  v13 = v12;
  if (v12
    && (objc_storeStrong(v12 + 7, a4),
        objc_msgSend(MEMORY[0x1E0C99E60], "set"),
        v14 = objc_claimAutoreleasedReturnValue(),
        v15 = v13[9],
        v13[9] = (id)v14,
        v15,
        (objc_msgSend(v13, "_isApplicationBoundToVisibleIcon") & 1) == 0))
  {
    SBLogMedusaDropDestination();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:].cold.1((uint64_t)v13);

    v16 = 0;
  }
  else
  {
    v16 = v13;
  }

  return v16;
}

- (SBApplicationDropSession)initWithUIDragDropSession:(id)a3 systemSession:(id)a4 application:(id)a5 targetContentIdentifier:(id)a6 localContext:(id)a7 activity:(id)a8 activityData:(id)a9
{
  id v15;
  id v16;
  id v17;
  id *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  SBApplicationDropSession *v41;
  NSObject *v42;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v46 = a8;
  v45 = a9;
  v18 = -[SBApplicationDropSession _initWithUIDragDropSession:application:targetContentIdentifier:](self, "_initWithUIDragDropSession:application:targetContentIdentifier:", v15, a5, a6);
  v19 = (uint64_t)v18;
  if (!v18)
    goto LABEL_23;
  objc_storeStrong(v18 + 7, a4);
  objc_storeStrong((id *)(v19 + 64), a7);
  v52[0] = *MEMORY[0x1E0DC6128];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v15, "hasItemsConformingToTypeIdentifiers:", v20);

  if (v21)
    *(_BYTE *)(v19 + 16) = 1;
  objc_msgSend(v17, "launchActions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  objc_msgSend(v17, "launchURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v44 = v16;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v28 = v26;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v48;
LABEL_10:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v31)
          objc_enumerationMutation(v28);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          if (v30)
            goto LABEL_10;
          goto LABEL_16;
        }
      }
    }
    else
    {
LABEL_16:

      v33 = objc_alloc(MEMORY[0x1E0CEA7E0]);
      objc_msgSend(v17, "launchURL");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v33, "initWithURL:", v34);
      objc_msgSend(v28, "addObject:", v35);

      v28 = (id)v34;
    }

    v16 = v44;
  }
  v37 = v45;
  v36 = v46;
  if (v46 && v45)
  {
    objc_msgSend((id)v19, "_activityContinuationActionFromActivity:activityData:", v46, v45);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v38);

  }
  v39 = objc_msgSend(v26, "copy");
  v40 = *(void **)(v19 + 72);
  *(_QWORD *)(v19 + 72) = v39;

  if ((objc_msgSend((id)v19, "_isApplicationBoundToVisibleIcon") & 1) != 0)
  {

LABEL_23:
    v41 = (SBApplicationDropSession *)(id)v19;
    v37 = v45;
    v36 = v46;
    goto LABEL_27;
  }
  SBLogMedusaDropDestination();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:].cold.1(v19);

  v41 = 0;
LABEL_27:

  return v41;
}

- (SBApplicationDropSession)initWithUIDragDropSession:(id)a3 systemSession:(id)a4 application:(id)a5 targetContentIdentifier:(id)a6 URL:(id)a7 requiresOpenInPlace:(BOOL)a8
{
  _BOOL4 v8;
  id v15;
  id v16;
  id v17;
  id *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  dispatch_group_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  const char *v38;
  id v39;
  int v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  SBActivationSettings *v48;
  void *v49;
  void *v50;
  void *v51;
  SBApplicationDropSession *v52;
  NSObject *v53;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  char v63[1025];
  uint64_t v64;

  v8 = a8;
  v64 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = -[SBApplicationDropSession _initWithUIDragDropSession:application:targetContentIdentifier:](self, "_initWithUIDragDropSession:application:targetContentIdentifier:", a3, v16, a6);
  v19 = (uint64_t)v18;
  if (!v18)
    goto LABEL_21;
  objc_storeStrong(v18 + 7, a4);
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7E0]), "initWithURL:", v17);
  objc_msgSend(v20, "setWithObject:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(void **)(v19 + 72);
  *(_QWORD *)(v19 + 72) = v22;

  if (objc_msgSend(v17, "isFileURL"))
  {
    if (v8)
    {
      v24 = dispatch_group_create();
      v25 = *(void **)(v19 + 8);
      *(_QWORD *)(v19 + 8) = v24;

      dispatch_group_enter(*(dispatch_group_t *)(v19 + 8));
      objc_msgSend(v17, "startAccessingSecurityScopedResource");
      objc_msgSend(v16, "bundleIdentifier");
      v59 = (id)v19;
      v60 = v17;
      FPExtendBookmarkForDocumentURL();

      v26 = v59;
    }
    else
    {
      objc_msgSend(v17, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "info");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dataContainerURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "URLByAppendingPathComponent:isDirectory:", CFSTR("tmp"), 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29 && v26)
      {
        v58 = v26;
        v30 = (void *)MEMORY[0x1E0CB3940];
        v56 = v17;
        v31 = v29;
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@.XXXXXX"), CFSTR("drag&Drop"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "URLByAppendingPathComponent:isDirectory:");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (uint64_t)v31;

        objc_msgSend(v32, "path");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "getFileSystemRepresentation:maxLength:", v63, 1024);

        if (mkdtemp(v63))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v63);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v34, 1);
          v35 = objc_claimAutoreleasedReturnValue();

          v32 = (void *)v35;
        }
        objc_msgSend(v32, "URLByAppendingPathComponent:", v58);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = objc_retainAutorelease(v56);
        v38 = (const char *)objc_msgSend(v37, "fileSystemRepresentation");

        v39 = objc_retainAutorelease(v36);
        v40 = copyfile(v38, (const char *)objc_msgSend(v39, "fileSystemRepresentation"), 0, 0x100800Fu);
        v41 = 0;
        if (!v40)
          v41 = v39;

        if (v41)
        {
          v42 = (void *)MEMORY[0x1E0C99E60];
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7E0]), "initWithURL:", v41);
          objc_msgSend(v42, "setWithObject:", v43);
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = *(void **)(v19 + 72);
          *(_QWORD *)(v19 + 72) = v44;

        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:URL:requiresOpenInPlace:].cold.2(v55);
        }

      }
      objc_msgSend(v16, "bundleIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.DocumentsApp"));

      if (v47)
      {
        v48 = objc_alloc_init(SBActivationSettings);
        v49 = *(void **)(v19 + 24);
        *(_QWORD *)(v19 + 24) = v48;

        v50 = *(void **)(v19 + 24);
        v61 = *MEMORY[0x1E0CEC148];
        v62 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setObject:forActivationSetting:", v51, 16);

      }
    }

  }
  if ((objc_msgSend((id)v19, "_isApplicationBoundToVisibleIcon") & 1) == 0)
  {
    SBLogMedusaDropDestination();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:].cold.1(v19);

    v52 = 0;
  }
  else
  {
LABEL_21:
    v52 = (SBApplicationDropSession *)(id)v19;
  }

  return v52;
}

void __128__SBApplicationDropSession_initWithUIDragDropSession_systemSession_application_targetContentIdentifier_URL_requiresOpenInPlace___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  SBActivationSettings *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    v6 = objc_alloc_init(SBActivationSettings);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v6;

    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v10 = *MEMORY[0x1E0CA57E0];
    v13[0] = *MEMORY[0x1E0CA5818];
    v13[1] = v10;
    v14[0] = MEMORY[0x1E0C9AAB0];
    v14[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forActivationSetting:", v11, 16);

  }
  if (a3)
  {
    SBLogMedusaDropDestination();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __128__SBApplicationDropSession_initWithUIDragDropSession_systemSession_application_targetContentIdentifier_URL_requiresOpenInPlace___block_invoke_cold_1(a1, v12);

  }
  objc_msgSend(*(id *)(a1 + 40), "stopAccessingSecurityScopedResource");
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));

}

- (SBApplicationDropSession)initWithUIDragDropSession:(id)a3 systemSession:(id)a4 application:(id)a5 activity:(id)a6 activityData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  SBApplicationDropSession *v25;
  NSObject *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = a5;
  objc_msgSend(v14, "targetContentIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SBApplicationDropSession _initWithUIDragDropSession:application:targetContentIdentifier:](self, "_initWithUIDragDropSession:application:targetContentIdentifier:", v12, v16, v17);

  if (!v18)
    goto LABEL_5;
  objc_storeStrong(v18 + 7, a4);
  v28[0] = *MEMORY[0x1E0CEB478];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v12, "hasItemsConformingToTypeIdentifiers:", v19);

  if (v20)
    *((_BYTE *)v18 + 17) = 1;
  v21 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v18, "_activityContinuationActionFromActivity:activityData:", v14, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithObject:", v22);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v18[9];
  v18[9] = (id)v23;

  if ((objc_msgSend(v18, "_isApplicationBoundToVisibleIcon") & 1) == 0)
  {
    SBLogMedusaDropDestination();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:].cold.1((uint64_t)v18);

    v25 = 0;
  }
  else
  {
LABEL_5:
    v25 = v18;
  }

  return v25;
}

- (id)_activityContinuationActionFromActivity:(id)a3 activityData:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithCapacity:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, &unk_1E91D1748);

  objc_msgSend(v7, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, &unk_1E91D1760);

  objc_msgSend(v7, "activityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, &unk_1E91D1778);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, &unk_1E91D1790);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C0]), "initWithSettings:", v8);
  return v12;
}

- (SBActivationSettings)activationSettings
{
  NSObject *activationSettingsGroup;
  dispatch_time_t v4;

  activationSettingsGroup = self->_activationSettingsGroup;
  if (activationSettingsGroup)
  {
    v4 = BSDispatchTimeWithInterval();
    dispatch_group_wait(activationSettingsGroup, v4);
  }
  return self->_activationSettings;
}

- (void)calculateSceneIdentityWithSceneProvider:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  FBSSceneIdentity *v12;
  FBSSceneIdentity *sceneIdentity;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  FBSSceneIdentity *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SBApplicationDropSession application](self, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationDropSession.m"), 741, CFSTR("Completed with Drop Session not bound to application."));

  }
  -[SBApplicationDropSession localContext](self, "localContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "draggedSceneIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v11);
    v12 = (FBSSceneIdentity *)objc_claimAutoreleasedReturnValue();
    sceneIdentity = self->_sceneIdentity;
    self->_sceneIdentity = v12;
  }
  else
  {
    objc_msgSend(v9, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "supportsMultiwindow");

    if (v15)
    {
      -[SBApplicationDropSession uiDragDropSession](self, "uiDragDropSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = *MEMORY[0x1E0DAB500];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "hasItemsConformingToTypeIdentifiers:", v17);

      objc_msgSend(v7, "preferredSceneIdentityForApplication:targetContentIdentifier:preferNewScene:", v9, self->_targetContentIdentifier, v18 ^ 1u);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "mostRecentSceneIdentityExcludingLiveScenesForApplication:", v9);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (FBSSceneIdentity *)v19;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationDropSession.m"), 757, CFSTR("Unable to calculate a scene identity for Drop Session."));

    }
    sceneIdentity = self->_sceneIdentity;
    self->_sceneIdentity = v20;
  }

  v8[2](v8, 0);
}

- (int64_t)dropZones
{
  void *v3;
  int64_t v4;
  void *v5;

  -[SBApplicationDropSession systemSession](self, "systemSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !-[SBApplicationDropSession isNotificationDrag](self, "isNotificationDrag"))
  {
    -[SBApplicationDropSession localContext](self, "localContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "startLocation") != 5;

  }
  else
  {

    v4 = 0;
  }
  if (-[SBApplicationDropSession isWindowTearOff](self, "isWindowTearOff"))
    return 2;
  else
    return v4;
}

- (SBApplication)application
{
  return self->_application;
}

- (FBSSceneIdentity)sceneIdentity
{
  return self->_sceneIdentity;
}

- (void)setSceneIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_sceneIdentity, a3);
}

- (UIDragDropSession)uiDragDropSession
{
  return self->_uiDragDropSession;
}

- (UIDraggingSystemSession)systemSession
{
  return self->_systemSession;
}

- (BOOL)isNotificationDrag
{
  return self->_notificationDrag;
}

- (BOOL)isWindowTearOff
{
  return self->_windowTearOff;
}

- (SBSAppDragLocalContext)localContext
{
  return self->_localContext;
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (void)setTargetContentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_launchActions, 0);
  objc_storeStrong((id *)&self->_localContext, 0);
  objc_storeStrong((id *)&self->_systemSession, 0);
  objc_storeStrong((id *)&self->_uiDragDropSession, 0);
  objc_storeStrong((id *)&self->_sceneIdentity, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_activationSettings, 0);
  objc_storeStrong((id *)&self->_activationSettingsGroup, 0);
}

void __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_144_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a3, (uint64_t)a3, "SBAppDrop: LSAppLink did not find appLink for URL: %{public}@ %{public}@", (uint8_t *)&v4);
}

- (void)initWithUIDragDropSession:(uint64_t)a1 systemSession:application:targetContentIdentifier:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_18(a1), "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v2, v3, "SBAppDrop: Bound to an application without an icon: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)initWithUIDragDropSession:(uint64_t)a1 systemSession:application:targetContentIdentifier:URL:requiresOpenInPlace:.cold.2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *__error());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v2;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, MEMORY[0x1E0C81028], v3, "FAILED to clone file to directory %@ errno %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_2_2();
}

void __128__SBApplicationDropSession_initWithUIDragDropSession_systemSession_application_targetContentIdentifier_URL_requiresOpenInPlace___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Failed to extend bookmark for document URL %@", (uint8_t *)&v3, 0xCu);
}

@end
