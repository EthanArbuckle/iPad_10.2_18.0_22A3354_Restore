@implementation ODDDataPoint

- (void)addPresentation:(id)a3 order:(unint64_t)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *mPresentations;
  NSMutableArray *v10;

  v6 = a3;
  v7 = self->mPresentations;
  v10 = v7;
  objc_msgSend((id)objc_opt_class(), "addConnectionToPoint:order:array:", v6, a4, &v10);
  v8 = v10;

  mPresentations = self->mPresentations;
  self->mPresentations = v8;

}

- (void)addAssociatedPresentation:(id)a3
{
  id v4;
  NSMutableArray *mPresentations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mPresentations = self->mPresentations;
  v8 = v4;
  if (mPresentations)
  {
    if (-[NSMutableArray indexOfObjectIdenticalTo:](mPresentations, "indexOfObjectIdenticalTo:", v4) == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray addObject:](self->mPresentations, "addObject:", v8);
  }
  else
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v4, 0);
    v7 = self->mPresentations;
    self->mPresentations = v6;

  }
}

- (id)presentations
{
  return self->mPresentations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPresentations, 0);
}

@end
