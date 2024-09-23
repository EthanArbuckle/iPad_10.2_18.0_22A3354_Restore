@implementation CRLCanvasLayoutControllerTemporaryCanvasDelegate

- (CRLCanvasLayoutControllerTemporaryCanvasDelegate)initWithInfos:(id)a3
{
  id v4;
  CRLCanvasLayoutControllerTemporaryCanvasDelegate *v5;
  CRLCanvasLayoutControllerTemporaryCanvasDelegate *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *i;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  NSDictionary *v25;
  NSDictionary *UUIDsToBoardItems;
  CRLCanvasLayoutControllerTemporaryCanvasDelegate *v28;
  id v29;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CRLCanvasLayoutControllerTemporaryCanvasDelegate;
  v5 = -[CRLCanvasLayoutControllerTemporaryCanvasDelegate init](&v40, "init");
  v6 = v5;
  if (v5)
  {
    v28 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v29 = v4;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v8)
    {
      v10 = v8;
      v31 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v31)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          objc_opt_class(_TtC8Freeform12CRLBoardItem, v9);
          v14 = sub_100221D0C(v13, v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          v16 = v15;
          if (v15)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "id"));
            objc_msgSend(v7, "setObject:forKey:", v16, v17);

            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "additionalBoardItemsForUUIDBookkeepingForTemporaryCanvases"));
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v33;
              do
              {
                for (j = 0; j != v20; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v33 != v21)
                    objc_enumerationMutation(v18);
                  v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "id"));
                  objc_msgSend(v7, "setObject:forKey:", v23, v24);

                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
              }
              while (v20);
            }

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v10);
    }

    v25 = (NSDictionary *)objc_msgSend(v7, "copy");
    v6 = v28;
    UUIDsToBoardItems = v28->_UUIDsToBoardItems;
    v28->_UUIDsToBoardItems = v25;

    v4 = v29;
  }

  return v6;
}

- (id)getBoardItemForUUID:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_UUIDsToBoardItems, "objectForKeyedSubscript:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDsToBoardItems, 0);
}

@end
