@implementation TUIAXElement

- (TUIAXElement)initWithEvaluationContext:(id)a3 accessibilityContainer:(id)a4
{
  id v7;
  TUIAXElement *v8;
  TUIAXElement *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIAXElement;
  v8 = -[TUIAXElement initWithAccessibilityContainer:](&v11, "initWithAccessibilityContainer:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_context, a3);

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel identifier](self->_axModel, "identifier"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXEvaluationContext identifierToAXElementMap](self->_context, "identifierToAXElementMap"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel identifier](self->_axModel, "identifier"));
    objc_msgSend(v4, "removeObjectForKey:", v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)TUIAXElement;
  -[TUIAXElement dealloc](&v6, "dealloc");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  unsigned int v7;
  __CFString *v8;
  const __CFString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  const __CFString *v22;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  id v34;
  __CFString *v35;
  void *v36;
  void *v37;
  CGRect v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement _accessibilityTraitsAsHumanReadableStrings:](self, "_accessibilityTraitsAsHumanReadableStrings:", -[TUIAXElement accessibilityTraits](self, "accessibilityTraits")));
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v32 = objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v7 = -[TUIAXElement isAccessibilityElement](self, "isAccessibilityElement");
  v8 = &stru_243BF0;
  v9 = CFSTR(" accessible=YES;");
  if (!v7)
    v9 = &stru_243BF0;
  v31 = v9;
  -[TUIAXElement accessibilityFrame](self, "accessibilityFrame");
  v10 = NSStringFromCGRect(v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v36 = v3;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" frame=%@;"), v11));
  v34 = objc_msgSend(v3, "count");
  if (v34)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" traits=%@;"),
                           v30));
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement accessibilityLabel](self, "accessibilityLabel"));
  if (v33)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement accessibilityLabel](self, "accessibilityLabel"));
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" label=%@;"),
                            v29));
  }
  else
  {
    v35 = &stru_243BF0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement accessibilityValue](self, "accessibilityValue"));
  if (v12)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement accessibilityValue](self, "accessibilityValue"));
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" value=%@;"),
                                  v28));
  }
  else
  {
    v13 = &stru_243BF0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement accessibilityHint](self, "accessibilityHint"));
  if (v14)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement accessibilityHint](self, "accessibilityHint"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" hint=%@;"),
                            v27));
  }
  else
  {
    v15 = &stru_243BF0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  if (objc_msgSend(v16, "shouldScrollVertically"))
  {
    v17 = (__CFString *)v13;
    v24 = v13;
    v18 = (void *)v32;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; (%@) %@%@%@%@%@%@%@>"),
                      v6,
                      self,
                      v32,
                      v31,
                      v37,
                      v8,
                      v35,
                      v24,
                      v15,
                      CFSTR(" scroll=v;")));
  }
  else
  {
    v26 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
    v21 = objc_msgSend(v20, "shouldScrollHorizontally");
    v22 = CFSTR(" scroll=h;");
    if (!v21)
      v22 = &stru_243BF0;
    v17 = (__CFString *)v13;
    v25 = v13;
    v18 = (void *)v32;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; (%@) %@%@%@%@%@%@%@>"),
                      v6,
                      self,
                      v32,
                      v31,
                      v37,
                      v8,
                      v35,
                      v25,
                      v15,
                      v22));

    v11 = v26;
  }

  if (v14)
  {

  }
  if (v12)
  {

  }
  if (v33)
  {

  }
  if (v34)
  {

  }
  return v19;
}

- (NSString)inferredLabel
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement children](self, "children"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray tui_stackWithObjectsFromArray:](NSMutableArray, "tui_stackWithObjectsFromArray:", v4));

  while (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tui_pop"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "axModel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "axAttributes"));

    if (objc_msgSend(v8, "isAXElement")
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "axLabel")),
          v10 = objc_msgSend(v9, "length"),
          v9,
          v10))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "axLabel"));
      -[NSMutableArray addObject:](v3, "addObject:", v11);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "children"));
      v13 = objc_msgSend(v12, "count");

      if (!v13)
        goto LABEL_9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "children"));
      objc_msgSend(v5, "tui_pushObjectsFromArray:", v11);
    }

LABEL_9:
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", CFSTR(", ")));

  return (NSString *)v14;
}

