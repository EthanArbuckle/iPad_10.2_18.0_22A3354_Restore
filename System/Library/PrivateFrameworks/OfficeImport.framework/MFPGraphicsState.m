@implementation MFPGraphicsState

- (MFPGraphicsState)initWithDefaults
{
  MFPGraphicsState *result;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFPGraphicsState;
  result = -[MFPGraphicsState init](&v7, sel_init);
  if (result)
  {
    v3 = (_OWORD *)MEMORY[0x24BDBD8B8];
    v4 = *MEMORY[0x24BDBD8B8];
    v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&result->mPageTransform.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    *(_OWORD *)&result->mPageTransform.c = v5;
    *(_OWORD *)&result->mPageTransform.a = v4;
    v6 = v3[1];
    *(_OWORD *)&result->mWorldTransform.a = *v3;
    *(_OWORD *)&result->mWorldTransform.c = v6;
    *(_OWORD *)&result->mWorldTransform.tx = v3[2];
  }
  return result;
}

- (MFPGraphicsState)initWithGraphicsState:(id)a3
{
  char *v4;
  char *v5;
  MFPGraphicsState *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v12;

  v4 = (char *)a3;
  v12.receiver = self;
  v12.super_class = (Class)MFPGraphicsState;
  v5 = -[MFPGraphicsState init](&v12, sel_init);
  v6 = (MFPGraphicsState *)v5;
  if (v5)
  {
    v7 = *(_OWORD *)(v4 + 8);
    v8 = *(_OWORD *)(v4 + 24);
    *(_OWORD *)(v5 + 40) = *(_OWORD *)(v4 + 40);
    *(_OWORD *)(v5 + 24) = v8;
    *(_OWORD *)(v5 + 8) = v7;
    v9 = *(_OWORD *)(v4 + 56);
    v10 = *(_OWORD *)(v4 + 72);
    *(_OWORD *)(v5 + 88) = *(_OWORD *)(v4 + 88);
    *(_OWORD *)(v5 + 72) = v10;
    *(_OWORD *)(v5 + 56) = v9;
  }

  return v6;
}

- (void)removeTransform:(CGAffineTransform *)a3
{
  CGContext *CurrentContext;
  __int128 v5;
  CGAffineTransform v6;
  CGAffineTransform transform;

  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v6.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v6.c = v5;
  *(_OWORD *)&v6.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformInvert(&transform, &v6);
  CGContextConcatCTM(CurrentContext, &transform);
}

- (CGAffineTransform)pageTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self->ty;
  return self;
}

- (void)setPageTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGContext *CurrentContext;
  __int128 v10;
  CGContext *v11;
  __int128 v12;
  CGAffineTransform v13;
  CGAffineTransform transform;
  _OWORD v15[3];
  _OWORD v16[3];

  v5 = *(_OWORD *)&self->mWorldTransform.c;
  v16[0] = *(_OWORD *)&self->mWorldTransform.a;
  v16[1] = v5;
  v16[2] = *(_OWORD *)&self->mWorldTransform.tx;
  -[MFPGraphicsState removeTransform:](self, "removeTransform:", v16);
  v6 = *(_OWORD *)&self->mPageTransform.c;
  v15[0] = *(_OWORD *)&self->mPageTransform.a;
  v15[1] = v6;
  v15[2] = *(_OWORD *)&self->mPageTransform.tx;
  -[MFPGraphicsState removeTransform:](self, "removeTransform:", v15);
  v7 = *(_OWORD *)&a3->a;
  v8 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mPageTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mPageTransform.c = v8;
  *(_OWORD *)&self->mPageTransform.a = v7;
  CurrentContext = UIGraphicsGetCurrentContext();
  v10 = *(_OWORD *)&self->mPageTransform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->mPageTransform.a;
  *(_OWORD *)&transform.c = v10;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->mPageTransform.tx;
  CGContextConcatCTM(CurrentContext, &transform);
  v11 = UIGraphicsGetCurrentContext();
  v12 = *(_OWORD *)&self->mWorldTransform.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&self->mWorldTransform.a;
  *(_OWORD *)&v13.c = v12;
  *(_OWORD *)&v13.tx = *(_OWORD *)&self->mWorldTransform.tx;
  CGContextConcatCTM(v11, &v13);
}

