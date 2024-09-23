@implementation PSURLManager

- (void)setTopLevelController:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelController, a3);
}

- (void)setSplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_splitViewController, a3);
}

- (void)setRootController:(id)a3
{
  objc_storeStrong((id *)&self->_rootController, a3);
}

void __29__PSURLManager_sharedManager__block_invoke()
{
  PSURLManager *v0;
  void *v1;

  v0 = objc_alloc_init(PSURLManager);
  v1 = (void *)sharedManager_manager_0;
  sharedManager_manager_0 = (uint64_t)v0;

}

+ (id)sharedManager
{
  if (sharedManager_once_0 != -1)
    dispatch_once(&sharedManager_once_0, &__block_literal_global_18);
  return (id)sharedManager_manager_0;
}

- (void)processURL:(id)a3 animated:(BOOL)a4 fromSearch:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL8 v6;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  PSURLManager *v47;
  id v48;
  id v49;
  uint8_t *v50;
  _QWORD *v51;
  BOOL v52;
  _QWORD v53[5];
  id v54;
  uint8_t buf[8];
  uint8_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  v6 = a5;
  v9 = (void (**)(_QWORD))a6;
  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%00"), &stru_1E4A69238);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSURLManager keyValueDictionaryForURL:](self, "keyValueDictionaryForURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("fromSearch"));

  objc_msgSend(v14, "objectForKey:", CFSTR("root"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByRemovingPercentEncoding");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  SFObjectAndOffsetForURLPair();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("object"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("offsetItem"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v19)
  {
    v35 = (void *)v20;
    v36 = v9;
    v33 = v13;
    -[PSURLManager rootController](self, "rootController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSURLManager topLevelController](self, "topLevelController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v56 = buf;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__4;
    v59 = __Block_byref_object_dispose__4;
    objc_msgSend(v23, "specifierForID:", v19);
    v60 = (id)objc_claimAutoreleasedReturnValue();
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = __Block_byref_object_copy__4;
    v53[4] = __Block_byref_object_dispose__4;
    objc_msgSend(v23, "indexPathForIndex:", objc_msgSend(v23, "indexOfSpecifier:", *((_QWORD *)v56 + 5)));
    v54 = (id)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke;
    v40[3] = &unk_1E4A67710;
    v50 = buf;
    v25 = v23;
    v41 = v25;
    v42 = v19;
    v43 = v17;
    v26 = v22;
    v44 = v26;
    v45 = v35;
    v46 = v14;
    v47 = self;
    v52 = a4;
    v49 = v36;
    v51 = v53;
    v48 = v18;
    v27 = (void *)MEMORY[0x1A8594D10](v40);
    v37[0] = v24;
    v37[1] = 3221225472;
    v37[2] = __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke_128;
    v37[3] = &unk_1E4A65758;
    v28 = v26;
    v38 = v28;
    v29 = v27;
    v39 = v29;
    v30 = MEMORY[0x1A8594D10](v37);
    v31 = (void *)v30;
    if (v6 || (v30 = (uint64_t)v29, !v25))
      (*(void (**)(void))(v30 + 16))();
    else
      objc_msgSend(v25, "dismissViewControllerAnimated:completion:", 0, v31);

    _Block_object_dispose(v53, 8);
    _Block_object_dispose(buf, 8);

    v21 = v35;
    v9 = (void (**)(_QWORD))v36;
    v13 = v33;
  }
  else
  {
    _PSLoggingFacility();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3819000, v32, OS_LOG_TYPE_DEFAULT, "PSURLManager: No root object in url", buf, 2u);
    }

    if (v9)
      v9[2](v9);
  }

}

