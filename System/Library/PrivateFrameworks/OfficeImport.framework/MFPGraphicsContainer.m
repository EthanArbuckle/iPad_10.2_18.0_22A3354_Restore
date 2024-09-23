@implementation MFPGraphicsContainer

- (MFPGraphicsContainer)initWithParentGraphicsState:(id)a3 containerTransform:(CGAffineTransform *)a4
{
  id v7;
  MFPGraphicsContainer *v8;
  MFPGraphicsContainer *v9;
  __int128 v10;
  __int128 v11;
  CGContext *CurrentContext;
  __int128 v13;
  CGAffineTransform v15;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFPGraphicsContainer;
  v8 = -[MFPGraphicsContainer init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->mParentGraphicsState, a3);
    v10 = *(_OWORD *)&a4->a;
    v11 = *(_OWORD *)&a4->tx;
    *(_OWORD *)&v9->mContainerTransform.c = *(_OWORD *)&a4->c;
    *(_OWORD *)&v9->mContainerTransform.tx = v11;
    *(_OWORD *)&v9->mContainerTransform.a = v10;
    CurrentContext = UIGraphicsGetCurrentContext();
    v13 = *(_OWORD *)&v9->mContainerTransform.c;
    *(_OWORD *)&v15.a = *(_OWORD *)&v9->mContainerTransform.a;
    *(_OWORD *)&v15.c = v13;
    *(_OWORD *)&v15.tx = *(_OWORD *)&v9->mContainerTransform.tx;
    CGContextConcatCTM(CurrentContext, &v15);
  }

  return v9;
}

- (id)parentGraphicsState
{
  return self->mParentGraphicsState;
}

- (CGAffineTransform)containerTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].a;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mParentGraphicsState, 0);
}

@end
