@implementation UIAccessibilityHierarchyEncoder

- (UIAccessibilityHierarchyEncoder)initWithRootElement:(id)a3 traversalOptions:(id)a4
{
  id v6;
  id v7;
  UIAccessibilityHierarchyEncoder *v8;
  UIAccessibilityHierarchyEncoder *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIAccessibilityHierarchyEncoder;
  v8 = -[UIAccessibilityHierarchyEncoder init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[UIAccessibilityHierarchyEncoder setRootElement:](v8, "setRootElement:", v6);
    if (v7)
    {
      -[UIAccessibilityHierarchyEncoder setTraversalOptions:](v9, "setTraversalOptions:", v7);
    }
    else
    {
      +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAccessibilityHierarchyEncoder setTraversalOptions:](v9, "setTraversalOptions:", v10);

    }
    -[UIAccessibilityHierarchyEncoder setShouldResolveRemoteElements:](v9, "setShouldResolveRemoteElements:", 1);
  }

  return v9;
}

- (id)encodeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[UIAccessibilityHierarchyEncoder rootElement](self, "rootElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityHierarchyEncoder traversalOptions](self, "traversalOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityLeafDescendantsWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAccessibilityHierarchyEncoder encodeWithLeafElements:error:](self, "encodeWithLeafElements:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)encodeWithLeafElements:(id)a3 error:(id *)a4
{
  id v5;
  UIAccessibilityHierarchyDescription *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  UIAccessibilityHierarchyDescription *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(UIAccessibilityHierarchyDescription);
  -[UIAccessibilityHierarchyEncoder rootElement](self, "rootElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAccessibilityElementDescription descriptionWithElement:frameInContainerSpaceOrNil:](UIAccessibilityElementDescription, "descriptionWithElement:frameInContainerSpaceOrNil:", v7, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  -[UIAccessibilityHierarchyDescription setRootElement:](v6, "setRootElement:", v8);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!-[UIAccessibilityHierarchyEncoder shouldResolveRemoteElements](self, "shouldResolveRemoteElements"))
            continue;
          -[UIAccessibilityHierarchyEncoder rootElement](self, "rootElement");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIAccessibilityHierarchyEncoder _resolveLeafElementsForRemoteElement:rootElement:addingToLeafElementDescriptions:](self, "_resolveLeafElementsForRemoteElement:rootElement:addingToLeafElementDescriptions:", v15, v16, v9);
        }
        else
        {
          -[UIAccessibilityHierarchyEncoder rootElement](self, "rootElement");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIAccessibilityHierarchyEncoder _convertAccessibilityFrameOfElement:toViewSpaceOfContainer:remoteParent:](self, "_convertAccessibilityFrameOfElement:toViewSpaceOfContainer:remoteParent:", v15, v16, 0);
          +[UIAccessibilityElementDescription descriptionWithElement:frameInContainerSpaceOrNil:](UIAccessibilityElementDescription, "descriptionWithElement:frameInContainerSpaceOrNil:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  -[UIAccessibilityHierarchyDescription setLeafElements:](v22, "setLeafElements:", v9);
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, &v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v24;
  v20 = v19;
  if (a4)
    *a4 = objc_retainAutorelease(v19);

  return v18;
}

- (CGRect)_convertAccessibilityFrameOfElement:(id)a3 toViewSpaceOfContainer:(id)a4 remoteParent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGRect v49;
  CGRect v50;
  CGRect result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v8, "accessibilityFrameInContainerSpace"), !CGRectIsNull(v49)))
  {
    objc_msgSend(v8, "accessibilityFrameInContainerSpace");
    v14 = v32;
    v16 = v33;
    v18 = v34;
    v20 = v35;
  }
  else
  {
    -[UIAccessibilityHierarchyEncoder rootElement](self, "rootElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIAccessibilityHierarchyEncoder rootElement](self, "rootElement");
    else
      objc_msgSend(v9, "_accessibilityParentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "bounds");
      objc_msgSend(v8, "convertRect:toView:", v12);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CF40C8], "elementWithUIElement:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "frame");
        v14 = v22;
        v16 = v23;
        v18 = v24;
        v20 = v25;
        objc_msgSend(v12, "window");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 && !v26)
        {
          objc_msgSend(v10, "_accessibilityParentView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "convertRect:toView:", v12, v14, v16, v18, v20);
          v14 = v28;
          v16 = v29;
          v18 = v30;
          v20 = v31;

        }
      }
      else
      {
        objc_msgSend(v8, "accessibilityFrame");
        v14 = v36;
        v16 = v37;
        v18 = v38;
        v20 = v39;
      }
      objc_msgSend(v12, "window");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v50.origin.x = v14;
      v50.origin.y = v16;
      v50.size.width = v18;
      v50.size.height = v20;
      if (!CGRectIsEmpty(v50) && v12 && v40)
      {
        objc_msgSend(v40, "convertRect:toView:", v12, v14, v16, v18, v20);
        v14 = v41;
        v16 = v42;
        v18 = v43;
        v20 = v44;
      }

    }
  }

  v45 = v14;
  v46 = v16;
  v47 = v18;
  v48 = v20;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
  return result;
}

- (void)_resolveLeafElementsForRemoteElement:(id)a3 rootElement:(id)a4 addingToLeafElementDescriptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[4];
  id v16;
  UIAccessibilityHierarchyEncoder *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __116__UIAccessibilityHierarchyEncoder__resolveLeafElementsForRemoteElement_rootElement_addingToLeafElementDescriptions___block_invoke;
  v15[3] = &unk_1E3DFDF10;
  v11 = v10;
  v16 = v11;
  v17 = self;
  v12 = v9;
  v18 = v12;
  v13 = v8;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v13, "getLeafElementsFromRemoteSide:", v15);
  v14 = (const __CFString *)*MEMORY[0x1E0C9B280];
  while (!*((_BYTE *)v22 + 24))
    CFRunLoopRunInMode(v14, 0.1, 1u);

  _Block_object_dispose(&v21, 8);
}

void __116__UIAccessibilityHierarchyEncoder__resolveLeafElementsForRemoteElement_rootElement_addingToLeafElementDescriptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "_convertAccessibilityFrameOfElement:toViewSpaceOfContainer:remoteParent:", v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        +[UIAccessibilityElementDescription descriptionWithElement:frameInContainerSpaceOrNil:](UIAccessibilityElementDescription, "descriptionWithElement:frameInContainerSpaceOrNil:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();

}

- (id)rootElement
{
  return self->_rootElement;
}

- (void)setRootElement:(id)a3
{
  objc_storeStrong(&self->_rootElement, a3);
}

- (UIAccessibilityElementTraversalOptions)traversalOptions
{
  return self->_traversalOptions;
}

- (void)setTraversalOptions:(id)a3
{
  objc_storeStrong((id *)&self->_traversalOptions, a3);
}

- (BOOL)shouldResolveRemoteElements
{
  return self->_shouldResolveRemoteElements;
}

- (void)setShouldResolveRemoteElements:(BOOL)a3
{
  self->_shouldResolveRemoteElements = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traversalOptions, 0);
  objc_storeStrong(&self->_rootElement, 0);
}

@end
