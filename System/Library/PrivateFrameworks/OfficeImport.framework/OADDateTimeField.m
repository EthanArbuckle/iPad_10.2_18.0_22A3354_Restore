@implementation OADDateTimeField

- (OADDateTimeField)init
{
  OADDateTimeField *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADDateTimeField;
  result = -[OADTextField init](&v3, sel_init);
  if (result)
    result->_format = -1;
  return result;
}

- (BOOL)isEmpty
{
  BOOL v3;
  void *v4;

  if (-[OADDateTimeField format](self, "format") != -1)
    return 0;
  -[OADTextField text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") == 0;

  return v3;
}

- (void)setFormat:(int)a3
{
  self->_format = a3;
}

- (BOOL)isSimilarToTextRun:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADDateTimeField;
  if (-[OADTextRun isSimilarToTextRun:](&v8, sel_isSimilarToTextRun_, v4))
  {
    v5 = -[OADDateTimeField format](self, "format");
    v6 = v5 == objc_msgSend(v4, "format");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)format
{
  return self->_format;
}

@end
