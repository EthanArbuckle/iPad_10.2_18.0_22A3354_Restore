@implementation CRLItemProviderItemWriter

- (id)createItemProviderWithCopyOfBoardItems:(id)a3 fromInteractiveCanvasController:(id)a4 outCopiedBoardItems:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _TtC8Freeform19CRLPasteboardObject *v14;
  void *v15;
  _TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CRLContentDescriptionTranslator *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *j;
  void *v48;
  void *v49;
  BOOL v50;
  char v51;
  dispatch_semaphore_t v52;
  dispatch_queue_global_t global_queue;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  CRLItemProviderItemWriter *v60;
  void *v61;
  BOOL v63;
  void *v64;
  _TtC8Freeform19CRLPasteboardObject *v65;
  _TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[5];
  _QWORD v75[4];
  NSObject *v76;
  __int128 *v77;
  __int128 *v78;
  _QWORD block[6];
  NSObject *v80;
  __int128 *v81;
  __int128 *v82;
  _QWORD v83[5];
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  NSObject *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];

  v7 = a3;
  v8 = a4;
  v69 = v7;
  if (!objc_msgSend(v7, "count"))
  {
    v73 = 0;
    goto LABEL_75;
  }
  v60 = self;
  v73 = objc_alloc_init((Class)NSItemProvider);
  v70 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editingCoordinator"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "boardItemFactory"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "board"));
  v67 = v10;
  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012304C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEDFF0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012304E8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEDF50(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLItemProviderItemWriter createItemProviderWithCopyOfBoardItems:fromInteractiveCanvasController:outCopiedBoardItems:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLItemProviderItemWriter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 36, 0, "invalid nil value for '%{public}s'", "board");

    v10 = 0;
  }
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "store"));
  v14 = [_TtC8Freeform19CRLPasteboardObject alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "crdtContext"));
  v65 = -[CRLPasteboardObject initWithContext:](v14, "initWithContext:", v15);

  v16 = [_TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "crdtContext"));
  v66 = -[CRLPasteboardObjectItemProviderWriteAssistant initWithStore:context:](v16, "initWithStore:context:", v68, v17);

  if (!v66)
    goto LABEL_41;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPasteboardController boardItemsForCopyByFixingUpBoardItems:boardItemFactory:board:](CRLPasteboardController, "boardItemsForCopyByFixingUpBoardItems:boardItemFactory:board:", v7, v64, v67));
  v71 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "makeDuplicateOfBoardItems:", v61));
  if (!v71)
  {

LABEL_41:
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101230570);
    v38 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
      sub_100DEDD3C(v38);
    goto LABEL_45;
  }
  if (v8)
  {
    v18 = objc_msgSend(v7, "count");
    if (v18 != objc_msgSend(v71, "count"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230508);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEDECC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230528);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEDE2C(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLItemProviderItemWriter createItemProviderWithCopyOfBoardItems:fromInteractiveCanvasController:outCopiedBoardItems:]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLItemProviderItemWriter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 56, 0, "Somehow didn't end up with the same number of board items");

    }
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v22 = v7;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
    if (v23)
    {
      v24 = 0;
      v25 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v98 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)i);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectAtIndexedSubscript:", (char *)i + v24));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "layoutForInfo:", v27));
          v95 = 0u;
          v96 = 0u;
          v94 = 0u;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "parent"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "geometryInRoot"));
          v32 = v31;
          if (v31)
          {
            objc_msgSend(v31, "transform");
          }
          else
          {
            v95 = 0u;
            v96 = 0u;
            v94 = 0u;
          }

          v91 = v94;
          v92 = v95;
          v93 = v96;
          objc_msgSend(v29, "transferLayoutGeometryToInfo:withAdditionalTransform:assertIfInDocument:", v28, &v91, 1);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
        v24 += (uint64_t)i;
      }
      while (v23);
    }

  }
  -[CRLPasteboardObject setBoardItems:](v65, "setBoardItems:", v71);
  if (a5)
    *a5 = objc_retainAutorelease(v71);
  v33 = objc_alloc_init(CRLContentDescriptionTranslator);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLContentDescriptionTranslator contentDescriptionForBoardItems:](v33, "contentDescriptionForBoardItems:", v7));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "canvasEditor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "pasteboardController"));
  -[CRLItemProviderItemWriter writeContentDescription:toItemProvider:pasteboardController:](v60, "writeContentDescription:toItemProvider:pasteboardController:", v34, v73, v36);

  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_10005E980;
  v89[3] = &unk_101230550;
  v37 = dispatch_semaphore_create(0);
  v90 = v37;
  -[CRLPasteboardObjectItemProviderWriteAssistant writePasteboardObject:to:completionHandler:](v66, "writePasteboardObject:to:completionHandler:", v65, v73, v89);
  dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);

