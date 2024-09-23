@implementation PXStoryChromeButtonConfiguration

- (PXStoryChromeButtonConfiguration)init
{
  PXStoryChromeButtonConfiguration *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryChromeButtonConfiguration;
  result = -[PXStoryChromeButtonConfiguration init](&v5, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0C9BAA8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&result->_transform.c = v4;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)(v3 + 32);
    result->_enabled = 1;
    result->_backgroundColorAdaptsToHoveredState = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  uint64_t v22;
  id v23;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_storeWeak(v4 + 3, WeakRetained);

  v4[4] = (id)self->_action;
  objc_storeStrong(v4 + 5, self->_menu);
  v4[7] = (id)self->_backgroundStyle;
  v4[9] = (id)self->_preferredSystemImageWeight;
  v4[10] = *(id *)&self->_preferredSystemImagePointSize;
  *((_OWORD *)v4 + 12) = self->_offset;
  v6 = -[NSString copy](self->_systemImageName, "copy");
  v7 = v4[12];
  v4[12] = (id)v6;

  v8 = -[NSString copy](self->_label, "copy");
  v9 = v4[14];
  v4[14] = (id)v8;

  *((_BYTE *)v4 + 8) = self->_backgroundExtendsUnderLabel;
  objc_storeStrong(v4 + 2, self->_spec);
  objc_storeStrong(v4 + 19, self->_tintColor);
  objc_storeStrong(v4 + 20, self->_focusedTintColor);
  objc_storeStrong(v4 + 21, self->_solidBackgroundColor);
  v4[8] = (id)self->_systemImageStyle;
  objc_storeStrong(v4 + 11, self->_symbolTransition);
  v10 = *(_OWORD *)&self->_contentEdgeInsets.bottom;
  *((_OWORD *)v4 + 14) = *(_OWORD *)&self->_contentEdgeInsets.top;
  *((_OWORD *)v4 + 15) = v10;
  v11 = *(_OWORD *)&self->_hitTestEdgeOutsets.bottom;
  *((_OWORD *)v4 + 16) = *(_OWORD *)&self->_hitTestEdgeOutsets.top;
  *((_OWORD *)v4 + 17) = v11;
  v12 = objc_loadWeakRetained((id *)&self->_customContextMenuInteractionDelegate);
  objc_storeWeak(v4 + 6, v12);

  v13 = -[PXDisplayAsset copyWithZone:](self->_displayAsset, "copyWithZone:", 0);
  v14 = v4[13];
  v4[13] = (id)v13;

  v15 = *(_OWORD *)&self->_transform.a;
  v16 = *(_OWORD *)&self->_transform.tx;
  *((_OWORD *)v4 + 21) = *(_OWORD *)&self->_transform.c;
  *((_OWORD *)v4 + 22) = v16;
  *((_OWORD *)v4 + 20) = v15;
  v4[17] = (id)self->_badgeEdges;
  v17 = -[NSString copy](self->_badgeSystemImageName, "copy");
  v18 = v4[15];
  v4[15] = (id)v17;

  *((_OWORD *)v4 + 13) = self->_badgePadding;
  v19 = -[NSArray copy](self->_badgeSystemImageColors, "copy");
  v20 = v4[16];
  v4[16] = (id)v19;

  *((_BYTE *)v4 + 9) = self->_enabled;
  *((_BYTE *)v4 + 11) = self->_backgroundColorAdaptsToHoveredState;
  *((_BYTE *)v4 + 10) = self->_applyTintColorAsHierarchicalColor;
  v4[22] = (id)self->_pointerShape;
  v21 = *(_OWORD *)&self->_pointerShapeInsets.bottom;
  *((_OWORD *)v4 + 18) = *(_OWORD *)&self->_pointerShapeInsets.top;
  *((_OWORD *)v4 + 19) = v21;
  v22 = -[NSString copy](self->_axLabel, "copy");
  v23 = v4[23];
  v4[23] = (id)v22;

  return v4;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v3 = -[PXStoryChromeButtonConfiguration backgroundStyle](self, "backgroundStyle");
  -[PXStoryChromeButtonConfiguration systemImageName](self, "systemImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ (4 * objc_msgSend(v4, "hash"));

  -[PXStoryChromeButtonConfiguration spec](self, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ (8 * objc_msgSend(v6, "hash"));

  v8 = v7 ^ (16 * -[PXStoryChromeButtonConfiguration pointerShape](self, "pointerShape"));
  -[PXStoryChromeButtonConfiguration symbolTransition](self, "symbolTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ (32 * objc_msgSend(v9, "hash"));

  -[PXStoryChromeButtonConfiguration displayAsset](self, "displayAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[PXStoryChromeButtonConfiguration badgeSystemImageName](self, "badgeSystemImageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");

  return v10 ^ v14 ^ -[PXStoryChromeButtonConfiguration systemImageStyle](self, "systemImageStyle");
}

- (BOOL)isEqual:(id)a3
{
  PXStoryChromeButtonConfiguration *v4;
  PXStoryChromeButtonConfiguration *v5;
  void *v6;
  void *v7;
  const char *v8;
  int v9;
  id v11;
  id v12;
  int v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int64_t v22;
  _BOOL4 v23;
  int64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  unint64_t v63;
  id v64;
  _BOOL4 v65;
  _BOOL4 v66;
  _BOOL4 v67;
  int64_t v68;
  id v69;
  int64_t v70;
  int v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  int v92;
  int v93;
  int v94;
  int v95;
  id v96;
  void *v97;
  void *v98;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v4 = (PXStoryChromeButtonConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v9) = 0;
    goto LABEL_9;
  }
  v5 = v4;
  -[PXStoryChromeButtonConfiguration target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButtonConfiguration target](v5, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v8 = -[PXStoryChromeButtonConfiguration action](self, "action");
    if (v8 == -[PXStoryChromeButtonConfiguration action](v5, "action"))
    {
      -[PXStoryChromeButtonConfiguration menu](self, "menu");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration menu](v5, "menu");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {

      }
      else
      {
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
        {
          LOBYTE(v9) = 0;
LABEL_34:

          goto LABEL_6;
        }
      }
      -[PXStoryChromeButtonConfiguration systemImageName](self, "systemImageName");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration systemImageName](v5, "systemImageName");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {

      }
      else
      {
        v9 = objc_msgSend(v14, "isEqualToString:", v15);

        if (!v9)
          goto LABEL_33;
      }
      -[PXStoryChromeButtonConfiguration label](self, "label");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration label](v5, "label");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v97 = v17;
      v98 = v16;
      if (v16 == v17)
      {

      }
      else
      {
        v91 = v12;
        v18 = v11;
        v19 = v15;
        v20 = v14;
        v21 = v17;
        v9 = objc_msgSend(v16, "isEqualToString:", v17);

        v14 = v20;
        v15 = v19;
        v11 = v18;
        v12 = v91;
        if (!v9)
          goto LABEL_32;
      }
      v22 = -[PXStoryChromeButtonConfiguration backgroundStyle](self, "backgroundStyle");
      if (v22 != -[PXStoryChromeButtonConfiguration backgroundStyle](v5, "backgroundStyle")
        || (v23 = -[PXStoryChromeButtonConfiguration backgroundExtendsUnderLabel](self, "backgroundExtendsUnderLabel"),
            v23 != -[PXStoryChromeButtonConfiguration backgroundExtendsUnderLabel](v5, "backgroundExtendsUnderLabel"))
        || (v24 = -[PXStoryChromeButtonConfiguration preferredSystemImageWeight](self, "preferredSystemImageWeight"),
            v24 != -[PXStoryChromeButtonConfiguration preferredSystemImageWeight](v5, "preferredSystemImageWeight"))
        || (-[PXStoryChromeButtonConfiguration preferredSystemImagePointSize](self, "preferredSystemImagePointSize"),
            -[PXStoryChromeButtonConfiguration preferredSystemImagePointSize](v5, "preferredSystemImagePointSize"),
            !PXFloatApproximatelyEqualToFloat()))
      {
        LOBYTE(v9) = 0;
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }
      -[PXStoryChromeButtonConfiguration offset](self, "offset");
      v26 = v25;
      v28 = v27;
      -[PXStoryChromeButtonConfiguration offset](v5, "offset");
      LOBYTE(v9) = 0;
      if (v26 != v30 || v28 != v29)
        goto LABEL_32;
      -[PXStoryChromeButtonConfiguration spec](self, "spec");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration spec](v5, "spec");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v89 = v32;
      v90 = v31;
      if (v31 == v32)
      {

      }
      else
      {
        v33 = v32;
        v34 = v31;
        v35 = v33;
        v92 = objc_msgSend(v34, "isEqual:", v33);

        if (!v92)
        {
          LOBYTE(v9) = 0;
LABEL_95:

          goto LABEL_32;
        }
      }
      -[PXStoryChromeButtonConfiguration symbolTransition](self, "symbolTransition");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration symbolTransition](v5, "symbolTransition");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v87 = v37;
      v88 = v36;
      if (v36 == v37)
      {

      }
      else
      {
        v38 = v37;
        v39 = v36;
        v40 = v38;
        v93 = objc_msgSend(v39, "isEqual:", v38);

        if (!v93)
        {
          LOBYTE(v9) = 0;
LABEL_94:

          goto LABEL_95;
        }
      }
      -[PXStoryChromeButtonConfiguration tintColor](self, "tintColor");
      v41 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration tintColor](v5, "tintColor");
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v85 = v42;
      v86 = v41;
      if (v41 == v42)
      {

      }
      else
      {
        v43 = v42;
        v44 = v41;
        v45 = v43;
        v94 = objc_msgSend(v44, "isEqual:", v43);

        if (!v94)
        {
          LOBYTE(v9) = 0;
LABEL_93:

          goto LABEL_94;
        }
      }
      -[PXStoryChromeButtonConfiguration focusedTintColor](self, "focusedTintColor");
      v46 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration focusedTintColor](v5, "focusedTintColor");
      v47 = (id)objc_claimAutoreleasedReturnValue();
      v83 = v47;
      v84 = v46;
      if (v46 == v47)
      {

      }
      else
      {
        v48 = v47;
        v49 = v46;
        v50 = v48;
        v95 = objc_msgSend(v49, "isEqual:", v48);

        if (!v95)
        {
          LOBYTE(v9) = 0;
LABEL_92:

          goto LABEL_93;
        }
      }
      v96 = v12;
      v81 = v15;
      v82 = v11;
      -[PXStoryChromeButtonConfiguration solidBackgroundColor](self, "solidBackgroundColor");
      v51 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration solidBackgroundColor](v5, "solidBackgroundColor");
      v52 = (id)objc_claimAutoreleasedReturnValue();
      v53 = v51;
      if (v51 == v52)
      {

      }
      else
      {
        v9 = objc_msgSend(v51, "isEqual:", v52);

        if (!v9)
          goto LABEL_91;
      }
      -[PXStoryChromeButtonConfiguration contentEdgeInsets](self, "contentEdgeInsets");
      -[PXStoryChromeButtonConfiguration contentEdgeInsets](v5, "contentEdgeInsets");
      if (!PXEdgeInsetsEqualToEdgeInsets()
        || (-[PXStoryChromeButtonConfiguration hitTestEdgeOutsets](self, "hitTestEdgeOutsets"),
            -[PXStoryChromeButtonConfiguration hitTestEdgeOutsets](v5, "hitTestEdgeOutsets"),
            !PXEdgeInsetsEqualToEdgeInsets()))
      {
        LOBYTE(v9) = 0;
LABEL_91:

        v15 = v81;
        v11 = v82;
        v12 = v96;
        goto LABEL_92;
      }
      -[PXStoryChromeButtonConfiguration customContextMenuInteractionDelegate](self, "customContextMenuInteractionDelegate");
      v54 = objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration customContextMenuInteractionDelegate](v5, "customContextMenuInteractionDelegate");
      v79 = (void *)v54;
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if ((void *)v54 != v80)
      {
        LOBYTE(v9) = 0;
LABEL_90:

        goto LABEL_91;
      }
      -[PXStoryChromeButtonConfiguration displayAsset](self, "displayAsset");
      v55 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration displayAsset](v5, "displayAsset");
      v77 = (id)objc_claimAutoreleasedReturnValue();
      v78 = v55;
      if (v55 == v77)
      {

      }
      else
      {
        v9 = objc_msgSend(v55, "isEqual:", v77);

        if (!v9)
          goto LABEL_89;
      }
      -[PXStoryChromeButtonConfiguration transform](self, "transform");
      if (v5)
        -[PXStoryChromeButtonConfiguration transform](v5, "transform");
      else
        memset(&t2, 0, sizeof(t2));
      if (!CGAffineTransformEqualToTransform(&t1, &t2))
      {
        LOBYTE(v9) = 0;
LABEL_89:

        goto LABEL_90;
      }
      -[PXStoryChromeButtonConfiguration badgeSystemImageName](self, "badgeSystemImageName");
      v56 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration badgeSystemImageName](v5, "badgeSystemImageName");
      v75 = (id)objc_claimAutoreleasedReturnValue();
      v76 = v56;
      if (v56 == v75)
      {

      }
      else
      {
        v9 = objc_msgSend(v56, "isEqualToString:", v75);

        if (!v9)
          goto LABEL_88;
      }
      -[PXStoryChromeButtonConfiguration badgePadding](self, "badgePadding");
      v58 = v57;
      v60 = v59;
      -[PXStoryChromeButtonConfiguration badgePadding](v5, "badgePadding");
      LOBYTE(v9) = 0;
      if (v58 != v62 || v60 != v61)
        goto LABEL_88;
      v63 = -[PXStoryChromeButtonConfiguration badgeEdges](self, "badgeEdges");
      if (v63 != -[PXStoryChromeButtonConfiguration badgeEdges](v5, "badgeEdges"))
      {
        LOBYTE(v9) = 0;
LABEL_88:

        goto LABEL_89;
      }
      -[PXStoryChromeButtonConfiguration badgeSystemImageColors](self, "badgeSystemImageColors");
      v64 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration badgeSystemImageColors](v5, "badgeSystemImageColors");
      v73 = (id)objc_claimAutoreleasedReturnValue();
      v74 = v64;
      if (v64 == v73)
      {

      }
      else
      {
        v9 = objc_msgSend(v64, "isEqual:", v73);

        if (!v9)
          goto LABEL_87;
      }
      v65 = -[PXStoryChromeButtonConfiguration enabled](self, "enabled");
      if (v65 != -[PXStoryChromeButtonConfiguration enabled](v5, "enabled")
        || (v66 = -[PXStoryChromeButtonConfiguration backgroundColorAdaptsToHoveredState](self, "backgroundColorAdaptsToHoveredState"), v66 != -[PXStoryChromeButtonConfiguration backgroundColorAdaptsToHoveredState](v5, "backgroundColorAdaptsToHoveredState"))|| (v67 = -[PXStoryChromeButtonConfiguration applyTintColorAsHierarchicalColor](self, "applyTintColorAsHierarchicalColor"), v67 != -[PXStoryChromeButtonConfiguration applyTintColorAsHierarchicalColor](v5, "applyTintColorAsHierarchicalColor"))|| (v68 = -[PXStoryChromeButtonConfiguration pointerShape](self, "pointerShape"), v68 != -[PXStoryChromeButtonConfiguration pointerShape](v5, "pointerShape"))|| (-[PXStoryChromeButtonConfiguration pointerShapeInsets](self, "pointerShapeInsets"), -[PXStoryChromeButtonConfiguration pointerShapeInsets](v5, "pointerShapeInsets"), !PXEdgeInsetsEqualToEdgeInsets()))
      {
        LOBYTE(v9) = 0;
LABEL_87:

        goto LABEL_88;
      }
      -[PXStoryChromeButtonConfiguration axLabel](self, "axLabel");
      v69 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButtonConfiguration axLabel](v5, "axLabel");
      v72 = (id)objc_claimAutoreleasedReturnValue();
      if (v69 == v72)
      {

      }
      else
      {
        v71 = objc_msgSend(v69, "isEqualToString:", v72);

        if (!v71)
        {
          LOBYTE(v9) = 0;
LABEL_98:

          goto LABEL_87;
        }
      }
      v70 = -[PXStoryChromeButtonConfiguration systemImageStyle](self, "systemImageStyle");
      LOBYTE(v9) = v70 == -[PXStoryChromeButtonConfiguration systemImageStyle](v5, "systemImageStyle");
      goto LABEL_98;
    }
  }
  LOBYTE(v9) = 0;