- (void)updateWithAXModel:(id)a3
{
  id v5;
  TUIAXModel *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
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
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  TUIAXElement *v41;
  TUIAXElement *v42;
  void *v43;
  void *v44;
  unsigned __int8 v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *k;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  unsigned int v55;
  TUIAXCustomActionInstantiation *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  TUIAXModel *v65;
  NSMutableArray *v66;
  NSMutableArray *v67;
  NSMutableArray *v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];

  v5 = a3;
  v6 = self->_axModel;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v65 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel identifier](v6, "identifier"));
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel identifier](v6, "identifier"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXEvaluationContext identifierToAXElementMap](self->_context, "identifierToAXElementMap"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel identifier](v6, "identifier"));
      objc_msgSend(v11, "removeObjectForKey:", v12);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXEvaluationContext identifierToAXElementMap](self->_context, "identifierToAXElementMap"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      objc_msgSend(v14, "setObject:forKey:", self, v15);

    }
  }
  objc_storeStrong((id *)&self->_axModel, a3);
  v68 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v5, "isControl")
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](self, "context")),
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "renderModelSection")),
        v17,
        v16,
        v17))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement _currentStateForControl](self, "_currentStateForControl"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "children"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    if (v20)
    {
      v21 = v20;
      v70 = 0;
      v22 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v80 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stateName"));
          v26 = objc_msgSend(v18, "isEqualToString:", v25);

          if (v26)
          {
            v27 = v24;

            v70 = v27;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
      }
      while (v21);
    }
    else
    {
      v70 = 0;
    }

  }
  else
  {
    v70 = 0;
  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "children"));
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  v69 = v5;
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(_QWORD *)v76 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v33, "hasAccessibleDescendants"))
        {
          if ((objc_msgSend(v33, "hidden") & 1) == 0)
          {
            if (!objc_msgSend(v5, "isControl")
              || (v34 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](self, "context")),
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "renderModelSection")),
                  v35,
                  v34,
                  !v35)
              || v33 == v70
              || !v70
              && (v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stateName")),
                  v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("default")),
                  v36,
                  v37))
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identifier"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](self, "context"));
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "identifierToAXElementMap"));
              v41 = (TUIAXElement *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", v38));

              if (!v41)
              {
                v42 = [TUIAXElement alloc];
                v43 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](self, "context"));
                v41 = -[TUIAXElement initWithEvaluationContext:accessibilityContainer:](v42, "initWithEvaluationContext:accessibilityContainer:", v43, self);

              }
              if (v41 != self)
              {
                -[TUIAXElement updateWithAXModel:](v41, "updateWithAXModel:", v33);
                -[TUIAXElement setAccessibilityContainer:](v41, "setAccessibilityContainer:", self);
                -[NSMutableArray addObject:](v68, "addObject:", v41);
              }

              v5 = v69;
            }
          }
        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    }
    while (v30);
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resolvedCustomActions"));
  if (objc_msgSend(v44, "count"))
  {

  }
  else
  {
    v45 = objc_msgSend(v5, "hasContextMenu");

    if ((v45 & 1) == 0)
    {
      -[TUIAXElement setAccessibilityCustomActions:](self, "setAccessibilityCustomActions:", 0);
      -[TUIAXElement setRetainedCustomActionTargets:](self, "setRetainedCustomActionTargets:", 0);
      goto LABEL_60;
    }
  }
  v67 = objc_opt_new(NSMutableArray);
  v66 = objc_opt_new(NSMutableArray);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resolvedCustomActions"));
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v72;
    do
    {
      for (k = 0; k != v48; k = (char *)k + 1)
      {
        if (*(_QWORD *)v72 != v49)
          objc_enumerationMutation(v46);
        v51 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)k);
        if (objc_msgSend(v51, "isDefault"))
        {
          -[TUIAXElement setDefaultAction:](self, "setDefaultAction:", v51);
        }
        else
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "trigger"));
          v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("accessibilityIncrement"));

          if (v53)
          {
            -[TUIAXElement setIncrementAction:](self, "setIncrementAction:", v51);
          }
          else
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "trigger"));
            v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("accessibilityDecrement"));

            if (v55)
            {
              -[TUIAXElement setDecrementAction:](self, "setDecrementAction:", v51);
            }
            else
            {
              v56 = -[TUIAXCustomActionInstantiation initWithCustomAction:arguments:axElement:]([TUIAXCustomActionInstantiation alloc], "initWithCustomAction:arguments:axElement:", v51, 0, self);
              v57 = objc_alloc((Class)UIAccessibilityCustomAction);
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "label"));
              v59 = objc_msgSend(v57, "initWithName:target:selector:", v58, v56, "invoke");

              -[NSMutableArray addObject:](v67, "addObject:", v59);
              -[NSMutableArray addObject:](v66, "addObject:", v56);

            }
          }
        }
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    }
    while (v48);
  }

  v5 = v69;
  if (objc_msgSend(v69, "hasContextMenu"))
  {
    v60 = TUIBundle();
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("Show menu"), &stru_243BF0, CFSTR("TemplateUILocalizable")));

    v63 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomAction), "initWithName:target:selector:", v62, self, "_presentContextMenu");
    -[NSMutableArray addObject:](v67, "addObject:", v63);

  }
  v64 = -[NSMutableArray copy](v67, "copy");
  -[TUIAXElement setAccessibilityCustomActions:](self, "setAccessibilityCustomActions:", v64);

  -[TUIAXElement setRetainedCustomActionTargets:](self, "setRetainedCustomActionTargets:", v66);
