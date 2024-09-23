@implementation CRLMediaReplacingHelper

- (CRLMediaReplacingHelper)initWithEditor:(id)a3
{
  id v5;
  CRLMediaReplacingHelper *v6;
  CRLMediaReplacingHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLMediaReplacingHelper;
  v6 = -[CRLMediaReplacingHelper init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_editor, a3);

  return v7;
}

- (NSSet)boardItems
{
  return -[CRLBoardItemEditor boardItems](self->_editor, "boardItems");
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  return -[CRLBoardItemEditor editingCoordinator](self->_editor, "editingCoordinator");
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return -[CRLBoardItemEditor interactiveCanvasController](self->_editor, "interactiveCanvasController");
}

- (void)showMediaReplaceUI:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  _QWORD v10[4];
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaReplacingHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  if (objc_msgSend(v4, "hasSelectedInfosInMultipleContainers"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248648);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E12BAC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248668);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaReplacingHelper showMediaReplaceUI:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaReplacingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 56, 0, "Cannot show media replace UI with cross-container selection!");

  }
  objc_msgSend(v4, "endEditing");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10025C91C;
  v12[3] = &unk_10122D3D8;
  v12[4] = self;
  v8 = v4;
  v13 = v8;
  v9 = objc_retainBlock(v12);
  if (+[CRLiOSKeyboardMonitor keyboardIsVisibleAndDocked](CRLiOSKeyboardMonitor, "keyboardIsVisibleAndDocked"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10025CB84;
    v10[3] = &unk_10122F678;
    v11 = v9;
    +[CRLiOSKeyboardMonitor afterKeyboardAnimationPerformBlock:](CRLiOSKeyboardMonitor, "afterKeyboardAnimationPerformBlock:", v10);

  }
  else
  {
    ((void (*)(_QWORD *))v9[2])(v9);
  }

}

- (id)p_commandsToSwapConnectionsFromInfo:(id)a3 infoMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  objc_class *v12;
  objc_class *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v42;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v43;
  _QWORD *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v53;
  id v54;
  id v55;
  id obj;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _BYTE v68[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaReplacingHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "repForInfo:", v6));
  *(_QWORD *)&v11 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v10).n128_u64[0];
  v13 = v12;
  v58 = v7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6, v11));
  v15 = sub_1002223BC(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);

  v55 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v57 = (void *)v16;
  if (!v16
    || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layout")),
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "connectedLayouts")),
        v19 = objc_msgSend(v18, "count"),
        v18,
        v17,
        !v19))
  {
    v22 = 0;
    goto LABEL_23;
  }
  v53 = v8;
  v54 = v6;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layout"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "connectedLayouts"));

  obj = v21;
  v60 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  v22 = 0;
  if (!v60)
    goto LABEL_21;
  v59 = *(_QWORD *)v63;
  v61 = v9;
  do
  {
    for (i = 0; i != v60; i = (char *)i + 1)
    {
      if (*(_QWORD *)v63 != v59)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "connectionLineInfo"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaReplacingHelper editingCoordinator](self, "editingCoordinator"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mainBoard"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "getConnectedFromWithBoardItemOwner:", v27));

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaReplacingHelper editingCoordinator](self, "editingCoordinator"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "mainBoard"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "getConnectedToWithBoardItemOwner:", v30));

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "connectionLinePathSource"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));

      if (v28 == v33)
      {
        v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", v31));

        if (!v35)
          v35 = v31;
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "layout"));
        -[CRLMediaReplacingHelper p_getNewMagnetNormalizedPositionAfterReplacingMediaWithConnectionLine:withOldLayout:withNewInfo:forLineEnd:](self, "p_getNewMagnetNormalizedPositionAfterReplacingMediaWithConnectionLine:withOldLayout:withNewInfo:forLineEnd:", v24, v45, v57, 10);
        v47 = v46;
        v49 = v48;
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tailMagnet"));
        objc_msgSend(v50, "setMagnetNormalizedPosition:", v47, v49);

        v42 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v25, v57, 0, v32);
        v43 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v25, v35, 1, v32);
        v67[0] = v42;
        v67[1] = v43;
        v44 = v67;
      }
      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));

        if (v31 != v34)
          goto LABEL_19;
        v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", v28));

        if (!v35)
          v35 = v28;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "layout"));
        -[CRLMediaReplacingHelper p_getNewMagnetNormalizedPositionAfterReplacingMediaWithConnectionLine:withOldLayout:withNewInfo:forLineEnd:](self, "p_getNewMagnetNormalizedPositionAfterReplacingMediaWithConnectionLine:withOldLayout:withNewInfo:forLineEnd:", v24, v36, v57, 11);
        v38 = v37;
        v40 = v39;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "headMagnet"));
        objc_msgSend(v41, "setMagnetNormalizedPosition:", v38, v40);

        v42 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v25, v35, 0, v32);
        v43 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v25, v57, 1, v32);
        v66[0] = v42;
        v66[1] = v43;
        v44 = v66;
      }
      v22 = v35;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 2));

      if (v51)
      {
        objc_msgSend(v55, "addObjectsFromArray:", v51);

      }
      v9 = v61;
