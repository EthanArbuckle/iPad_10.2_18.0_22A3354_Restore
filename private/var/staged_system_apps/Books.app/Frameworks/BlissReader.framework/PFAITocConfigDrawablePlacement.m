@implementation PFAITocConfigDrawablePlacement

- (void)addFloatingDrawable:(id)a3 withState:(id)a4
{
  objc_msgSend(objc_msgSend(a4, "thNodeBody"), "addFloatingInfo:", a3);
}

- (void)mapNonChildPlacementModeWithState:(id)a3
{
  self->super.mMode = 1;
}

- (void)mapNonChildResults:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (self->super.mMode == 1)
  {
    v6 = objc_msgSend(a4, "pageInfo");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(a3);
          v11 = TSUProtocolCast(&OBJC_PROTOCOL___TSDInfo, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10));
          if (v11)
          {
            v12 = v11;
            objc_msgSend(v6, "addFloatingDrawable:insertContext:", v11, 0);
            +[PFAITocConfigDrawablePlacement cacheDrawable:readerState:](PFAITocConfigDrawablePlacement, "cacheDrawable:readerState:", v12, a4);
          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }
}

+ (void)cacheDrawable:(id)a3 readerState:(id)a4
{
  objc_msgSend(objc_msgSend(a4, "pageDrawableList"), "addObject:", a3);
}

@end
