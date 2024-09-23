@implementation NSObject

- (NSString)imaxIdentification
{
  return (NSString *)__IMAccessibilityGetAssociatedObject(self, &unk_30D5C0);
}

- (void)imaxSetIdentification:(id)a3
{
  __IMAccessibilitySetAssociatedCopiedObject(self, &unk_30D5C0, a3);
}

- (id)imaxFindAncestor:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  uint64_t v6;

  v4 = (uint64_t (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject imaxValueForKey:](self, "imaxValueForKey:", CFSTR("accessibilityContainer")));
  if (v5)
  {
    do
    {
      if ((v4[2](v4, v5) & 1) != 0)
        break;
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imaxValueForKey:", CFSTR("accessibilityContainer")));

      v5 = (void *)v6;
    }
    while (v6);
  }

  return v5;
}

- (id)imaxElementIsAncestor:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_40218;
  v7[3] = &unk_28D2E0;
  v8 = a3;
  v4 = v8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject imaxFindAncestor:](self, "imaxFindAncestor:", v7));

  return v5;
}

- (id)imaxAncestorIsKindOf:(Class)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4027C;
  v4[3] = &unk_28D300;
  v4[4] = a3;
  return (id)objc_claimAutoreleasedReturnValue(-[NSObject imaxFindAncestor:](self, "imaxFindAncestor:", v4));
}

- (id)_accessibilityFindDescendant:(id)a3
{
  uint64_t (**v4)(id, void *);
  id v5;
  void *v6;
  char *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = (uint64_t (**)(id, void *))a3;
  v5 = objc_msgSend(objc_allocWithZone((Class)NSMutableArray), "init");
  objc_msgSend(v5, "addObject:", self);
  if (objc_msgSend(v5, "count"))
  {
    while (1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
      objc_msgSend(v5, "removeLastObject");
      if ((v4[2](v4, v6) & 1) != 0)
        break;
      v7 = (char *)objc_msgSend(v6, "accessibilityElementCount");
      if ((unint64_t)(v7 - 1) > 0x7FFFFFFFFFFFFFFDLL)
      {
        v10 = objc_opt_class(UIView);
        if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews", 0));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "reverseObjectEnumerator"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));

          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v20;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v20 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v17));
                v17 = (char *)v17 + 1;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            }
            while (v15);
          }

        }
      }
      else
      {
        v8 = (unint64_t)(v7 + 1);
        do
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessibilityElementAtIndex:", v8 - 2));
          if (v9)
            objc_msgSend(v5, "addObject:", v9);

          --v8;
        }
        while (v8 > 1);
      }

      if (!objc_msgSend(v5, "count"))
        goto LABEL_19;
    }
  }
  else
  {
LABEL_19:
    v6 = 0;
  }

  return v6;
}

- (id)imaxDescendentOfType:(Class)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4050C;
  v4[3] = &unk_28D300;
  v4[4] = a3;
  return (id)objc_claimAutoreleasedReturnValue(-[NSObject _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", v4));
}

- (id)imaxUnignoredDescendant
{
  return -[NSObject _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", &stru_28D340);
}

- (id)im_propertiesDescription
{
  objc_class *v2;
  objc_property_t *v3;
  unint64_t v4;
  __CFString *v5;
  NSString *v6;
  NSString *v7;
  __CFString *v8;
  SEL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  _QWORD *v14;
  unsigned int (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  int v17;
  __CFString *v18;
  _QWORD v21[4];
  __CFString *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  unsigned int outCount;
  _QWORD v29[4];
  _QWORD v30[3];

  outCount = 0;
  v2 = (objc_class *)objc_opt_class(self);
  v3 = class_copyPropertyList(v2, &outCount);
  if (v3)
  {
    if (outCount)
    {
      v4 = 0;
      v5 = &stru_296430;
      while (1)
      {
        v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", property_getName(v3[v4]), 1);
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
        v8 = &stru_296430;
        if (!-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("description"))
          && !-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("debugDescription")))
        {
          v9 = NSSelectorFromString(v7);
          v8 = CFSTR("<not implemented>");
          if ((objc_opt_respondsToSelector(self, v9) & 1) != 0)
            v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKey:](self, "valueForKey:", v7));
        }
        v10 = objc_opt_class(v8);
        v30[0] = objc_opt_class(NSString);
        v30[1] = objc_opt_class(NSNumber);
        v30[2] = objc_opt_class(NSURL);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 3));
        v29[0] = objc_opt_class(NSDictionary);
        v29[1] = objc_opt_class(NSArray);
        v29[2] = objc_opt_class(NSSet);
        v29[3] = objc_opt_class(NSCountedSet);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
        v24 = 0;
        v25 = &v24;
        v26 = 0x2020000000;
        v27 = 0;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_6DE48;
        v21[3] = &unk_28E4D8;
        v23 = &v24;
        v13 = v8;
        v22 = v13;
        v14 = objc_retainBlock(v21);
        v15 = (unsigned int (**)(_QWORD, _QWORD))v14;
        if (!v13)
          *((_DWORD *)v25 + 6) = 1;
        if (((unsigned int (*)(_QWORD *, void *))v14[2])(v14, v11))
        {
          *((_DWORD *)v25 + 6) = 1;
        }
        else
        {
          if (((unsigned int (**)(_QWORD, void *))v15)[2](v15, v12))
          {
            *((_DWORD *)v25 + 6) = 2;
LABEL_18:
            v16 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR("\t%@ = <%@: %p> {%ld objects}"), v7, v10, v13, -[__CFString count](v13, "count")));
            goto LABEL_19;
          }
          v17 = *((_DWORD *)v25 + 6);
          if (v17 == 2)
            goto LABEL_18;
          if (v17 != 1)
          {
            v16 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR("\t%@ = <%@: %p>"), v7, v10, v13));
            goto LABEL_19;
          }
        }
        v16 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR("\t%@ = %@"), v7, v13));