void __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  uint64_t v41;
  char v42;
  int v43;
  unint64_t v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  _BOOL8 v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  NSObject *v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  uint8_t v81[16];
  _QWORD v82[4];
  id v83;
  _BYTE *v84;
  _QWORD v85[4];
  id v86;
  id v87;
  id v88;
  _BYTE *v89;
  _BYTE buf[24];
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "specifierForBundle:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  _PSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "Special ROOT processing: %@ and %@", buf, 0x16u);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR("ROOT")))
  {
    objc_msgSend(*(id *)(a1 + 56), "popRecursivelyToRootController");
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == *(void **)(a1 + 32);

    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 64);
    if (v10)
      objc_msgSend(v11, "_scrollToSpecifierWithID:animated:", v12, 0);
    else
      objc_msgSend(v11, "setDesiredVerticalContentOffsetItemNamed:", v12);
  }
  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
  if (v13
    && ((objc_msgSend(v13, "propertyForKey:", CFSTR("enabled")),
         (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
     || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "propertyForKey:", CFSTR("enabled")),
         v15 = (void *)objc_claimAutoreleasedReturnValue(),
         v16 = objc_msgSend(v15, "BOOLValue"),
         v15,
         v14,
         v16)))
  {
    _PSLoggingFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
      objc_msgSend(v18, "properties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      _os_log_impl(&dword_1A3819000, v17, OS_LOG_TYPE_DEFAULT, "Trying to navigate to: %@ and %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", CFSTR("path"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pathComponents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 80), "currentSpecifierIDPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v22, "count") >= 2)
    {
      objc_msgSend(v22, "subarrayWithRange:", 1, objc_msgSend(v22, "count") - 1);
      v23 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v23;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 80), "splitViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "categoryController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "specifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);

    if (v29)
    {
      objc_msgSend(*(id *)(a1 + 80), "splitViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "categoryController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v34);

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v91 = 0;
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke_19;
      v85[3] = &unk_1E4A676C0;
      v86 = v22;
      v87 = v24;
      v88 = v25;
      v89 = buf;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v85);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "selectSpecifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v35 = objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR("FollowUpList_"));
    if (v30)
      v36 = 0;
    else
      v36 = v35;
    if (v36 == 1)
    {
      objc_msgSend(*(id *)(a1 + 56), "popRecursivelyToRootController");
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "topViewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38 == *(void **)(a1 + 32);

      v40 = *(void **)(a1 + 32);
      v41 = *(_QWORD *)(a1 + 40);
      if (v39)
        objc_msgSend(v40, "_scrollToSpecifierWithID:animated:", v41, 0);
      else
        objc_msgSend(v40, "setDesiredVerticalContentOffsetItemNamed:", v41);
      _PSLoggingFacility();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3819000, v57, OS_LOG_TYPE_DEFAULT, "PSURLManager: skipping push for specifier that returns nil controller", buf, 2u);
      }

      v58 = *(_QWORD *)(a1 + 96);
      if (v58)
        (*(void (**)(void))(v58 + 16))();
    }
    else
    {
      v42 = objc_msgSend(*(id *)(a1 + 32), "shouldDeferPushForSpecifierID:urlDictionary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
      v43 = objc_msgSend(v24, "containsObject:", *(_QWORD *)(a1 + 40));
      v44 = objc_msgSend(v24, "count");
      if (v43)
        v45 = v44 != 0;
      else
        v45 = v44 > 1;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v91 = __Block_byref_object_copy__4;
      v92 = __Block_byref_object_dispose__4;
      v93 = 0;
      if ((v42 & 1) == 0)
      {
        if (v45)
        {
          objc_msgSend(v24, "lastObject");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "viewControllers");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke_23;
          v82[3] = &unk_1E4A676E8;
          v48 = v46;
          v83 = v48;
          v84 = buf;
          objc_msgSend(v47, "enumerateObjectsWithOptions:usingBlock:", 2, v82);

          v49 = *(void **)(*(_QWORD *)&buf[8] + 40);
          objc_msgSend(*(id *)(a1 + 56), "topViewController");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v49) = v49 == v50;

          if ((v49 & 1) == 0)
          {
            v51 = objc_msgSend(v25, "count") == 0;
            v52 = (id)objc_msgSend(*(id *)(a1 + 56), "popToViewController:animated:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v51);
          }
          v53 = *(id *)(*(_QWORD *)&buf[8] + 40);

          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "specifier");
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
          v56 = *(void **)(v55 + 40);
          *(_QWORD *)(v55 + 40) = v54;

          v30 = v53;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 56), "setViewControllers:", MEMORY[0x1E0C9AA60]);
          objc_msgSend(*(id *)(a1 + 32), "setSkipSelectingDefaultCategoryOnLaunch:", 1);
        }
      }
      v59 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 120));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v60, CFSTR("animate"));

      if ((v42 & 1) != 0)
      {
        v61 = *(void **)(a1 + 32);
        objc_msgSend(v61, "table");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "tableView:willSelectRowAtIndexPath:", v62, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40));
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
        v65 = *(void **)(v64 + 40);
        *(_QWORD *)(v64 + 40) = v63;

        if (v63)
        {
          objc_msgSend(*(id *)(a1 + 32), "table");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), 0, 0);

          objc_msgSend(*(id *)(a1 + 80), "popToRootAndSelectDefaultCategory:performWithoutDeferringTransitions:", 0, objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("PASSBOOK")));
          v67 = *(void **)(a1 + 32);
          objc_msgSend(v67, "table");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "tableView:didSelectRowAtIndexPath:", v68, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40));

          _PSLoggingFacility();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v81 = 0;
            _os_log_impl(&dword_1A3819000, v69, OS_LOG_TYPE_DEFAULT, "PSURLManager: selecting top level tableview row", v81, 2u);
          }

          v70 = *(_QWORD *)(a1 + 96);
          if (v70)
            (*(void (**)(void))(v70 + 16))();
        }
      }
      else if (v45)
      {
        objc_msgSend(*(id *)(a1 + 32), "table");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), 0, 0);

        if (objc_msgSend(v25, "count"))
        {
          v72 = (void *)objc_msgSend(*(id *)(a1 + 72), "mutableCopy");
          objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v25);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setObject:forKeyedSubscript:", v73, CFSTR("path"));

          objc_msgSend(v25, "firstObject");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          SFObjectAndOffsetForURLPair();
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 80), "setOffsetForController:fromObjectPair:", v30, v75);
          _PSLoggingFacility();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v81 = 0;
            _os_log_impl(&dword_1A3819000, v76, OS_LOG_TYPE_DEFAULT, "PSURLManager: handling url reusing existing controllers", v81, 2u);
          }

          objc_msgSend(*(id *)(a1 + 80), "performURLHandlingForController:dictionary:items:controllerNeedsPush:withCompletion:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v72, v25, 0, *(_QWORD *)(a1 + 96));
        }
        else
        {
          objc_msgSend(v21, "lastObject");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v72, "length"))
          {
            objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", CFSTR("root"));
            v78 = objc_claimAutoreleasedReturnValue();

            v72 = (void *)v78;
          }
          SFObjectAndOffsetForURLPair();
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          if (v75)
            objc_msgSend(*(id *)(a1 + 80), "setOffsetForController:fromObjectPair:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v75);
          if (objc_msgSend(v30, "conformsToProtocol:", &unk_1EE72CE58)
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v30, "handleResourceDictionaryWhenAlreadyPresented:", *(_QWORD *)(a1 + 72));
          }
          _PSLoggingFacility();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v81 = 0;
            _os_log_impl(&dword_1A3819000, v79, OS_LOG_TYPE_DEFAULT, "PSURLManager: handling url while already at destination", v81, 2u);
          }

          v80 = *(_QWORD *)(a1 + 96);
          if (v80)
            (*(void (**)(void))(v80 + 16))();
        }

      }
      else
      {
        _PSLoggingFacility();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v81 = 0;
          _os_log_impl(&dword_1A3819000, v77, OS_LOG_TYPE_DEFAULT, "PSURLManager: handling url", v81, 2u);
        }

        objc_msgSend(*(id *)(a1 + 80), "handleDeferredURLForSpecifierID:resourceDictionary:objectOffsetPair:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
      }
      _Block_object_dispose(buf, 8);

    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "shouldDeferPushForSpecifierID:urlDictionary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72)))
  {
    objc_msgSend(*(id *)(a1 + 32), "prepareHandlingURLForSpecifierID:resourceDictionary:animatePush:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), 0, *(_QWORD *)(a1 + 96));
  }
  else
  {
    _PSLoggingFacility();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3819000, v31, OS_LOG_TYPE_DEFAULT, "PSURLManager: Couldn't find top level specifier and loading was not deferred", buf, 2u);
    }

    v32 = *(_QWORD *)(a1 + 96);
    if (v32)
      (*(void (**)(void))(v32 + 16))();
  }
}

