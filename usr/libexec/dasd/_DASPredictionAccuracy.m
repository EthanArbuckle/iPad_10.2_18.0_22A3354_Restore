@implementation _DASPredictionAccuracy

- (_DASPredictionAccuracy)init
{
  _DASPredictionAccuracy *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DASPredictionAccuracy;
  result = -[_DASPredictionAccuracy init](&v3, "init");
  if (result)
  {
    *(_QWORD *)&result->_top1Hits = 0;
    *(_QWORD *)&result->_top5Hits = 0;
    result->_totalPredictionIntervals = 0;
  }
  return result;
}

- (id)addPredictionAccuracy:(id)a3
{
  __objc2_class *v5;
  id v6;
  __objc2_class *v7;

  v5 = _DASPredictionAccuracy;
  v6 = a3;
  v7 = -[__objc2_class init](v5, "init");
  -[__objc2_class setTop1Hits:](v7, "setTop1Hits:", objc_msgSend(v6, "top1Hits") + -[_DASPredictionAccuracy top1Hits](self, "top1Hits"));
  -[__objc2_class setTop3Hits:](v7, "setTop3Hits:", objc_msgSend(v6, "top3Hits") + -[_DASPredictionAccuracy top3Hits](self, "top3Hits"));
  -[__objc2_class setTop5Hits:](v7, "setTop5Hits:", objc_msgSend(v6, "top5Hits") + -[_DASPredictionAccuracy top5Hits](self, "top5Hits"));
  -[__objc2_class setTop10Hits:](v7, "setTop10Hits:", objc_msgSend(v6, "top10Hits") + -[_DASPredictionAccuracy top10Hits](self, "top10Hits"));
  LODWORD(self) = -[_DASPredictionAccuracy totalPredictionIntervals](self, "totalPredictionIntervals");
  LODWORD(v5) = objc_msgSend(v6, "totalPredictionIntervals");

  -[__objc2_class setTotalPredictionIntervals:](v7, "setTotalPredictionIntervals:", ((_DWORD)v5 + (_DWORD)self));
  return v7;
}

+ (id)initFromDictionaryRepresentation:(id)a3
{
  id v3;
  _DASPredictionAccuracy *v4;
  _DASPredictionAccuracy *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(_DASPredictionAccuracy);
  v5 = v4;
  if (v3 && v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("1")));
    -[_DASPredictionAccuracy setTop1Hits:](v5, "setTop1Hits:", objc_msgSend(v6, "intValue"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("3")));
    -[_DASPredictionAccuracy setTop3Hits:](v5, "setTop3Hits:", objc_msgSend(v7, "intValue"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("5")));
    -[_DASPredictionAccuracy setTop5Hits:](v5, "setTop5Hits:", objc_msgSend(v8, "intValue"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("10")));
    -[_DASPredictionAccuracy setTop10Hits:](v5, "setTop10Hits:", objc_msgSend(v9, "intValue"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("predictionIntervals")));
    -[_DASPredictionAccuracy setTotalPredictionIntervals:](v5, "setTotalPredictionIntervals:", objc_msgSend(v10, "intValue"));

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_top1Hits));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("1"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_top3Hits));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("3"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_top5Hits));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("5"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_top10Hits));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("10"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_totalPredictionIntervals));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("predictionIntervals"));

  return v3;
}

- (id)accuracyRate
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  if (-[_DASPredictionAccuracy totalPredictionIntervals](self, "totalPredictionIntervals") < 1)
  {
    v8 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)-[_DASPredictionAccuracy top1Hits](self, "top1Hits")/ (double)-[_DASPredictionAccuracy totalPredictionIntervals](self, "totalPredictionIntervals")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("top1"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)-[_DASPredictionAccuracy top3Hits](self, "top3Hits")/ ((double)-[_DASPredictionAccuracy totalPredictionIntervals](self, "totalPredictionIntervals")* 3.0)));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("top3"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)-[_DASPredictionAccuracy top5Hits](self, "top5Hits")/ ((double)-[_DASPredictionAccuracy totalPredictionIntervals](self, "totalPredictionIntervals")* 5.0)));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("top5"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)-[_DASPredictionAccuracy top10Hits](self, "top10Hits")/ ((double)-[_DASPredictionAccuracy totalPredictionIntervals](self, "totalPredictionIntervals")* 10.0)));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("top10"));

    v8 = v3;
  }

  return v8;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPredictionAccuracy dictionaryRepresentation](self, "dictionaryRepresentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return v3;
}

- (int)top1Hits
{
  return self->_top1Hits;
}

- (void)setTop1Hits:(int)a3
{
  self->_top1Hits = a3;
}

- (int)top3Hits
{
  return self->_top3Hits;
}

- (void)setTop3Hits:(int)a3
{
  self->_top3Hits = a3;
}

- (int)top5Hits
{
  return self->_top5Hits;
}

- (void)setTop5Hits:(int)a3
{
  self->_top5Hits = a3;
}

- (int)top10Hits
{
  return self->_top10Hits;
}

- (void)setTop10Hits:(int)a3
{
  self->_top10Hits = a3;
}

- (int)totalPredictionIntervals
{
  return self->_totalPredictionIntervals;
}

- (void)setTotalPredictionIntervals:(int)a3
{
  self->_totalPredictionIntervals = a3;
}

@end