LABEL_45:
  if (objc_msgSend(v7, "count") == (id)1)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v72 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "promisedStringForCopy"));

  }
  else
  {
    v72 = 0;
  }
  if (objc_msgSend(v7, "count") == (id)1)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "customPublicTypesToPromiseWhenCopyingSingleBoardItem"));
    v42 = objc_msgSend(v41, "count");
    v63 = v42 != 0;
    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "suggestedNameWhenDraggingSingleBoardItem"));
      if (v43)
        objc_msgSend(v73, "setSuggestedName:", v43);

    }
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v44 = v41;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v45; j = (char *)j + 1)
        {
          if (*(_QWORD *)v86 != v46)
            objc_enumerationMutation(v44);
          v48 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)j);
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePlainText, "identifier"));
          if (objc_msgSend(v48, "crl_conformsToUTI:", v49))
          {
            v50 = objc_msgSend(v72, "length") == 0;

            if (!v50)
              continue;
          }
          else
          {

          }
          v83[0] = _NSConcreteStackBlock;
          v83[1] = 3221225472;
          v83[2] = sub_10005E9B8;
          v83[3] = &unk_101230618;
          v83[4] = v48;
          v84 = v40;
          objc_msgSend(v73, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v48, 0, v83);

        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
      }
      while (v45);
    }

  }
  else
  {
    v63 = 0;
  }
  if (objc_msgSend(v72, "length"))
    v51 = 1;
  else
    v51 = v63;
  if ((v51 & 1) == 0)
  {
    *(_QWORD *)&v94 = 0;
    *((_QWORD *)&v94 + 1) = &v94;
    v95 = 0x2020000000uLL;
    *(_QWORD *)&v91 = 0;
    *((_QWORD *)&v91 + 1) = &v91;
    *(_QWORD *)&v92 = 0x2020000000;
    BYTE8(v92) = 0;
    v52 = dispatch_semaphore_create(0);
    global_queue = dispatch_get_global_queue(0, 0);
    v54 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005EE1C;
    block[3] = &unk_101230680;
    block[4] = v67;
    block[5] = v65;
    v81 = &v91;
    v82 = &v94;
    v55 = v52;
    v80 = v55;
    dispatch_async(v54, block);
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePNG, "identifier"));
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_10005F0CC;
    v75[3] = &unk_1012306A8;
    v57 = v55;
    v76 = v57;
    v77 = &v94;
    v78 = &v91;
    objc_msgSend(v73, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v56, 0, v75);

    _Block_object_dispose(&v91, 8);
    _Block_object_dispose(&v94, 8);
  }
  if (objc_msgSend(v72, "length"))
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_10005F2E8;
    v74[3] = &unk_101230710;
    v74[4] = v72;
    objc_msgSend(v73, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v58, 0, v74);

  }
  v8 = v70;
LABEL_75:

  return v73;
}

- (id)itemProviderWithStorage:(id)a3 selection:(id)a4 boardItems:(id)a5 styleProvider:(id)a6 inIsSmart:(BOOL)a7 pasteboardController:(id)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  _TtC8Freeform19CRLPasteboardObject *v23;
  void *v24;
  CRLContentDescriptionTranslator *v25;
  uint64_t v26;
  id v27;
  void *v28;
  _TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant *v29;
  void *v30;
  void *v31;
  _TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  _TtC8Freeform19CRLPasteboardObject *v40;
  CRLContentDescriptionTranslator *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[5];
  _QWORD v46[4];
  NSObject *v47;

  v9 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  if (objc_msgSend(v14, "isRange"))
  {
    v17 = objc_msgSend(v14, "range");
    v19 = v18;
    v20 = objc_alloc_init((Class)NSItemProvider);
    if (v19)
    {
      v43 = v17;
      v21 = -[CRLWPStorage initFromStorage:withRange:]([_TtC8Freeform12CRLWPStorage alloc], "initFromStorage:withRange:", v13, v17, v19);
      if (objc_msgSend(v21, "length"))
      {
        v44 = v15;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sourceContextForPasteboardController:", v16));

        v23 = [_TtC8Freeform19CRLPasteboardObject alloc];
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "sourceContext"));
        v40 = -[CRLPasteboardObject initWithContext:](v23, "initWithContext:", v24);

        -[CRLPasteboardObject copyTextFrom:](v40, "copyTextFrom:", v21);
        -[CRLPasteboardObject setIsSmartCopyPaste:](v40, "setIsSmartCopyPaste:", v9);
        v25 = objc_alloc_init(CRLContentDescriptionTranslator);
        v41 = v25;
        v27 = objc_msgSend(v21, "range");
        if (v44)
          v28 = v44;
        else
          v28 = &__NSArray0__struct;
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLContentDescriptionTranslator contentDescriptionForTextStorage:range:boardItems:](v25, "contentDescriptionForTextStorage:range:boardItems:", v21, v27, v26, v28));
        -[CRLItemProviderItemWriter writeContentDescription:toItemProvider:pasteboardController:](self, "writeContentDescription:toItemProvider:pasteboardController:", v39, v20, v16);
        v29 = [_TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant alloc];
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "sourceStore"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "sourceContext"));
        v32 = -[CRLPasteboardObjectItemProviderWriteAssistant initWithStore:context:](v29, "initWithStore:context:", v30, v31);

        v15 = v44;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10005F864;
        v46[3] = &unk_101230550;
        v33 = dispatch_semaphore_create(0);
        v47 = v33;
        -[CRLPasteboardObjectItemProviderWriteAssistant writePasteboardObject:to:completionHandler:](v32, "writePasteboardObject:to:completionHandler:", v40, v20, v46);
        dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);

      }
      v17 = v43;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "coreTextAttributedString"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "attributedSubstringFromRange:", v17, v19));

    if (objc_msgSend(v35, "length"))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTF, "identifier"));
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10005F86C;
      v45[3] = &unk_101230710;
      v45[4] = v35;
      objc_msgSend(v20, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v36, 0, v45);

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringWithRange:", v17, v19));
    if (objc_msgSend(v37, "length"))
      objc_msgSend(v20, "registerObject:visibility:", v37, 0);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)writeContentDescription:(id)a3 toItemProvider:(id)a4 pasteboardController:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSMutableSet *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_new(NSMutableSet);
  objc_msgSend(v9, "distillPasteboardContentDescription:intoPasteboardStateTypes:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver crl_securelyArchiveRoot:](NSKeyedArchiver, "crl_securelyArchiveRoot:", v10));
  objc_msgSend(v8, "setTeamData:", v11);

}

@end
