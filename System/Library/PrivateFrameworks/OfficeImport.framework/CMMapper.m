@implementation CMMapper

- (CMMapper)initWithParent:(id)a3
{
  id v4;
  CMMapper *v5;
  CMMapper *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMMapper;
  v5 = -[CMMapper init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mParent, v4);
    objc_msgSend(v4, "root");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = v4;
    objc_storeWeak((id *)&v6->mRoot, v9);

  }
  return v6;
}

- (void)addStyleUsingGlobalCacheTo:(id)a3 style:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a4, "cssStyleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    -[CMMapper archiver](self, "archiver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addCssStyle:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3C7218, v9, v8);
    else
      -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3C9458, v9, v6);

  }
}

- (void)addAttribute:(id)a3 toNode:(id)a4 value:(id)a5
{
  void *v7;
  id v8;

  v8 = a4;
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", a3, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttribute:", v7);

}

- (void)addStyleUsingGlobalCacheTo:(id)a3 style:(id)a4 embedStyle:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = v8;
  if (a5)
  {
    objc_msgSend(v8, "cssStyleString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", CFSTR("style"), v11, v10);

  }
  else
  {
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v11, v8);
  }

}

- (id)root
{
  return objc_loadWeakRetained((id *)&self->mRoot);
}

- (CMMapper)parent
{
  return (CMMapper *)objc_loadWeakRetained((id *)&self->mParent);
}

- (id)archiver
{
  CMArchiveManager *mArchiver;
  CMArchiveManager *v3;
  CMMapper **p_mRoot;
  id WeakRetained;
  int v6;
  id v7;

  mArchiver = self->mArchiver;
  if (mArchiver)
  {
    v3 = mArchiver;
  }
  else
  {
    p_mRoot = &self->mRoot;
    WeakRetained = objc_loadWeakRetained((id *)&self->mRoot);
    v6 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_255B568A0);

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)p_mRoot);
      objc_msgSend(v7, "archiver");
      v3 = (CMArchiveManager *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)mapStylesheetAt:(id)a3 stylesheet:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 17, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3DF6B8, 0x24F3E6838);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:", v6);

  objc_msgSend(v7, "addChild:", v5);
}

- (CMMapper)init
{
  return -[CMMapper initWithParent:](self, "initWithParent:", 0);
}

- (void)addStyle:(id)a3 withName:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "cssStyleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMMapper archiver](self, "archiver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addCssStyle:withName:", v6, v8);

}

- (void)mapAt:(id)a3 withState:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CMMapper.mm"), 99, CFSTR("Please implement -[%@ %@]"), v6, v7);

}

- (void)mapWithState:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CMMapper.mm"), 105, CFSTR("Please implement -[%@ %@]"), v5, v6);

}

- (OCDDocument)document
{
  return self->_document;
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->mArchiver, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_destroyWeak((id *)&self->mRoot);
  objc_destroyWeak((id *)&self->mParent);
}

@end