void __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke_19(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  SFObjectAndOffsetForURLPair();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("object"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v15;
  if (v15 && (v9 = objc_msgSend(*(id *)(a1 + 32), "count") > a3, v8 = v15, v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "isEqualToString:", v10);

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
      v12 = *(void **)(a1 + 48);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(_QWORD *)(v13 + 24);
      *(_QWORD *)(v13 + 24) = v14 + 1;
      objc_msgSend(v12, "removeObjectAtIndex:", a3 - v14);
    }
    else
    {
      *a4 = 1;
    }
    v8 = v15;
  }
  else
  {
    *a4 = 1;
  }

}

void __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke_23(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EE6E3CA8);
  v8 = v11;
  if (v7)
  {
    objc_msgSend(v11, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }

    v8 = v11;
  }

}

uint64_t __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke_128(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
    return objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, v3);
  else
    return (*(uint64_t (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40));
}

- (id)keyValueDictionaryForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "componentsSeparatedByString:", CFSTR("="), (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count") == 2)
        {
          objc_msgSend(v12, "objectAtIndex:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByRemovingPercentEncoding");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectAtIndex:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v14, v15);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v4;
}

- (id)currentSpecifierIDPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  -[PSURLManager rootController](self, "rootController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__PSURLManager_currentSpecifierIDPath__block_invoke;
  v8[3] = &unk_1E4A67738;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __38__PSURLManager_currentSpecifierIDPath__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    else
      *a4 = 1;

  }
  else
  {
    *a4 = 1;
  }

}

