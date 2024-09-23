@implementation _UIUnflockItemAnimation

+ (id)animationWithPlatterView:(id)a3 destination:(id)a4 positionReferenceView:(id)a5 type:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setPlatterView:", v11);

  objc_msgSend(v12, "setDestination:", v9);
  if (v10)
  {
    objc_msgSend(v12, "setPositionReferenceView:", v10);
  }
  else
  {
    objc_msgSend(v9, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "target");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "container");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v16)
    {
      objc_msgSend(v9, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPositionReferenceView:", v17);

    }
  }
  objc_msgSend(v12, "setType:", a6);

  return v12;
}

- (void)play
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  int64_t v13;
  double v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[3];
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  -[_UIUnflockItemAnimation platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIUnflockItemAnimation destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIUnflockItemAnimation platterView](self, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x3810000000;
  v52 = &unk_18685B0AF;
  v53 = 0;
  v54 = 0;
  v55 = 0;
  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x4010000000;
  v46 = &unk_18685B0AF;
  v47 = 0u;
  v48 = 0u;
  v36 = 0;
  v37 = &v36;
  v38 = 0x5010000000;
  v39 = &unk_18685B0AF;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  if (-[_UIUnflockItemAnimation type](self, "type") == 1 || -[_UIUnflockItemAnimation type](self, "type") == 2)
  {
    _UIContextMenuGetFromPreview(v4, (_QWORD *)v44 + 4, v50 + 4, (_OWORD *)v37 + 2, v6);
  }
  else
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__202;
    v34[4] = __Block_byref_object_dispose__202;
    v35 = 0;
    v30 = 0;
    v31 = (double *)&v30;
    v32 = 0x2020000000;
    v33 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __31___UIUnflockItemAnimation_play__block_invoke;
    v20[3] = &unk_1E16E53D0;
    v20[4] = self;
    v21 = v3;
    v22 = v6;
    v25 = v34;
    v23 = v8;
    v24 = v4;
    v26 = &v43;
    v27 = &v49;
    v28 = &v36;
    v29 = &v30;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v20);
    v9 = v31[3];
    -[_UIUnflockItemAnimation positionTrackingProperty](self, "positionTrackingProperty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:", v9);

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(v34, 8);

  }
  if (-[_UIUnflockItemAnimation type](self, "type") == 2)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __31___UIUnflockItemAnimation_play__block_invoke_3;
    v18[3] = &unk_1E16B1B28;
    v19 = v3;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v18);

  }
  else
  {
    objc_msgSend(v3, "setCenter:", v50[4], v50[5]);
    v11 = v50[6];
    objc_msgSend(v3, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setZPosition:", v11);

    objc_msgSend(v3, "setBounds:", v44[4], v44[5], v44[6], v44[7]);
    v13 = -[_UIUnflockItemAnimation type](self, "type");
    v14 = 1.0;
    if (v13 == 1)
      v14 = 0.0;
    objc_msgSend(v3, "setAlpha:", v14);
    v15 = *((_OWORD *)v37 + 4);
    v16 = *((_OWORD *)v37 + 2);
    v17[1] = *((_OWORD *)v37 + 3);
    v17[2] = v15;
    v17[0] = v16;
    objc_msgSend(v3, "setTransform:", v17);
  }
  objc_msgSend(v3, "setExpanded:", 0);
  objc_msgSend(v3, "layoutIfNeeded");
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

}

- (void)complete
{
  void *v3;
  id v4;

  -[_UIUnflockItemAnimation reparentingPortalView](self, "reparentingPortalView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[_UIUnflockItemAnimation reparentingContainerView](self, "reparentingContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (_UIMorphingPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (UITargetedPreview)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (UIView)positionReferenceView
{
  return self->_positionReferenceView;
}

- (void)setPositionReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_positionReferenceView, a3);
}

- (_UIUnflockReparentingView)reparentingContainerView
{
  return self->_reparentingContainerView;
}

- (void)setReparentingContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_reparentingContainerView, a3);
}

- (_UIPortalView)reparentingPortalView
{
  return self->_reparentingPortalView;
}

- (void)setReparentingPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_reparentingPortalView, a3);
}

- (UIViewFloatAnimatableProperty)positionTrackingProperty
{
  return self->_positionTrackingProperty;
}

- (void)setPositionTrackingProperty:(id)a3
{
  objc_storeStrong((id *)&self->_positionTrackingProperty, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionTrackingProperty, 0);
  objc_storeStrong((id *)&self->_reparentingPortalView, 0);
  objc_storeStrong((id *)&self->_reparentingContainerView, 0);
  objc_storeStrong((id *)&self->_positionReferenceView, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
}

@end
