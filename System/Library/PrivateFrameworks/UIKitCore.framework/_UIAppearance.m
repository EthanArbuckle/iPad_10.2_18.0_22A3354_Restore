@implementation _UIAppearance

+ (void)_applyInvocationsTo:(id)a3 window:(id)a4 matchingSelector:(SEL)a5 onlySystemInvocations:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *context;
  id object;
  void *v38;
  int v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[2];
  uint64_t (*v62)(uint64_t, void *, int);
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  SEL v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v6 = a6;
  v73 = *MEMORY[0x1E0C80C00];
  v11 = +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", objc_opt_class(), objc_msgSend(a3, "_appearanceGuideClass"));
  v12 = (void *)existingAppearancesNodesInNodeForClassAndSuperclasses((uint64_t)+[_UIAppearance _rootAppearancesNode](_UIAppearance, "_rootAppearancesNode"), v11);
  if (objc_msgSend(v12, "count"))
  {
    context = (void *)MEMORY[0x186DC9484]();
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v62 = __83___UIAppearance__applyInvocationsTo_window_matchingSelector_onlySystemInvocations___block_invoke;
    v63 = &unk_1E16C9918;
    v64 = a1;
    v65 = a3;
    v66 = a4;
    v67 = v14;
    v68 = v13;
    v69 = a5;
    __83___UIAppearance__applyInvocationsTo_window_matchingSelector_onlySystemInvocations___block_invoke((uint64_t)v61, v12, !v6);
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (void *)objc_msgSend(a3, "_appearanceContainer");
    else
      v16 = 0;
    v34 = v14;
    v35 = v13;
    LOBYTE(v39) = v6;
    object = a3;
    v45 = v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      obj = v12;
      do
      {
        v17 = +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", objc_opt_class(), objc_msgSend(v16, "_appearanceGuideClass"));
        v18 = (void *)objc_msgSend(v17, "_customizableViewClass");
        v38 = v16;
        if ((v39 & 1) != 0)
          v39 = 1;
        else
          v39 = objc_msgSend(v18, "_preventsAppearanceProxyCustomization");
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v72, 16, v34);
        if (v42)
        {
          v41 = *(_QWORD *)v58;
          v19 = v39 ^ 1u;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v58 != v41)
                objc_enumerationMutation(obj);
              v43 = v20;
              v44 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v20);
              if (!objc_msgSend(v45, "count") || objc_msgSend((id)objc_msgSend(v45, "objectAtIndex:", 0), "count"))
              {
                v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v45, "insertObject:atIndex:", v21, 0);

              }
              v55 = 0u;
              v56 = 0u;
              v53 = 0u;
              v54 = 0u;
              v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
              if (v47)
              {
                v46 = *(_QWORD *)v54;
                do
                {
                  v22 = 0;
                  do
                  {
                    if (*(_QWORD *)v54 != v46)
                      objc_enumerationMutation(v45);
                    v48 = v22;
                    v23 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v22);
                    if (objc_msgSend(v23, "count"))
                    {
                      v24 = objc_msgSend(v23, "count");
                      if (v24)
                      {
                        v25 = v24;
                        for (i = 0; i != v25; ++i)
                        {
                          v27 = (void *)objc_msgSend(v23, "objectAtIndex:", i);
                          v49 = 0u;
                          v50 = 0u;
                          v51 = 0u;
                          v52 = 0u;
                          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v70, 16);
                          if (v28)
                          {
                            v29 = v28;
                            v30 = *(_QWORD *)v50;
                            do
                            {
                              for (j = 0; j != v29; ++j)
                              {
                                if (*(_QWORD *)v50 != v30)
                                  objc_enumerationMutation(v27);
                                v32 = (void *)existingAppearancesNodesInNodeForClassAndSuperclasses(*(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j), v17);
                                if (objc_msgSend(v32, "count"))
                                {
                                  objc_msgSend(v23, "addObject:", v32);
                                  v62((uint64_t)v61, v32, v19);
                                }
                              }
                              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v70, 16);
                            }
                            while (v29);
                          }
                        }
                      }
                    }
                    else
                    {
                      v33 = (void *)existingAppearancesNodesInNodeForClassAndSuperclasses(v44, v17);
                      if (objc_msgSend(v33, "count"))
                      {
                        objc_msgSend(v23, "addObject:", v33);
                        v62((uint64_t)v61, v33, v19);
                      }
                    }
                    v22 = v48 + 1;
                  }
                  while (v48 + 1 != v47);
                  v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
                }
                while (v47);
              }
              v20 = v43 + 1;
            }
            while (v43 + 1 != v42);
            v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
          }
          while (v42);
        }
        v16 = (void *)objc_msgSend(v38, "_appearanceContainer");
      }
      while ((objc_opt_respondsToSelector() & 1) != 0);
    }
    applyInvocationsToTarget(v34, object);
    if ((v39 & 1) == 0)
      applyInvocationsToTarget(v35, object);

    objc_autoreleasePoolPop(context);
  }
}

