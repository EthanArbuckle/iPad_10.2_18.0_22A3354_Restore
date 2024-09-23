@implementation PMState

- (PMState)init
{
  PMState *v2;
  CMOutlineState *v3;
  CMOutlineState *mListState;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PMState;
  v2 = -[CMState init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CMOutlineState);
    mListState = v2->mListState;
    v2->mListState = v3;

  }
  return v2;
}

- (id)listState
{
  return self->mListState;
}

- (id)currentRowStyle
{
  return self->mCurrentRowStyle;
}

- (void)setCurrentRowStyle:(id)a3
{
  OADTablePartStyle *v5;
  OADTablePartStyle *v6;

  v5 = (OADTablePartStyle *)a3;
  if (self->mCurrentRowStyle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mCurrentRowStyle, a3);
    v5 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCurrentRowStyle, 0);
  objc_storeStrong((id *)&self->mListState, 0);
}

@end
