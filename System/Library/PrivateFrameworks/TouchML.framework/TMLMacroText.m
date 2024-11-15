@implementation TMLMacroText

+ (id)macroTextWithMacroText:(id)a3 basePath:(id)a4 filename:(id)a5
{
  id v7;
  id v8;
  id v9;
  TMLMacroText *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(TMLMacroText);
  objc_msgSend_setMacroText_(v10, v11, v12, v9);

  objc_msgSend_setBasePath_(v10, v13, v14, v8);
  objc_msgSend_setFilename_(v10, v15, v16, v7);

  return v10;
}

- (NSString)macroText
{
  return self->macroText;
}

- (void)setMacroText:(id)a3
{
  objc_storeStrong((id *)&self->macroText, a3);
}

- (NSString)basePath
{
  return self->basePath;
}

- (void)setBasePath:(id)a3
{
  objc_storeStrong((id *)&self->basePath, a3);
}

- (NSString)filename
{
  return self->filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->filename, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->filename, 0);
  objc_storeStrong((id *)&self->basePath, 0);
  objc_storeStrong((id *)&self->macroText, 0);
}

@end