+ (id)appearancesAtNode:(id)a3 withObject:(id)a4
{
  void *v6;
  void **v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[2];
  uint64_t (*v46)(uint64_t, uint64_t);
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("_UIAppearanceKey"));
  if ((dyld_program_sdk_at_least() & 1) == 0 && v6)
  {
    v56[0] = v6;
    v7 = (void **)v56;
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("_UIAppearanceHasExtendedAppearancesKey")), "BOOLValue"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    if (dyld_program_sdk_at_least())
    {
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v46 = __46___UIAppearance_appearancesAtNode_withObject___block_invoke;
      v47 = &unk_1E16C98C8;
      v48 = a3;
      v49 = a4;
      v50 = v6;
      __46___UIAppearance_appearancesAtNode_withObject___block_invoke((uint64_t)v45, (uint64_t)CFSTR("_UIAppearanceKey"));
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v42 != v11)
              objc_enumerationMutation(a3);
            v13 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v8, "addObject:", v13);
          }
          v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
        }
        while (v10);
      }
      objc_msgSend(v8, "sortUsingSelector:", sel__compare_);
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v38 != v16)
              objc_enumerationMutation(v8);
            v46((uint64_t)v45, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
          }
          v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
        }
        while (v15);
      }
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v34;
        do
        {
          for (k = 0; k != v19; ++k)
          {
            if (*(_QWORD *)v34 != v20)
              objc_enumerationMutation(a3);
            v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_msgSend(v22, "isEqualToString:", CFSTR("_UIAppearanceKey")) & 1) == 0
              && (objc_msgSend(v22, "isEqualToString:", CFSTR("_UIAppearanceHasExtendedAppearancesKey")) & 1) == 0)
            {
              v46((uint64_t)v45, (uint64_t)v22);
            }
          }
          v19 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
        }
        while (v19);
      }
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v52, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v30;
        do
        {
          for (m = 0; m != v25; ++m)
          {
            if (*(_QWORD *)v30 != v26)
              objc_enumerationMutation(a3);
            v28 = (void *)objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * m));
            if ((objc_opt_respondsToSelector() & 1) != 0
              && objc_msgSend(v28, "_isValidAppearanceForCustomizableObject:", a4))
            {
              objc_msgSend(v6, "addObject:", v28);
            }
          }
          v25 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v52, 16);
        }
        while (v25);
      }
    }
  }
  else if (v6)
  {
    v51 = v6;
    v7 = &v51;
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  }
  return v6;
}

+ (BOOL)_hasCustomizationsForClass:(Class)a3 guideClass:(Class)a4
{
  int v6;
  void *v7;

  v6 = objc_msgSend(a1, "_hasAnyCustomizations");
  if (v6)
  {
    v7 = (void *)objc_msgSend((id)objc_opt_class(), "_rootAppearancesNode");
    LOBYTE(v6) = existingAppearancesNodeInNodeForClass(v7, +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", a3, a4)) != 0;
  }
  return v6;
}

+ (BOOL)_hasAnyCustomizations
{
  return __rootAppearances != 0;
}

+ (id)_rootAppearancesNode
{
  id result;

  result = (id)__rootAppearances;
  if (!__rootAppearances)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    __rootAppearances = (uint64_t)result;
  }
  return result;
}

