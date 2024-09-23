@implementation ODCurareModelInformation

- (ODCurareModelInformation)initWithModelInformation:(id)a3 modelURL:(id)a4
{
  id v6;
  id v7;
  ODCurareModelInformation *v8;
  ODCurareModelInformation *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[ODCurareModelInformation init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[ODCurareModelInformation setModelInformation:](v8, "setModelInformation:", v6);
    -[ODCurareModelInformation setModelURL:](v9, "setModelURL:", v7);
  }

  return v9;
}

- (ODCurareReportFillerModelInformation)modelInformation
{
  return self->_modelInformation;
}

- (void)setModelInformation:(id)a3
{
  objc_storeStrong((id *)&self->_modelInformation, a3);
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_modelInformation, 0);
}

@end