LABEL_19:

    }
    v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  }
  while (v60);
LABEL_21:

  v8 = v53;
  v6 = v54;
LABEL_23:

  return v55;
}

- (CGPoint)p_getNewMagnetNormalizedPositionAfterReplacingMediaWithConnectionLine:(id)a3 withOldLayout:(id)a4 withNewInfo:(id)a5 forLineEnd:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  uint64_t v36;
  uint64_t v37;
  CGPoint result;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a6 == 11)
    v12 = objc_msgSend(v9, "headMagnetType");
  else
    v12 = objc_msgSend(v9, "tailMagnetType");
  v13 = v12;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3010000000;
  v36 = 0;
  v37 = 0;
  v35[3] = &unk_1010E66AB;
  if (a6 == 11)
    objc_msgSend(v9, "headMagnetCanvasPosition");
  else
    objc_msgSend(v9, "tailMagnetCanvasPosition");
  v36 = v14;
  v37 = v15;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x3010000000;
  v33 = 0;
  v34 = 0;
  v32 = &unk_1010E66AB;
  if (a6 == 11)
    objc_msgSend(v9, "headMagnetNormalizedPosition");
  else
    objc_msgSend(v9, "tailMagnetNormalizedPosition");
  v33 = v16;
  v34 = v17;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10025D224;
  v23[3] = &unk_101244540;
  v27 = v13;
  v25 = v35;
  v18 = v9;
  v28 = a6;
  v24 = v18;
  v26 = &v29;
  objc_msgSend(v11, "withTemporaryLayoutPerform:", v23);
  v19 = v30[4];
  v20 = v30[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);

  v21 = v19;
  v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (void)replaceCanvasElementInfo:(id)a3 withFilesAtURLs:(id)a4 allowedTypes:(id)a5 actionString:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(_QWORD);

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(_QWORD))a7;
  if (objc_msgSend(v13, "count") != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012486C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E12CAC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012486E8);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaReplacingHelper replaceCanvasElementInfo:withFilesAtURLs:allowedTypes:actionString:completion:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaReplacingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 179, 0, "The URL array must only contain one object.");

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  if (v20)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10025D5D4;
    v21[3] = &unk_101248710;
    v22 = v16;
    -[CRLMediaReplacingHelper p_replaceCanvasElementInfo:withFileAtURL:interactively:allowedTypes:actionString:queue:completion:](self, "p_replaceCanvasElementInfo:withFileAtURL:interactively:allowedTypes:actionString:queue:completion:", v12, v20, 1, v14, v15, &_dispatch_main_q, v21);

  }
  else if (v16)
  {
    v16[2](v16);
  }

}

- (void)replaceSelectedMediaWithData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  -[CRLMediaReplacingHelper replaceSelectedMediaWithData:actionString:completion:](self, "replaceSelectedMediaWithData:actionString:completion:", v5, 0, 0, v6);
}

