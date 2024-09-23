@implementation BKReadAloudEventHandler

+ (BKReadAloudEventHandler)readAloudEventHandlerWithMediaClass:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  BKReadAloudEventHandler *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(BKReadAloudEventHandler);
  -[BKReadAloudEventHandler setMediaActiveClass:](v7, "setMediaActiveClass:", v6);

  -[BKReadAloudEventHandler setDelegate:](v7, "setDelegate:", v5);
  return v7;
}

- (void)setMediaActiveClass:(id)a3
{
  __CFString *v3;

  if (a3)
    v3 = (__CFString *)a3;
  else
    v3 = CFSTR("media-overlay-active");
  objc_storeStrong((id *)&self->_mediaActiveClass, v3);
}

- (void)addhighlightForElementID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKReadAloudEventHandler mediaActiveClass](self, "mediaActiveClass"));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_read_aloud.highlightElement('%@', '%@')"), v4, v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKReadAloudEventHandler delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wkWebView"));
  objc_msgSend(v7, "evaluateJavaScript:completionHandler:", v8, 0);

}

- (void)removeHighlightForElementID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKReadAloudEventHandler mediaActiveClass](self, "mediaActiveClass"));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_read_aloud.removeHighlightElement('%@', '%@')"), v4, v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKReadAloudEventHandler delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wkWebView"));
  objc_msgSend(v7, "evaluateJavaScript:completionHandler:", v8, 0);

}

- (void)installTapHandlersOnElementIDs:(id)a3 withHref:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(obj);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_read_aloud.installTapHandlerElementIDAndHREF('%@', '%@')"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11), v7));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKReadAloudEventHandler delegate](self, "delegate"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "wkWebView"));
        objc_msgSend(v14, "evaluateJavaScript:completionHandler:", v12, 0);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)removeTapHandlersOnElementIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_read_aloud.removeTapHandlerElementID('%@')"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8)));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKReadAloudEventHandler delegate](self, "delegate"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wkWebView"));
        objc_msgSend(v11, "evaluateJavaScript:completionHandler:", v9, 0);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)addMarkupForReadAloudToDocument
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKReadAloudEventHandler delegate](self, "delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wkWebView"));
  objc_msgSend(v2, "evaluateJavaScript:completionHandler:", CFSTR("__ibooks_read_aloud.addMediaOverlayClassToDocument()"), 0);

}

- (void)removeMarkupForReadAloudToDocument
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKReadAloudEventHandler delegate](self, "delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wkWebView"));
  objc_msgSend(v2, "evaluateJavaScript:completionHandler:", CFSTR("__ibooks_read_aloud.removeMediaOverlayClassFromDocument()"), 0);

}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  id v57;

  v57 = a4;
  *(_QWORD *)&v5 = objc_opt_class(NSString).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "name", v5));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("readAloudHandler")))
  {
    *(_QWORD *)&v11 = objc_opt_class(NSDictionary).n128_u64[0];
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "body", v11));
    v15 = BUDynamicCast(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("event")));
    *(_QWORD *)&v18 = objc_opt_class(NSDictionary).n128_u64[0];
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("data"), v18));
    v22 = BUDynamicCast(v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (objc_msgSend(v17, "isEqualToString:", CFSTR("media_source_load")))
    {
      *(_QWORD *)&v24 = objc_opt_class(NSString).n128_u64[0];
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("media_source"), v24));
      v28 = BUDynamicCast(v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKReadAloudEventHandler delegate](self, "delegate"));
      objc_msgSend(v30, "readAloudEventHandler:foundMediaSource:", self, v29);
      goto LABEL_10;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("click")))
    {
      *(_QWORD *)&v31 = objc_opt_class(NSString).n128_u64[0];
      v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("id"), v31));
      v35 = BUDynamicCast(v33, v34);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v35);

      *(_QWORD *)&v36 = objc_opt_class(NSString).n128_u64[0];
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("href"), v36));
      v40 = BUDynamicCast(v38, v39);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v40);

      if (!objc_msgSend(v29, "length"))
        goto LABEL_10;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKReadAloudEventHandler delegate](self, "delegate"));
      objc_msgSend(v41, "readAloudEventHandler:tappedElementID:inHref:", self, v29, v30);
    }
    else
    {
      if (!objc_msgSend(v17, "isEqualToString:", CFSTR("action")))
      {
        if (!objc_msgSend(v17, "isEqualToString:", CFSTR("audio-ended")))
          goto LABEL_11;
        *(_QWORD *)&v52 = objc_opt_class(NSString).n128_u64[0];
        v54 = v53;
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("media_source"), v52));
        v56 = BUDynamicCast(v54, v55);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v56);

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKReadAloudEventHandler delegate](self, "delegate"));
        objc_msgSend(v30, "readAloudEventHandler:audioElementEnded:", self, v29);
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
      *(_QWORD *)&v42 = objc_opt_class(NSString).n128_u64[0];
      v44 = v43;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("action"), v42));
      v46 = BUDynamicCast(v44, v45);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v46);

      *(_QWORD *)&v47 = objc_opt_class(NSString).n128_u64[0];
      v49 = v48;
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("auto_turn"), v47));
      v51 = BUDynamicCast(v49, v50);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v51);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKReadAloudEventHandler delegate](self, "delegate"));
      objc_msgSend(v41, "readAloudEventHandler:performedAction:turnStyle:", self, v29, v30);
    }

    goto LABEL_10;
  }
LABEL_12:

}

- (NSString)mediaActiveClass
{
  return self->_mediaActiveClass;
}

- (BKReadAloudEventHandlerDelegate)delegate
{
  return (BKReadAloudEventHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaActiveClass, 0);
}

@end