- (void)setOffsetForController:(id)a3 fromObjectPair:(id)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  double v10;
  id v11;

  v11 = a3;
  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offsetValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offsetItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EE6E5C88))
  {
    if (v8 == 0.0)
    {
      if (objc_msgSend(v9, "length"))
        objc_msgSend(v11, "setDesiredVerticalContentOffsetItemNamed:", v9);
    }
    else
    {
      *(float *)&v10 = v8;
      objc_msgSend(v11, "setDesiredVerticalContentOffset:", v10);
    }
  }
  if (objc_msgSend(v9, "length") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "highlightSpecifierWithID:", v9);

}

- (void)_performURLHandlingForController:(id)a3 dictionary:(id)a4 items:(id)a5 controllerNeedsPush:(BOOL)a6
{
  -[PSURLManager performURLHandlingForController:dictionary:items:controllerNeedsPush:withCompletion:](self, "performURLHandlingForController:dictionary:items:controllerNeedsPush:withCompletion:", a3, a4, a5, a6, 0);
}

- (void)performURLHandlingForController:(id)a3 dictionary:(id)a4 items:(id)a5 controllerNeedsPush:(BOOL)a6 withCompletion:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  char v23;
  char v24;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("animate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("fromSearch"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "BOOLValue");

  v24 = 0;
  if (objc_msgSend(v14, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SFObjectAndOffsetForURLPair();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("object"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      v22 = objc_msgSend(v12, "prepareHandlingURLForSpecifierID:resourceDictionary:animatePush:withCompletion:", v21, v13, &v24, v15) ^ 1;
    else
      LOBYTE(v22) = 0;

  }
  else
  {
    LOBYTE(v22) = 0;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", v17);
    if ((v22 & 1) != 0)
      goto LABEL_19;
LABEL_18:
    objc_msgSend(v12, "handleURL:withCompletion:", v13, v15);
    goto LABEL_19;
  }
  if (v24)
    v23 = v22;
  else
    v23 = 0;
  if ((v23 & 1) == 0 && ((v17 ^ 1) & 1) == 0)
    objc_msgSend(v14, "count");
  objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", v17);
  -[PSSplitViewController showInitialViewController:](self->_splitViewController, "showInitialViewController:", v12);
  if ((v22 & 1) == 0)
    goto LABEL_18;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CEABB0], "enableAnimation");

}

