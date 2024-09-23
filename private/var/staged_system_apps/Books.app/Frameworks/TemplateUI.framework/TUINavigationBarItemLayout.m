@implementation TUINavigationBarItemLayout

- (void)computeLayout
{
  double v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v3 = COERCE_FLOAT(-[TUILayout specifiedWidth](self, "specifiedWidth"));
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "setSpecifiedWidthComputeInherited:", 1);
        objc_msgSend(v9, "setContainingWidth:", v3);
        objc_msgSend(v9, "validateLayout");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (BOOL)collectHostingPropertiesWithCollector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingIdentifiers"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingIdentifiers"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingIdentifiers"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingProperties"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v9));

        objc_msgSend(v4, "hostingCollectorAddProperties:forIdentifier:", v13, v11);
        ++v9;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingIdentifiers"));
        v15 = objc_msgSend(v14, "count");

      }
      while (v9 < (unint64_t)v15);
    }
  }

  return 0;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5;
  void *v6;
  float v7;
  void *v8;
  uint64_t v9;
  void *v10;
  TUIAXAttributes *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  TUINavigationBarItemLayout *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unsigned __int8 v42;
  void *v43;
  TUINavigationBarItemLayout *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  unsigned __int8 v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  float v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  TUIAXAttributes *v91;
  void *v92;
  id obj;
  id obja;
  uint64_t v95;
  void *v96;
  id v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v86 = objc_msgSend(v6, "width");
  v81 = v7;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  if (v9)
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "renderModelForLayout:kind:", v9, 6));
  else
    v92 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v84 = (void *)v9;
  if (objc_msgSend(v10, "axHasNonDefaultAttributess"))
  {
    v11 = [TUIAXAttributes alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v91 = -[TUIAXAttributes initWithAXAttributes:](v11, "initWithAXAttributes:", v12);

  }
  else
  {
    v91 = 0;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actionHandler"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "menuContainer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "menuModel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v19 = objc_msgSend(v18, "menuIsPrimary");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "actionObject"));
  v90 = v14;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "actionDelegate"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "menuWithIsPrimary:actionObject:actionDelegate:", v19, v20, v21));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "menuContainer"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "imageModelsToLoad"));

  v85 = v5;
  v83 = v24;
  if (objc_msgSend(v24, "count"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v24, "count")));
    objc_msgSend(v5, "contentsScale");
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    obj = v24;
    v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
    if (v97)
    {
      v95 = *(_QWORD *)v100;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v100 != v95)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "manager"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "imageResourceCache"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "urlString"));
          v33 = self;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "baseURL"));
          objc_msgSend(v28, "size");
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "imageResourceForTemplatedURL:baseURL:naturalSize:contentsScale:", v32, v34));

          self = v33;
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v35, v36);

          v27 = (char *)v27 + 1;
        }
        while (v97 != v27);
        v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
      }
      while (v97);
    }
    v88 = v26;

    v5 = v85;
  }
  else
  {
    v88 = 0;
  }
  LODWORD(v25) = (_DWORD)v86;
  v37 = v81;
  v38 = *((float *)&v86 + 1);
  v39 = *(float *)&v86;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box", 0.0, *(float *)&v86, v25, *((float *)&v86 + 1)));
  v72 = objc_msgSend(v82, "itemType");
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "identifier"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "title"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "attributedTitle"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "image"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v66 = objc_msgSend(v76, "isEnabled");
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v64 = objc_msgSend(v75, "buttonType");
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v62 = objc_msgSend(v74, "buttonRole");
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "text"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v60 = objc_msgSend(v70, "searchTextMaxLength");
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "placeholderText"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "environment"));
  v57 = TUIKeyboardAppearanceFromEnvironmentStyle((uint64_t)objc_msgSend(v67, "style"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v65, "navigationBarBackgroundOpacity");
  v41 = v40;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "observeTrigger"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v55 = objc_msgSend(v61, "observeTriggerValue");
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v42 = objc_msgSend(v59, "ignoreInsetsForOpacityTrigger");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v44 = self;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "refId"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v44, "box"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "refInstance"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v44, "box"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "hostingIdentifiers"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v44, "box"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "hostingProperties"));
  LOBYTE(v54) = v42;
  LOBYTE(v53) = v66;
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderModelNavigationItem renderModelWithItemType:identifier:imageModelIDToResource:actionHandler:title:attributedTitle:image:enabled:buttonType:buttonRole:width:minWidth:maxWidth:text:searchTextMaxLength:placeholderText:keyboardAppearance:navigationBarBackgroundOpacity:observeTrigger:observeTriggerValue:ignoreInsetsForOpacityTrigger:menu:subview:axAttributes:refId:refInstance:hostingIdentifiers:hostingProperties:](TUIRenderModelNavigationItem, "renderModelWithItemType:identifier:imageModelIDToResource:actionHandler:title:attributedTitle:image:enabled:buttonType:buttonRole:width:minWidth:maxWidth:text:searchTextMaxLength:placeholderText:keyboardAppearance:navigationBarBackgroundOpacity:observeTrigger:observeTriggerValue:ignoreInsetsForOpacityTrigger:menu:subview:axAttributes:refId:refInstance:hostingIdentifiers:hostingProperties:", v72, v98, v88, v90, obja, v69, v39, v38, v37, v41, v96, v53, v64,
                    v62,
                    v87,
                    v60,
                    v58,
                    v57,
                    v56,
                    v55,
                    v54,
                    v89,
                    v92,
                    v91,
                    v45,
                    v47,
                    v49,
                    v51));

  return v73;
}

- (NSMutableDictionary)stateNameToLayout
{
  return self->_stateNameToLayout;
}

- (void)setStateNameToLayout:(id)a3
{
  objc_storeStrong((id *)&self->_stateNameToLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateNameToLayout, 0);
}

@end