+ (void)_applyInvocationsTo:(id)a3 window:(id)a4 matchingSelector:(SEL)a5
{
  objc_msgSend(a1, "_applyInvocationsTo:window:matchingSelector:onlySystemInvocations:", a3, a4, a5, 0);
}

+ (void)_applyInvocationsTo:(id)a3 window:(id)a4
{
  objc_msgSend(a1, "_applyInvocationsTo:window:matchingSelector:", a3, a4, 0);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[objc_class instanceMethodSignatureForSelector:](-[_UIAppearanceCustomizableClassInfo _customizableViewClass](self->_customizableClassInfo, "_customizableViewClass"), "instanceMethodSignatureForSelector:", a3);
}

- (void)_handleGetterInvocation:(id)a3
{
  void *v5;
  NSString *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSString *v11;
  uint64_t v12;
  NSMutableArray *appearanceInvocations;
  size_t v14;
  unint64_t v15;
  _OWORD *v16;
  _QWORD v17[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  _OWORD v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "methodSignature");
  v6 = NSStringFromSelector((SEL)objc_msgSend(a3, "selector"));
  v7 = objc_msgSend(v5, "numberOfArguments");
  if (-[NSString characterAtIndex:](v6, "characterAtIndex:", 0) == 95)
    v6 = -[NSString substringFromIndex:](v6, "substringFromIndex:", 1);
  if (v7 < 3)
  {
    v11 = -[NSString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR(":"));
  }
  else
  {
    v8 = -[NSString rangeOfString:](v6, "rangeOfString:", CFSTR("For"));
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      while (1)
      {
        v10 = -[NSString characterAtIndex:](v6, "characterAtIndex:", v9 + 3);
        if (v10 == -[NSString characterAtIndex:](-[NSString uppercaseString](-[NSString substringWithRange:](v6, "substringWithRange:", v9 + 3, 1), "uppercaseString"), "characterAtIndex:", 0))break;
        v9 = -[NSString rangeOfString:options:range:](v6, "rangeOfString:options:range:", CFSTR("For"), 0, v9 + 1, -[NSString length](v6, "length") - (v9 + 1));
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v9 = 0x7FFFFFFFFFFFFFFFLL;
          break;
        }
      }
    }
    v11 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:f%@"), -[NSString substringToIndex:](v6, "substringToIndex:", v9), -[NSString substringFromIndex:](v6, "substringFromIndex:", v9 + 1));
  }
  v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set%@%@"), -[NSString uppercaseString](-[NSString substringToIndex:](v11, "substringToIndex:", 1), "uppercaseString"), -[NSString substringFromIndex:](v11, "substringFromIndex:", 1));
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__104;
  v22 = __Block_byref_object_dispose__104;
  v23 = 0;
  appearanceInvocations = self->_appearanceInvocations;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41___UIAppearance__handleGetterInvocation___block_invoke;
  v17[3] = &unk_1E16C9940;
  v17[7] = &v18;
  v17[8] = v7;
  v17[4] = v12;
  v17[5] = a3;
  v17[6] = v5;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](appearanceInvocations, "enumerateObjectsWithOptions:usingBlock:", 2, v17);
  v14 = objc_msgSend(v5, "methodReturnLength");
  v15 = v14;
  memset(v24, 0, sizeof(v24));
  if (v14 < 0x21)
    v16 = v24;
  else
    v16 = malloc_type_calloc(v14, 1uLL, 0x100004077774924uLL);
  objc_msgSend((id)v19[5], "getArgument:atIndex:", v16, 2);
  objc_msgSend(a3, "setReturnValue:", v16);
  if (v15 >= 0x21)
    free(v16);
  _Block_object_dispose(&v18, 8);
}

- (void)forwardInvocation:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "methodReturnLength"))
    -[_UIAppearance _handleGetterInvocation:](self, "_handleGetterInvocation:", a3);
  else
    -[_UIAppearance _handleSetterInvocation:](self, "_handleSetterInvocation:", a3);
}

