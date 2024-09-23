@implementation TUIHScrollBoxLayout

- (TUIHScrollBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  TUIHScrollBoxLayout *v5;
  TUIHScrollBoxLayout *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIHScrollBoxLayout;
  v5 = -[TUILayout initWithModel:parent:controller:](&v9, "initWithModel:parent:controller:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[TUILayout specifiedWidth](v5, "specifiedWidth");
    if ((v7 & 0x6000000000000) == 0x2000000000000)
      -[TUILayout setSpecifiedWidthComputeInherited:](v6, "setSpecifiedWidthComputeInherited:", 1);
  }
  return v6;
}

- (unint64_t)scrollAxis
{
  return 1;
}

- (CGPoint)scrollAdditionalAXTranslation
{
  void *v3;
  void *v4;
  double v5;
  double left;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  if ((objc_opt_respondsToSelector(v4, "layoutScrollGradientInsets") & 1) != 0)
  {
    objc_msgSend(v4, "layoutScrollGradientInsets");
    left = v5;
  }
  else
  {
    left = UIEdgeInsetsZero.left;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  objc_msgSend(v7, "contentsScale");
  -[TUILayout erasableInsetsForContentsScale:](self, "erasableInsetsForContentsScale:");
  v9 = v8;
  v11 = v10;

  if (left >= 0.0)
    left = v11;

  v12 = left;
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)childrenForHoverRegions
{
  return 0;
}

- (void)computeLayout
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  -[TUILayout computeWidth](self, "computeWidth");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v7 = objc_msgSend(v6, "shouldUpdateContainingMetricsForScrollableContent");

  if (v7)
    objc_msgSend(v12, "setContainingWidth:", NAN);
  objc_msgSend(v12, "validateLayout");
  objc_msgSend(v12, "computedTransformedSize");
  v9 = v8;
  if ((objc_opt_respondsToSelector(v12, "layoutScrollContentScrollSizeWithProposedSize:") & 1) != 0)
  {
    objc_msgSend(v12, "layoutScrollContentScrollSizeWithProposedSize:", v4, v9);
    v4 = v10;
    v9 = v11;
  }
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v9);
  -[TUIHScrollBoxLayout _updateAnchorSet](self, "_updateAnchorSet");

}

- (void)onChildTransformedSizeDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[TUIHScrollBoxLayout _updateAnchorSet](self, "_updateAnchorSet");
  -[TUILayout computedNaturalSize](self, "computedNaturalSize");
  v6 = v5;
  objc_msgSend(v4, "computedTransformedSize");
  v8 = v7;

  if (v6 != v8)
    -[TUILayout invalidateLayout](self, "invalidateLayout");
}

- (BOOL)shouldAppendChildAnchorsForAncestor
{
  return 0;
}

- (void)appendEmbeddedAnchorsToSet:(id)a3 inRoot:(id)a4
{
  -[TUIAnchorSet appendTriggerAnchorsToSet:forAxis:](self->_anchorSet, "appendTriggerAnchorsToSet:forAxis:", a3, 2);
}

- (void)_updateAnchorSet
{
  void *v3;
  char *v4;
  void *v5;
  double v6;
  void *v7;
  TUIAnchorSet *v8;
  TUIAnchorSet *anchorSet;
  TUIMutableAnchorSet *v10;

  v10 = -[TUIAnchorSet initWithAxis:]([TUIMutableAnchorSet alloc], "initWithAxis:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layout](self, "layout"));
  v4 = (char *)objc_msgSend(v3, "computedLayoutDirection");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v5, "anchorOffset");
  if (v4 == (_BYTE *)&dword_0 + 2)
    v6 = -v6;
  -[TUIAnchorSet setOffset:](v10, "setOffset:", v6);

  -[TUILayout appendChildAnchorsToSet:inRoot:](self, "appendChildAnchorsToSet:inRoot:", v10, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  objc_msgSend(v7, "contentsScale");
  -[TUIMutableAnchorSet finalizeWithContentsScale:](v10, "finalizeWithContentsScale:");

  v8 = (TUIAnchorSet *)-[TUIMutableAnchorSet copy](v10, "copy");
  anchorSet = self->_anchorSet;
  self->_anchorSet = v8;

}

- (void)_validateLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TUIHScrollBoxLayout;
  -[TUILayout _validateLayout](&v2, "_validateLayout");
}

