@implementation TSDContainerLayout

- (TSDContainerLayout)initWithInfo:(id)a3
{
  void *v5;
  uint64_t v6;
  objc_super v8;

  if (a3 && (objc_msgSend(a3, "conformsToProtocol:", &unk_254F72128) & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContainerLayout initWithInfo:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerLayout.m"), 19, CFSTR("info is wrong protocol for layout"));
  }
  v8.receiver = self;
  v8.super_class = (Class)TSDContainerLayout;
  return -[TSDLayout initWithInfo:](&v8, sel_initWithInfo_, a3);
}

- (id)childInfosForLayout
{
  return (id)objc_msgSend(-[TSDContainerLayout containerInfo](self, "containerInfo"), "childInfos");
}

- (void)updateChildrenFromInfo
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSDContainerLayout childInfosForLayout](self, "childInfosForLayout");
  v4 = -[TSDAbstractLayout children](self, "children");
  v5 = objc_msgSend(v3, "count");
  if (v5 == -[NSArray count](v4, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (!v6)
      goto LABEL_22;
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v25;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v9)
        objc_enumerationMutation(v3);
      v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
      if (objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", v8 + v10), "info") != v11)
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        v8 += v10;
        if (v7)
          goto LABEL_4;
        goto LABEL_22;
      }
    }
  }
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = -[TSDLayout layoutController](self, "layoutController");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v3);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v19 = (id)objc_msgSend(v13, "layoutForInfo:childOfLayout:", v18, self);
        if (!v19)
        {
          v19 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v18, "layoutClass")), "initWithInfo:", v18);
          if (!v19)
            continue;
        }
        objc_msgSend(v12, "addObject:", v19);

      }
      v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }
  -[TSDAbstractLayout setChildren:](self, "setChildren:", v12);

  -[TSDLayout invalidate](self, "invalidate");
LABEL_22:
  -[NSArray makeObjectsPerformSelector:](-[TSDAbstractLayout children](self, "children"), "makeObjectsPerformSelector:", sel_updateChildrenFromInfo);
}

@end