- (void)_handleSetterInvocation:(id)a3
{
  const char *v5;
  NSString *v6;
  objc_class *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *containerList;
  id v14;
  NSMapTable *invocationSources;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (const char *)objc_msgSend(a3, "selector");
  v6 = NSStringFromSelector(v5);
  v7 = -[_UIAppearanceCustomizableClassInfo _customizableViewClass](self->_customizableClassInfo, "_customizableViewClass");
  if (!self->_appearanceInvocations)
    self->_appearanceInvocations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = UIAppearancePrefixedSelectorForSelectorString(v6);
  objc_msgSend(a3, "setSelector:", -[_UIAppearance _beginListeningForAppearanceEventsForSetter:](self, "_beginListeningForAppearanceEventsForSetter:", v5));
  objc_msgSend(a3, "setTarget:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  objc_msgSend(a3, "retainArguments");
  -[NSMutableArray addObject:](self->_appearanceInvocations, "addObject:", a3);
  if (__isSettingUpSystemAppearanceProxyModifications == 1)
    objc_setAssociatedObject(a3, &_MergedGlobals_1083, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), (void *)3);
  v9 = objc_msgSend((id)objc_opt_class(), "_currentAppearanceSource");
  if (-[_UIAppearance _isRecordingInvocations](self, "_isRecordingInvocations"))
  {
    v10 = (void *)objc_msgSend((id)objc_opt_class(), "_pendingRecordInvocationsForSource:", v9);
    if ((-[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", objc_msgSend(a3, "selector")) & 1) == 0)
      v6 = NSStringFromSelector(v8);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v6, CFSTR("_UIAppearanceWrapperKeySelector"), a3, CFSTR("_UIAppearanceWrapperKeyInvocation"), v7, CFSTR("_UIAppearanceWrapperKeyClass"), 0);
    v12 = v11;
    containerList = self->_containerList;
    if (containerList)
      objc_msgSend(v11, "setObject:forKey:", containerList, CFSTR("_UIAppearanceWrapperKeyContainerClasses"));
    v14 = -[_UIAppearance _traitCollection](self, "_traitCollection");
    if (v14)
      objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("_UIAppearanceWrapperKeyTraitCollection"));
    objc_msgSend(v10, "addObject:", v12);

  }
  if (v9)
  {
    invocationSources = self->_invocationSources;
    if (!invocationSources)
    {
      invocationSources = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 514, 0, 0);
      self->_invocationSources = invocationSources;
    }
    -[NSMapTable setObject:forKey:](invocationSources, "setObject:forKey:", v9, a3);
  }
  if (byte_1ECD7E181)
  {
    v16 = (id)objc_msgSend((id)objc_opt_class(), "_windowsForSource:", v9);
    if (!v16)
      v16 = +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          -[_UIAppearance _invalidateAppearanceInWindow:](self, "_invalidateAppearanceInWindow:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v18);
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("_UIAppearanceInvocationsDidChangeNotification"), self);
}

- (SEL)_beginListeningForAppearanceEventsForSetter:(SEL)a3
{
  const char *v3;
  NSString *v6;
  const char *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  NSString *v12;

  v3 = a3;
  v6 = NSStringFromSelector(a3);
  v7 = UIAppearancePrefixedSelectorForSelectorString(v6);
  v8 = -[_UIAppearanceCustomizableClassInfo _customizableViewClass](self->_customizableClassInfo, "_customizableViewClass");
  v9 = _classWithImplementationOfSelector(v8, v7, 0);
  v10 = _classWithImplementationOfSelector(v8, v3, 1);
  if (v9 != v10)
  {
    v11 = v10;
    if (v9 && (!v10 || -[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", v10)))
    {
      if (-[NSString isEqualToString:](-[NSString substringToIndex:](v6, "substringToIndex:", 1), "isEqualToString:", CFSTR("_")))
      {
        v12 = -[NSString substringFromIndex:](v6, "substringFromIndex:", 1);
      }
      else
      {
        v12 = (NSString *)objc_msgSend(CFSTR("_"), "stringByAppendingString:", v6);
      }
      v3 = NSSelectorFromString(v12);
      if (_classWithImplementationOfSelector(v8, v3, 1) != v9)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIAppearance.m"), 1502, CFSTR("Bad selector setup for -[%@ %@]"), NSStringFromClass(v8), v6);
    }
    else
    {
      -[objc_class _installAppearanceSwizzlesForSetter:](v11, "_installAppearanceSwizzlesForSetter:", v6);
    }
  }
  return v3;
}

+ (id)_currentAppearanceSource
{
  return (id)__currentAppearanceSource;
}

+ (id)_windowsForSource:(id)a3
{
  return (id)objc_msgSend((id)__appearanceSourceWindows, "objectForKey:", a3);
}

- (id)_traitCollection
{
  return 0;
}

- (BOOL)_isRecordingInvocations
{
  return (__isSettingUpSystemAppearanceProxyModifications & 1) == 0;
}

+ (id)_pendingRecordInvocationsForSource:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  if (!a3)
    v3 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (id)__pendingRecordInvocations;
  if (!__pendingRecordInvocations)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    __pendingRecordInvocations = (uint64_t)v4;
  }
  v5 = (id)objc_msgSend(v4, "objectForKey:", v3);
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)__pendingRecordInvocations, "setObject:forKey:", v5, v3);

  }
  return v5;
}