LABEL_60:
  -[TUIAXElement setChildren:](self, "setChildren:", v68);

}

- (id)controlViewForOverrideIdentifier:(id)a3
{
  return -[TUIAXElement _viewForOverrideIdentifier:outParentRenderModelSection:outParentView:](self, "_viewForOverrideIdentifier:outParentRenderModelSection:outParentView:", a3, 0, 0);
}

- (id)_viewForOverrideIdentifier:(id)a3 outParentRenderModelSection:(id *)a4 outParentView:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
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
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  id *v50;
  id v51;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scrollAncestorIdentifier"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](self, "context"));
  v15 = v14;
  v50 = a4;
  if (!v13)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "renderModelSection"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifierToModelMap"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", v10));

    if (v24)
    {
      v29 = objc_msgSend(v24, "itemIndex");
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](self, "context"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v29, objc_msgSend(v30, "sectionIndex")));

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](self, "context"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "screenOffsetProvider"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "feedViewForAX"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "viewAtIndexPath:", v31));

      v22 = 0;
      if (!a5)
        goto LABEL_13;
    }
    else
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](self, "context"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "screenOffsetProvider"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "feedViewForAX"));

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "descendentViewWithIdentifier:", v10));
      v22 = 0;
      v24 = 0;
      if (!a5)
        goto LABEL_13;
    }
LABEL_12:
    *a5 = objc_retainAutorelease(v22);
    goto LABEL_13;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifierToAXElementMap"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v13));

  v18 = objc_opt_class(TUIFeedView);
  v51 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_viewForOverrideIdentifier:outParentRenderModelSection:outParentView:", 0, &v51, 0));
  v20 = v51;
  v21 = TUIDynamicCast(v18, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifierToModelMap"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v10));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v24, "itemIndex"), 0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "viewAtIndexPath:", v25));

  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "descendentViewWithIdentifier:", v10));
  }

  if (a5)
    goto LABEL_12;
LABEL_13:
  v35 = objc_opt_class(TUIEmbeddedCollectionView);
  if ((objc_opt_isKindOfClass(v26, v35) & 1) != 0)
  {
    v36 = objc_opt_class(TUIEmbeddedCollectionView);
    v37 = TUIDynamicCast(v36, v26);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "scrollView"));

    v26 = (void *)v39;
  }
  if (v26)
  {
    v40 = objc_opt_class(TUIFeedView);
    v41 = TUIDynamicCast(v40, v26);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "renderModel"));

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "sections"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndexedSubscript:", 0));

    if (v50)
      *v50 = objc_retainAutorelease(v45);

  }
  return v26;
}

- (id)_scrollAncestor
{
  id v2;
  id v4;

  v4 = 0;
  v2 = -[TUIAXElement _viewForOverrideIdentifier:outParentRenderModelSection:outParentView:](self, "_viewForOverrideIdentifier:outParentRenderModelSection:outParentView:", 0, 0, &v4);
  return v4;
}

