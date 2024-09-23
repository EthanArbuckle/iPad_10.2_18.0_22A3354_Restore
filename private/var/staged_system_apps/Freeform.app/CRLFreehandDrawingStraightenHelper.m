@implementation CRLFreehandDrawingStraightenHelper

- (CRLFreehandDrawingStraightenHelper)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLFreehandDrawingStraightenHelper *v5;
  CRLFreehandDrawingStraightenHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingStraightenHelper;
  v5 = -[CRLFreehandDrawingStraightenHelper init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_icc, v4);

  return v6;
}

- (id)commandForStraighteningShapeItem:(id)a3 toStrokesInUnscaledSpace:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform15CRLCommandGroup *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  CRLCanvasInfoGeometry *v21;
  void *v22;
  CRLCanvasInfoGeometry *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  char v33;
  void *i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char *v40;
  void *v41;
  id v42;
  _TtC8Freeform26CRLCommandInsertBoardItems *v43;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  _TtC8Freeform15CRLCommandGroup *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];

  v6 = a3;
  v7 = a4;
  v8 = -[CRLCommandGroup initWithCommands:]([_TtC8Freeform15CRLCommandGroup alloc], "initWithCommands:", &__NSArray0__struct);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Straighten"), 0, CFSTR("UndoStrings")));
  v53 = v8;
  -[CRLCommandGroup setActionString:](v8, "setActionString:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editingCoordinator"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "boardItemFactory"));

  v15 = (objc_class *)objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v14);
  v54 = v6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentInfo"));
  v17 = sub_1002223BC(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);

  v19 = objc_loadWeakRetained((id *)&self->_icc);
  v46 = (void *)v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layoutForInfo:", v18));

  v21 = [CRLCanvasInfoGeometry alloc];
  v45 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "geometryInRoot"));
  v23 = -[CRLCanvasInfoGeometry initWithLayoutGeometry:](v21, "initWithLayoutGeometry:", v22);

  v47 = v7;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingStraightenHelper p_strokesByClippingMaskedStrokes:](self, "p_strokesByClippingMaskedStrokes:", v7));
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v51)
  {
    v49 = *(_QWORD *)v60;
    v24 = 1;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v60 != v49)
          objc_enumerationMutation(obj);
        v52 = v25;
        v26 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "stroke"));
        objc_msgSend(v27, "width");
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "makeShapeItemsForFreehandDrawingWithPKStroke:adjustedBaseWidth:", v26));

        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v56;
          v33 = v24;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(_QWORD *)v56 != v32)
                objc_enumerationMutation(v29);
              v35 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "geometry"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "geometryRelativeToGeometry:", v23));
              objc_msgSend(v35, "setGeometry:", v37);

              if ((v33 & 1) != 0)
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "commandsToUpdateModelToMatch:", v35));
                -[CRLCommandGroup addCommand:](v53, "addCommand:", v38);

              }
              else
              {
                objc_msgSend(v11, "addObject:", v35);
              }
              v33 = 0;
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
            v33 = 0;
            v24 = 0;
          }
          while (v31);
        }

        v25 = v52 + 1;
      }
      while ((id)(v52 + 1) != v51);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v51);
  }
  if (objc_msgSend(v11, "count"))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "childInfos"));
    v40 = (char *)objc_msgSend(v39, "indexOfObject:", v54);

    if (v40 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "childInfos"));
      v42 = objc_msgSend(v41, "count");

    }
    else
    {
      v42 = v40 + 1;
    }
    v43 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItems:index:]([_TtC8Freeform26CRLCommandInsertBoardItems alloc], "initWithParentContainer:boardItems:index:", v46, v11, v42);
    -[CRLCommandGroup addCommand:](v53, "addCommand:", v43);

  }
  return v53;
}

- (id)p_strokesByClippingMaskedStrokes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  void *v29;
  _BYTE v30[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "_isMaskedStroke"))
        {
          v11 = objc_alloc((Class)PKDrawing);
          v29 = v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
          v13 = objc_msgSend(v11, "initWithStrokes:", v12);

          objc_msgSend(v13, "_clipMaskedStrokes");
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "strokes", 0));
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(_QWORD *)v21 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j));
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v16);
          }

        }
        else
        {
          objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);
}

@end