- (void)replaceSelectedMediaWithData:(id)a3 actionString:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CRLBoardItemImporter *v18;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v19;
  void *v20;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v21;
  CRLBoardItemImporter *v22;
  CRLBoardItemImporter *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248730);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E12D2C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248750);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaReplacingHelper replaceSelectedMediaWithData:actionString:completion:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaReplacingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 197, 0, "The data array must only contain one object.");

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaReplacingHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "editingCoordinator"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "boardItemFactory"));

    v18 = [CRLBoardItemImporter alloc];
    v19 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetOwner"));
    v21 = -[CRLPreinsertionAssetWrapper initWithAlreadyInsertedAsset:owner:](v19, "initWithAlreadyInsertedAsset:owner:", v14, v20);
    v22 = -[CRLBoardItemImporter initWithData:boardItemFactory:](v18, "initWithData:boardItemFactory:", v21, v17);

    if (v22)
    {
      -[CRLBoardItemImporter setDelegate:](v22, "setDelegate:", self);
      v23 = v22;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10025DA88;
      v25[3] = &unk_101248710;
      v26 = v10;
      if (self)
        -[CRLMediaReplacingHelper p_replaceCanvasElementInfo:withInfoFromInfoImporter:interactively:allowedTypes:actionString:queue:completion:](self, "p_replaceCanvasElementInfo:withInfoFromInfoImporter:interactively:allowedTypes:actionString:queue:completion:", 0, v23, 1, 0, v9, &_dispatch_main_q, v25);
      else

      v24 = v26;
    }
    else
    {
      if (!v10)
      {
LABEL_22:

        goto LABEL_23;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, 0));
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v24);
    }

    goto LABEL_22;
  }
  if (v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, 0));
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v15);
LABEL_23:

  }
}

- (void)p_replaceCanvasElementInfo:(id)a3 withFileAtURL:(id)a4 interactively:(BOOL)a5 allowedTypes:(id)a6 actionString:(id)a7 queue:(id)a8 completion:(id)a9
{
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  CRLBoardItemImporter *v28;
  CRLBoardItemImporter *v29;
  void *v30;
  void *v31;
  CRLBoardItemImporter *v32;
  CRLBoardItemImporter *v33;
  _BOOL4 v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v12 = a5;
  v35 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v34 = v12;
  if (v12 && v18 != &_dispatch_main_q)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248770);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E12DAC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248790);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaReplacingHelper p_replaceCanvasElementInfo:withFileAtURL:interactively:allowedTypes:actionString:queue:completion:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaReplacingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 227, 0, "Can't replace media interactively without running completion blocks on the main queue.");

  }
  if (v16)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v23 = v16;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v26)
            objc_enumerationMutation(v23);
          if ((objc_msgSend(v15, "crl_conformsToUTI:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i)) & 1) != 0)
          {

            goto LABEL_23;
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v25)
          continue;
        break;
      }
    }

    v28 = 0;
  }
  else
  {
LABEL_23:
    v29 = [CRLBoardItemImporter alloc];
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaReplacingHelper editingCoordinator](self, "editingCoordinator"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "boardItemFactory"));
    v28 = -[CRLBoardItemImporter initWithURL:boardItemFactory:](v29, "initWithURL:boardItemFactory:", v15, v31);

    -[CRLBoardItemImporter setDelegate:](v28, "setDelegate:", self);
  }
  v32 = v28;
  v33 = v32;
  if (self)
    -[CRLMediaReplacingHelper p_replaceCanvasElementInfo:withInfoFromInfoImporter:interactively:allowedTypes:actionString:queue:completion:](self, "p_replaceCanvasElementInfo:withInfoFromInfoImporter:interactively:allowedTypes:actionString:queue:completion:", v35, v32, v34, v16, v17, v18, v19);
  else

}