- (void)_invalidateAppearanceInWindow:(id)a3
{
  objc_msgSend(a3, "_invalidateAppearanceForSubviewsOfClass:", -[_UIAppearanceCustomizableClassInfo _customizableViewClass](self->_customizableClassInfo, "_customizableViewClass"));
}

+ (id)_appearanceForClass:(Class)a3 withContainerList:(id)a4
{
  return (id)objc_msgSend(a1, "_appearanceWithClassInfo:containerList:", +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", a3, 0), a4);
}

+ (id)_appearanceWithClassInfo:(id)a3 containerList:(id)a4
{
  void *v7;
  void *v8;

  v7 = (void *)objc_msgSend(a1, "_appearanceNodeForClassInfo:containerList:");
  v8 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("_UIAppearanceKey"));
  if (!v8)
  {
    v8 = (void *)objc_msgSend(a1, "_newAppearanceWithClassInfo:containerList:", a3, a4);
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("_UIAppearanceKey"));
  }
  return v8;
}

+ (id)_appearanceNodeForClassInfo:(id)a3 containerList:(id)a4
{
  void *IfNecessary;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  IfNecessary = appearancesNodeInNodeForClassCreateIfNecessary((void *)objc_msgSend(a1, "_rootAppearancesNode"), (uint64_t)a3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(a4);
      if (!IfNecessary)
        break;
      IfNecessary = appearancesNodeInNodeForClassCreateIfNecessary(IfNecessary, (uint64_t)+[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), 0));
      if (v7 == v9)
      {
        v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          goto LABEL_3;
        return IfNecessary;
      }
    }
  }
  return IfNecessary;
}

+ (id)_newAppearanceWithClassInfo:(id)a3 containerList:(id)a4
{
  _QWORD *v6;

  v6 = objc_alloc_init((Class)a1);
  v6[4] = a3;
  v6[1] = objc_msgSend(a4, "copy");
  return v6;
}

+ (void)_setInvalidatesViewsOnAppearanceChange:(BOOL)a3
{
  byte_1ECD7E181 = a3;
}

- (id)_appearanceInvocations
{
  return self->_appearanceInvocations;
}

+ (void)_setCurrentAppearanceSource:(id)a3
{

  __currentAppearanceSource = objc_msgSend(a3, "copyWithZone:", 0);
}

+ (void)_addWindow:(id)a3 forSource:(id)a4
{
  id v6;
  void *v7;

  v6 = (id)__appearanceSourceWindows;
  if (!__appearanceSourceWindows)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    __appearanceSourceWindows = (uint64_t)v6;
  }
  v7 = (void *)objc_msgSend(v6, "objectForKey:", a4);
  if (!v7)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend((id)__appearanceSourceWindows, "setObject:forKey:", v7, a4);
  }
  objc_msgSend(v7, "addObject:", a3);
}

+ (void)_removeWindow:(id)a3 forSource:(id)a4
{
  objc_msgSend((id)objc_msgSend((id)__appearanceSourceWindows, "objectForKey:", a4), "removeObject:", a3);
}

