@implementation _UIDebugLogReportFormatter

- (id)_componentsFromReport:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _UIDebugReportComponents *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_statements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(v3, "_statements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52___UIDebugLogReportFormatter__componentsFromReport___block_invoke;
  v12[3] = &unk_1E16C67A8;
  v13 = v3;
  v14 = v4;
  v15 = v6;
  v8 = v4;
  v9 = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v10 = objc_alloc_init(_UIDebugReportComponents);
  -[_UIDebugReportComponents setBody:](v10, "setBody:", v8);

  return v10;
}

- (id)stringFromReport:(id)a3
{
  void *v4;
  void *v5;

  -[_UIDebugLogReportFormatter _componentsFromReport:](self, "_componentsFromReport:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDebugReportFormatter stringFromReportComponents:](self, "stringFromReportComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