LABEL_19:
        v18 = (__CFString *)v16;

        if (v4 >= outCount - 1)
        {
          v5 = v18;
        }
        else
        {
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v18, "stringByAppendingString:", CFSTR(",\n")));

        }
        _Block_object_dispose(&v24, 8);

        if (++v4 >= outCount)
          goto LABEL_26;
      }
    }
    v5 = &stru_296430;
LABEL_26:
    free(v3);
  }
  else
  {
    v5 = &stru_296430;
  }
  return v5;
}

- (id)im_completeDescription
{
  objc_class *v3;
  objc_method *InstanceMethod;
  IMP Implementation;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (objc_class *)objc_msgSend((id)objc_opt_class(self), "superclass");
  InstanceMethod = class_getInstanceMethod(v3, "description");
  Implementation = method_getImplementation(InstanceMethod);
  v6 = ((uint64_t (*)(NSObject *, const char *))Implementation)(self, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject im_propertiesDescription](self, "im_propertiesDescription"));
  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("{\n%@\n}"), v8));

    v7 = (void *)v9;
  }

  return v7;
}

- (id)im_recursiveDescriptionChildrenBlock:(id)a3
{
  uint64_t (**v4)(id, NSObject *);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  uint64_t (**v35)(id, NSObject *);
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v4 = (uint64_t (**)(id, NSObject *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject description](self, "description"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v7 = v4[2](v4, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "im_recursiveDescriptionChildrenBlock:", v4));
        objc_msgSend(v6, "appendString:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
        if (v13 != v15)
          objc_msgSend(v6, "appendString:", CFSTR("\n"));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v10);
  }
  v33 = v8;
  v35 = v4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByTrimmingCharactersInSet:", v25));
        v27 = objc_msgSend(v26, "length");

        if (v27)
        {
          objc_msgSend(v18, "appendFormat:", CFSTR("\t%@"), v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));

          if (v24 != v28)
            objc_msgSend(v18, "appendString:", CFSTR("\n"));
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v21);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v29));
  v31 = objc_msgSend(v30, "length");

  if (v31)
    objc_msgSend(v34, "appendFormat:", CFSTR("\n%@"), v18);

  return v34;
}

- (id)_imaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 expectedTypeEncoding:(const char *)a5
{
  return -[NSObject _imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, a4, a5, 0);
}