LABEL_6:

LABEL_9:
  return v9;
}

- (BOOL)hasPrimaryImageContent
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PXStoryChromeButtonConfiguration displayAsset](self, "displayAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[PXStoryChromeButtonConfiguration systemImageName](self, "systemImageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)hasBadgeImageContent
{
  void *v2;
  BOOL v3;

  -[PXStoryChromeButtonConfiguration badgeSystemImageName](self, "badgeSystemImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)preferredSystemImageWeight
{
  int64_t preferredSystemImageWeight;
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  preferredSystemImageWeight = self->_preferredSystemImageWeight;
  if (preferredSystemImageWeight == *(_QWORD *)off_1E50B8458)
  {
    v4 = -[PXStoryChromeButtonConfiguration backgroundStyle](self, "backgroundStyle");
    -[PXStoryChromeButtonConfiguration spec](self, "spec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      v7 = objc_msgSend(v5, "systemImageWeightWithBackground");
    else
      v7 = objc_msgSend(v5, "systemImageWeightWithoutBackground");
    preferredSystemImageWeight = v7;

  }
  return preferredSystemImageWeight;
}

- (double)preferredSystemImagePointSize
{
  double preferredSystemImagePointSize;
  int64_t v4;
  void *v5;
  void *v6;
  double v7;

  preferredSystemImagePointSize = self->_preferredSystemImagePointSize;
  if (preferredSystemImagePointSize == *(double *)off_1E50B8450)
  {
    v4 = -[PXStoryChromeButtonConfiguration backgroundStyle](self, "backgroundStyle");
    -[PXStoryChromeButtonConfiguration spec](self, "spec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "systemImageSizeWithBackground");
    else
      objc_msgSend(v5, "systemImageSizeWithoutBackground");
    preferredSystemImagePointSize = v7;

  }
  return preferredSystemImagePointSize;
}

- (PXStoryChromeButtonSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  objc_storeStrong((id *)&self->_menu, a3);
}

- (NSObject)customContextMenuInteractionDelegate
{
  return objc_loadWeakRetained((id *)&self->_customContextMenuInteractionDelegate);
}

- (void)setCustomContextMenuInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_customContextMenuInteractionDelegate, a3);
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (int64_t)systemImageStyle
{
  return self->_systemImageStyle;
}

- (void)setSystemImageStyle:(int64_t)a3
{
  self->_systemImageStyle = a3;
}

- (void)setPreferredSystemImageWeight:(int64_t)a3
{
  self->_preferredSystemImageWeight = a3;
}

- (void)setPreferredSystemImagePointSize:(double)a3
{
  self->_preferredSystemImagePointSize = a3;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (NSSymbolContentTransition)symbolTransition
{
  return self->_symbolTransition;
}

- (void)setSymbolTransition:(id)a3
{
  objc_storeStrong((id *)&self->_symbolTransition, a3);
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (void)setDisplayAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)backgroundExtendsUnderLabel
{
  return self->_backgroundExtendsUnderLabel;
}

- (void)setBackgroundExtendsUnderLabel:(BOOL)a3
{
  self->_backgroundExtendsUnderLabel = a3;
}

- (NSString)badgeSystemImageName
{
  return self->_badgeSystemImageName;
}

- (void)setBadgeSystemImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)badgeSystemImageColors
{
  return self->_badgeSystemImageColors;
}

- (void)setBadgeSystemImageColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (unint64_t)badgeEdges
{
  return self->_badgeEdges;
}

- (void)setBadgeEdges:(unint64_t)a3
{
  self->_badgeEdges = a3;
}

- (CGSize)badgePadding
{
  double width;
  double height;
  CGSize result;

  width = self->_badgePadding.width;
  height = self->_badgePadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBadgePadding:(CGSize)a3
{
  self->_badgePadding = a3;
}

- (double)badgeBorderWidth
{
  return self->_badgeBorderWidth;
}

- (void)setBadgeBorderWidth:(double)a3
{
  self->_badgeBorderWidth = a3;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (UIEdgeInsets)hitTestEdgeOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestEdgeOutsets.top;
  left = self->_hitTestEdgeOutsets.left;
  bottom = self->_hitTestEdgeOutsets.bottom;
  right = self->_hitTestEdgeOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitTestEdgeOutsets:(UIEdgeInsets)a3
{
  self->_hitTestEdgeOutsets = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (UIColor)focusedTintColor
{
  return self->_focusedTintColor;
}

- (void)setFocusedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_focusedTintColor, a3);
}

- (UIColor)solidBackgroundColor
{
  return self->_solidBackgroundColor;
}

- (void)setSolidBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_solidBackgroundColor, a3);
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[7].c;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)applyTintColorAsHierarchicalColor
{
  return self->_applyTintColorAsHierarchicalColor;
}

- (void)setApplyTintColorAsHierarchicalColor:(BOOL)a3
{
  self->_applyTintColorAsHierarchicalColor = a3;
}

- (BOOL)backgroundColorAdaptsToHoveredState
{
  return self->_backgroundColorAdaptsToHoveredState;
}

- (void)setBackgroundColorAdaptsToHoveredState:(BOOL)a3
{
  self->_backgroundColorAdaptsToHoveredState = a3;
}

- (int64_t)pointerShape
{
  return self->_pointerShape;
}

- (void)setPointerShape:(int64_t)a3
{
  self->_pointerShape = a3;
}

- (UIEdgeInsets)pointerShapeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_pointerShapeInsets.top;
  left = self->_pointerShapeInsets.left;
  bottom = self->_pointerShapeInsets.bottom;
  right = self->_pointerShapeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPointerShapeInsets:(UIEdgeInsets)a3
{
  self->_pointerShapeInsets = a3;
}

- (NSString)axLabel
{
  return self->_axLabel;
}

- (void)setAxLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axLabel, 0);
  objc_storeStrong((id *)&self->_solidBackgroundColor, 0);
  objc_storeStrong((id *)&self->_focusedTintColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_badgeSystemImageColors, 0);
  objc_storeStrong((id *)&self->_badgeSystemImageName, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_symbolTransition, 0);
  objc_destroyWeak((id *)&self->_customContextMenuInteractionDelegate);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_spec, 0);
}

@end
