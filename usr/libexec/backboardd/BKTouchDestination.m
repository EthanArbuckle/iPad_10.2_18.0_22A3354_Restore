@implementation BKTouchDestination

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_touchStream);
  objc_storeStrong((id *)&self->_externalReferences, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKTouchDestination;
  v4 = -[BKCAContextDestination copyWithZone:](&v7, "copyWithZone:", a3);
  *((_QWORD *)v4 + 4) = self->_predicate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_touchStream);
  objc_storeWeak((id *)v4 + 5, WeakRetained);

  return v4;
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendSuccinctDescriptionToFormatter:(id)a3
{
  unint64_t predicate;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  predicate = self->_predicate;
  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = v6;
  if ((predicate & 1) == 0)
  {
    if ((predicate & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v7, "addObject:", CFSTR("touchStream"));
    if ((predicate & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v6, "addObject:", CFSTR("hitTest"));
  if ((predicate & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((predicate & 4) != 0)
LABEL_4:
    objc_msgSend(v7, "addObject:", CFSTR("filterDetachedTouches"));
LABEL_5:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR("|")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@)"), v8));

  objc_msgSend(a3, "appendString:withName:", v9, 0);
  v10.receiver = self;
  v10.super_class = (Class)BKTouchDestination;
  -[BKCAContextDestination appendSuccinctDescriptionToFormatter:](&v10, "appendSuccinctDescriptionToFormatter:", a3);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10008D4D4;
  v3[3] = &unk_1000ECD80;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend(a3, "appendProem:block:", self, v3);
}

@end
