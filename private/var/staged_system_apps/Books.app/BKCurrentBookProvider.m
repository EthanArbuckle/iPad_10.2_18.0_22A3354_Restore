@implementation BKCurrentBookProvider

- (BKCurrentBookProvider)init
{
  BKCurrentBookProvider *v2;
  BSUIDynamicValue *v3;
  BSUIDynamicValue *generatingCurrentBookSnapshot;
  BSUIDynamicValue *v5;
  BSUIDynamicValue *showBookCover;
  BSUIDynamicValue *v7;
  BSUIDynamicValue *spreadPageCount;
  BSUIDynamicValue *v9;
  BSUIDynamicValue *portraitSpread;
  BSUIDynamicValue *v11;
  BSUIDynamicValue *showSquareCover;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKCurrentBookProvider;
  v2 = -[BKCurrentBookProvider init](&v14, "init");
  if (v2)
  {
    v3 = (BSUIDynamicValue *)objc_msgSend(objc_alloc((Class)BSUIDynamicValue), "initWithValue:options:", &__kCFBooleanFalse, &off_10092F458);
    generatingCurrentBookSnapshot = v2->_generatingCurrentBookSnapshot;
    v2->_generatingCurrentBookSnapshot = v3;

    v5 = (BSUIDynamicValue *)objc_msgSend(objc_alloc((Class)BSUIDynamicValue), "initWithValue:options:", &__kCFBooleanTrue, &off_10092F480);
    showBookCover = v2->_showBookCover;
    v2->_showBookCover = v5;

    v7 = (BSUIDynamicValue *)objc_msgSend(objc_alloc((Class)BSUIDynamicValue), "initWithValue:options:", &off_10092EE50, &off_10092F4A8);
    spreadPageCount = v2->_spreadPageCount;
    v2->_spreadPageCount = v7;

    v9 = (BSUIDynamicValue *)objc_msgSend(objc_alloc((Class)BSUIDynamicValue), "initWithValue:options:", &__kCFBooleanFalse, &off_10092F4D0);
    portraitSpread = v2->_portraitSpread;
    v2->_portraitSpread = v9;

    v11 = (BSUIDynamicValue *)objc_msgSend(objc_alloc((Class)BSUIDynamicValue), "initWithValue:options:", &__kCFBooleanTrue, &off_10092F4F8);
    showSquareCover = v2->_showSquareCover;
    v2->_showSquareCover = v11;

  }
  return v2;
}

- (void)setSquareCover:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_squareCover = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKCurrentBookProvider showSquareCover](self, "showSquareCover"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v5, "updateValue:", v4);

}

- (id)imageResourceForNaturalSize:(CGSize)a3 contentsScale:(double)a4 instance:(id)a5 options:(id)a6
{
  return 0;
}

- (id)intrinsicImageResourceForInstance:(id)a3 options:(id)a4
{
  return 0;
}

- (BSUIDynamicValue)generatingCurrentBookSnapshot
{
  return self->_generatingCurrentBookSnapshot;
}

- (BSUIDynamicValue)showBookCover
{
  return self->_showBookCover;
}

- (BSUIDynamicValue)spreadPageCount
{
  return self->_spreadPageCount;
}

- (BSUIDynamicValue)portraitSpread
{
  return self->_portraitSpread;
}

- (BSUIDynamicValue)showSquareCover
{
  return self->_showSquareCover;
}

- (BOOL)squareCover
{
  return self->_squareCover;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showSquareCover, 0);
  objc_storeStrong((id *)&self->_portraitSpread, 0);
  objc_storeStrong((id *)&self->_spreadPageCount, 0);
  objc_storeStrong((id *)&self->_showBookCover, 0);
  objc_storeStrong((id *)&self->_generatingCurrentBookSnapshot, 0);
}

@end
