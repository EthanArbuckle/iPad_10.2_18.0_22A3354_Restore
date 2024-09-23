@implementation TUILayoutOptionsLayout

- (void)onChildrenUpdated
{
  TUILayout *chosenChild;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUILayoutOptionsLayout;
  -[TUILayout onChildrenUpdated](&v4, "onChildrenUpdated");
  chosenChild = self->_chosenChild;
  self->_chosenChild = 0;

}

- (BOOL)validatesAllChildren
{
  return 0;
}

- (void)onChildInvalidate:(id)a3
{
  TUILayout *chosenChild;
  void *v5;
  id v6;
  unint64_t chosenIndex;
  TUILayout *v8;

  chosenChild = (TUILayout *)a3;
  v8 = chosenChild;
  if (self->_chosenChild == chosenChild)
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v8);
  chosenIndex = self->_chosenIndex;

  if ((unint64_t)v6 < chosenIndex)
  {
    chosenChild = self->_chosenChild;
LABEL_4:
    self->_chosenChild = 0;

  }
}

- (void)onInvalidate
{
  TUILayout *chosenChild;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUILayoutOptionsLayout;
  -[TUILayout onInvalidate](&v4, "onInvalidate");
  chosenChild = self->_chosenChild;
  self->_chosenChild = 0;

  self->_chosenIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)onChildInvalidateIntrinsicSize:(id)a3
{
  TUILayout *chosenChild;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUILayoutOptionsLayout;
  -[TUILayout onChildInvalidateIntrinsicSize:](&v5, "onChildInvalidateIntrinsicSize:", a3);
  chosenChild = self->_chosenChild;
  self->_chosenChild = 0;

  self->_chosenIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (id)computedBoundsChildrenWithFlags:(unint64_t)a3
{
  void *v3;
  TUILayout *chosenChild;

  if (self->_chosenChild)
  {
    chosenChild = self->_chosenChild;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &chosenChild, 1));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  void *v3;
  void *v4;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v4, "validatedIntrinsicWidthConsideringSpecified");
  return v5;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  void *v3;
  void *v4;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v4, "validatedIntrinsicHeightConsideringSpecified");
  return v5;
}

- (void)computeLayout
{
  TUILayout *chosenChild;
  void *v4;
  TUILayout *v5;
  TUILayout *v6;
  _QWORD v7[5];

  chosenChild = self->_chosenChild;
  if (!chosenChild)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_7A514;
    v7[3] = &unk_23FF28;
    v7[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
    if (!self->_chosenChild && objc_msgSend(v4, "count"))
    {
      v5 = (TUILayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
      v6 = self->_chosenChild;
      self->_chosenChild = v5;

      self->_chosenIndex = (unint64_t)objc_msgSend(v4, "count") - 1;
    }

    chosenChild = self->_chosenChild;
  }
  -[TUILayout setComputedOrigin:](chosenChild, "setComputedOrigin:", CGPointZero.x, CGPointZero.y);
  -[TUILayout computedTransformedSize](self->_chosenChild, "computedTransformedSize");
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");
}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v10;
  id v11;
  void *v12;
  __int128 v13;
  _OWORD v14[3];
  TUILayout *chosenChild;

  if (self->_chosenChild)
  {
    chosenChild = self->_chosenChild;
    v10 = a6;
    v11 = a4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &chosenChild, 1));
    v13 = *(_OWORD *)&a5->c;
    v14[0] = *(_OWORD *)&a5->a;
    v14[1] = v13;
    v14[2] = *(_OWORD *)&a5->tx;
    -[TUILayout appendChilden:renderModelCompatibleWithKind:context:transform:toModels:](self, "appendChilden:renderModelCompatibleWithKind:context:transform:toModels:", v12, a3, v11, v14, v10);

  }
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  return -[TUILayout axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:](self->_chosenChild, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", a3, a4, a6, a5.x, a5.y);
}

- (unint64_t)chosenIndex
{
  return self->_chosenIndex;
}

- (void)setChosenIndex:(unint64_t)a3
{
  self->_chosenIndex = a3;
}

- (TUILayout)chosenChild
{
  return self->_chosenChild;
}

- (void)setChosenChild:(id)a3
{
  objc_storeStrong((id *)&self->_chosenChild, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chosenChild, 0);
}

@end
