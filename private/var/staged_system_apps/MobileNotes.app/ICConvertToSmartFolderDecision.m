@implementation ICConvertToSmartFolderDecision

- (ICConvertToSmartFolderDecision)initWithSourceFolder:(id)a3
{
  id v5;
  ICConvertToSmartFolderDecision *v6;
  ICConvertToSmartFolderDecision *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICConvertToSmartFolderDecision;
  v6 = -[ICConvertToSmartFolderDecision init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceFolder, a3);
    -[ICConvertToSmartFolderDecision makeDecision](v7, "makeDecision");
  }

  return v7;
}

- (void)makeDecision
{
  void *v3;
  unsigned int v4;
  ICConvertToSmartFolderDecision *v5;
  void *v6;
  unsigned int v7;
  ICConvertToSmartFolderDecision *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecision sourceFolder](self, "sourceFolder"));
  v4 = objc_msgSend(v3, "isSystemFolder");

  v5 = self;
  if (v4
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecision sourceFolder](self, "sourceFolder")),
        v7 = objc_msgSend(v6, "isSmartFolder"),
        v6,
        v5 = self,
        v7))
  {
    -[ICConvertToSmartFolderDecision setType:](v5, "setType:", 1);
    v8 = self;
    v9 = 0;
LABEL_4:
    -[ICConvertToSmartFolderDecision setAdditionalStep:](v8, "setAdditionalStep:", v9);
    return;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecision sourceFolder](self, "sourceFolder"));
  v11 = objc_msgSend(v10, "isSharedViaICloud");

  if (v11)
  {
    -[ICConvertToSmartFolderDecision setType:](self, "setType:", 2);
    v8 = self;
    v9 = 3;
    goto LABEL_4;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecision sourceFolder](self, "sourceFolder"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "visibleSubFolders"));
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[ICConvertToSmartFolderDecision setType:](self, "setType:", 2);
    v8 = self;
    v9 = 4;
    goto LABEL_4;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecision sourceFolder](self, "sourceFolder", 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "visibleNotesIncludingChildFolders"));

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    v20 = 6;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v22, "isPasswordProtected") & 1) != 0)
          goto LABEL_21;
        if ((objc_msgSend(v22, "isSharedViaICloud") & 1) != 0)
        {
          v20 = 5;
LABEL_21:
          -[ICConvertToSmartFolderDecision setType:](self, "setType:", 2);
          -[ICConvertToSmartFolderDecision setAdditionalStep:](self, "setAdditionalStep:", v20);

          return;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v18)
        continue;
      break;
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecision sourceFolder](self, "sourceFolder"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "parent"));

  -[ICConvertToSmartFolderDecision setType:](self, "setType:", 0);
  if (v24)
    v25 = 2;
  else
    v25 = 1;
  -[ICConvertToSmartFolderDecision setAdditionalStep:](self, "setAdditionalStep:", v25);
}

+ (BOOL)canShowConvertToSmartFolder:(id)a3
{
  id v3;
  ICConvertToSmartFolderDecision *v4;

  v3 = a3;
  v4 = -[ICConvertToSmartFolderDecision initWithSourceFolder:]([ICConvertToSmartFolderDecision alloc], "initWithSourceFolder:", v3);

  LOBYTE(v3) = (id)-[ICConvertToSmartFolderDecision type](v4, "type") != (id)1;
  return (char)v3;
}

- (ICFolder)sourceFolder
{
  return self->_sourceFolder;
}

- (void)setSourceFolder:(id)a3
{
  objc_storeStrong((id *)&self->_sourceFolder, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)additionalStep
{
  return self->_additionalStep;
}

- (void)setAdditionalStep:(unint64_t)a3
{
  self->_additionalStep = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceFolder, 0);
}

@end
