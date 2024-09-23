@implementation PFAIGlossaryDrawablePlacement

- (void)addFloatingDrawable:(id)a3 withState:(id)a4
{
  objc_msgSend(objc_msgSend(a4, "entryBody"), "addFloatingInfo:", a3);
}

- (void)mapNonChildPlacementModeWithState:(id)a3
{
  int v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  if (objc_msgSend(a3, "ancestorEntryWithReaderClass:", objc_opt_class(PFXBlock)))
    goto LABEL_2;
  self->super.mMode = 1;
  v6 = objc_msgSend(a3, "currentHtmlStackEntry");
  if (xmlStrEqual((const xmlChar *)objc_msgSend(v6, "xmlElementName"), (const xmlChar *)"table"))
  {
    v7 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "currentEntryMediaState"), "propertySet"), "valueForProperty:", "position");
    if (objc_msgSend(v7, "count") == (char *)&dword_0 + 1)
    {
      v8 = objc_opt_class(PFSPair);
      *(_QWORD *)&v10 = TSUDynamicCast(v8, objc_msgSend(v7, "lastObject")).n128_u64[0];
      if (v9)
      {
        if (objc_msgSend(+[PFSUtilities identValueOrNilFromPair:](PFSUtilities, "identValueOrNilFromPair:", v9, v10), "isEqualToString:", CFSTR("absolute")))v5 = 1;
        else
          v5 = 2;
        goto LABEL_3;
      }
    }
LABEL_2:
    v5 = 2;
LABEL_3:
    self->super.mMode = v5;
  }
}

- (void)mapNonChildResults:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->super.mMode == 1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(a3);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___TSDInfo))
            objc_msgSend(objc_msgSend(a4, "entryBody"), "addFloatingInfo:", v10);
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
  }
}

@end
