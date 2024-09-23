@implementation MTOptionsDescription

+ (id)optionsWithLongTitles:(id)a3 shortTitles:(id)a4 valueList:(id)a5 footerTextCallback:(id)a6 headerTextCallback:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  MTOptionsDescription *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(MTOptionsDescription);
  -[MTOptionsDescription setShortTitles:](v16, "setShortTitles:", v14);

  -[MTOptionsDescription setLongTitles:](v16, "setLongTitles:", v15);
  -[MTOptionsDescription setValueSet:](v16, "setValueSet:", v13);

  -[MTOptionsDescription setFooterCallback:](v16, "setFooterCallback:", v12);
  -[MTOptionsDescription setHeaderCallback:](v16, "setHeaderCallback:", v11);

  return v16;
}

+ (id)optionsWithLongTitles:(id)a3 shortTitles:(id)a4 valueList:(id)a5
{
  return objc_msgSend(a1, "optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:", a3, a4, a5, 0, 0);
}

- (unint64_t)indexForValue:(unint64_t)a3
{
  NSOrderedSet *valueSet;
  void *v4;
  NSUInteger v5;

  valueSet = self->_valueSet;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v5 = -[NSOrderedSet indexOfObject:](valueSet, "indexOfObject:", v4);

  return v5;
}

- (unint64_t)valueForIndex:(unint64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSOrderedSet objectAtIndex:](self->_valueSet, "objectAtIndex:", a3));
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return (unint64_t)v4;
}

- (NSArray)longTitles
{
  return self->_longTitles;
}

- (void)setLongTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)shortTitles
{
  return self->_shortTitles;
}

- (void)setShortTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSOrderedSet)valueSet
{
  return self->_valueSet;
}

- (void)setValueSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)footerCallback
{
  return self->_footerCallback;
}

- (void)setFooterCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)headerCallback
{
  return self->_headerCallback;
}

- (void)setHeaderCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_headerCallback, 0);
  objc_storeStrong(&self->_footerCallback, 0);
  objc_storeStrong((id *)&self->_valueSet, 0);
  objc_storeStrong((id *)&self->_shortTitles, 0);
  objc_storeStrong((id *)&self->_longTitles, 0);
}

@end
