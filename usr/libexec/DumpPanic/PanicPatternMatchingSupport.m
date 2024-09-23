@implementation PanicPatternMatchingSupport

- (id)init:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  const char *v11;
  PanicPatternMatchingSupport *v12;
  int v14;
  const char *v15;

  v3 = a3;
  if (!NSClassFromString(CFSTR("objcDiagnosticPatternMatching")))
  {
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  -[PanicPatternMatchingSupport setTakeAction:](self, "setTakeAction:", v3);
  v5 = objc_msgSend(objc_alloc((Class)objcDiagnosticPatternMatching), "initWithType:", 2);
  -[PanicPatternMatchingSupport setPatternMatching:](self, "setPatternMatching:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PanicPatternMatchingSupport patternMatching](self, "patternMatching"));
  v7 = qword_10003A5D8;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to initialize Pattern Matching", (uint8_t *)&v14, 2u);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PanicPatternMatchingSupport patternMatching](self, "patternMatching"));
    v10 = objc_msgSend(v9, "isPatternPayloadAvailable");
    v11 = "No";
    if (v10)
      v11 = "Yes";
    v14 = 136315138;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Pattern Matching initialized with payload available: %s", (uint8_t *)&v14, 0xCu);

  }
  v12 = self;
LABEL_11:

  return v12;
}

- (id)createPanicCriterials:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (NSClassFromString(CFSTR("objcPanicCriterials")))
    v13 = objc_msgSend(objc_alloc((Class)objcPanicCriterials), "initWithCriterials::::", v9, v10, v11, v12);
  else
    v13 = 0;

  return v13;
}

- (BOOL)lookForKnownPanic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PanicPatternMatchingSupport patternMatching](self, "patternMatching"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PanicPatternMatchingSupport patternMatching](self, "patternMatching"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getPanicCriterials"));
    v8 = objc_msgSend(v6, "lookForPattern::", v7, 0);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (objcDiagnosticPatternMatching)patternMatching
{
  return (objcDiagnosticPatternMatching *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPatternMatching:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)takeAction
{
  return self->_takeAction;
}

- (void)setTakeAction:(BOOL)a3
{
  self->_takeAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternMatching, 0);
}

@end
