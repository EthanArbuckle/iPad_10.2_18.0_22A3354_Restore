@implementation _UIAppearanceRecorder

- (void)_importCustomizations:(id)a3 withArchiveVersion:(int64_t)a4
{
  if (a4 == 1)
    self->_unarchivedCustomizations = (NSArray *)a3;
  else
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIAppearance.m"), 2137, CFSTR("Can't import customizations with archive version %ld"), a4);
}

- (_UIAppearanceRecorder)initWithSerializedRepresentation:(id)a3
{
  _UIAppearanceRecorder *v5;
  void *v6;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIAppearanceRecorder;
  v5 = -[_UIAppearanceRecorder init](&v10, sel_init);
  if (v5)
  {
    if (a3)
    {
      v9 = 0;
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v9);
      if (!v6)
      {
        v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("UIAppearance.m"), 2165, CFSTR("Encountered error attempting to deserialize customizations: %@"), objc_msgSend(v9, "localizedDescription"));
      }
      if (objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("_UIARAVersionKey")), "integerValue") == 1)
        -[_UIAppearanceRecorder _importCustomizations:withArchiveVersion:](v5, "_importCustomizations:withArchiveVersion:", objc_msgSend(v6, "objectForKey:", CFSTR("_UIARACustomizationsKey")), 1);
    }
    else
    {
      v5->_customizations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
  }
  return v5;
}

- (_UIAppearanceRecorder)init
{
  return -[_UIAppearanceRecorder initWithSerializedRepresentation:](self, "initWithSerializedRepresentation:", 0);
}

+ (id)_sharedAppearanceRecorder
{
  id v3;

  v3 = (id)_sharedAppearanceRecorder_sharedAppearance;
  if (!_sharedAppearanceRecorder_sharedAppearance)
  {
    v3 = objc_alloc_init((Class)a1);
    _sharedAppearanceRecorder_sharedAppearance = (uint64_t)v3;
  }
  objc_msgSend(v3, "_setClassNameToRecord:", 0);
  objc_msgSend((id)_sharedAppearanceRecorder_sharedAppearance, "_setSuperclassToRecord:", 0);
  objc_msgSend((id)_sharedAppearanceRecorder_sharedAppearance, "_setContainerClassNames:", 0);
  return (id)_sharedAppearanceRecorder_sharedAppearance;
}

+ (id)_sharedAppearanceRecorderForClassNamed:(id)a3 superclass:(Class)a4 whenContainedIn:(id)a5
{
  void *v8;

  v8 = (void *)objc_msgSend(a1, "_sharedAppearanceRecorder");
  objc_msgSend(v8, "_setClassNameToRecord:", a3);
  objc_msgSend(v8, "_setSuperclassToRecord:", a4);
  objc_msgSend(v8, "_setContainerClassNames:", a5);
  return v8;
}