- (id)_currentStateForControl
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;

  v3 = objc_opt_class(TUIControlView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement controlViewForOverrideIdentifier:](self, "controlViewForOverrideIdentifier:", 0));
  v5 = TUIDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentState"));
  else
    v7 = CFSTR("default");
  v8 = v7;

  return v8;
}

- (BOOL)_shouldInferAccessibilityLabel
{
  uint64_t v2;
  void *v3;
  unsigned int v4;

  v2 = objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v2, "axAttributes"));

  LODWORD(v2) = objc_msgSend(v3, "isAXElement");
  v4 = objc_msgSend(v3, "accessibilityTraits");
  LODWORD(v2) = (v2 | (v4 >> 2)) & (objc_msgSend(v3, "axTouchContainer") ^ 1);

  return v2;
}

- (BOOL)_presentContextMenu
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = objc_opt_class(TUIInteractiveBaseView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement controlViewForOverrideIdentifier:](self, "controlViewForOverrideIdentifier:", v5));
  v7 = TUIDynamicCast(v3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  LOBYTE(v6) = objc_msgSend(v8, "presentContextMenuForAccessibility");
  return (char)v6;
}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "axAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "axIdentifier"));

  if (!v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)TUIAXElement;
    v6 = -[TUIAXElement accessibilityIdentifier](&v8, "accessibilityIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "axAttributes"));
  v4 = objc_msgSend(v3, "isAXElement");

  return v4;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v5 = objc_msgSend(v4, "shouldVendControlView");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement controlViewForOverrideIdentifier:](self, "controlViewForOverrideIdentifier:", v7));

    if (v8)
    {
      v11 = v8;
      v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

      objc_msgSend(v8, "setAccessibilityContainer:", self);
      v3 = (void *)v9;
    }

  }
  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "axAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "axLabel"));

  if (!objc_msgSend(v5, "length")
    && -[TUIAXElement _shouldInferAccessibilityLabel](self, "_shouldInferAccessibilityLabel"))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[TUIAXElement inferredLabel](self, "inferredLabel"));

    v5 = (void *)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  if (objc_msgSend(v7, "isControl"))
  {
    if (objc_msgSend(v5, "length"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
      v9 = objc_msgSend(v8, "isEditableControl");

      if (!v9)
        return v5;
    }
    else
    {

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement controlViewForOverrideIdentifier:](self, "controlViewForOverrideIdentifier:", 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityLabel"));
    if (objc_msgSend(v10, "length"))
    {
      v11 = v10;

      v5 = v11;
    }

  }
  return v5;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "axAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "axValue"));

  return v4;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "axAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "axHint"));

  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  UIAccessibilityTraits v7;
  UIAccessibilityTraits v8;
  UIAccessibilityTraits v9;
  unsigned int v10;
  UIAccessibilityTraits v11;
  UIAccessibilityTraits v12;
  UIAccessibilityTraits v13;
  unsigned int v14;
  UIAccessibilityTraits v15;
  UIAccessibilityTraits v16;
  unsigned int v17;
  UIAccessibilityTraits v18;
  UIAccessibilityTraits v19;
  unsigned int v20;
  UIAccessibilityTraits v21;
  unint64_t v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)TUIAXElement;
  v3 = -[TUIAXElement accessibilityTraits](&v24, "accessibilityTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "axAttributes"));
  v6 = objc_msgSend(v5, "axButton");
  v7 = UIAccessibilityTraitButton;
  if (!v6)
    v7 = 0;
  v8 = v7 | v3;
  if (objc_msgSend(v5, "axImage"))
    v9 = UIAccessibilityTraitImage;
  else
    v9 = 0;
  v10 = objc_msgSend(v5, "axHeading");
  v11 = UIAccessibilityTraitHeader;
  if (!v10)
    v11 = 0;
  v12 = v8 | v9 | v11;
  if ((objc_msgSend(v4, "shouldScrollVertically") & 1) != 0
    || objc_msgSend(v4, "shouldScrollHorizontally"))
  {
    v12 |= UIAccessibilityTraitScrollable;
  }
  if (objc_msgSend(v5, "axDisabled"))
    v13 = UIAccessibilityTraitNotEnabled;
  else
    v13 = 0;
  v14 = objc_msgSend(v5, "axAdjustable");
  v15 = UIAccessibilityTraitAdjustable;
  if (!v14)
    v15 = 0;
  v16 = v12 | v15;
  v17 = objc_msgSend(v5, "axToggle");
  v18 = UIAccessibilityTraitToggleButton;
  if (!v17)
    v18 = 0;
  v19 = v13 | v18;
  v20 = objc_msgSend(v5, "axStaticText");
  v21 = UIAccessibilityTraitStaticText;
  if (!v20)
    v21 = 0;
  v22 = v19 | v21 | v16;

  return v22;
}

- (BOOL)canBecomeFocused
{
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning()
    && -[TUIAXElement _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    return -[TUIAXElement isAccessibilityElement](self, "isAccessibilityElement");
  }
  v4.receiver = self;
  v4.super_class = (Class)TUIAXElement;
  return -[TUIAXElement canBecomeFocused](&v4, "canBecomeFocused");
}

- (id)accessibilityContainer
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TUIAXElement *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUIAXElement;
  v3 = -[TUIAXElement accessibilityContainer](&v11, "accessibilityContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (_AXSFullKeyboardAccessEnabled() && UIAccessibilityIsVoiceOverRunning())
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](self, "context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "screenOffsetProvider"));
    v7 = v6;
    if (v6)
    {
      v8 = (TUIAXElement *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelAXElement"));
      if (v8 == self)
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(-[TUIAXElement _scrollAncestor](self, "_scrollAncestor"));
        if (v9 || (v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedViewForAX"))) != 0)
        {

          goto LABEL_11;
        }
      }

    }
    v9 = v4;
LABEL_11:

    goto LABEL_12;
  }
  v9 = v4;
LABEL_12:

  return v9;
}

- (int64_t)accessibilityContainerType
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "axAttributes"));
  v7.receiver = self;
  v7.super_class = (Class)TUIAXElement;
  v5 = -[TUIAXElement accessibilityContainerType](&v7, "accessibilityContainerType");
  if (objc_msgSend(v4, "axTouchContainer"))
    v5 = &dword_4;

  return (int64_t)v5;
}

