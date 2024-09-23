@implementation TUIRootLayout

- (void)computeLayout
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  NSErrorUserInfoKey v30;
  const __CFString *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentModels"));
  v5 = objc_msgSend(v4, "count");

  if ((unint64_t)v5 >= 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    v30 = NSLocalizedDescriptionKey;
    v31 = CFSTR("More than one root boxes in template");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TUIErrorDomain"), 1015, v7));
    objc_msgSend(v6, "addError:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentModel"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layoutForModel:", v10));

  -[TUILayout containingWidth](self, "containingWidth");
  objc_msgSend(v12, "setContainingWidth:");
  -[TUILayout containingHeight](self, "containingHeight");
  objc_msgSend(v12, "setContainingHeight:");
  objc_msgSend(v12, "validateLayout");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box", 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "navBarModels"));

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layoutForModel:", v19));

        -[TUILayout containingWidth](self, "containingWidth");
        objc_msgSend(v21, "setContainingWidth:");
        objc_msgSend(v21, "setContainingHeight:", 44.0);
        objc_msgSend(v21, "validateLayout");

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  -[TUILayout containingWidth](self, "containingWidth");
  v23 = v22;
  -[TUILayout containingHeight](self, "containingHeight");
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v23, v24);

}

- (void)onChildRenderModelInvalidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navBarModels"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    objc_msgSend(v9, "invalidateAuxiliaryRenderModel");

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TUIRootLayout;
    -[TUILayout onChildRenderModelInvalidate:](&v10, "onChildRenderModelInvalidate:", v4);
  }

}

@end
