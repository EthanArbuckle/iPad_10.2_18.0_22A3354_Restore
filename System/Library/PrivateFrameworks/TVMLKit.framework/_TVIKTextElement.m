@implementation _TVIKTextElement

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_TVIKTextElement;
  -[_TVIKTextElement dealloc](&v4, sel_dealloc);
}

- (void)setCachedAttributedString:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *cachedAttributedString;
  void *v6;
  void *v7;
  id v8;

  v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
  cachedAttributedString = self->_cachedAttributedString;
  self->_cachedAttributedString = v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("TVAppDocumentDidMarkStylesDirtyNotification"), 0);

  if (self->_cachedAttributedString)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[_TVIKTextElement appDocument](self, "appDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__stylesMarkedDirtyNotification_, CFSTR("TVAppDocumentDidMarkStylesDirtyNotification"), v7);

  }
}

- (void)_stylesMarkedDirtyNotification:(id)a3
{
  if (-[_TVIKTextElement updateType](self, "updateType", a3) == 2
    || -[_TVIKTextElement updateType](self, "updateType") == 4)
  {
    -[_TVIKTextElement setCachedAttributedString:](self, "setCachedAttributedString:", 0);
  }
}

- (NSAttributedString)cachedAttributedString
{
  return self->_cachedAttributedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAttributedString, 0);
}

@end