- (CGRect)accessibilityFrame
{
  CGFloat y;
  CGFloat x;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  TUIAXElement *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat width;
  CGFloat height;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  unsigned int v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  double v41;
  CGFloat v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  TUIAXElement *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  void *v68;
  double v69;
  CGFloat v70;
  void *v71;
  double v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  void *v86;
  char *v87;
  double v88;
  double v90;
  void *v91;
  id v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  CGFloat v99;
  double v100;
  double MidY;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  CGFloat rect;
  double v117;
  double v118;
  CGFloat v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  objc_msgSend(v5, "accessibilityFrameRelativeToScrollAncestor");
  v7 = v6;
  v9 = v8;

  v10 = self;
  v11 = v10;
  do
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "axModel"));
    objc_msgSend(v12, "accessibilityFrameRelativeToScrollAncestor");
    v14 = v13;
    v16 = v15;

    v120.origin.x = x;
    v120.origin.y = y;
    v120.size.width = v7;
    v120.size.height = v9;
    v121 = CGRectOffset(v120, v14, v16);
    v17 = v121.origin.x;
    v18 = v121.origin.y;
    width = v121.size.width;
    height = v121.size.height;
    v21 = objc_opt_class(UIScrollView);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_scrollAncestor"));
    v23 = TUIDynamicCast(v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    objc_msgSend(v24, "contentOffset");
    v26 = -v25;
    objc_msgSend(v24, "contentOffset");
    v28 = -v27;
    v122.origin.x = v17;
    v122.origin.y = v18;
    v122.size.width = width;
    v122.size.height = height;
    v123 = CGRectOffset(v122, v26, v28);
    x = v123.origin.x;
    y = v123.origin.y;
    v7 = v123.size.width;
    v9 = v123.size.height;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "axModel"));
    v30 = objc_msgSend(v29, "flipsHorizontal");

    if (v30)
    {
      objc_msgSend(v24, "contentSize");
      v32 = v31;
      objc_msgSend(v24, "bounds");
      v34 = v32 - v33;
      v124.origin.x = x;
      v124.origin.y = y;
      v124.size.width = v7;
      v124.size.height = v9;
      v125 = CGRectOffset(v124, v34, 0.0);
      x = v125.origin.x;
      y = v125.origin.y;
      v7 = v125.size.width;
      v9 = v125.size.height;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "axModel"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "scrollAncestorIdentifier"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](v10, "context"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifierToAXElementMap"));
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", v36));

    v11 = (void *)v39;
  }
  while (v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](v10, "context"));
  objc_msgSend(v40, "sectionOffset");
  v42 = v41;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](v10, "context"));
  objc_msgSend(v43, "sectionOffset");
  v45 = v44;
  v126.origin.x = x;
  v126.origin.y = y;
  v126.size.width = v7;
  v126.size.height = v9;
  v127 = CGRectOffset(v126, v42, v45);
  v46 = v127.origin.x;
  v47 = v127.origin.y;
  v48 = v127.size.width;
  v49 = v127.size.height;

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](v10, "context"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "screenOffsetProvider"));

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](v10, "axModel"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "liveTransformAncestorIdentifier"));

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](v10, "context"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "identifierToAXElementMap"));
  v56 = (TUIAXElement *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKey:", v53));

  if (v56
    || (v91 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](v10, "axModel")),
        v92 = objc_msgSend(v91, "liveTransformKind"),
        v91,
        v92)
    && (v56 = v10) != 0)
  {
    v119 = v46;
    objc_msgSend(v51, "boundsForFeedView");
    rect = v57;
    v117 = v58;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](v56, "axModel"));
    objc_msgSend(v59, "accessibilityFrameRelativeToScrollAncestor");
    v61 = v60;
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](v10, "context"));
    objc_msgSend(v68, "sectionOffset");
    v70 = v69;
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](v10, "context"));
    objc_msgSend(v71, "sectionOffset");
    v73 = v72;
    v128.origin.x = v61;
    v128.origin.y = v63;
    v128.size.width = v65;
    v128.size.height = v67;
    v129 = CGRectOffset(v128, v70, v73);
    v74 = v129.origin.x;
    v75 = v129.origin.y;
    v76 = v129.size.width;
    v77 = v129.size.height;

    objc_msgSend(v51, "contentOffset");
    v79 = -v78;
    objc_msgSend(v51, "contentOffset");
    v81 = -v80;
    v130.origin.x = v74;
    v130.origin.y = v75;
    v130.size.width = v76;
    v130.size.height = v77;
    v131 = CGRectOffset(v130, v79, v81);
    v82 = v131.origin.x;
    v83 = v131.origin.y;
    v84 = v131.size.width;
    v85 = v131.size.height;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](v56, "axModel"));
    v87 = (char *)objc_msgSend(v86, "liveTransformKind");

    switch((unint64_t)v87)
    {
      case 2uLL:
        v133.origin.x = v82;
        v133.origin.y = v83;
        v133.size.width = v84;
        v133.size.height = v85;
        v90 = -CGRectGetMinY(v133);
        break;
      case 3uLL:
        goto LABEL_22;
      case 4uLL:
        v93 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](v10, "context"));
        objc_msgSend(v93, "sectionOffset");
        v95 = v94;

        if (v95 <= 0.0)
        {
LABEL_22:
          v136.origin.x = v82;
          v136.origin.y = v83;
          v136.size.width = v84;
          v136.size.height = v85;
          v90 = v117 * 0.5 - CGRectGetMidY(v136);
        }
        else
        {
          -[TUIAXEvaluationContext sectionOffset](v10->_context, "sectionOffset");
          v118 = v96;
          objc_msgSend(v51, "availableHeight");
          v115 = v97;
          objc_msgSend(v51, "contentOffset");
          v99 = -v98;
          objc_msgSend(v51, "contentOffset");
          v134.origin.y = -v100;
          v134.size.height = v115 + v118;
          v134.origin.x = v99;
          v134.size.width = rect;
          MidY = CGRectGetMidY(v134);
          v135.origin.x = v82;
          v135.origin.y = v83;
          v135.size.width = v84;
          v135.size.height = v85;
          v102 = MidY - CGRectGetMidY(v135);
          if (v102 >= 0.0)
            v90 = v102;
          else
            v90 = 0.0;
        }
        break;
      case 5uLL:
      case 6uLL:
        v132.origin.x = v82;
        v132.origin.y = v83;
        v132.size.width = v84;
        v132.size.height = v85;
        v88 = v117 - CGRectGetMaxY(v132);
        if (v88 < 0.0 && v87 == (_BYTE *)&dword_4 + 1)
          v90 = 0.0;
        else
          v90 = v88;
        break;
      default:
        v90 = 0.0;
        break;
    }
    v137.origin.x = v119;
    v137.origin.y = v47;
    v137.size.width = v48;
    v137.size.height = v49;
    v138 = CGRectOffset(v137, 0.0, v90);
    v46 = v138.origin.x;
    v47 = v138.origin.y;
    v48 = v138.size.width;
    v49 = v138.size.height;

  }
  objc_msgSend(v51, "screenCoordinatesForFrame:", v46, v47, v48, v49);
  v104 = v103;
  v106 = v105;
  v108 = v107;
  v110 = v109;

  v111 = v104;
  v112 = v106;
  v113 = v108;
  v114 = v110;
  result.size.height = v114;
  result.size.width = v113;
  result.origin.y = v112;
  result.origin.x = v111;
  return result;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  TUIAXCustomActionInstantiation *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement defaultAction](self, "defaultAction"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "axAttributes"));
    v6 = objc_msgSend(v5, "axDisabled");

    if ((v6 & 1) == 0)
    {
      v7 = -[TUIAXCustomActionInstantiation initWithCustomAction:arguments:axElement:]([TUIAXCustomActionInstantiation alloc], "initWithCustomAction:arguments:axElement:", v3, 0, self);
      -[TUIAXCustomActionInstantiation invoke](v7, "invoke");

    }
  }

  return v3 != 0;
}