- (void)p_replaceCanvasElementInfo:(id)a3 withInfoFromInfoImporter:(id)a4 interactively:(BOOL)a5 allowedTypes:(id)a6 actionString:(id)a7 queue:(id)a8 completion:(id)a9
{
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  _BOOL4 v43;
  id v44;
  dispatch_queue_t queue;
  _QWORD block[4];
  id v47;
  id v48;
  id v49;
  BOOL v50;
  _QWORD v51[4];
  NSObject *v52;
  id v53;
  id v54;
  CRLMediaReplacingHelper *v55;
  id v56;
  id v57;
  __CFString *v58;
  id v59;
  _QWORD *v60;
  uint64_t *v61;
  _QWORD *v62;
  _QWORD *v63;
  BOOL v64;
  _QWORD v65[4];
  id v66;
  NSObject *v67;
  id v68;
  id v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _QWORD v80[3];
  char v81;
  _QWORD v82[3];
  char v83;
  _QWORD v84[4];
  int v85;
  _QWORD v86[3];
  _QWORD v87[3];

  v43 = a5;
  v14 = a3;
  v42 = a6;
  v44 = a7;
  queue = (dispatch_queue_t)a8;
  v15 = a9;
  objc_opt_class(_TtC8Freeform12CRLBoardItem, v16);
  if ((objc_opt_isKindOfClass(v14, v17) & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaReplacingHelper boardItems](self, "boardItems"));
    v19 = objc_msgSend(v18, "containsObject:", v14);

    if ((v19 & 1) == 0)
    {
      v20 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012487B0);
      v21 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E12EE4((uint64_t)v14, v20, v21);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012487D0);
      v22 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E12E2C(v22, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaReplacingHelper p_replaceCanvasElementInfo:withInfoFromInfoImporter:interactively:allowedTypes:actionString:queue:completion:]"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaReplacingHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 254, 0, "Invalid single info to replace: %@", v14);

    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaReplacingHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v26 = v25;
  if (a4)
  {
    v84[0] = 0;
    v84[1] = v84;
    v84[2] = 0x2810000000;
    v84[3] = &unk_1010E66AB;
    v85 = 0;
    v82[0] = 0;
    v82[1] = v82;
    v82[2] = 0x2020000000;
    v83 = 0;
    v80[0] = 0;
    v80[1] = v80;
    v80[2] = 0x2020000000;
    v81 = 0;
    v74 = 0;
    v75 = &v74;
    v76 = 0x3032000000;
    v77 = sub_10025E5B8;
    v78 = sub_10025E5C8;
    v79 = 0;
    if (v43)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layerHost"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Replacing Media…"), 0, 0));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "progress"));
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_10025E5D0;
      v65[3] = &unk_101248840;
      v70 = v80;
      v66 = a4;
      v71 = v84;
      v69 = v15;
      v72 = v82;
      v67 = queue;
      v73 = &v74;
      v68 = v26;
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "beginModalOperationWithLocalizedMessage:progress:cancelHandler:", v29, v30, v65));
      v32 = (void *)v75[5];
      v75[5] = v31;

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "editingCoordinator"));
    objc_msgSend(v33, "suspendCollaborationWithReason:", CFSTR("Importing media for replacement"));

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10025E7F4;
    v51[3] = &unk_1012489D0;
    v52 = queue;
    v60 = v84;
    v61 = &v74;
    v62 = v82;
    v53 = v26;
    v54 = a4;
    v55 = self;
    v64 = v43;
    v59 = v15;
    v63 = v80;
    v56 = v14;
    v57 = v44;
    v58 = CFSTR("Importing media for replacement");
    objc_msgSend(v54, "importBoardItemWithCompletionHandler:", v51);

    _Block_object_dispose(&v74, 8);
    _Block_object_dispose(v80, 8);
    _Block_object_dispose(v82, 8);
    _Block_object_dispose(v84, 8);
  }
  else if (v15)
  {
    v34 = objc_alloc((Class)NSError);
    v86[0] = NSLocalizedDescriptionKey;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Couldn’t Add Media File"), 0, 0));
    v87[0] = v36;
    v86[1] = NSLocalizedRecoverySuggestionErrorKey;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Your media file wasn’t added because it’s an unsupported format."), 0, 0));
    v87[1] = v38;
    v86[2] = CFSTR("CRLBoardItemImporterErrorMediaTypeKey");
    v87[2] = &off_1012CC5B0;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 3));
    v40 = objc_msgSend(v34, "initWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainInfoImporter"), 103, v39);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10025F8E4;
    block[3] = &unk_101248A18;
    v50 = v43;
    v47 = v26;
    v48 = v40;
    v49 = v15;
    v41 = v40;
    dispatch_async(queue, block);

  }
}

- (void)boardItemImporter:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaReplacingHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layerHost"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10025FAA4;
  v16[3] = &unk_101248A40;
  v17 = v10;
  v18 = v11;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v13, "presentMediaCompatibilityAlertWithReasons:forMediaType:forSingleMediaObject:completionHandler:", a4, a5, 1, v16);

}

- (CRLBoardItemEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
  objc_storeStrong((id *)&self->_editor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editor, 0);
}

@end