- (CGAffineTransform)worldTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setWorldTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGContext *CurrentContext;
  __int128 v9;
  CGAffineTransform v10;
  _OWORD v11[3];

  v5 = *(_OWORD *)&self->mWorldTransform.c;
  v11[0] = *(_OWORD *)&self->mWorldTransform.a;
  v11[1] = v5;
  v11[2] = *(_OWORD *)&self->mWorldTransform.tx;
  -[MFPGraphicsState removeTransform:](self, "removeTransform:", v11);
  v6 = *(_OWORD *)&a3->a;
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mWorldTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mWorldTransform.c = v7;
  *(_OWORD *)&self->mWorldTransform.a = v6;
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = *(_OWORD *)&self->mWorldTransform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->mWorldTransform.a;
  *(_OWORD *)&v10.c = v9;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->mWorldTransform.tx;
  CGContextConcatCTM(CurrentContext, &v10);
}

- (void)multiplyWorldTransformBy:(CGAffineTransform *)a3 order:(int)a4
{
  CGAffineTransform *p_mWorldTransform;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform *p_t1;
  CGAffineTransform *p_t2;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGContext *CurrentContext;
  __int128 v16;
  CGAffineTransform v17;
  _OWORD v18[3];
  _OWORD v19[3];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v22;
  _OWORD v23[3];

  p_mWorldTransform = &self->mWorldTransform;
  v7 = *(_OWORD *)&self->mWorldTransform.c;
  v23[0] = *(_OWORD *)&self->mWorldTransform.a;
  v23[1] = v7;
  v23[2] = *(_OWORD *)&self->mWorldTransform.tx;
  -[MFPGraphicsState removeTransform:](self, "removeTransform:", v23);
  if (a4)
  {
    v8 = *(_OWORD *)&p_mWorldTransform->c;
    v19[0] = *(_OWORD *)&p_mWorldTransform->a;
    v19[1] = v8;
    v19[2] = *(_OWORD *)&p_mWorldTransform->tx;
    v9 = *(_OWORD *)&a3->c;
    v18[0] = *(_OWORD *)&a3->a;
    v18[1] = v9;
    v18[2] = *(_OWORD *)&a3->tx;
    p_t1 = (CGAffineTransform *)v19;
    p_t2 = (CGAffineTransform *)v18;
  }
  else
  {
    v12 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v12;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    v13 = *(_OWORD *)&p_mWorldTransform->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&p_mWorldTransform->a;
    *(_OWORD *)&t2.c = v13;
    *(_OWORD *)&t2.tx = *(_OWORD *)&p_mWorldTransform->tx;
    p_t1 = &t1;
    p_t2 = &t2;
  }
  CGAffineTransformConcat(&v22, p_t1, p_t2);
  v14 = *(_OWORD *)&v22.c;
  *(_OWORD *)&p_mWorldTransform->a = *(_OWORD *)&v22.a;
  *(_OWORD *)&p_mWorldTransform->c = v14;
  *(_OWORD *)&p_mWorldTransform->tx = *(_OWORD *)&v22.tx;
  CurrentContext = UIGraphicsGetCurrentContext();
  v16 = *(_OWORD *)&p_mWorldTransform->c;
  *(_OWORD *)&v17.a = *(_OWORD *)&p_mWorldTransform->a;
  *(_OWORD *)&v17.c = v16;
  *(_OWORD *)&v17.tx = *(_OWORD *)&p_mWorldTransform->tx;
  CGContextConcatCTM(CurrentContext, &v17);
}

@end
