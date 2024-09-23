@implementation ODIList1

- (void)map
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int mMaxPointCount;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  -[ODIState diagram](self->super.mState, "diagram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "children");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v10, "count");
  mMaxPointCount = self->super.mMaxPointCount;
  if (mMaxPointCount >= v5)
    v7 = v5;
  else
    v7 = mMaxPointCount;
  -[ODIState setPointCount:](self->super.mState, "setPointCount:", v7);
  -[ODIState setLogicalBounds:maintainAspectRatio:](self->super.mState, "setLogicalBounds:maintainAspectRatio:", 0, 0.0, 0.0, 1.0, (float)((float)v7 + (float)((float)(v7 - 1) * 0.080292)));
  if ((_DWORD)v7)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v10, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ODIState setPointIndex:](self->super.mState, "setPointIndex:", i);
      -[ODILinear mapPoint:bounds:](self, "mapPoint:bounds:", v9, 0.0527383367, (double)i * 1.08029197, 0.693711968, 0.729927007);

    }
  }

}

@end