- (void)handleDeferredURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 objectOffsetPair:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  -[PSURLManager topLevelController](self, "topLevelController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "specifierForID:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v14, "selectSpecifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v14, "indexPathForIndex:", objc_msgSend(v14, "indexOfSpecifier:", v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "table");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "selectRowAtIndexPath:animated:scrollPosition:", v17, 0, 0);

      objc_msgSend(v16, "setParentController:", v14);
      -[PSURLManager rootController](self, "rootController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setRootController:", v19);

      objc_msgSend(v16, "setSpecifier:", v15);
      v25 = v12;
      -[PSURLManager setOffsetForController:fromObjectPair:](self, "setOffsetForController:fromObjectPair:", v16, v12);
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("path"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pathComponents");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      _PSLoggingFacility();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_impl(&dword_1A3819000, v22, OS_LOG_TYPE_DEFAULT, "PSURLManager: Handling deferred url for %@", buf, 0xCu);
      }

      -[PSURLManager performURLHandlingForController:dictionary:items:controllerNeedsPush:withCompletion:](self, "performURLHandlingForController:dictionary:items:controllerNeedsPush:withCompletion:", v16, v11, v21, 1, v13);
      v12 = v25;
    }
    else
    {
      _PSLoggingFacility();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_impl(&dword_1A3819000, v24, OS_LOG_TYPE_DEFAULT, "PSURLManager: No controller for deferred URL-handling ID %@", buf, 0xCu);
      }

      if (v13)
        v13[2](v13);
    }

  }
  else
  {
    _PSLoggingFacility();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v10;
      _os_log_impl(&dword_1A3819000, v23, OS_LOG_TYPE_DEFAULT, "PSURLManager: No specifier for deferred URL-handling ID %@", buf, 0xCu);
    }

    if (v13)
      v13[2](v13);
  }

}

- (void)handleDeferredURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("root"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByRemovingPercentEncoding");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  SFObjectAndOffsetForURLPair();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "mutableCopy");

  -[PSURLManager handleDeferredURLForSpecifierID:resourceDictionary:objectOffsetPair:withCompletion:](self, "handleDeferredURLForSpecifierID:resourceDictionary:objectOffsetPair:withCompletion:", v10, v13, v12, v8);
}

- (void)popToRootAndSelectDefaultCategory:(BOOL)a3
{
  -[PSURLManager popToRootAndSelectDefaultCategory:performWithoutDeferringTransitions:](self, "popToRootAndSelectDefaultCategory:performWithoutDeferringTransitions:", a3, 0);
}

- (void)popToRootAndSelectDefaultCategory:(BOOL)a3 performWithoutDeferringTransitions:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a4;
  v5 = a3;
  -[PSURLManager topLevelController](self, "topLevelController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v4)
  {
    v8 = (void *)MEMORY[0x1E0CEABB8];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__PSURLManager_popToRootAndSelectDefaultCategory_performWithoutDeferringTransitions___block_invoke;
    v12[3] = &unk_1E4A654F0;
    v13 = v7;
    objc_msgSend(v8, "_performWithoutDeferringTransitions:", v12);
    v9 = v13;
  }
  else
  {
    objc_msgSend(v7, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "popToRootViewControllerAnimated:", 0);
  }

  if (v5 && (-[PSSplitViewController isCollapsed](self->_splitViewController, "isCollapsed") & 1) == 0)
    objc_msgSend(v11, "selectDefaultCategoryForced:", 1);

}

