@implementation BCAudioBookPosition

+ (id)positionWithChapter:(int64_t)a3 time:(double)a4
{
  BCAudioBookPosition *v6;

  v6 = objc_alloc_init(BCAudioBookPosition);
  -[BCAudioBookPosition setTimePosition:](v6, "setTimePosition:", a4);
  -[BCAudioBookPosition setChapterNum:](v6, "setChapterNum:", a3);
  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = objc_opt_class(BCAudioBookPosition);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = -[BCAudioBookPosition chapterNum](self, "chapterNum");
  if (v8 == objc_msgSend(v7, "chapterNum"))
  {
    -[BCAudioBookPosition timePosition](self, "timePosition");
    v10 = v9;
    objc_msgSend(v7, "timePosition");
    if (v10 == v11)
    {
      v15 = 0;
    }
    else
    {
      -[BCAudioBookPosition timePosition](self, "timePosition");
      v13 = v12;
      objc_msgSend(v7, "timePosition");
      if (v13 >= v14)
        v15 = 1;
      else
        v15 = -1;
    }
  }
  else
  {
    v16 = -[BCAudioBookPosition chapterNum](self, "chapterNum");
    if (v16 < (uint64_t)objc_msgSend(v7, "chapterNum"))
      v15 = -1;
    else
      v15 = 1;
  }

  return v15;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[BCAudioBookPosition chapterNum](self, "chapterNum")));
  -[BCAudioBookPosition timePosition](self, "timePosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BCAudioBookPosition(chapter:%@ time:%@)"), v3, v4));

  return (NSString *)v5;
}

- (double)timePosition
{
  return self->_timePosition;
}

- (void)setTimePosition:(double)a3
{
  self->_timePosition = a3;
}

- (int64_t)chapterNum
{
  return self->_chapterNum;
}

- (void)setChapterNum:(int64_t)a3
{
  self->_chapterNum = a3;
}

@end
