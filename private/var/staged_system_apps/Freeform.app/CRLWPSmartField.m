@implementation CRLWPSmartField

+ (id)allocWithZone:(_NSZone *)a3
{
  id v6;
  objc_super v7;

  if ((id)objc_opt_class(CRLWPSmartField, a2) == a1)
  {
    v6 = objc_autorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("It is illegal to instantiate CRLWPSmartField; it is abstract"),
                                  0)));
    objc_exception_throw(v6);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CRLWPSmartField;
  return objc_msgSendSuper2(&v7, "allocWithZone:", a3);
}

- (CRLWPSmartField)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CRLWPSmartField *v5;
  void *v6;
  uint64_t v7;
  NSString *textAttributeUUIDString;
  objc_super v10;

  length = a3.length;
  location = a3.location;
  v10.receiver = self;
  v10.super_class = (Class)CRLWPSmartField;
  v5 = -[CRLWPSmartField init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    textAttributeUUIDString = v5->_textAttributeUUIDString;
    v5->_textAttributeUUIDString = (NSString *)v7;

    v5->_range.location = location;
    v5->_range.length = length;
  }
  return v5;
}

- (id)initFromSmartField:(id)a3
{
  id v4;
  CRLWPSmartField *v5;
  uint64_t v6;
  NSString *textAttributeUUIDString;
  void *v8;
  NSUInteger v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLWPSmartField;
  v5 = -[CRLWPSmartField init](&v11, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textAttributeUUIDString"));
    textAttributeUUIDString = v5->_textAttributeUUIDString;
    v5->_textAttributeUUIDString = (NSString *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentStorage"));
    objc_storeWeak((id *)&v5->_parentStorage, v8);

    v5->_range.location = (NSUInteger)objc_msgSend(v4, "range");
    v5->_range.length = v9;
  }

  return v5;
}

- (unsigned)smartFieldKind
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  unsigned int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101232EB8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class(self, v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 67110146;
    v24 = v3;
    v25 = 2082;
    v26 = "-[CRLWPSmartField smartFieldKind]";
    v27 = 2082;
    v28 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSmartField.mm";
    v29 = 1024;
    v30 = 58;
    v31 = 2114;
    v32 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101232ED8);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v24 = v3;
    v25 = 2114;
    v26 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSmartField smartFieldKind]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSmartField.mm"));
  v14 = (objc_class *)objc_opt_class(self, v13);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 58, 0, "Abstract method not overridden by %{public}@", v16);

  v18 = (objc_class *)objc_opt_class(self, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v20, "-[CRLWPSmartField smartFieldKind]"));
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v21, 0));

  objc_exception_throw(v22);
}

- (unint64_t)attributeArrayKind
{
  return 6;
}

- (int)styleAttributeArrayKind
{
  return 6;
}

- (BOOL)allowsEditing
{
  return 0;
}

- (BOOL)allowsPasteAsSmartField
{
  return 1;
}

- (BOOL)canCopy:(_NSRange)a3
{
  return 1;
}

- (id)text
{
  return 0;
}

+ (id)defaultFieldStyleIdentifier
{
  return 0;
}

- (void)resetTextAttributeUUIDString
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  -[CRLWPSmartField setTextAttributeUUIDString:](self, "setTextAttributeUUIDString:", v3);

}

- (BOOL)isEquivalentToObject:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  CRLWPSmartField *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *textAttributeUUIDString;
  unsigned __int8 v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  _BYTE v28[24];

  v4 = a3;
  v6 = objc_opt_class(CRLWPSmartField, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (CRLWPSmartField *)objc_claimAutoreleasedReturnValue(v7);

  if (v8 == self)
  {
    v20 = 1;
  }
  else
  {
    if (v4)
    {
      v10 = objc_opt_class(CRLWPSmartField, v9);
      v11 = sub_100221D0C(v10, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textAttributeUUIDString"));
      if (!self->_textAttributeUUIDString)
      {
        v14 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101232EF8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF26A0();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101232F18);
        v15 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DEB414(v16, (uint64_t)v28, v14);
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSmartField isEquivalentToObject:]"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSmartField.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 111, 0, "Expect to have a UUIDString.");

      }
      if (v13)
      {
        textAttributeUUIDString = self->_textAttributeUUIDString;
        if (textAttributeUUIDString)
        {
          v20 = -[NSString isEqualToString:](textAttributeUUIDString, "isEqualToString:", v13);
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101232F38);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF261C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101232F58);
        v22 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DEB414(v23, (uint64_t)&v27, v21);
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSmartField isEquivalentToObject:]"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSmartField.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 112, 0, "Expect to have a UUIDString for other object.");

      }
      v20 = 0;
      goto LABEL_28;
    }
    v20 = 0;
  }
LABEL_29:

  return v20;
}

- (NSString)textAttributeUUIDString
{
  return self->_textAttributeUUIDString;
}

- (void)setTextAttributeUUIDString:(id)a3
{
  NSString *v5;
  NSString **p_textAttributeUUIDString;
  NSString *textAttributeUUIDString;
  NSString *v8;

  v5 = (NSString *)a3;
  textAttributeUUIDString = self->_textAttributeUUIDString;
  p_textAttributeUUIDString = &self->_textAttributeUUIDString;
  if (textAttributeUUIDString != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_textAttributeUUIDString, a3);
    v5 = v8;
  }

}

- (CRLWPTextSource)parentStorage
{
  return (CRLWPTextSource *)objc_loadWeakRetained((id *)&self->_parentStorage);
}

- (void)setParentStorage:(id)a3
{
  objc_storeWeak((id *)&self->_parentStorage, a3);
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentStorage);
  objc_storeStrong((id *)&self->_textAttributeUUIDString, 0);
}

@end