+ (id)_sharedAppearanceRecorderForClass:(Class)a3 whenContainedIn:(id)a4
{
  return (id)objc_msgSend(a1, "_sharedAppearanceRecorderForClassNamed:superclass:whenContainedIn:", NSStringFromClass(a3), 0, a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIAppearanceRecorder;
  -[_UIAppearanceRecorder dealloc](&v3, sel_dealloc);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  Class superclassToRecord;

  superclassToRecord = self->_superclassToRecord;
  if (!superclassToRecord)
    superclassToRecord = NSClassFromString(self->_classNameToRecord);
  return (id)-[objc_class instanceMethodSignatureForSelector:](superclassToRecord, "instanceMethodSignatureForSelector:", a3);
}

- (void)_recordInvocation:(id)a3 withClassName:(id)a4 containerClassNames:(id)a5 traitCollection:(id)a6 selectorString:(id)a7 forRemoteProcess:(BOOL)a8
{
  _UIAppearanceRecorder *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  char isKindOfClass;
  id v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSString *v35;
  unint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSString *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  _UIAppearanceRecorder *v45;
  id v46;
  id v47;
  id v48;
  NSString *v49;
  _BOOL4 v51;
  void *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  UIEdgeInsets buf;
  _BYTE v60[128];
  uint64_t v61;
  UIOffset v62;

  v51 = a8;
  v12 = self;
  v61 = *MEMORY[0x1E0C80C00];
  if (!a4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIAppearance.m"), 2367, CFSTR("No class to record"));
  v49 = (NSString *)a7;
  if (-[NSArray count](v12->_unarchivedCustomizations, "count"))
  {
    v12->_customizations = (NSMutableArray *)-[NSArray mutableCopy](v12->_unarchivedCustomizations, "mutableCopy");

    v12->_unarchivedCustomizations = 0;
  }
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "numberOfArguments") < 3)
  {
LABEL_89:
    v39 = v49;
    if (!v49)
      v39 = NSStringFromSelector((SEL)objc_msgSend(a3, "selector"));
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", a4, CFSTR("_UIARACustomizationsClassNameKey"), v39, CFSTR("_UIARACustomizationsSelectorNameKey"), v13, CFSTR("_UIARACustomizationsArgsKey"), 0);
    v41 = v40;
    if (a5)
      objc_msgSend(v40, "setObject:forKey:", a5, CFSTR("_UIARACustomizationsContainerClassNamesKey"));
    if (a6)
      objc_msgSend(v41, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a6, 1, 0), CFSTR("_UIARACustomizationsTraitCollectionArchiveKey"));
    -[NSMutableArray addObject:](v12->_customizations, "addObject:", v41);

    return;
  }
  v14 = 2;
  v15 = *(_QWORD *)off_1E1678D90;
  v16 = *(_QWORD *)off_1E1679048;
  v53 = *(_QWORD *)off_1E1678D98;
  v46 = a5;
  v47 = a6;
  v48 = a3;
  v52 = v13;
  while (1)
  {
    v17 = (const char *)objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "getArgumentTypeAtIndex:", v14);
    if (!strcmp(v17, "@"))
    {
      v58 = 0;
      objc_msgSend(a3, "getArgument:atIndex:", &v58, v14);
      if (!v58)
      {
        v24 = 0;
        goto LABEL_43;
      }
      v19 = (void *)qword_1ECD7E1D0;
      if (!qword_1ECD7E1D0)
      {
        v20 = objc_alloc(MEMORY[0x1E0C99D20]);
        v21 = objc_opt_class();
        v43 = objc_opt_class();
        v44 = objc_opt_class();
        a5 = v46;
        a6 = v47;
        v19 = (void *)objc_msgSend(v20, "initWithObjects:", v21, v43, v44, objc_opt_class(), 0);
        qword_1ECD7E1D0 = (uint64_t)v19;
      }
      if (objc_msgSend(v19, "count"))
      {
        v22 = 1;
        do
        {
          objc_msgSend(v19, "objectAtIndex:", v22 - 1);
          isKindOfClass = objc_opt_isKindOfClass();
          if (v22 >= objc_msgSend(v19, "count"))
            break;
          ++v22;
        }
        while ((isKindOfClass & 1) == 0);
        a3 = v48;
        if ((isKindOfClass & 1) != 0)
        {
          v24 = v58;
LABEL_43:
          v25 = CFSTR("_UIARACustomizationArgsHintIsPlistType");
          goto LABEL_47;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = CFSTR("_UIARACustomizationArgsHintIsUIImage");
        else
          v25 = CFSTR("_UIARACustomizationArgsHintIsUIColor");
        if (v51 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          v26 = objc_msgSend(v58, "_serializedData");
        else
          v26 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v58, 1, 0);
        v24 = (id)v26;
LABEL_47:
        v27 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("id"), CFSTR("_UIARACustomizationArgsObjCTypeKey"), v25, CFSTR("_UIARACustomizationArgsHintKey"), v24, CFSTR("_UIARACustomizationArgsRepresentationKey"), 0);
LABEL_48:
        v13 = v52;
        goto LABEL_83;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v27 = 0;
        goto LABEL_48;
      }
      v28 = objc_msgSend(-[NSArray objectAtIndex:](-[NSString componentsSeparatedByString:](NSStringFromSelector((SEL)objc_msgSend(a3, "selector")), "componentsSeparatedByString:", CFSTR(":")), "objectAtIndex:", 0), "rangeOfString:", CFSTR("TitleTextAttributes"));
      v27 = 0;
      v13 = v52;
      if (v28 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v24 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", 0);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v29 = (void *)objc_msgSend(v58, "allKeys");
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        if (!v30)
        {
          v25 = CFSTR("_UIARACustomizationArgsHintIsUITextAttribute");
          a5 = v46;
          a6 = v47;
          goto LABEL_47;
        }
        v31 = v30;
        v45 = v12;
        v32 = *(_QWORD *)v55;
        while (2)
        {
          v33 = 0;
LABEL_55:
          if (*(_QWORD *)v55 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v33);
          if ((objc_msgSend(v34, "isEqual:", v15) & 1) != 0
            || (objc_msgSend(v34, "isEqual:", v16) & 1) != 0
            || (objc_msgSend(v34, "isEqual:", v53) & 1) != 0
            || (objc_msgSend(v34, "isEqual:", CFSTR("Font")) & 1) != 0
            || (objc_msgSend(v34, "isEqual:", CFSTR("TextColor")) & 1) != 0
            || (objc_msgSend(v34, "isEqual:", CFSTR("NSColor")) & 1) != 0
            || (objc_msgSend(v34, "isEqual:", CFSTR("TextShadowColor")) & 1) != 0
            || objc_msgSend(v34, "isEqual:", CFSTR("NSFont")))
          {
            v35 = (NSString *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(v58, "objectForKey:", v34), 1, 0);
            goto LABEL_66;
          }
          if (objc_msgSend(v34, "isEqual:", CFSTR("TextShadowOffset")))
          {
            objc_msgSend((id)objc_msgSend(v58, "objectForKey:", v34), "UIOffsetValue");
            v35 = NSStringFromUIOffset(v62);
LABEL_66:
            objc_msgSend(v24, "setObject:forKey:", v35, v34);
          }
          else
          {
            v36 = qword_1ECD7E1C8;
            if (!qword_1ECD7E1C8)
            {
              v36 = __UILogCategoryGetNode("Appearance", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v36, (unint64_t *)&qword_1ECD7E1C8);
            }
            v37 = *(NSObject **)(v36 + 8);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf.top) = 138412290;
              *(_QWORD *)((char *)&buf.top + 4) = v34;
              _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "Unknown key, \"%@\" in title text attributes dictionary. Ignoring.", (uint8_t *)&buf, 0xCu);
            }
          }
          if (v31 == ++v33)
          {
            v38 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
            v31 = v38;
            if (!v38)
            {
              v25 = CFSTR("_UIARACustomizationArgsHintIsUITextAttribute");
              v12 = v45;
              a5 = v46;
              a6 = v47;
              a3 = v48;
              goto LABEL_47;
            }
            continue;
          }
          goto LABEL_55;
        }
      }
    }
    else
    {
      if (!strcmp(v17, "{CGPoint=dd}"))
      {
        memset(&buf, 0, 16);
        objc_msgSend(a3, "getArgument:atIndex:", &buf, v14);
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("CGPoint"), CFSTR("_UIARACustomizationArgsObjCTypeKey"), NSStringFromCGPoint(*(CGPoint *)&buf.top), CFSTR("_UIARACustomizationArgsRepresentationKey"), 0);
      }
      else if (!strcmp(v17, "{CGSize=dd}"))
      {
        memset(&buf, 0, 16);
        objc_msgSend(a3, "getArgument:atIndex:", &buf, v14);
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("CGSize"), CFSTR("_UIARACustomizationArgsObjCTypeKey"), NSStringFromCGSize(*(CGSize *)&buf.top), CFSTR("_UIARACustomizationArgsRepresentationKey"), 0);
      }
      else if (!strcmp(v17, "{UIOffset=dd}"))
      {
        memset(&buf, 0, 16);
        objc_msgSend(a3, "getArgument:atIndex:", &buf, v14);
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("UIOffset"), CFSTR("_UIARACustomizationArgsObjCTypeKey"), NSStringFromUIOffset(*(UIOffset *)&buf.top), CFSTR("_UIARACustomizationArgsRepresentationKey"), 0);
      }
      else if (!strcmp(v17, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
      {
        memset(&buf, 0, sizeof(buf));
        objc_msgSend(a3, "getArgument:atIndex:", &buf, v14);
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("CGRect"), CFSTR("_UIARACustomizationArgsObjCTypeKey"), NSStringFromCGRect((CGRect)buf), CFSTR("_UIARACustomizationArgsRepresentationKey"), 0);
      }
      else if (!strcmp(v17, "{UIEdgeInsets=dddd}"))
      {
        memset(&buf, 0, sizeof(buf));
        objc_msgSend(a3, "getArgument:atIndex:", &buf, v14);
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("UIEdgeInsets"), CFSTR("_UIARACustomizationArgsObjCTypeKey"), NSStringFromUIEdgeInsets(buf), CFSTR("_UIARACustomizationArgsRepresentationKey"), 0);
      }
      else if (!strcmp(v17, "d") || !strcmp(v17, "f"))
      {
        buf.top = 0.0;
        objc_msgSend(a3, "getArgument:atIndex:", &buf, v14);
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("double"), CFSTR("_UIARACustomizationArgsObjCTypeKey"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", buf.top), CFSTR("_UIARACustomizationArgsRepresentationKey"), 0);
      }
      else if (!strcmp(v17, "Q") || !strcmp(v17, "q"))
      {
        buf.top = 0.0;
        objc_msgSend(a3, "getArgument:atIndex:", &buf, v14);
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("NSUInteger"), CFSTR("_UIARACustomizationArgsObjCTypeKey"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)&buf.top), CFSTR("_UIARACustomizationArgsRepresentationKey"), 0);
      }
      else if (!strcmp(v17, "I") || !strcmp(v17, "i"))
      {
        LODWORD(buf.top) = 0;
        objc_msgSend(a3, "getArgument:atIndex:", &buf, v14);
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("unsigned int"), CFSTR("_UIARACustomizationArgsObjCTypeKey"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(buf.top)), CFSTR("_UIARACustomizationArgsRepresentationKey"), 0);
      }
      else if (!strcmp(v17, "B"))
      {
        LOBYTE(buf.top) = 0;
        objc_msgSend(a3, "getArgument:atIndex:", &buf, v14);
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("BOOL"), CFSTR("_UIARACustomizationArgsObjCTypeKey"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LOBYTE(buf.top)), CFSTR("_UIARACustomizationArgsRepresentationKey"), 0);
      }
      else if (!strcmp(v17, "c"))
      {
        LOBYTE(buf.top) = 0;
        objc_msgSend(a3, "getArgument:atIndex:", &buf, v14);
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("char"), CFSTR("_UIARACustomizationArgsObjCTypeKey"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", SLOBYTE(buf.top)), CFSTR("_UIARACustomizationArgsRepresentationKey"), 0);
      }
      else
      {
        if (strcmp(v17, "#"))
          break;
        buf.top = 0.0;
        objc_msgSend(a3, "getArgument:atIndex:", &buf, v14);
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Class"), CFSTR("_UIARACustomizationArgsObjCTypeKey"), NSStringFromClass(*(Class *)&buf.top), CFSTR("_UIARACustomizationArgsRepresentationKey"), 0);
      }
      v27 = v18;
    }