+ (id)_recorderForSource:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  if (qword_1ECD7E1C0 != -1)
    dispatch_once(&qword_1ECD7E1C0, &__block_literal_global_370);
  if (!byte_1ECD7E183)
    return 0;
  if (!a3)
    a3 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (qword_1ECD7E1A0 != -1)
    dispatch_once(&qword_1ECD7E1A0, &__block_literal_global_273);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__104;
  v11 = __Block_byref_object_dispose__104;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36___UIAppearance__recorderForSource___block_invoke_96;
  v6[3] = &unk_1E16C3E80;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)qword_1ECD7E198, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (id)_recordersExcludingSource:(id)a3 withWindow:(id)a4
{
  void *v7;
  _QWORD v9[8];

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54___UIAppearance__recordersExcludingSource_withWindow___block_invoke;
  v9[3] = &unk_1E16C98A0;
  v9[4] = a3;
  v9[5] = a1;
  v9[6] = a4;
  v9[7] = v7;
  objc_msgSend((id)__pendingRecordInvocations, "enumerateKeysAndObjectsUsingBlock:", v9);
  return v7;
}

- (BOOL)_isValidAppearanceForCustomizableObject:(id)a3
{
  return 1;
}

+ (void)_removeInvocationsForSource:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "_rootAppearancesNode");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45___UIAppearance__removeInvocationsForSource___block_invoke;
  v5[3] = &unk_1E16C98F0;
  v5[4] = a3;
  _enumerateAppearancesHelper(v4, (uint64_t)v5);
}

- (void)_removeInvocationsForSource:(id)a3
{
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  id v8;

  if (-[NSMapTable count](self->_invocationSources, "count"))
  {
    v5 = -[NSMutableArray count](self->_appearanceInvocations, "count");
    v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    if (v5)
    {
      for (i = 0; i != v5; ++i)
      {
        v7 = -[NSMutableArray objectAtIndex:](self->_appearanceInvocations, "objectAtIndex:", i);
        if (objc_msgSend(-[NSMapTable objectForKey:](self->_invocationSources, "objectForKey:", v7), "isEqual:", a3))
        {
          objc_msgSend(v8, "addIndex:", i);
          -[NSMapTable removeObjectForKey:](self->_invocationSources, "removeObjectForKey:", v7);
        }
      }
    }
    -[NSMutableArray removeObjectsAtIndexes:](self->_appearanceInvocations, "removeObjectsAtIndexes:", v8);

  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIAppearance;
  -[_UIAppearance dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  _UIAppearanceCustomizableClassInfo *customizableClassInfo;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  customizableClassInfo = self->_customizableClassInfo;
  if (self->_containerList)
    v7 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" when contained in %@"), self->_containerList);
  else
    v7 = &stru_1E16EDF20;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> %@%@ with invocations %@>"), v5, self, customizableClassInfo, v7, self->_appearanceInvocations);
}

