@implementation GEOComposedRouteLaneInfo

+ (id)_debug_laneWithDirections:(id)a3 good:(BOOL)a4 preferred:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v7 = a3;
  v8 = objc_alloc_init((Class)GEOComposedRouteLaneInfo);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v7;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v16 = objc_alloc_init((Class)GEOLaneArrowhead);
          objc_msgSend(v16, "setCategory:", objc_msgSend(v15, "integerValue"));
          v17 = objc_msgSend(objc_alloc((Class)GEOComposedRouteLaneDirectionInfo), "initWithLaneArrowHead:", v16);
          objc_msgSend(v9, "addObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    objc_msgSend(v8, "setDirections:", v9);
    *((_BYTE *)v8 + OBJC_IVAR___GEOComposedRouteLaneInfo__good) = a4;
    *((_BYTE *)v8 + OBJC_IVAR___GEOComposedRouteLaneInfo__preferred) = a5;

    v7 = v19;
  }

  return v8;
}

+ (id)_debug_straightLane
{
  return objc_msgSend(a1, "_debug_laneWithDirections:good:preferred:", &off_101274298, 0, 0);
}

@end