void __85__PSURLManager_popToRootAndSelectDefaultCategory_performWithoutDeferringTransitions___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popToRootViewControllerAnimated:", 0);

}

- (id)urlForCurrentNavStack
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t i;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  float v46;
  float v47;
  void *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  __CFString *v58;
  void *v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  -[PSURLManager splitViewController](self, "splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  v7 = 0.0;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE6E5C88))
  {
    objc_msgSend(v5, "verticalContentOffset");
    v7 = v8;
  }
  v61 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PSURLManager splitViewController](self, "splitViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "categoryController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = v10;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE6E3CA8))
  {
    objc_msgSend(v10, "specifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("ROOT");
    if (v12)
      v14 = (__CFString *)v12;
    v15 = v14;

  }
  else
  {
    _PSLoggingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v68 = "-[PSURLManager urlForCurrentNavStack]";
      v69 = 2114;
      v70 = v18;
      _os_log_impl(&dword_1A3819000, v16, OS_LOG_TYPE_DEFAULT, "%s: Category controller doesn't have a specifier: %{public}@", buf, 0x16u);

    }
    v15 = CFSTR("ROOT");
  }
  v19 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v15;
  -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v15, "stringByAddingPercentEncodingWithAllowedCharacters:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "appendFormat:", CFSTR("prefs:root=%@"), v21);

  if (v7 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%0.0f"), v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "appendString:", v24);

  }
  v25 = (void *)MEMORY[0x1E0C99D20];
  -[PSURLManager splitViewController](self, "splitViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "containerNavigationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "viewControllers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "arrayWithArray:", v28);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v29, "count") >= 2)
  {
    v57 = v6;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, objc_msgSend(v29, "count") - 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectsAtIndexes:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v29 = v31;
    v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v63;
      v35 = 1;
      v60 = v29;
      while (2)
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v63 != v34)
            objc_enumerationMutation(v29);
          v37 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v38 = v19;
            objc_msgSend(v37, "specifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "identifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v37, "specifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "propertyForKey:", CFSTR("id"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v42)
            {
              objc_msgSend(v37, "specifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "specifier");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "identifier");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "setProperty:forKey:", v45, CFSTR("id"));

            }
            if (!objc_msgSend(v37, "canBeShownFromSuspendedState"))
            {

              v29 = v60;
              goto LABEL_34;
            }
            v46 = 0.0;
            if (objc_msgSend(v37, "conformsToProtocol:", &unk_1EE6E5C88))
            {
              objc_msgSend(v37, "verticalContentOffset");
              v46 = v47;
            }
            v19 = v38;
            objc_msgSend(*(id *)(v38 + 1280), "URLPathAllowedCharacterSet");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "stringByAddingPercentEncodingWithAllowedCharacters:", v48);
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = (void *)v49;
            if ((v35 & 1) != 0)
              v51 = CFSTR("&path=%@");
            else
              v51 = CFSTR("/%@");
            objc_msgSend(v61, "appendFormat:", v51, v49);

            if (v46 != 0.0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%0.0f"), v46);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v38 + 1280), "URLPathAllowedCharacterSet");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "stringByAddingPercentEncodingWithAllowedCharacters:", v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "appendString:", v54);

              v19 = v38;
            }

            v35 = 0;
            v29 = v60;
          }
        }
        v33 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        if (v33)
          continue;
        break;
      }
    }
LABEL_34:

    v6 = v57;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v61);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
}

- (PSTopLevelController)topLevelController
{
  return self->_topLevelController;
}

- (PSSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (PSRootController)rootController
{
  return self->_rootController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_topLevelController, 0);
}

@end
