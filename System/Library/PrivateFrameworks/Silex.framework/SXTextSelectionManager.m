@implementation SXTextSelectionManager

- (SXTextSelectionManager)init
{
  SXTextSelectionManager *v2;
  uint64_t v3;
  NSHashTable *textSelecting;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXTextSelectionManager;
  v2 = -[SXTextSelectionManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v3 = objc_claimAutoreleasedReturnValue();
    textSelecting = v2->_textSelecting;
    v2->_textSelecting = (NSHashTable *)v3;

  }
  return v2;
}

- (NSString)selectedText
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SXTextSelectionManager textSelecting](self, "textSelecting", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "selectedText");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v3 = v6;

          v2 = v3;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (NSString *)v3;
}

- (void)addTextSelecting:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXTextSelectionManager textSelecting](self, "textSelecting");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)clearSelection
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SXTextSelectionManager textSelecting](self, "textSelecting", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "endSelection");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSHashTable)textSelecting
{
  return self->_textSelecting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSelecting, 0);
}

@end