- (id)_imaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 possibleExpectedTypeEncodings:(const char *)a5
{
  id v8;
  uint64_t v9;
  id v10;
  const char *v11;
  char v12;
  const char **v13;
  int v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  NSString *v18;
  void *v19;
  objc_class *v20;
  NSString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  id v29;
  id v30;
  uint64_t i;
  uint64_t *v32;
  int v33;
  objc_class *v34;
  NSString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  void *v42;
  void *v43;
  const char **v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v8 = a3;
  v9 = objc_claimAutoreleasedReturnValue(-[NSObject imaxValueForKey:](self, "imaxValueForKey:", v8));
  v10 = (id)v9;
  if (v9)
  {
    if ((objc_opt_isKindOfClass(v9, a4) & 1) == 0)
    {
      if (qword_311308 != -1)
        dispatch_once(&qword_311308, &stru_291A08);
      if (!byte_311300)
        goto LABEL_17;
      if (qword_311328 != -1)
        dispatch_once(&qword_311328, &stru_291A48);
      v14 = byte_311320;
      v15 = (objc_class *)objc_opt_class(self);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = NSStringFromClass(a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (objc_class *)objc_opt_class(v10);
      v21 = NSStringFromClass(v20);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v27 = __IMAccessibilityHandleValidationErrorWithDescription(v14, 0, CFSTR("Value for key %@ on object <%@: %p> is not an %@; class: %@; value: %@"),
              v22,
              v23,
              v24,
              v25,
              v26,
              (uint64_t)v8);

      if (!v27)
        goto LABEL_17;
      goto LABEL_33;
    }
    if (a5)
    {
      v10 = objc_retainAutorelease(v10);
      v11 = (const char *)objc_msgSend(v10, "objCType");
      if (strcmp(v11, a5))
      {
        v12 = 0;
        v44 = (const char **)&v46;
        while (1)
        {
          v13 = v44++;
          if (!*v13)
            break;
          if ((v12 & 1) == 0)
            v12 = 1;
          if (!strcmp(v11, *v13))
            goto LABEL_18;
        }
        if (qword_311308 != -1)
          dispatch_once(&qword_311308, &stru_291A08);
        if (!byte_311300)
          goto LABEL_17;
        if ((v12 & 1) != 0)
        {
          v30 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", CFSTR("%s"), a5);
          v45 = &v47;
          for (i = v46; i; i = *v32)
          {
            objc_msgSend(v30, "appendFormat:", CFSTR("\", \"%s"), i);
            v32 = v45++;
          }
          v29 = objc_retainAutorelease(v30);
          objc_msgSend(v29, "UTF8String");
          if (qword_311308 != -1)
            dispatch_once(&qword_311308, &stru_291A08);
        }
        else
        {
          v29 = 0;
        }
        if (!byte_311300)
          goto LABEL_32;
        if (qword_311328 != -1)
          dispatch_once(&qword_311328, &stru_291A48);
        v33 = byte_311320;
        v34 = (objc_class *)objc_opt_class(self);
        v35 = NSStringFromClass(v34);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v41 = __IMAccessibilityHandleValidationErrorWithDescription(v33, 0, CFSTR("Value for key %@ on object <%@: %p> doesn't encapsulate the right type; value: %@; actual type encoding: \"%s\"; %s: \"%s\"."),
                v36,
                v37,
                v38,
                v39,
                v40,
                (uint64_t)v8);

        if (!v41)
        {
LABEL_32:

LABEL_17:
          v10 = 0;
          goto LABEL_18;
        }
LABEL_33:
        abort();
      }
    }
  }
LABEL_18:

  return v10;
}

- (id)imaxValueForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKey:](self, "valueForKey:", v4));

  return v5;
}

- (BOOL)imaxBoolValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(NSNumber), "i", "c", "B", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_msgSend(v6, "BOOLValue");
  return v7;
}

- (int)imaxIntValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;

  v4 = a3;
  v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSNumber), "i");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_msgSend(v6, "intValue");
  return v7;
}

- (unsigned)imaxUnsignedIntValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned int v7;

  v4 = a3;
  v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(NSNumber), "i", "I", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_msgSend(v6, "unsignedIntValue");
  return v7;
}

- (int64_t)imaxIntegerValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(NSNumber), "q", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_msgSend(v6, "integerValue");
  return (int64_t)v7;
}

- (unint64_t)imaxUnsignedIntegerValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(NSNumber), "Q", "q", "Q", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  return (unint64_t)v7;
}

- (float)imaxFloatValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  float v7;
  float v8;

  v4 = a3;
  v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSNumber), "f");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

- (double)imaxDoubleValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSNumber), "d");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (double)imaxTimeIntervalValueForKey:(id)a3
{
  double result;

  -[NSObject imaxDoubleValueForKey:](self, "imaxDoubleValueForKey:", a3);
  return result;
}

