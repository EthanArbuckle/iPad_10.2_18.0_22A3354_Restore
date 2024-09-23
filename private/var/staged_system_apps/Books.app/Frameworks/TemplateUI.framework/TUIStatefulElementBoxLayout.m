@implementation TUIStatefulElementBoxLayout

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  void *v3;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v4;
  _QWORD v6[5];
  void *__p;
  _BYTE *v8;
  uint64_t v9;

  __p = 0;
  v8 = 0;
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatefulElementBoxLayout stateNameToLayout](self, "stateNameToLayout"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_DB360;
  v6[3] = &unk_241390;
  v6[4] = &__p;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthCombine((float *)__p, (v8 - (_BYTE *)__p) >> 4);
  if (__p)
  {
    v8 = __p;
    operator delete(__p);
  }
  return v4;
}

- (void)computeLayout
{
  double v3;
  double v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double *v10;
  _QWORD v11[7];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  __n128 (*v15)(__n128 *, __n128 *);
  uint64_t (*v16)();
  const char *v17;
  CGSize v18;

  -[TUILayout computeWidth](self, "computeWidth");
  v4 = v3;
  v12 = 0;
  v13 = (double *)&v12;
  v15 = sub_DB5F4;
  v16 = nullsub_4;
  v14 = 0x4012000000;
  v17 = "";
  v18 = CGSizeZero;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatefulElementBoxLayout stateNameToLayout](self, "stateNameToLayout"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatefulElementBoxLayout stateNameToLayout](self, "stateNameToLayout"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_DB604;
    v11[3] = &unk_2413B8;
    *(double *)&v11[6] = v4;
    v11[4] = self;
    v11[5] = &v12;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

    v4 = v13[6];
    v8 = v13[7];
  }
  else
  {
    -[TUILayout computeHeight](self, "computeHeight");
    v8 = v9;
    v10 = v13;
    v13[6] = v4;
    v10[7] = v9;
  }
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v8);
  _Block_object_dispose(&v12, 8);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  void *v4;
  void *v5;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v6;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v7;
  objc_super v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatefulElementBoxLayout stateNameToLayout](self, "stateNameToLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("default")));

  if (v5)
  {
    v6 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v5, "computedWidth");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TUIStatefulElementBoxLayout;
    v6 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)-[$881BB7C90C7D0DFCC1492E3DC022A30F computedContentWidth](&v9, "computedContentWidth");
  }
  v7 = v6;

  return v7;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight
{
  void *v4;
  void *v5;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v6;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v7;
  objc_super v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatefulElementBoxLayout stateNameToLayout](self, "stateNameToLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("default")));

  if (v5)
  {
    v6 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v5, "computedHeight");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TUIStatefulElementBoxLayout;
    v6 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)-[$881BB7C90C7D0DFCC1492E3DC022A30F computedContentWidth](&v9, "computedContentWidth");
  }
  v7 = v6;

  return v7;
}

- (CGRect)computedErasableBoundsPrimitive
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect result;
  CGRect v25;

  v21.receiver = self;
  v21.super_class = (Class)TUIStatefulElementBoxLayout;
  -[TUILayout computedErasableBoundsPrimitive](&v21, "computedErasableBoundsPrimitive");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "focusStyle"));

  if (v12)
  {
    -[TUILayout computedBounds](self, "computedBounds");
    objc_msgSend(v12, "erasableBoundsWithBounds:");
    v25.origin.x = v13;
    v25.origin.y = v14;
    v25.size.width = v15;
    v25.size.height = v16;
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v23 = CGRectUnion(v22, v25);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
  }

  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)onChildrenUpdated
{
  NSMutableDictionary *v3;
  NSMutableDictionary *stateNameToLayout;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIStatefulElementBoxLayout;
  -[TUILayout onChildrenUpdated](&v8, "onChildrenUpdated");
  -[TUILayout invalidateIntrinsicSize](self, "invalidateIntrinsicSize");
  v3 = objc_opt_new(NSMutableDictionary);
  stateNameToLayout = self->_stateNameToLayout;
  self->_stateNameToLayout = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stateMap"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_DBA48;
  v7[3] = &unk_2413E0;
  v7[4] = self;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

  -[TUIStatefulElementBoxLayout _updateSpecifiedWidth](self, "_updateSpecifiedWidth");
}

- (BOOL)collectImpressionsForChild:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatefulElementBoxLayout stateNameToLayout](self, "stateNameToLayout"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("default")));
  v7 = v6 == v4;

  return v7;
}

- (BOOL)collectLinkEntitiesForChild:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatefulElementBoxLayout stateNameToLayout](self, "stateNameToLayout"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("default")));
  v7 = v6 == v4;

  return v7;
}

- (void)_updateSpecifiedWidth
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _BOOL8 v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatefulElementBoxLayout stateNameToLayout](self, "stateNameToLayout"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("default")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v4, "width");
  if ((v5 & 0x6000000000000) == 0x2000000000000)
  {
    objc_msgSend(v10, "specifiedWidth");
    v7 = HIWORD(v6) & 7;
    v9 = v7 == 4 || v7 == 1;
  }
  else
  {
    v9 = 0;
  }
  -[TUILayout setSpecifiedWidthComputeInherited:](self, "setSpecifiedWidthComputeInherited:", v9);

}

