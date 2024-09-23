@implementation MFUIStateCaptor

+ (id)sharedCaptor
{
  if (qword_1005AA448 != -1)
    dispatch_once(&qword_1005AA448, &stru_1005230D8);
  return (id)qword_1005AA440;
}

- (MFUIStateCaptor)init
{
  MFUIStateCaptor *v2;
  MFUIStateCaptor *v3;
  NSArray *redactedFieldNames;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFUIStateCaptor;
  v2 = -[MFUIStateCaptor init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    redactedFieldNames = v2->_redactedFieldNames;
    v2->_redactedFieldNames = (NSArray *)&off_100542220;

  }
  return v3;
}

- (id)viewControllerHierarchy
{
  return -[MFUIStateCaptor _captureUIStateWithTitle:captureBlock:](self, "_captureUIStateWithTitle:captureBlock:", CFSTR("UIVC Hierarchy"), &stru_100523118);
}

- (id)viewControllerDescriptions
{
  return -[MFUIStateCaptor _captureUIStateWithTitle:captureBlock:](self, "_captureUIStateWithTitle:captureBlock:", CFSTR("All UIVC Descriptions"), &stru_100523138);
}

- (id)mailSceneHierarchy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentIdentifier"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001BE2E0;
  v10[3] = &unk_100523160;
  v7 = v4;
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFUIStateCaptor _captureUIStateWithTitle:captureBlock:](self, "_captureUIStateWithTitle:captureBlock:", v6, v10));

  return v8;
}

- (id)redactedStringForString:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[MFUIStateCaptor isCapturingUIState](self, "isCapturingUIState"))
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mf_fancyRedactedString"));
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (id)_captureUIStateWithTitle:(id)a3 captureBlock:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (uint64_t (**)(_QWORD))a4;
  -[MFUIStateCaptor setIsCapturingUIState:](self, "setIsCapturingUIState:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n- Begin %@ --------------------------------------------------\n"), v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n- End %@ --------------------------------------------------\n"), v6));
  v10 = v7[2](v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[MFUIStateCaptor setIsCapturingUIState:](self, "setIsCapturingUIState:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), v8, v11, v9));

  return v12;
}

- (BOOL)isCapturingUIState
{
  return self->_isCapturingUIState;
}

- (void)setIsCapturingUIState:(BOOL)a3
{
  self->_isCapturingUIState = a3;
}

- (NSArray)redactedFieldNames
{
  return self->_redactedFieldNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redactedFieldNames, 0);
}

@end
