@implementation SXTransitionDataSourceProvider

- (SXTransitionDataSourceProvider)initWithComponentController:(id)a3 scrollView:(id)a4 documentMetadataProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXTransitionDataSourceProvider *v12;
  SXTransitionDataSourceProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXTransitionDataSourceProvider;
  v12 = -[SXTransitionDataSourceProvider init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_componentController, a3);
    objc_storeStrong((id *)&v13->_scrollView, a4);
    objc_storeStrong((id *)&v13->_documentMetadataProvider, a5);
  }

  return v13;
}

- (id)transitionDataSourceForType:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  SXTransitionDataSourceNode *v23;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[SXTransitionDataSourceProvider currentNode](self, "currentNode");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[SXTransitionDataSourceProvider currentNode](self, "currentNode"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "transitionType"),
        v7,
        v6,
        v8 != a3))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[SXTransitionDataSourceProvider componentController](self, "componentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "flattenedComponentViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v25 = a3;
      v12 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v14, "transitionViewIsVisible"))
          {
            if (objc_msgSend(v14, "isTransitionable"))
            {
              -[SXTransitionDataSourceProvider documentMetadataProvider](self, "documentMetadataProvider");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "metadata");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "thumbnailImageIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v14, "usesThumbnailWithImageIdentifier:", v17);

              if (v18)
              {
                v11 = v14;
                -[SXTransitionDataSourceProvider scrollView](self, "scrollView");
                v19 = (id)objc_claimAutoreleasedReturnValue();

                v20 = v11;
                a3 = v25;
                if (v11)
                {
                  v20 = v11;
                  if (v11 != v19)
                  {
                    v21 = v11;
                    do
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        objc_msgSend(v21, "prepareForTransitionType:", v25);
                      objc_msgSend(v21, "superview");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();

                      -[SXTransitionDataSourceProvider scrollView](self, "scrollView");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v20)
                        break;
                      v21 = v20;
                    }
                    while (v20 != v22);
                  }
                }

                goto LABEL_22;
              }
            }
          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v11)
          continue;
        break;
      }
      a3 = v25;
    }
LABEL_22:

    v23 = -[SXTransitionDataSourceNode initWithComponentView:transitionType:usesThumbnail:]([SXTransitionDataSourceNode alloc], "initWithComponentView:transitionType:usesThumbnail:", v11, a3, v11 != 0);
    -[SXTransitionDataSourceProvider setCurrentNode:](self, "setCurrentNode:", v23);

  }
  -[SXTransitionDataSourceProvider currentNode](self, "currentNode");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SXComponentController)componentController
{
  return self->_componentController;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (SXDocumentMetadataProviding)documentMetadataProvider
{
  return self->_documentMetadataProvider;
}

- (SXTransitionDataSourceNode)currentNode
{
  return self->_currentNode;
}

- (void)setCurrentNode:(id)a3
{
  objc_storeStrong((id *)&self->_currentNode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNode, 0);
  objc_storeStrong((id *)&self->_documentMetadataProvider, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_componentController, 0);
}

@end