- (_NSRange)imaxRangeValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v4 = a3;
  v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSValue), "{_NSRange=QQ}");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_msgSend(v6, "rangeValue");
  v9 = v8;

  v10 = (NSUInteger)v7;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (double)imaxCGFloatValueForKey:(id)a3
{
  double result;

  -[NSObject imaxDoubleValueForKey:](self, "imaxDoubleValueForKey:", a3);
  return result;
}

- (CGPoint)imaxCGPointValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v4 = a3;
  v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSValue), "{CGPoint=dd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  objc_msgSend(v6, "CGPointValue");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGSize)imaxCGSizeValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v4 = a3;
  v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSValue), "{CGSize=dd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  objc_msgSend(v6, "CGSizeValue");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGRect)imaxCGRectValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v4 = a3;
  v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_imaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSValue), "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)imaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4
{
  return -[NSObject _imaxRespondsToSelector:fromExtrasProtocol:skipAssertions:](self, "_imaxRespondsToSelector:fromExtrasProtocol:skipAssertions:", a3, a4, 0);
}

- (double)imaxScreenScale
{
  return 1.0;
}

- (BOOL)_imaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4 skipAssertions:(BOOL)a5
{
  Protocol *v8;
  unsigned int v9;
  SEL name;
  unsigned int v11;
  int ShouldPerformValidationChecks;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  NSString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  NSString *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v50;
  void *v51;
  void *v52;

  v8 = (Protocol *)a4;
  if (!a5)
  {
    ShouldPerformValidationChecks = IMAccessibilityShouldPerformValidationChecks();
    if (!a3)
    {
      if (ShouldPerformValidationChecks)
      {
        ShouldCrashOnValidationErrorAfterLaunch = IMAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__IMAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, CFSTR("Selector can't be null."), v14, v15, v16, v17, v18, v50))goto LABEL_23;
      }
    }
    v19 = IMAccessibilityShouldPerformValidationChecks();
    if (!v8)
    {
      if (v19)
      {
        v20 = IMAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        LOBYTE(v9) = 0;
        if (!__IMAccessibilityHandleValidationErrorWithDescription(v20, 0, CFSTR("Protocol can't be null."), v21, v22, v23, v24, v25, v50))goto LABEL_25;
        goto LABEL_23;
      }
    }
  }
  LOBYTE(v9) = 0;
  if (!a3 || !v8)
    goto LABEL_25;
  name = protocol_getMethodDescription(v8, a3, 1, 1).name;
  v11 = -[NSObject conformsToProtocol:](self, "conformsToProtocol:", v8);
  v9 = v11;
  if (a5)
  {
    if (v11)
      LOBYTE(v9) = objc_opt_respondsToSelector(self, a3);
    goto LABEL_25;
  }
  v26 = IMAccessibilityShouldPerformValidationChecks() ^ 1;
  if (!name)
    v26 = 1;
  if (((v26 | v9) & 1) == 0)
  {
    v27 = IMAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v28 = (objc_class *)objc_opt_class(self);
    v29 = NSStringFromClass(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = NSStringFromProtocol(v8);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v37 = __IMAccessibilityHandleValidationErrorWithDescription(v27, 0, CFSTR("<%@: %p> doesn't conform to the protocol: %@"), v32, v33, v34, v35, v36, (uint64_t)v30);

    if (v37)
      goto LABEL_23;
  }
  if ((v9 & 1) == 0)
  {
    LOBYTE(v9) = 0;
    goto LABEL_25;
  }
  LOBYTE(v9) = objc_opt_respondsToSelector(self, a3);
  if (IMAccessibilityShouldPerformValidationChecks())
  {
    if (name)
    {
      if ((v9 & 1) == 0)
      {
        v38 = IMAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        v39 = (objc_class *)objc_opt_class(self);
        v40 = NSStringFromClass(v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v42 = NSStringFromSelector(a3);
        v52 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v48 = __IMAccessibilityHandleValidationErrorWithDescription(v38, 0, CFSTR("<%@: %p> doesn't respond to the following abstract method: %@"), v43, v44, v45, v46, v47, (uint64_t)v41);

        LOBYTE(v9) = 0;
        if (v48)
LABEL_23:
          abort();
      }
    }
  }
LABEL_25:

  return v9 & 1;
}

@end