- (CGRect)computedErasableBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect result;

  v11.receiver = self;
  v11.super_class = (Class)TUIHScrollBoxLayout;
  -[TUILayout computedErasableBounds](&v11, "computedErasableBounds");
  v4 = v3;
  v6 = v5;
  -[TUILayout computedBounds](self, "computedBounds");
  v9 = v4;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v9;
  result.origin.x = v7;
  return result;
}

- (id)_embeddedCollectionModelWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  TUIRenderModelIdentifierMap *v8;
  TUIRenderModelIdentifierMap *renderModelidentifierMap;
  void *v10;
  void *v11;
  NSUUID *v12;
  NSUUID *sectionUUID;
  TUIRenderModelIdentifierMap *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  objc_msgSend(v5, "cachedRenderModelValidatedForLayout:", self);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_12CC68;
  v25 = sub_12CC78;
  v26 = 0;
  if (!self->_renderModelidentifierMap)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = (TUIRenderModelIdentifierMap *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "embeddedIdentifierMapForIdentifier:", v7));
    renderModelidentifierMap = self->_renderModelidentifierMap;
    self->_renderModelidentifierMap = v8;

  }
  if (!self->_sectionUUID)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v12 = (NSUUID *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "embeddedUUIDForIdentifier:", v11));
    sectionUUID = self->_sectionUUID;
    self->_sectionUUID = v12;

  }
  v14 = self->_renderModelidentifierMap;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_12CC80;
  v18[3] = &unk_23D7A8;
  v18[4] = self;
  v15 = v4;
  v19 = v15;
  v20 = &v21;
  objc_msgSend(v15, "evaluateWithIdentifierMap:block:", v14, v18);
  v16 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v16;
}