- (void)_appendDescriptionToString:(id)a3 atLevel:(unint64_t)a4
{
  uint64_t i;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  id v15;
  id v16;
  const __CFString *v17;
  NSMutableArray *obj;
  uint64_t v19;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_appearanceInvocations;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v22)
  {
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v7 = a4 + 1;
        if (a4 != -1)
        {
          do
          {
            objc_msgSend(a3, "appendString:", CFSTR("    "));
            --v7;
          }
          while (v7);
        }
        v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", NSStringFromSelector((SEL)objc_msgSend(v6, "selector")));
        v26 = 0;
        objc_msgSend(v8, "scanUpToString:intoString:", CFSTR("s"), 0);
        objc_msgSend(v8, "scanString:intoString:", CFSTR("set"), 0);
        objc_msgSend(v8, "scanUpToString:intoString:", CFSTR(":"), &v26);
        objc_msgSend(v8, "scanString:intoString:", CFSTR(":"), 0);
        v9 = (void *)objc_msgSend((id)objc_msgSend(v26, "substringToIndex:", 1), "lowercaseString");
        v10 = (void *)objc_msgSend(v9, "stringByAppendingString:", objc_msgSend(v26, "substringFromIndex:", 1));
        v25 = 0;
        v26 = v10;
        objc_msgSend(v6, "getArgument:atIndex:", &v25, 2);
        if (*(_BYTE *)objc_msgSend((id)objc_msgSend(v6, "methodSignature"), "getArgumentTypeAtIndex:", 2) == 64)
          objc_msgSend(a3, "appendFormat:", CFSTR("%@ = %@"), v26, v25);
        else
          objc_msgSend(a3, "appendFormat:", CFSTR("%@ = %ld"), v26, v25);
        v11 = objc_msgSend((id)objc_msgSend(v6, "methodSignature"), "numberOfArguments");
        if (v11 >= 4)
        {
          v12 = v11;
          for (j = 3; j != v12; ++j)
          {
            v24 = 0;
            objc_msgSend(v8, "scanUpToString:intoString:", CFSTR(":"), &v24);
            objc_msgSend(v8, "scanString:intoString:", CFSTR(":"), 0);
            v23 = 0;
            objc_msgSend(v6, "getArgument:atIndex:", &v23, j);
            if (j == 3)
            {
              objc_msgSend(a3, "appendString:", CFSTR(" for "));
              v14 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v24, "substringFromIndex:", 3), "substringToIndex:", 1), "lowercaseString");
              v15 = (id)objc_msgSend(v14, "stringByAppendingString:", objc_msgSend(v24, "substringFromIndex:", 4));
              v24 = v15;
            }
            else
            {
              objc_msgSend(a3, "appendString:", CFSTR(", "));
              v15 = v24;
            }
            objc_msgSend(a3, "appendFormat:", CFSTR("%@ = %ld"), v15, v23);
          }
        }
        v16 = -[NSMapTable objectForKey:](self->_invocationSources, "objectForKey:", v6);
        v17 = CFSTR(" pid");
        if (!v16)
          v17 = &stru_1E16EDF20;
        objc_msgSend(a3, "appendFormat:", CFSTR(" (source%@ = %@)\n"), v17, v16);
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v22);
  }
}

+ (void)_appendDescriptionOfNode:(id)a3 toString:(id)a4 atLevel:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v16;
  const __CFString *v17;
  id v18;
  uint64_t v19;
  unint64_t i;
  uint64_t v22;
  id obj;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = a3;
    a3 = 0;
  }
  else
  {
    v8 = (id)objc_msgSend(a3, "objectForKey:", CFSTR("_UIAppearanceKey"));
  }
  objc_msgSend(v8, "_appendDescriptionToString:atLevel:", a4, a5);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_msgSend(a3, "keyEnumerator");
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = CFSTR("_UIAppearanceKey");
    v12 = *(_QWORD *)v26;
    v24 = a5 + 1;
    do
    {
      v13 = 0;
      v22 = v10;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(const __CFString **)(*((_QWORD *)&v25 + 1) + 8 * v13);
        if (v14 != v11 && v14 != CFSTR("_UIAppearanceHasExtendedAppearancesKey"))
        {
          v16 = v12;
          v17 = v11;
          v18 = a3;
          v19 = objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13));
          for (i = v24; i; --i)
            objc_msgSend(a4, "appendString:", CFSTR("    "));
          objc_msgSend(a4, "appendFormat:", CFSTR("-> when contained in %@\n"), v14);
          objc_msgSend(a1, "_appendDescriptionOfNode:toString:atLevel:", v19, a4, v24);
          a3 = v18;
          v11 = v17;
          v12 = v16;
          v10 = v22;
        }
        ++v13;
      }
      while (v13 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }
}

+ (id)recursiveDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a1, "_rootAppearancesNode");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_msgSend(v3, "keyEnumerator");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(__CFString **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v10 != CFSTR("_UIAppearanceKey"))
        {
          objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
          objc_msgSend(a1, "_appendDescriptionOfNode:toString:atLevel:", objc_msgSend(v3, "objectForKey:", v10), v4, 0);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  if (objc_msgSend(v4, "length"))
    return v4;
  else
    return CFSTR("No appearance invocations have been saved.");
}

- (_UIAppearanceCustomizableClassInfo)_customizableClassInfo
{
  return self->_customizableClassInfo;
}

@end
