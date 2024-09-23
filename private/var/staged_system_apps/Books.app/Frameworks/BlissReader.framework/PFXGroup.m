@implementation PFXGroup

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  THWPStorage *v6;
  THGroupInfo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFXGroup;
  -[PFXDrawable mapStartElementWithState:](&v9, "mapStartElementWithState:");
  v5 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  v6 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", +[THTemporaryObjectContext context](THTemporaryObjectContext, "context"), &stru_43D7D8, objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), 3);
  objc_msgSend(v5, "setOverriddenStorage:", v6);

  v7 = -[THGroupInfo initWithContext:geometry:]([THGroupInfo alloc], "initWithContext:geometry:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry"));
  objc_msgSend(v5, "setResult:", v7);

  return 1;
}

+ (void)addChildInfo:(id)a3 toGroupInfo:(id)a4
{
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (objc_msgSend(a3, "conformsToProtocol:", &OBJC_PROTOCOL___TSDInfo))
  {
    objc_msgSend(a4, "addChildInfo:", a3);
  }
  else
  {
    v7 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(a3);
            objc_msgSend(a1, "addChildInfo:toGroupInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), a4);
            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }
    }
  }
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  char *v7;
  char *v8;
  char *i;
  objc_super v10;

  v5 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  v6 = objc_msgSend(v5, "result");
  v7 = (char *)objc_msgSend(v5, "childResultCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      +[PFXGroup addChildInfo:toGroupInfo:](PFXGroup, "addChildInfo:toGroupInfo:", objc_msgSend(v5, "childResultAtIndex:", i), v6);
    objc_msgSend(v6, "ensureGeometryFitsChildren");
  }
  else
  {
    objc_msgSend(v5, "setResult:", 0);
  }
  v10.receiver = self;
  v10.super_class = (Class)PFXGroup;
  -[PFXDrawable mapEndElementWithState:](&v10, "mapEndElementWithState:", a3);
}

@end