- (void)accessibilityIncrement
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  TUIAXCustomActionInstantiation *v6;
  TUIAXCustomActionInstantiation *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "axAttributes"));
  v5 = objc_msgSend(v4, "axDisabled");

  if ((v5 & 1) == 0)
  {
    v6 = [TUIAXCustomActionInstantiation alloc];
    v8 = (id)objc_claimAutoreleasedReturnValue(-[TUIAXElement incrementAction](self, "incrementAction"));
    v7 = -[TUIAXCustomActionInstantiation initWithCustomAction:arguments:axElement:](v6, "initWithCustomAction:arguments:axElement:", v8, 0, self);
    -[TUIAXCustomActionInstantiation invoke](v7, "invoke");

  }
}

- (void)accessibilityDecrement
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  TUIAXCustomActionInstantiation *v6;
  TUIAXCustomActionInstantiation *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](self, "axModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "axAttributes"));
  v5 = objc_msgSend(v4, "axDisabled");

  if ((v5 & 1) == 0)
  {
    v6 = [TUIAXCustomActionInstantiation alloc];
    v8 = (id)objc_claimAutoreleasedReturnValue(-[TUIAXElement decrementAction](self, "decrementAction"));
    v7 = -[TUIAXCustomActionInstantiation initWithCustomAction:arguments:axElement:](v6, "initWithCustomAction:arguments:axElement:", v8, 0, self);
    -[TUIAXCustomActionInstantiation invoke](v7, "invoke");

  }
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)_accessibilityParentForFindingScrollParent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement _scrollAncestor](self, "_scrollAncestor"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](self, "context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screenOffsetProvider"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedViewForAX"));

  }
  return v5;
}

- (TUIAXModel)axModel
{
  return self->_axModel;
}

- (TUIAXEvaluationContext)context
{
  return self->_context;
}

- (TUIAXCustomAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAction, a3);
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TUIAXCustomAction)incrementAction
{
  return self->_incrementAction;
}

- (void)setIncrementAction:(id)a3
{
  objc_storeStrong((id *)&self->_incrementAction, a3);
}

- (TUIAXCustomAction)decrementAction
{
  return self->_decrementAction;
}

- (void)setDecrementAction:(id)a3
{
  objc_storeStrong((id *)&self->_decrementAction, a3);
}

- (NSArray)retainedCustomActionTargets
{
  return self->_retainedCustomActionTargets;
}

- (void)setRetainedCustomActionTargets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedCustomActionTargets, 0);
  objc_storeStrong((id *)&self->_decrementAction, 0);
  objc_storeStrong((id *)&self->_incrementAction, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_axModel, 0);
}

@end
