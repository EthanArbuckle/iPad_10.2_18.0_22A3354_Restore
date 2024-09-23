@implementation APOdmlSortableObject

- (APOdmlSortableObject)initWithRankable:(id)a3 andPTTR:(id)a4
{
  id v7;
  id v8;
  APOdmlSortableObject *v9;
  APOdmlSortableObject *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)APOdmlSortableObject;
  v9 = -[APOdmlSortableObject init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pTTR, a4);
    objc_storeStrong((id *)&v10->_rankable, a3);
  }

  return v10;
}

- (APOdmlRankable)rankable
{
  return self->_rankable;
}

- (NSNumber)pTTR
{
  return self->_pTTR;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pTTR, 0);
  objc_storeStrong((id *)&self->_rankable, 0);
}

@end
