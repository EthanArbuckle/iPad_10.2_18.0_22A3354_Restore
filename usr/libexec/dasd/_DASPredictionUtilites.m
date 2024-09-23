@implementation _DASPredictionUtilites

+ (id)computeAccuraciesFromSortedPredictions:(id)a3 andObservations:(id)a4 withEqualityOperator:(id)a5
{
  id v7;
  id v8;
  id v9;
  _DASPredictionAccuracy *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v20;
  id obj;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(_DASPredictionAccuracy);
  if (objc_msgSend(v7, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = v8;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (!v11)
      goto LABEL_20;
    v12 = v11;
    v13 = *(_QWORD *)v25;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10002B234;
        v22[3] = &unk_10015D820;
        v16 = v9;
        v22[4] = v15;
        v23 = v16;
        v17 = objc_msgSend(v7, "indexOfObjectPassingTest:", v22);
        if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (!v17)
          {
            -[_DASPredictionAccuracy setTop1Hits:](v10, "setTop1Hits:", -[_DASPredictionAccuracy top1Hits](v10, "top1Hits") + 1);
LABEL_11:
            -[_DASPredictionAccuracy setTop3Hits:](v10, "setTop3Hits:", -[_DASPredictionAccuracy top3Hits](v10, "top3Hits", v20) + 1);
LABEL_12:
            -[_DASPredictionAccuracy setTop5Hits:](v10, "setTop5Hits:", -[_DASPredictionAccuracy top5Hits](v10, "top5Hits", v20) + 1);
LABEL_13:
            -[_DASPredictionAccuracy setTop10Hits:](v10, "setTop10Hits:", -[_DASPredictionAccuracy top10Hits](v10, "top10Hits", v20) + 1);
            goto LABEL_14;
          }
          if ((unint64_t)v17 <= 2)
            goto LABEL_11;
          if ((unint64_t)v17 <= 4)
            goto LABEL_12;
          if ((unint64_t)v17 <= 9)
            goto LABEL_13;
        }
LABEL_14:

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v12 = v18;
      if (!v18)
      {
LABEL_20:

        -[_DASPredictionAccuracy setTotalPredictionIntervals:](v10, "setTotalPredictionIntervals:", -[_DASPredictionAccuracy totalPredictionIntervals](v10, "totalPredictionIntervals") + 1);
        v8 = v20;
        break;
      }
    }
  }

  return v10;
}

@end
