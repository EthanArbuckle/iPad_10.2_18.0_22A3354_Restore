@implementation CHXDrawingState

- (CHXDrawingState)initWithCHXState:(id)a3
{
  id v5;
  OAXClient *v6;
  CHXDrawingState *v7;
  CHXDrawingState *v8;
  objc_super v10;

  v5 = a3;
  v6 = objc_alloc_init(OAXClient);
  v10.receiver = self;
  v10.super_class = (Class)CHXDrawingState;
  v7 = -[OAXDrawingState initWithClient:](&v10, sel_initWithClient_, v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->mCHXState, a3);

  return v8;
}

- (id)chxState
{
  return self->mCHXState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCHXState, 0);
}

@end
