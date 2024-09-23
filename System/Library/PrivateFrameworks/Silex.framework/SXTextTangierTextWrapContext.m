@implementation SXTextTangierTextWrapContext

- (SXTextTangierTextWrapContext)initWithColumn:(id)a3 targetLayout:(id)a4
{
  id v7;
  id v8;
  SXTextTangierTextWrapContext *v9;
  TSUPointerKeyDictionary *v10;
  TSUPointerKeyDictionary *wrapPathInverseTransformInRootDictionary;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SXTextTangierTextWrapContext;
  v9 = -[SXTextTangierTextWrapContext init](&v13, sel_init);
  if (v9)
  {
    v10 = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CE0]);
    wrapPathInverseTransformInRootDictionary = v9->_wrapPathInverseTransformInRootDictionary;
    v9->_wrapPathInverseTransformInRootDictionary = v10;

    objc_storeStrong((id *)&v9->_column, a3);
    -[SXTextTangierTextWrapContext setTarget:](v9, "setTarget:", v8);
  }

  return v9;
}

- (void)setTarget:(id)a3
{
  void *v4;
  void *v5;
  __int128 v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  objc_storeWeak((id *)&self->_target, a3);
  -[SXTextTangierTextWrapContext target](self, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "transformInRoot");
  else
    memset(&v7, 0, sizeof(v7));
  CGAffineTransformInvert(&v8, &v7);
  v6 = *(_OWORD *)&v8.c;
  *(_OWORD *)&self->_targetInverseTransformInRoot.a = *(_OWORD *)&v8.a;
  *(_OWORD *)&self->_targetInverseTransformInRoot.c = v6;
  *(_OWORD *)&self->_targetInverseTransformInRoot.tx = *(_OWORD *)&v8.tx;

}

- (id)transformedWrapPolygonForWrappable:(id)a3 canvasSpaceToWrapSpaceTransform:(CGAffineTransform *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v6 = a3;
  -[SXTextTangierTextWrapContext wrapPathInverseTransformInRootDictionary](self, "wrapPathInverseTransformInRootDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v6, "wrapPolygon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "copy");

    if (v8)
    {
      objc_msgSend(v8, "bezierPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "intersectsSelf");
      v12 = *(_OWORD *)&self->_targetInverseTransformInRoot.c;
      v16 = *(_OWORD *)&self->_targetInverseTransformInRoot.a;
      v17 = v12;
      v18 = *(_OWORD *)&self->_targetInverseTransformInRoot.tx;
      objc_msgSend(v10, "transformUsingAffineTransform:", &v16);
      v13 = *(_OWORD *)&a4->c;
      v16 = *(_OWORD *)&a4->a;
      v17 = v13;
      v18 = *(_OWORD *)&a4->tx;
      objc_msgSend(v10, "transformUsingAffineTransform:", &v16);
      objc_msgSend(v8, "setPath:", v10);
      objc_msgSend(v8, "setIntersectsSelf:", v11);
      -[TSUPointerKeyDictionary setObject:forUncopiedKey:](self->_wrapPathInverseTransformInRootDictionary, "setObject:forUncopiedKey:", v8, v6);

    }
  }
  v14 = v8;

  return v14;
}

- (TSWPColumn)column
{
  return self->_column;
}

- (TSWPLayoutTarget)target
{
  return (TSWPLayoutTarget *)objc_loadWeakRetained((id *)&self->_target);
}

- (TSDWrapPolygon)interiorWrapPolygon
{
  return self->_interiorWrapPolygon;
}

- (CGAffineTransform)targetInverseTransformInRoot
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].d;
  return self;
}

- (TSUPointerKeyDictionary)wrapPathInverseTransformInRootDictionary
{
  return self->_wrapPathInverseTransformInRootDictionary;
}

- (void)setWrapPathInverseTransformInRootDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_wrapPathInverseTransformInRootDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapPathInverseTransformInRootDictionary, 0);
  objc_storeStrong((id *)&self->_interiorWrapPolygon, 0);
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_column, 0);
}

@end