LABEL_83:
    if (!v27)
      break;
    objc_msgSend(v13, "addObject:");
    if (++v14 >= (unint64_t)objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "numberOfArguments"))
      goto LABEL_89;
  }
  if (!v51 && !v13)
  {
    v42 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIAppearanceRecorder _recordInvocation:withClassName:containerClassNames:traitCollection:selectorString:forRemoteProcess:]"), CFSTR("UIAppearance.m"), 2384, CFSTR("Failed to record argument %lu of invocation %@"), v14, a3);
  }
}

- (void)forwardInvocation:(id)a3
{
  -[_UIAppearanceRecorder _recordInvocation:withClassName:containerClassNames:traitCollection:selectorString:forRemoteProcess:](self, "_recordInvocation:withClassName:containerClassNames:traitCollection:selectorString:forRemoteProcess:", a3, -[_UIAppearanceRecorder _classNameToRecord](self, "_classNameToRecord"), self->_containerClassNames, 0, 0, 0);
}

- (void)_applyCustomizations
{
  NSMutableArray *unarchivedCustomizations;
  const __CFString *v3;
  uint64_t v4;
  NSString *v5;
  Class v6;
  Class v7;
  uint64_t v8;
  SEL v9;
  BOOL v10;
  const char *v11;
  void *v12;
  unint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  Class v18;
  void *v19;
  uint64_t v20;
  void *v21;
  CGFloat v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  CGFloat x;
  CGFloat y;
  CGPoint v41;
  CGSize v42;
  UIOffset v43;
  uint64_t i;
  const char *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  Class v54;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  Class v62;
  unint64_t v63;
  NSObject *v64;
  unint64_t v65;
  NSObject *v66;
  unint64_t v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  Class v72;
  NSMutableArray *obj;
  const char *aSelector;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  unint64_t v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  UIOffset v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  CGRect buf;
  _BYTE v101[128];
  uint64_t v102;
  CGRect v103;

  v102 = *MEMORY[0x1E0C80C00];
  unarchivedCustomizations = (NSMutableArray *)self->_unarchivedCustomizations;
  if (!unarchivedCustomizations)
    unarchivedCustomizations = self->_customizations;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](unarchivedCustomizations, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
  if (v77)
  {
    v76 = *(_QWORD *)v90;
    v81 = *MEMORY[0x1E0C99778];
    v78 = *(_QWORD *)off_1E1678D90;
    v71 = *(_QWORD *)off_1E1679048;
    v70 = *(_QWORD *)off_1E1678D98;
    v3 = CFSTR("_UIARACustomizationArgsObjCTypeKey");
    obj = unarchivedCustomizations;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v90 != v76)
          objc_enumerationMutation(obj);
        v80 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v4);
        v5 = (NSString *)objc_msgSend(v80, "objectForKey:", CFSTR("_UIARACustomizationsClassNameKey"));
        v6 = NSClassFromString(v5);
        v7 = v6;
        if (v6 && (-[objc_class conformsToProtocol:](v6, "conformsToProtocol:", &unk_1EDDD5C00) & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v81, CFSTR("*** Invalid class for appearance customization: %@"), v7);
        v8 = objc_msgSend(v80, "objectForKey:", CFSTR("_UIARACustomizationsSelectorNameKey"));
        v9 = NSSelectorFromString((NSString *)objc_msgSend(v80, "objectForKey:", CFSTR("_UIARACustomizationsSelectorNameKey")));
        if (v7)
          v10 = v9 == 0;
        else
          v10 = 1;
        if (v10)
          goto LABEL_139;
        v11 = v9;
        if (!-[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", v9))
          goto LABEL_139;
        if (os_variant_has_internal_diagnostics())
        {
          v63 = qword_1ECD7E1D8;
          if (!qword_1ECD7E1D8)
          {
            v63 = __UILogCategoryGetNode("AppearanceRecorderSecurity", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v63, (unint64_t *)&qword_1ECD7E1D8);
          }
          v64 = *(NSObject **)(v63 + 8);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.origin.x) = 138543618;
            *(_QWORD *)((char *)&buf.origin.x + 4) = v5;
            WORD2(buf.origin.y) = 2114;
            *(_QWORD *)((char *)&buf.origin.y + 6) = v8;
            _os_log_impl(&dword_185066000, v64, OS_LOG_TYPE_DEFAULT, "Appearance Recorder is checking untrusted customization, -[%{public}@ %{public}@]", (uint8_t *)&buf, 0x16u);
          }
        }
        v12 = (void *)-[objc_class instanceMethodSignatureForSelector:](v7, "instanceMethodSignatureForSelector:", v11);
        v79 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v12);
        objc_msgSend(v79, "setSelector:", v11);
        v84 = v12;
        v83 = objc_msgSend(v12, "numberOfArguments");
        if (v83 <= 2)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v81, CFSTR("*** Invalid selector for appearance customization: %@"), NSStringFromSelector(v11));
        aSelector = v11;
        v72 = v7;
        v82 = (void *)objc_msgSend(v80, "objectForKey:", CFSTR("_UIARACustomizationsArgsKey"));
        v13 = 0x1E0C99000uLL;
        if (objc_msgSend(v82, "count") != v83 - 2)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v81, CFSTR("*** Number of arguments in appearance customization data does not match method signature"));
        v14 = (const char *)objc_msgSend(v84, "getArgumentTypeAtIndex:", 2);
        v15 = (void *)objc_msgSend(v82, "objectAtIndexedSubscript:", 0);
        v16 = (void *)objc_msgSend(v15, "objectForKey:", v3);
        if (os_variant_has_internal_diagnostics())
        {
          v65 = qword_1ECD7E1E0;
          if (!qword_1ECD7E1E0)
          {
            v65 = __UILogCategoryGetNode("AppearanceRecorderSecurity", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v65, (unint64_t *)&qword_1ECD7E1E0);
          }
          v66 = *(NSObject **)(v65 + 8);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.origin.x) = 138543618;
            *(_QWORD *)((char *)&buf.origin.x + 4) = v16;
            WORD2(buf.origin.y) = 2082;
            *(_QWORD *)((char *)&buf.origin.y + 6) = v14;
            _os_log_impl(&dword_185066000, v66, OS_LOG_TYPE_DEFAULT, "Appearance Recorder is checking the third argument type, %{public}@, for expected property type, %{public}s", (uint8_t *)&buf, 0x16u);
          }
        }
        if (strcmp(v14, "@"))
        {
          if (!strcmp(v14, "q") || !strcmp(v14, "Q"))
          {
            v17 = CFSTR("NSUInteger");
            if (!objc_msgSend(v16, "isEqualToString:", CFSTR("NSUInteger")))
              goto LABEL_97;
            v18 = (Class)objc_msgSend((id)objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")), "unsignedIntegerValue");
LABEL_40:
            *(_QWORD *)&buf.origin.x = v18;
            goto LABEL_86;
          }
          if (strcmp(v14, "i") && strcmp(v14, "I"))
          {
            if (!strcmp(v14, "d") || !strcmp(v14, "f"))
            {
              v17 = CFSTR("double");
              if (!objc_msgSend(v16, "isEqualToString:", CFSTR("double")))
                goto LABEL_97;
              objc_msgSend((id)objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")), "doubleValue");
              buf.origin.x = v22;
              goto LABEL_86;
            }
            if (!strcmp(v14, "{CGPoint=dd}"))
            {
              v17 = CFSTR("CGPoint");
              if (!objc_msgSend(v16, "isEqualToString:", CFSTR("CGPoint")))
                goto LABEL_97;
              v41 = CGPointFromString((NSString *)objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")));
              y = v41.y;
              x = v41.x;
            }
            else if (!strcmp(v14, "{CGSize=dd}"))
            {
              v17 = CFSTR("CGSize");
              if (!objc_msgSend(v16, "isEqualToString:", CFSTR("CGSize")))
                goto LABEL_97;
              v42 = CGSizeFromString((NSString *)objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")));
              y = v42.height;
              x = v42.width;
            }
            else
            {
              if (strcmp(v14, "{UIOffset=dd}"))
              {
                if (!strcmp(v14, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
                {
                  v17 = CFSTR("CGRect");
                  if (!objc_msgSend(v16, "isEqualToString:", CFSTR("CGRect")))
                    goto LABEL_97;
                  v103 = CGRectFromString((NSString *)objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")));
                }
                else
                {
                  if (strcmp(v14, "{UIEdgeInsets=dddd}"))
                  {
                    if (!strcmp(v14, "B"))
                    {
                      v17 = CFSTR("BOOL");
                      if (!objc_msgSend(v16, "isEqualToString:", CFSTR("BOOL")))
                        goto LABEL_97;
                      LOBYTE(buf.origin.x) = objc_msgSend((id)objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")), "BOOLValue");
                      goto LABEL_86;
                    }
                    if (strcmp(v14, "c"))
                    {
                      if (strcmp(v14, "#"))
                      {
                        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v81, CFSTR("*** Invalid property type, %s, for appearance customization: %@"), v14, NSStringFromSelector(aSelector));
                        v17 = 0;
LABEL_97:
                        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v81, CFSTR("*** Property type for appearance customization data (%@) does not match method signature. Expected %@"), v16, v17);
                        goto LABEL_98;
                      }
                      v17 = CFSTR("Class");
                      if (!objc_msgSend(v16, "isEqualToString:", CFSTR("Class")))
                        goto LABEL_97;
                      v18 = NSClassFromString((NSString *)objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")));
                      goto LABEL_40;
                    }
                    v21 = v16;
                    v17 = CFSTR("char");
                    goto LABEL_46;
                  }
                  v17 = CFSTR("UIEdgeInsets");
                  if (!objc_msgSend(v16, "isEqualToString:", CFSTR("UIEdgeInsets")))
                    goto LABEL_97;
                  v103 = (CGRect)UIEdgeInsetsFromString((NSString *)objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")));
                }
                buf = v103;
                goto LABEL_86;
              }
              v17 = CFSTR("UIOffset");
              if (!objc_msgSend(v16, "isEqualToString:", CFSTR("UIOffset")))
                goto LABEL_97;
              v43 = UIOffsetFromString((NSString *)objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")));
              y = v43.vertical;
              x = v43.horizontal;
            }
            buf.origin.x = x;
            buf.origin.y = y;
            goto LABEL_86;
          }
          v21 = v16;
          v17 = CFSTR("unsigned int");
LABEL_46:
          if (!objc_msgSend(v21, "isEqualToString:", v17))
            goto LABEL_97;
          LODWORD(buf.origin.x) = objc_msgSend((id)objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")), "unsignedIntValue");
LABEL_86:
          objc_msgSend(v79, "setArgument:atIndex:", &buf, 2);
          goto LABEL_98;
        }
        v17 = CFSTR("id");
        if (!objc_msgSend(v16, "isEqualToString:", CFSTR("id")))
          goto LABEL_97;
        v19 = (void *)objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsHintKey"));
        if (os_variant_has_internal_diagnostics())
        {
          v67 = qword_1ECD7E1E8;
          if (!qword_1ECD7E1E8)
          {
            v67 = __UILogCategoryGetNode("AppearanceRecorderSecurity", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v67, (unint64_t *)&qword_1ECD7E1E8);
          }
          v68 = *(NSObject **)(v67 + 8);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.origin.x) = 138543362;
            *(_QWORD *)((char *)&buf.origin.x + 4) = v19;
            _os_log_impl(&dword_185066000, v68, OS_LOG_TYPE_DEFAULT, "Appearance Recorder is checking the hint for a third-argument type of id, %{public}@]", (uint8_t *)&buf, 0xCu);
          }
        }
        if (objc_msgSend(v19, "isEqual:", CFSTR("_UIARACustomizationArgsHintIsPlistType")))
        {
          v20 = objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey"));
          goto LABEL_51;
        }
        if ((objc_msgSend(v19, "isEqual:", CFSTR("_UIARACustomizationArgsHintIsUIImage")) & 1) != 0
          || objc_msgSend(v19, "isEqual:", CFSTR("_UIARACustomizationArgsHintIsUIColor")))
        {
          objc_msgSend(v19, "isEqual:", CFSTR("_UIARACustomizationArgsHintIsUIImage"));
          v20 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")), 0);
LABEL_51:
          *(_QWORD *)&buf.origin.x = v20;
          if (!v20)
            goto LABEL_98;
          goto LABEL_86;
        }
        if (!objc_msgSend(v19, "isEqual:", CFSTR("_UIARACustomizationArgsHintIsUITextAttribute")))
          goto LABEL_98;
        v23 = (void *)objc_msgSend(v15, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey"));
        v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v75 = (id)objc_msgSend(v23, "allKeys");
        v25 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
        if (!v25)
          goto LABEL_77;
        v26 = v25;
        v27 = *(_QWORD *)v95;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v95 != v27)
              objc_enumerationMutation(v75);
            v29 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v28);
            if ((objc_msgSend(v29, "isEqual:", v78) & 1) != 0
              || (objc_msgSend(v29, "isEqual:", CFSTR("Font")) & 1) != 0
              || (objc_msgSend(v29, "isEqual:", CFSTR("NSFont")) & 1) != 0
              || (objc_msgSend(v29, "isEqual:", v71) & 1) != 0
              || (objc_msgSend(v29, "isEqual:", v70) & 1) != 0
              || (objc_msgSend(v29, "isEqual:", CFSTR("TextColor")) & 1) != 0
              || (objc_msgSend(v29, "isEqual:", CFSTR("NSColor")) & 1) != 0
              || objc_msgSend(v29, "isEqual:", CFSTR("TextShadowColor")))
            {
              v30 = objc_opt_class();
              v31 = v3;
              v32 = (void *)MEMORY[0x1E0CB3710];
              v33 = objc_msgSend(v23, "objectForKey:", v29);
              v34 = v32;
              v3 = v31;
              v35 = objc_msgSend(v34, "unarchivedObjectOfClass:fromData:error:", v30, v33, 0);
              if (!v35)
                goto LABEL_71;
              goto LABEL_70;
            }
            if (objc_msgSend(v29, "isEqual:", CFSTR("TextShadowOffset")))
            {
              v36 = (void *)MEMORY[0x1E0CB3B18];
              v93 = UIOffsetFromString((NSString *)objc_msgSend(v23, "objectForKey:", v29));
              v35 = objc_msgSend(v36, "valueWithBytes:objCType:", &v93, "{UIOffset=dd}");
LABEL_70:
              objc_msgSend(v24, "setObject:forKey:", v35, v29);
              goto LABEL_71;
            }
            v37 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInvocation *_invocationFromCustomizationRaiseForUnexpectedData(NSDictionary *, Class *)"), CFSTR("UIAppearance.m"), 2521, CFSTR("Unknown key, \"%@\" in title text attributes dictionary"), v29);
LABEL_71:
            ++v28;
          }
          while (v26 != v28);
          v38 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
          v26 = v38;
        }
        while (v38);
LABEL_77:
        *(_QWORD *)&buf.origin.x = v24;
        v13 = 0x1E0C99000;
        if (v24)
          goto LABEL_86;
LABEL_98:
        if (v83 >= 4)
        {
          for (i = 3; v83 != i; ++i)
          {
            v45 = (const char *)objc_msgSend(v84, "getArgumentTypeAtIndex:", i);
            v46 = (void *)objc_msgSend(v82, "objectAtIndexedSubscript:", i - 2);
            v47 = (void *)objc_msgSend(v46, "objectForKey:", v3);
            if (os_variant_has_internal_diagnostics())
            {
              v48 = qword_1ECD7E1F0;
              if (!qword_1ECD7E1F0)
              {
                v48 = __UILogCategoryGetNode("AppearanceRecorderSecurity", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v48, (unint64_t *)&qword_1ECD7E1F0);
              }
              v49 = *(NSObject **)(v48 + 8);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.origin.x) = 134218498;
                *(_QWORD *)((char *)&buf.origin.x + 4) = i + 1;
                WORD2(buf.origin.y) = 2114;
                *(_QWORD *)((char *)&buf.origin.y + 6) = v47;
                HIWORD(buf.size.width) = 2082;
                *(_QWORD *)&buf.size.height = v45;
                _os_log_impl(&dword_185066000, v49, OS_LOG_TYPE_DEFAULT, "Appearance Recorder is checking the %luth argument type, %{public}@, for expected property type, %{public}s", (uint8_t *)&buf, 0x20u);
              }
            }
            if (!strcmp(v45, "q") || !strcmp(v45, "Q"))
            {
              if (!objc_msgSend(v47, "isEqualToString:", CFSTR("NSUInteger")))
                goto LABEL_111;
              buf.origin.x = 0.0;
              *(_QWORD *)&buf.origin.x = objc_msgSend((id)objc_msgSend(v46, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")), "unsignedIntegerValue");
            }
            else
            {
              if (strcmp(v45, "i") && strcmp(v45, "I"))
              {
                objc_msgSend(*(id *)(v13 + 3488), "raise:format:", v81, CFSTR("*** Invalid axis type, %s, for appearance customization, %@"), v45, NSStringFromSelector(aSelector));
LABEL_111:
                objc_msgSend(*(id *)(v13 + 3488), "raise:format:", v81, CFSTR("*** Axis type, %s, for appearance customization data is not integer"), v45);
                continue;
              }
              if (!objc_msgSend(v47, "isEqualToString:", CFSTR("unsigned int")))
                goto LABEL_111;
              LODWORD(buf.origin.x) = 0;
              LODWORD(buf.origin.x) = objc_msgSend((id)objc_msgSend(v46, "objectForKey:", CFSTR("_UIARACustomizationArgsRepresentationKey")), "unsignedIntValue");
            }
            objc_msgSend(v79, "setArgument:atIndex:", &buf, i);
          }
        }
        if (!v79)
          goto LABEL_139;
        v50 = (void *)objc_msgSend(v80, "objectForKey:", CFSTR("_UIARACustomizationsContainerClassNamesKey"));
        v51 = objc_msgSend(v80, "objectForKey:", CFSTR("_UIARACustomizationsTraitCollectionArchiveKey"));
        if (!v51)
        {
          v56 = objc_msgSend(v50, "count");
          v54 = v72;
          if (v56)
          {
            v52 = 0;
LABEL_125:
            v57 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v85 = 0u;
            v86 = 0u;
            v87 = 0u;
            v88 = 0u;
            v58 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
            if (!v58)
            {
LABEL_133:
              if (v52)
                v55 = +[_UITraitBasedAppearance _appearanceForTraitCollection:forClass:withContainerList:](_UITraitBasedAppearance, "_appearanceForTraitCollection:forClass:withContainerList:", v52, v72, v57);
              else
                v55 = (id)-[objc_class _appearanceWhenContainedIn:](v72, "_appearanceWhenContainedIn:", v57);
              goto LABEL_137;
            }
            v59 = v58;
            v60 = *(_QWORD *)v86;
LABEL_127:
            v61 = 0;
            while (1)
            {
              if (*(_QWORD *)v86 != v60)
                objc_enumerationMutation(v50);
              v62 = NSClassFromString(*(NSString **)(*((_QWORD *)&v85 + 1) + 8 * v61));
              if (!v62)
                goto LABEL_139;
              objc_msgSend(v57, "addObject:", v62);
              if (v59 == ++v61)
              {
                v59 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
                if (v59)
                  goto LABEL_127;
                goto LABEL_133;
              }
            }
          }
LABEL_135:
          v55 = (id)-[objc_class appearance](v54, "appearance");
          goto LABEL_137;
        }
        v52 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v51, 0);
        v53 = objc_msgSend(v50, "count");
        v54 = v72;
        if (v53)
          goto LABEL_125;
        if (!v52)
          goto LABEL_135;
        v55 = (id)-[objc_class appearanceForTraitCollection:](v72, "appearanceForTraitCollection:", v52);
LABEL_137:
        if (v55)
          objc_msgSend(v79, "invokeWithTarget:", v55);
LABEL_139:
        ++v4;
      }
      while (v4 != v77);
      v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
      v77 = v69;
    }
    while (v69);
  }
}

- (NSData)_serializedRepresentation
{
  uint64_t v4;
  NSData *v5;
  void *v7;
  id v8;

  v8 = 0;
  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1), CFSTR("_UIARAVersionKey"), self->_customizations, CFSTR("_UIARACustomizationsKey"), 0);
  v5 = (NSData *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v8);
  if (!v5)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIAppearance.m"), 2725, CFSTR("Encountered error attempting to serialize customizations: %@"), objc_msgSend(v8, "localizedDescription"));
  }
  return v5;
}

- (NSString)_classNameToRecord
{
  return self->_classNameToRecord;
}

- (void)_setClassNameToRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (Class)_superclassToRecord
{
  return self->_superclassToRecord;
}

- (void)_setSuperclassToRecord:(Class)a3
{
  self->_superclassToRecord = a3;
}

- (NSArray)_containerClassNames
{
  return self->_containerClassNames;
}

- (void)_setContainerClassNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