- (id)modelIdentifierForScrollable
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "modelIdentifierForScrollable"));

  return v3;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6;
  uint64_t v7;
  TUIRenderUpdateCollectionController *renderModelUpdateController;
  void *v9;
  void *v10;
  TUIRenderUpdateCollectionController *v11;
  TUIRenderUpdateCollectionController *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  double v18;
  double v19;
  double left;
  double v21;
  double bottom;
  double v23;
  double right;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  TUIRenderUpdateCollectionController *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v45;
  void *v46;
  double top;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;

  v6 = a4;
  if (a3 < 4)
  {
    v25 = 0;
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(-[TUIHScrollBoxLayout _embeddedCollectionModelWithContext:](self, "_embeddedCollectionModelWithContext:", v6));
    renderModelUpdateController = self->_renderModelUpdateController;
    if (!renderModelUpdateController)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      v11 = (TUIRenderUpdateCollectionController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "embeddedUpdateControllerForIdentifier:renderModel:", v10, 0));
      v12 = self->_renderModelUpdateController;
      self->_renderModelUpdateController = v11;

      renderModelUpdateController = self->_renderModelUpdateController;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transactionGroup"));
    -[TUIRenderUpdateCollectionController updateWithRenderModel:viewState:flags:transactionGroup:](renderModelUpdateController, "updateWithRenderModel:viewState:flags:transactionGroup:", v7, 0, 0, v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

    v16 = objc_opt_respondsToSelector(v15, "scrollPolicy");
    v17 = 0;
    if ((v16 & 1) != 0)
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "scrollPolicy"));
    v54 = (void *)v17;
    if ((objc_opt_respondsToSelector(v15, "layoutScrollGradientInsets") & 1) != 0)
    {
      objc_msgSend(v15, "layoutScrollGradientInsets");
      top = v18;
      left = v19;
      bottom = v21;
      right = v23;
    }
    else
    {
      left = UIEdgeInsetsZero.left;
      top = UIEdgeInsetsZero.top;
      bottom = UIEdgeInsetsZero.bottom;
      right = UIEdgeInsetsZero.right;
    }
    v26 = 1.0;
    v27 = 1.0;
    v28 = 1.0;
    v29 = 1.0;
    if ((objc_opt_respondsToSelector(v15, "layoutScrollGradientFraction") & 1) != 0)
    {
      objc_msgSend(v15, "layoutScrollGradientFraction");
      v29 = v30;
      v28 = v31;
      v27 = v32;
      v26 = v33;
    }
    v52 = (void *)v7;
    v34 = 0.0;
    if ((objc_opt_respondsToSelector(v15, "layoutScrollPageGap") & 1) != 0)
    {
      objc_msgSend(v15, "layoutScrollPageGap");
      v34 = v35;
    }
    v36 = self->_renderModelUpdateController;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uid"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "identifier"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHScrollBoxLayout modelIdentifierForScrollable](self, "modelIdentifierForScrollable"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout modelIdentifierForEnclosingScrollable](self, "modelIdentifierForEnclosingScrollable"));
    v53 = v6;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v39 = objc_msgSend(v49, "acceptsDrop");
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "dropHandler"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v42, "decelerationRate");
    LOBYTE(v45) = v39;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[TUIEmbeddedCollectionView renderModelWithUpdateController:uid:UUID:identifier:scrollIdentifier:ancestorScrollIdentifier:scrollPolicy:pageGap:gradientInsets:gradientFraction:acceptsDrop:dropHandler:decelerationRate:](TUIEmbeddedCollectionView, "renderModelWithUpdateController:uid:UUID:identifier:scrollIdentifier:ancestorScrollIdentifier:scrollPolicy:pageGap:gradientInsets:gradientFraction:acceptsDrop:dropHandler:decelerationRate:", v36, v37, v38, v50, v48, v46, v34, top, left, bottom, right, v54, *(_QWORD *)&v29, *(_QWORD *)&v28, *(_QWORD *)&v27,
                      *(_QWORD *)&v26,
                      v45,
                      v41,
                      v43));

    v6 = v53;
    -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v53);
    objc_msgSend(v25, "setSize:");

  }
  return v25;
}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 origin:(CGPoint)a6 toModels:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 <= 3)
  {
    v10 = v7;
    v11 = v8;
    v9.receiver = self;
    v9.super_class = (Class)TUIHScrollBoxLayout;
    -[TUILayout appendChildRenderModelCompatibleWithKind:context:transform:toModels:](&v9, "appendChildRenderModelCompatibleWithKind:context:transform:toModels:", *(_QWORD *)&a5->a, *(_QWORD *)&a5->b, *(_QWORD *)&a5->c, *(_QWORD *)&a5->d, *(_QWORD *)&a5->tx, *(_QWORD *)&a5->ty);
  }
}

- (BOOL)collectImpressionsForChildren
{
  return 0;
}

- (BOOL)collectImpressionsForChild:(id)a3
{
  return 0;
}

- (BOOL)collectLinkEntitiesForChildren
{
  return 0;
}

- (BOOL)collectLinkEntitiesForChild:(id)a3
{
  return 0;
}

- (void)validateRenderModelWithContext:(id)a3 transactionGroup:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[TUIHScrollBoxLayout _embeddedCollectionModelWithContext:](self, "_embeddedCollectionModelWithContext:", a3));
  -[TUIRenderUpdateCollectionController updateWithRenderModel:viewState:flags:transactionGroup:](self->_renderModelUpdateController, "updateWithRenderModel:viewState:flags:transactionGroup:", v7, 0, 0, v6);

}

- (BOOL)shouldAutoInvalidateRenderModelOnChildInvalidate
{
  return 0;
}

- (void)appendEmbeddedIdentifierMaps:(id)a3 updateControllers:(id)a4 UUIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

  if (v12)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_renderModelidentifierMap, v12);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", self->_renderModelUpdateController, v12);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_sectionUUID, v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)TUIHScrollBoxLayout;
  -[TUILayout appendEmbeddedIdentifierMaps:updateControllers:UUIDs:](&v13, "appendEmbeddedIdentifierMaps:updateControllers:UUIDs:", v8, v9, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorSet, 0);
  objc_storeStrong((id *)&self->_renderModelUpdateController, 0);
  objc_storeStrong((id *)&self->_sectionUUID, 0);
  objc_storeStrong((id *)&self->_renderModelidentifierMap, 0);
}

@end