- (void)onSpecifiedWidthChangedForChild:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIStatefulElementBoxLayout;
  -[TUILayout onSpecifiedWidthChangedForChild:](&v5, "onSpecifiedWidthChangedForChild:", v4);
  -[TUIStatefulElementBoxLayout _updateSpecifiedWidth](self, "_updateSpecifiedWidth");

}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  TUIContainerLayerConfig *v30;
  TUIRenderModelLayer *v31;
  id v32;
  TUIRenderModelLayer *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t (**v37)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v38;
  void *v39;
  uint64_t v40;
  void *v42;
  NSMutableDictionary *v43;
  id v44;
  NSMutableDictionary *v45;
  NSMutableArray *v46;
  id v47;
  id obj;
  TUIStatefulElementBoxLayout *v49;
  void *v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  id v58;
  NSMutableDictionary *v59;
  _BYTE v60[128];

  v47 = a4;
  if (a3 < 4)
  {
    if (a3 == 3)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatefulElementBoxLayout stateNameToLayout](self, "stateNameToLayout"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("default")));

      if (v25)
      {
        v46 = objc_opt_new(NSMutableArray);
        -[TUILayout computedNaturalSize](self, "computedNaturalSize");
        memset(&v52, 0, sizeof(v52));
        CGAffineTransformMakeTranslation(&v52, v26 * 0.5, v27 * 0.5);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatefulElementBoxLayout stateNameToLayout](self, "stateNameToLayout"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("default")));
        v51 = v52;
        objc_msgSend(v29, "appendRenderModelCompatibleWithKind:context:transform:toModels:", 3, v47, &v51, v46);

        v30 = -[TUIContainerLayerConfig initWithSize:]([TUIContainerLayerConfig alloc], "initWithSize:", CGSizeZero.width, CGSizeZero.height);
        v31 = [TUIRenderModelLayer alloc];
        v32 = -[NSMutableArray copy](v46, "copy");
        v33 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:](v31, "initWithSubmodels:config:erasableInsets:", v32, v30, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

        -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v47);
        -[TUIRenderModelLayer setSize:](v33, "setSize:");
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
        -[TUIRenderModelLayer setIdentifier:](v33, "setIdentifier:", v35);

        goto LABEL_19;
      }
    }
LABEL_15:
    v33 = 0;
    goto LABEL_19;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "renderModelBlock"));

  if (!v7)
    goto LABEL_15;
  v43 = objc_opt_new(NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pointer"));
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_DC4C0;
  v57[3] = &unk_241430;
  v57[4] = self;
  v58 = v47;
  v44 = v58;
  v45 = v43;
  v59 = v45;
  objc_msgSend(v58, "evaluateWithPointer:block:", v9, v57);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "menuContainer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageModelsToLoad"));

  v42 = v12;
  if (objc_msgSend(v12, "count"))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v12, "count")));
    objc_msgSend(v44, "contentsScale");
    v49 = self;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v54;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v54 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](v49, "controller"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "manager"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageResourceCache"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "urlString"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "baseURL"));
          objc_msgSend(v16, "size");
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageResourceForTemplatedURL:baseURL:naturalSize:contentsScale:", v20, v21));

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
          objc_msgSend(v50, "setObject:forKeyedSubscript:", v22, v23);

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v13);
    }

    self = v49;
  }
  else
  {
    v50 = 0;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v37 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "renderModelBlock"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "animationGroups"));
  v40 = ((uint64_t (**)(_QWORD, TUIStatefulElementBoxLayout *, NSMutableDictionary *, void *, void *))v37)[2](v37, self, v45, v50, v39);
  v33 = (TUIRenderModelLayer *)objc_claimAutoreleasedReturnValue(v40);

  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v44);
  -[TUIRenderModelLayer setSize:](v33, "setSize:");

LABEL_19:
  return v33;
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  void *v6;
  double y;
  double x;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void **v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, void *);
  void *v33;
  TUIStatefulElementBoxLayout *v34;
  id v35;
  objc_super v36;

  y = a5.y;
  x = a5.x;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)TUIStatefulElementBoxLayout;
  v15 = -[TUILayout axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:](&v36, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", v12, v13, v14, x, y);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v16, "setIsControl:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v16, "setIsEditableControl:", objc_msgSend(v17, "isEditableControl"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "triggerHandler"));
  v20 = objc_msgSend(v19, "hasActionForTrigger:", CFSTR("context-menu"));
  if (v20)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v21 = objc_msgSend(v6, "menuIsPrimary") ^ 1;
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(v16, "setHasContextMenu:", v21);
  if (v20)

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatefulElementBoxLayout stateNameToLayout](self, "stateNameToLayout"));
  v30 = _NSConcreteStackBlock;
  v31 = 3221225472;
  v32 = sub_DC8A4;
  v33 = &unk_241408;
  v34 = self;
  v23 = v16;
  v35 = v23;
  objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", &v30);

  if (v12)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box", v30, v31, v32, v33, v34));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "triggerHandler"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
    objc_msgSend(v12, "addActionTriggerHandler:controlIdentifier:", v25, v26);

  }
  v27 = v35;
  v28 = v23;

  return v28;
}

- (BOOL)shouldDescendentsInheritRefSpec
{
  return 0;
}

- (BOOL)groupedContainingIsGrouped
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v3 = objc_msgSend(v2, "grouped");

  return v3;
}

- (UIEdgeInsets)groupedContainingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (unint64_t)groupedContainingInsetsMode
{
  return 1;
}

- (unint64_t)groupedContainingContentMode
{
  return 1;
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
