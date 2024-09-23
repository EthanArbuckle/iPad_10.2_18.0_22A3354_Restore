@implementation THNoteCardLayer

- (THNoteCardLayer)initWithDelegate:(id)a3 darkMode:(BOOL)a4
{
  _BOOL8 v4;
  THNoteCardLayer *v6;
  THNoteCardLayer *v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)THNoteCardLayer;
  v6 = -[THNoteCardLayer init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_delegate = (THNoteCardLayerDelegate *)a3;
    -[THNoteCardLayer p_commonInitWithDarkMode:](v6, "p_commonInitWithDarkMode:", v4);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_frontLayer = 0;
  self->_backLayer = 0;

  self->_completionAnimationCompletionBlock = 0;
  self->_layoutContext = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardLayer;
  -[THNoteCardLayer dealloc](&v3, "dealloc");
}

- (void)setLayoutContext:(id)a3
{
  uint64_t v5;

  TSDRectWithSize(objc_msgSend(a3, "noteCardSize"));
  -[THNoteCardLayer setBounds:](self, "setBounds:", TSDRoundedRect(v5));

  self->_layoutContext = (THNoteCardLayoutContext *)a3;
  -[THNoteCardContentLayer setLayoutContext:](self->_frontLayer, "setLayoutContext:", a3);
  -[THNoteCardContentLayer setLayoutContext:](self->_backLayer, "setLayoutContext:", a3);
  -[THNoteCardLayer p_rebuildNoteTransform](self, "p_rebuildNoteTransform");
  -[THNoteCardLayer setNeedsLayout](self, "setNeedsLayout");
}

- (THNoteCardContentLayer)upwardFacingLayer
{
  if (self->_transformParams.flipped)
    return -[THNoteCardLayer backLayer](self, "backLayer");
  else
    return -[THNoteCardLayer frontLayer](self, "frontLayer");
}

- (THNoteCardContentLayer)downwardFacingLayer
{
  if (self->_transformParams.flipped)
    return -[THNoteCardLayer frontLayer](self, "frontLayer");
  else
    return -[THNoteCardLayer backLayer](self, "backLayer");
}

- (int64_t)cardIndex
{
  return self->_transformParams.cardIndex;
}

- (void)setCardIndex:(int64_t)a3
{
  _THNoteTransformParameters *p_transformParams;
  CGPoint filteredOutDirection;
  CGPoint dragAnchor;
  __int128 v7;
  _OWORD v8[7];

  p_transformParams = &self->_transformParams;
  self->_transformParams.cardIndex = a3;
  -[THNoteCardLayer p_rebuildNoteTransform](self, "p_rebuildNoteTransform");
  filteredOutDirection = p_transformParams->filteredOutDirection;
  v8[4] = *(_OWORD *)&p_transformParams->flownOutDirection.y;
  v8[5] = filteredOutDirection;
  v8[6] = *(_OWORD *)&p_transformParams->scaleFactor;
  dragAnchor = p_transformParams->dragAnchor;
  v8[0] = *(_OWORD *)&p_transformParams->cardIndex;
  v8[1] = dragAnchor;
  v7 = *(_OWORD *)&p_transformParams->shuffleAnimationState;
  v8[2] = p_transformParams->dragOffset;
  v8[3] = v7;
  -[THNoteCardContentLayer setDisplayAttributes:animated:duration:](self->_frontLayer, "setDisplayAttributes:animated:duration:", (unint64_t)-[THNoteCardLayer p_displayAttributesForParameters:](self, "p_displayAttributesForParameters:", v8) & 0xFFFFFFFFFFLL, 0, 0.0);
}

- (BOOL)isTopCard
{
  CGPoint filteredOutDirection;
  CGPoint dragAnchor;
  __int128 v4;
  _OWORD v6[7];

  filteredOutDirection = self->_transformParams.filteredOutDirection;
  v6[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v6[5] = filteredOutDirection;
  v6[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
  dragAnchor = self->_transformParams.dragAnchor;
  v6[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v6[1] = dragAnchor;
  v4 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v6[2] = self->_transformParams.dragOffset;
  v6[3] = v4;
  return -[THNoteCardLayer p_isTopCardParameters:](self, "p_isTopCardParameters:", v6);
}

- (BOOL)isBottomCard
{
  CGPoint filteredOutDirection;
  CGPoint dragAnchor;
  __int128 v4;
  _OWORD v6[7];

  filteredOutDirection = self->_transformParams.filteredOutDirection;
  v6[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v6[5] = filteredOutDirection;
  v6[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
  dragAnchor = self->_transformParams.dragAnchor;
  v6[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v6[1] = dragAnchor;
  v4 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v6[2] = self->_transformParams.dragOffset;
  v6[3] = v4;
  return -[THNoteCardLayer p_isBottomCardParameters:](self, "p_isBottomCardParameters:", v6);
}

- (int64_t)offsetFromTopOfDeck
{
  return (int64_t)-[THNoteCardLayerDelegate noteCardLayerCount](self->_delegate, "noteCardLayerCount")
       + ~self->_transformParams.cardIndex;
}

- (BOOL)darkMode
{
  return -[THNoteCardContentLayer darkMode](self->_frontLayer, "darkMode");
}

- (void)setDarkMode:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[THNoteCardContentLayer setDarkMode:](self->_backLayer, "setDarkMode:");
  -[THNoteCardContentLayer setDarkMode:](self->_frontLayer, "setDarkMode:", v3);
}

- (BOOL)isFlipped
{
  return self->_transformParams.flipped;
}

- (void)setFlipped:(BOOL)a3
{
  if (self->_transformParams.flipped != a3)
  {
    self->_transformParams.flipped = a3;
    -[THNoteCardLayer p_rebuildNoteTransform](self, "p_rebuildNoteTransform");
  }
}

- (int)poppedState
{
  return self->_transformParams.poppedState;
}

- (void)setPoppedState:(int)a3
{
  if (self->_transformParams.poppedState != a3)
  {
    self->_transformParams.poppedState = a3;
    -[THNoteCardLayer p_rebuildNoteTransform](self, "p_rebuildNoteTransform");
  }
}

- (CGPoint)dragAnchor
{
  double x;
  double y;
  CGPoint result;

  x = self->_transformParams.dragAnchor.x;
  y = self->_transformParams.dragAnchor.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDragAnchor:(CGPoint)a3
{
  self->_transformParams.dragAnchor = a3;
  -[THNoteCardLayer p_rebuildNoteTransform](self, "p_rebuildNoteTransform");
}

- (CGPoint)dragOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_transformParams.dragOffset.x;
  y = self->_transformParams.dragOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDragOffset:(CGPoint)a3
{
  self->_transformParams.dragOffset = a3;
  -[THNoteCardLayer p_rebuildNoteTransform](self, "p_rebuildNoteTransform");
}

- (BOOL)forceHidden
{
  return self->_transformParams.forceHidden;
}

- (void)setForceHidden:(BOOL)a3
{
  self->_transformParams.forceHidden = a3;
  -[THNoteCardLayer p_rebuildNoteTransform](self, "p_rebuildNoteTransform");
}

- (BOOL)flownOut
{
  return self->_transformParams.flownOut;
}

- (void)setFlownOut:(BOOL)a3
{
  self->_transformParams.flownOut = a3;
  self->_transformParams.flownOutDirection = (CGPoint)xmmword_3145D0;
  -[THNoteCardLayer p_rebuildNoteTransform](self, "p_rebuildNoteTransform");
}

- (void)setFlownOut:(BOOL)a3 direction:(CGPoint)a4
{
  self->_transformParams.flownOut = a3;
  self->_transformParams.flownOutDirection = a4;
  -[THNoteCardLayer p_rebuildNoteTransform](self, "p_rebuildNoteTransform");
}

- (BOOL)filteredOut
{
  return self->_transformParams.filteredOut;
}

- (void)setFilteredOut:(BOOL)a3
{
  self->_transformParams.filteredOut = a3;
  self->_transformParams.filteredOutDirection = (CGPoint)xmmword_3145D0;
  -[THNoteCardLayer p_rebuildNoteTransform](self, "p_rebuildNoteTransform");
}

- (void)setFilteredOut:(BOOL)a3 direction:(CGPoint)a4
{
  self->_transformParams.filteredOut = a3;
  self->_transformParams.filteredOutDirection = a4;
  -[THNoteCardLayer p_rebuildNoteTransform](self, "p_rebuildNoteTransform");
}

- (BOOL)draggedPastThreshold
{
  double v3;
  double v4;
  id v5;
  double v6;
  double v7;
  double v8;

  -[THNoteCardLayer bounds](self, "bounds");
  v4 = v3;
  v5 = -[THNoteCardLayer bounds](self, "bounds");
  v7 = TSDPointLength(v5, self->_transformParams.dragOffset.x / v4, self->_transformParams.dragOffset.y / v6);
  v8 = v7 + v7;
  if (-[THNoteCardLayer isBottomCard](self, "isBottomCard"))
    return v8 >= 0.100000001;
  else
    return v8 >= 0.5;
}

- (BOOL)isPointInsideFlipGlyph:(CGPoint)a3
{
  double y;
  double x;
  THNoteCardContentLayer *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGPoint v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v6 = -[THNoteCardLayer upwardFacingLayer](self, "upwardFacingLayer");
  -[THNoteCardContentLayer convertPoint:fromLayer:](v6, "convertPoint:fromLayer:", self, x, y);
  v8 = v7;
  v10 = v9;
  -[THNoteCardContentLayer flipGlyphFrame](v6, "flipGlyphFrame");
  v12.x = v8;
  v12.y = v10;
  return CGRectContainsPoint(v13, v12);
}

- (NSArray)interactiveLayers
{
  return -[THNoteCardContentLayer interactiveLayers](-[THNoteCardLayer upwardFacingLayer](self, "upwardFacingLayer"), "interactiveLayers");
}

- (BOOL)p_isTopCardParameters:(_THNoteTransformParameters *)a3
{
  char *cardIndex;

  cardIndex = (char *)a3->cardIndex;
  return cardIndex == (char *)-[THNoteCardLayerDelegate noteCardLayerCount](self->_delegate, "noteCardLayerCount") - 1;
}

- (BOOL)p_isBottomCardParameters:(_THNoteTransformParameters *)a3
{
  return a3->cardIndex == 0;
}

- (void)p_applyNoteTransform:(_THNoteTransform *)a3
{
  _THNoteTransform *p_transform;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double x;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[8];
  _OWORD v20[8];

  p_transform = &self->_transform;
  memcpy(&self->_transform, a3, sizeof(self->_transform));
  v5 = *(_OWORD *)&p_transform->xform.m33;
  v20[4] = *(_OWORD *)&p_transform->xform.m31;
  v20[5] = v5;
  v6 = *(_OWORD *)&p_transform->xform.m43;
  v20[6] = *(_OWORD *)&p_transform->xform.m41;
  v20[7] = v6;
  v7 = *(_OWORD *)&p_transform->xform.m13;
  v20[0] = *(_OWORD *)&p_transform->xform.m11;
  v20[1] = v7;
  v8 = *(_OWORD *)&p_transform->xform.m23;
  v20[2] = *(_OWORD *)&p_transform->xform.m21;
  v20[3] = v8;
  -[THNoteCardLayer setTransform:](self, "setTransform:", v20);
  -[THNoteCardLayer setZPosition:](self, "setZPosition:", p_transform->zPosition);
  x = p_transform->position.x;
  -[THNoteCardLayer bounds](self, "bounds");
  TSDRectWithCenterAndSize(x);
  v11 = TSDRoundedRect(v10);
  -[THNoteCardLayer setPosition:](self, "setPosition:", TSDCenterOfRect(v11, v12, v13, v14));
  v15 = *(_OWORD *)&p_transform->sublayerXform.m33;
  v19[4] = *(_OWORD *)&p_transform->sublayerXform.m31;
  v19[5] = v15;
  v16 = *(_OWORD *)&p_transform->sublayerXform.m43;
  v19[6] = *(_OWORD *)&p_transform->sublayerXform.m41;
  v19[7] = v16;
  v17 = *(_OWORD *)&p_transform->sublayerXform.m13;
  v19[0] = *(_OWORD *)&p_transform->sublayerXform.m11;
  v19[1] = v17;
  v18 = *(_OWORD *)&p_transform->sublayerXform.m23;
  v19[2] = *(_OWORD *)&p_transform->sublayerXform.m21;
  v19[3] = v18;
  -[THNoteCardLayer setSublayerTransform:](self, "setSublayerTransform:", v19);
}

- (void)p_rebuildNoteTransform
{
  CGPoint filteredOutDirection;
  CGPoint dragAnchor;
  __int128 v5;
  _BYTE __dst[280];
  _OWORD v7[7];
  _BYTE __src[280];

  if (self->_delegate)
  {
    filteredOutDirection = self->_transformParams.filteredOutDirection;
    v7[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
    v7[5] = filteredOutDirection;
    v7[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
    dragAnchor = self->_transformParams.dragAnchor;
    v7[0] = *(_OWORD *)&self->_transformParams.cardIndex;
    v7[1] = dragAnchor;
    v5 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
    v7[2] = self->_transformParams.dragOffset;
    v7[3] = v5;
    -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", v7);
    memcpy(__dst, __src, sizeof(__dst));
    -[THNoteCardLayer p_applyNoteTransform:](self, "p_applyNoteTransform:", __dst);
  }
}

- (_THNoteTransform)p_noteTransformForParameters:(SEL)a3
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CATransform3D *p_sublayerXform;
  double v16;
  double v17;
  id v18;
  double v19;
  double x;
  double y;
  double v22;
  double v23;
  double v24;
  int64_t v25;
  CGPoint filteredOutDirection;
  CGPoint dragAnchor;
  CGPoint dragOffset;
  unsigned __int8 v29;
  CGPoint v30;
  CGPoint v31;
  CGPoint v32;
  CATransform3D *v33;
  int v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  int8x16_t v40;
  int8x16_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  double v46;
  double v47;
  float v48;
  double v49;
  double v50;
  double v51;
  float v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  int8x16_t v60;
  double v61;
  BOOL v62;
  int8x16_t v63;
  int8x16_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  double v69;
  CATransform3D *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  double v75;
  double v76;
  id v77;
  double v78;
  double v79;
  double v80;
  float v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  _THNoteTransform *result;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  uint64_t v111;
  int8x16_t v112;
  CATransform3D v113;
  double v114[6];
  CATransform3D v115;
  CATransform3D v116;
  CATransform3D v117;
  CATransform3D v118;
  CATransform3D v119;
  CATransform3D v120;
  CATransform3D v121;
  CATransform3D v122;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v125;
  _OWORD v126[7];
  _OWORD v127[8];
  CGRect v128;
  CGRect v129;
  CGRect v130;

  retstr->zPosition = 0.0;
  v7 = *(_OWORD *)&CATransform3DIdentity.m31;
  v8 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&retstr->xform.m31 = v7;
  *(_OWORD *)&retstr->xform.m33 = v8;
  v9 = *(_OWORD *)&CATransform3DIdentity.m41;
  v10 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&retstr->xform.m41 = v9;
  *(_OWORD *)&retstr->xform.m43 = v10;
  v11 = *(_OWORD *)&CATransform3DIdentity.m11;
  v12 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&retstr->xform.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&retstr->xform.m13 = v12;
  v13 = *(_OWORD *)&CATransform3DIdentity.m21;
  v14 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&retstr->xform.m21 = v13;
  *(_OWORD *)&retstr->xform.m23 = v14;
  p_sublayerXform = &retstr->sublayerXform;
  *(_OWORD *)&retstr->sublayerXform.m43 = v10;
  *(_OWORD *)&retstr->sublayerXform.m41 = v9;
  *(_OWORD *)&retstr->sublayerXform.m33 = v8;
  *(_OWORD *)&retstr->sublayerXform.m31 = v7;
  *(_OWORD *)&retstr->sublayerXform.m23 = v14;
  *(_OWORD *)&retstr->sublayerXform.m21 = v13;
  *(_OWORD *)&retstr->sublayerXform.m13 = v12;
  *(_OWORD *)&retstr->sublayerXform.m11 = v11;
  retstr->position = CGPointZero;
  if (TSDPointLength(self, a4->dragOffset.x, a4->dragOffset.y) <= 0.0)
  {
    v24 = 1.0;
    v23 = 0.0;
    y = 0.0;
  }
  else
  {
    -[THNoteCardLayer bounds](self, "bounds");
    v17 = v16;
    v18 = -[THNoteCardLayer bounds](self, "bounds");
    x = a4->dragOffset.x;
    if (a4->flipped)
      y = 0.0;
    else
      y = a4->dragOffset.y;
    v22 = TSDPointLength(v18, x / v17, y / v19);
    *(float *)&v22 = v22 + v22;
    v23 = fminf(atanf(*(float *)&v22) * 50.0, 75.0);
    v24 = -x;
  }
  v25 = a4->cardIndex - (_QWORD)-[THNoteCardLayerDelegate noteCardLayerCount](self->_delegate, "noteCardLayerCount") + 1;
  filteredOutDirection = a4->filteredOutDirection;
  v127[4] = *(_OWORD *)&a4->flownOutDirection.y;
  v127[5] = filteredOutDirection;
  v127[6] = *(_OWORD *)&a4->scaleFactor;
  dragAnchor = a4->dragAnchor;
  v127[0] = *(_OWORD *)&a4->cardIndex;
  v127[1] = dragAnchor;
  dragOffset = a4->dragOffset;
  v127[3] = *(_OWORD *)&a4->shuffleAnimationState;
  v127[2] = dragOffset;
  v29 = -[THNoteCardLayer p_isTopCardParameters:](self, "p_isTopCardParameters:", v127);
  v30 = a4->filteredOutDirection;
  v126[4] = *(_OWORD *)&a4->flownOutDirection.y;
  v126[5] = v30;
  v126[6] = *(_OWORD *)&a4->scaleFactor;
  v31 = a4->dragAnchor;
  v126[0] = *(_OWORD *)&a4->cardIndex;
  v126[1] = v31;
  v32 = a4->dragOffset;
  v126[3] = *(_OWORD *)&a4->shuffleAnimationState;
  v126[2] = v32;
  v33 = (CATransform3D *)-[THNoteCardLayer p_isBottomCardParameters:](self, "p_isBottomCardParameters:", v126);
  v34 = (int)v33;
  v35 = CGPointZero.x;
  v36 = CGPointZero.y;
  v37 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&p_sublayerXform->m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&p_sublayerXform->m33 = v37;
  v38 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&p_sublayerXform->m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&p_sublayerXform->m43 = v38;
  v39 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&p_sublayerXform->m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&p_sublayerXform->m13 = v39;
  v40 = *(int8x16_t *)&CATransform3DIdentity.m21;
  v41 = *(int8x16_t *)&CATransform3DIdentity.m23;
  *(int8x16_t *)&p_sublayerXform->m21 = v40;
  *(int8x16_t *)&p_sublayerXform->m23 = v41;
  if (a4->flipped)
  {
    v23 = -v23;
    v33 = CATransform3DMakeRotation(&v125, 3.14159265, 0.0, 1.0, 0.0);
    v42 = *(_OWORD *)&v125.m33;
    *(_OWORD *)&p_sublayerXform->m31 = *(_OWORD *)&v125.m31;
    *(_OWORD *)&p_sublayerXform->m33 = v42;
    v43 = *(_OWORD *)&v125.m43;
    *(_OWORD *)&p_sublayerXform->m41 = *(_OWORD *)&v125.m41;
    *(_OWORD *)&p_sublayerXform->m43 = v43;
    v44 = *(_OWORD *)&v125.m13;
    *(_OWORD *)&p_sublayerXform->m11 = *(_OWORD *)&v125.m11;
    *(_OWORD *)&p_sublayerXform->m13 = v44;
    v40 = *(int8x16_t *)&v125.m21;
    v41 = *(int8x16_t *)&v125.m23;
    *(_OWORD *)&p_sublayerXform->m21 = *(_OWORD *)&v125.m21;
    *(int8x16_t *)&p_sublayerXform->m23 = v41;
  }
  v45 = v25 & (v25 >> 63);
  if ((v29 & 1) != 0 || a4->shuffleAnimationState == 2)
  {
    v46 = 0.0;
    if (!a4->flipped)
    {
      v47 = a4->dragOffset.x;
      *(double *)v40.i64 = TSDPointLength(v33, v47, a4->dragOffset.y);
      if (*(double *)v40.i64 > 0.0)
      {
        v48 = v47 / 300.0;
        *(double *)v40.i64 = (float)(atanf(v48) * 7.5);
        v41.i32[1] = -1080959162;
        v46 = *(double *)v40.i64 * -0.0174532925;
      }
    }
  }
  else
  {
    v46 = 0.0;
    if (!a4->forceHidden)
    {
      if (v34)
      {
        -[THNoteCardLayoutContext bottomCardAngle](self->_layoutContext, "bottomCardAngle");
        v46 = v49 * 0.0174532925;
        -[THNoteCardLayoutContext bottomCardOffset](self->_layoutContext, "bottomCardOffset");
        v35 = v50;
        v36 = v51;
        v33 = (CATransform3D *)-[THNoteCardLayerDelegate dragOffset](self->_delegate, "dragOffset");
        v23 = 0.0;
        if (*(double *)v40.i64 > 0.0)
        {
          v52 = *(double *)v40.i64 / 100.0;
          v53 = (float)(atanf(fabsf(v52)) / 1.5);
          -[THNoteCardLayoutContext scale](self->_layoutContext, "scale");
          v55 = 1.0;
          v56 = 1.0;
          if (v54 != 0.0)
          {
            -[THNoteCardLayoutContext scale](self->_layoutContext, "scale", v54, 1.0);
            v55 = 1.0;
            v56 = v57;
          }
          v58 = TSDMultiplyPointScalar(v35, v36, v55 / v56);
          *(double *)v40.i64 = TSDMultiplyPointScalar((1.0 - v53) * v58, (1.0 - v53) * v59, v56);
          v35 = *(double *)v40.i64;
          v36 = *(double *)v41.i64;
        }
      }
    }
  }
  if (a4->flownOut)
  {
    if (v45 == -1)
    {
      v40.i64[0] = 0xBFB1DF46A2529D39;
    }
    else
    {
      if (v45)
        goto LABEL_26;
      v40.i64[0] = 0x3FB1DF46A2529D39;
    }
    v46 = v46 + *(double *)v40.i64;
  }
LABEL_26:
  if (a4->flattenFlipped)
  {
    *(float *)v41.i32 = v23;
    v112 = v41;
    v40.i32[0] = 1127481344;
    v60.i64[0] = 0x8000000080000000;
    v60.i64[1] = 0x8000000080000000;
    v61 = *(float *)vbslq_s8(v60, v40, v41).i32;
    *(double *)v63.i64 = fabs(TSDPointLength(v33, a4->dragOffset.x, a4->dragOffset.y));
    v62 = *(double *)v63.i64 < 0.00999999978;
    v63.i32[0] = 1110704128;
    if (v62)
      *(float *)v63.i32 = 0.0;
    v64.i64[0] = 0x8000000080000000;
    v64.i64[1] = 0x8000000080000000;
    v23 = v61 - *(float *)vbslq_s8(v64, v63, v112).i32;
    v46 = -v46;
  }
  if (a4->filteredOut || a4->forceHidden)
    v46 = 0.0;
  v65 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v125.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v125.m33 = v65;
  v66 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v125.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v125.m43 = v66;
  v67 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v125.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v125.m13 = v67;
  v68 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v125.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v125.m23 = v68;
  *(_OWORD *)&a.m11 = *(_OWORD *)&v125.m11;
  *(_OWORD *)&a.m13 = v67;
  *(_OWORD *)&a.m21 = *(_OWORD *)&v125.m21;
  *(_OWORD *)&a.m23 = v68;
  *(_OWORD *)&a.m43 = v66;
  *(_OWORD *)&a.m41 = *(_OWORD *)&v125.m41;
  *(_OWORD *)&a.m33 = v65;
  *(_OWORD *)&a.m31 = *(_OWORD *)&v125.m31;
  v69 = 0.0;
  CATransform3DMakeRotation(&b, v46, 0.0, 0.0, 1.0);
  CATransform3DConcat(&v125, &a, &b);
  v121 = v125;
  CATransform3DMakeRotation(&v120, v23 * 0.0174532925, y, v24, 0.0);
  CATransform3DConcat(&v122, &v121, &v120);
  v125 = v122;
  memset(&v122, 0, sizeof(v122));
  v119 = v125;
  CATransform3DMakeTranslation(&v118, v35, v36, 0.0);
  CATransform3DConcat(&v122, &v119, &v118);
  memset(&v117, 0, sizeof(v117));
  v116 = v122;
  CATransform3DMakeScale(&v115, a4->scaleFactor, a4->scaleFactor, 1.0);
  v70 = CATransform3DConcat(&v117, &v116, &v115);
  v71 = *(_OWORD *)&v117.m33;
  *(_OWORD *)&retstr->xform.m31 = *(_OWORD *)&v117.m31;
  *(_OWORD *)&retstr->xform.m33 = v71;
  v72 = *(_OWORD *)&v117.m43;
  *(_OWORD *)&retstr->xform.m41 = *(_OWORD *)&v117.m41;
  *(_OWORD *)&retstr->xform.m43 = v72;
  v73 = *(_OWORD *)&v117.m13;
  *(_OWORD *)&retstr->xform.m11 = *(_OWORD *)&v117.m11;
  *(_OWORD *)&retstr->xform.m13 = v73;
  v74 = *(_OWORD *)&v117.m23;
  *(_OWORD *)&retstr->xform.m21 = *(_OWORD *)&v117.m21;
  *(_OWORD *)&retstr->xform.m23 = v74;
  if (TSDPointLength(v70, a4->dragOffset.x, a4->dragOffset.y) != 0.0)
  {
    -[THNoteCardLayer bounds](self, "bounds");
    v75 = CGRectGetWidth(v128) * -0.5;
    -[THNoteCardLayer bounds](self, "bounds");
    v76 = CGRectGetHeight(v129) * -0.5;
    v77 = -[THNoteCardLayer bounds](self, "bounds");
    v130.origin.x = TSDRectWithOriginAndSize(v77, v75, v76, v78, v79);
    v113 = v125;
    THBoundingCubeForTransformedRect(v130, &v113, v114);
    v80 = 0.5;
    if (!a4->flipped)
      v80 = 1.0;
    v81 = v114[2];
    v69 = v80 * fmaxf(-v81, 0.0);
  }
  if (a4->poppedState == 3)
    v82 = v69 + 90.0;
  else
    v82 = v69;
  if ((v29 & 1) == 0
    && (-[THNoteCardLayerDelegate topNoteCardIsFlipped](self->_delegate, "topNoteCardIsFlipped") & 1) == 0
    && -[THNoteCardLayerDelegate isDraggingTopCard](self->_delegate, "isDraggingTopCard"))
  {
    -[THNoteCardLayerDelegate dragOffset](self->_delegate, "dragOffset");
    *(float *)&v83 = v83 / 150.0;
    v82 = v82 + atanf(fabsf(*(float *)&v83)) * 53.9999986;
  }
  retstr->zPosition = v82 + (double)(5 * v45);
  if (!-[THNoteCardLayer superlayer](self, "superlayer", *(_OWORD *)&v112))
  {
    result = (_THNoteTransform *)-[THNoteCardLayer position](self, "position");
    goto LABEL_49;
  }
  v84 = TSDMultiplyPointScalar(a4->dragOffset.x, a4->dragOffset.y, -0.300000012);
  v86 = v85;
  v88 = CGPointZero.x;
  v87 = CGPointZero.y;
  if (a4->filteredOut)
  {
    v89 = a4->filteredOutDirection.x;
    v90 = a4->filteredOutDirection.y;
    -[THNoteCardLayerDelegate offscreenNoteDistance](self->_delegate, "offscreenNoteDistance");
    v92 = TSDMultiplyPointScalar(v89, v90, v91);
    v94 = v93;
  }
  else
  {
    if (!a4->flownOut)
    {
      v92 = CGPointZero.x;
      v94 = CGPointZero.y;
      goto LABEL_47;
    }
    v107 = a4->flownOutDirection.x;
    v108 = a4->flownOutDirection.y;
    -[THNoteCardLayerDelegate offscreenNoteDistance](self->_delegate, "offscreenNoteDistance");
    v92 = TSDMultiplyPointScalar(v107, v108, v109);
    v94 = v110;
    if (a4->flownOut)
    {
      if (v45 == -2)
      {
        v87 = 0.0;
        *(double *)&v111 = 60.0;
      }
      else if (v45 == -1)
      {
        v87 = 0.0;
        *(double *)&v111 = 120.0;
      }
      else
      {
        if (v45)
          goto LABEL_47;
        v87 = 0.0;
        *(double *)&v111 = 200.0;
      }
      v88 = *(double *)&v111;
    }
  }
LABEL_47:
  objc_msgSend(-[THNoteCardLayer superlayer](self, "superlayer"), "bounds");
  v100 = v88 + v92 + v84 + TSDCenterOfRect(v95, v96, v97, v98) + a4->dragOffset.x;
  v101 = v87 + v94 + v86 + v99 + a4->dragOffset.y;
  result = (_THNoteTransform *)-[THNoteCardLayoutContext noteCardOffset](self->_layoutContext, "noteCardOffset");
  v104 = v100 + v103;
  v106 = v101 + v105;
LABEL_49:
  retstr->position.x = v104;
  retstr->position.y = v106;
  return result;
}

- (_THNoteCardDisplayAttributes)p_displayAttributesForParameters:(_THNoteTransformParameters *)a3
{
  CGPoint filteredOutDirection;
  CGPoint dragAnchor;
  __int128 v7;
  unsigned int v8;
  CGPoint v9;
  CGPoint v10;
  __int128 v11;
  unsigned int v12;
  id v13;
  uint64_t useDarkerBackground;
  unsigned int v15;
  uint64_t v16;
  _OWORD v18[7];
  _OWORD v19[7];

  filteredOutDirection = a3->filteredOutDirection;
  v19[4] = *(_OWORD *)&a3->flownOutDirection.y;
  v19[5] = filteredOutDirection;
  v19[6] = *(_OWORD *)&a3->scaleFactor;
  dragAnchor = a3->dragAnchor;
  v19[0] = *(_OWORD *)&a3->cardIndex;
  v19[1] = dragAnchor;
  v7 = *(_OWORD *)&a3->shuffleAnimationState;
  v19[2] = a3->dragOffset;
  v19[3] = v7;
  v8 = -[THNoteCardLayer p_isTopCardParameters:](self, "p_isTopCardParameters:", v19);
  v9 = a3->filteredOutDirection;
  v18[4] = *(_OWORD *)&a3->flownOutDirection.y;
  v18[5] = v9;
  v18[6] = *(_OWORD *)&a3->scaleFactor;
  v10 = a3->dragAnchor;
  v18[0] = *(_OWORD *)&a3->cardIndex;
  v18[1] = v10;
  v11 = *(_OWORD *)&a3->shuffleAnimationState;
  v18[2] = a3->dragOffset;
  v18[3] = v11;
  v12 = -[THNoteCardLayer p_isBottomCardParameters:](self, "p_isBottomCardParameters:", v18);
  if (v8)
  {
    v13 = -[THNoteCardInfo hasBackContent](self->_noteCardInfo, "hasBackContent");
    useDarkerBackground = a3->useDarkerBackground;
    v15 = 1;
  }
  else
  {
    useDarkerBackground = 0;
    v13 = 0;
    v15 = v12;
  }
  v16 = 0x1000000;
  if ((v12 & (v8 ^ 1)) == 0)
    v16 = 0;
  return (_THNoteCardDisplayAttributes)(v16 | (useDarkerBackground << 32) | ((_QWORD)v13 << 16) | ((unint64_t)v15 << 8) | v15);
}

- (void)reset
{
  -[THNoteCardContentLayer reset](self->_frontLayer, "reset");
  -[THNoteCardContentLayer reset](self->_backLayer, "reset");
}

- (CGPoint)extendedDragOffsetInDirection:(CGPoint)a3
{
  double y;
  double x;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat width;
  double v18;
  double height;
  double v20;
  unsigned int v21;
  double v22;
  double v23;
  double v24;
  CGPoint result;
  CGPoint v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  v6 = fabs(TSDPointLength(self, a3.x, a3.y)) < 0.00999999978;
  v7 = 1.0;
  if (!v6)
    v7 = x;
  v8 = 0.0;
  if (!v6)
    v8 = y;
  v9 = TSDNormalizePoint(v7, v8);
  v11 = v10;
  -[THNoteCardLayer bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  width = v16;
  height = v18;
  if (-[THNoteCardLayer isFlipped](self, "isFlipped"))
  {
    v27.origin.x = v13;
    v27.origin.y = v15;
    v27.size.width = width;
    v27.size.height = height;
    v28 = CGRectInset(v27, 0.0, height * -0.5);
    v13 = v28.origin.x;
    v15 = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
  }
  v29.origin.x = v13;
  v29.origin.y = v15;
  v29.size.width = width;
  v29.size.height = height;
  v26.x = v9;
  v26.y = v11;
  v20 = THDistanceFromRectCenterToEdge(v29, v26);
  if (-[THNoteCardLayer isTopCard](self, "isTopCard"))
  {
    v21 = -[THNoteCardLayer isFlipped](self, "isFlipped");
    v22 = 1.0;
    if (!v21)
      v22 = 1.60000002;
  }
  else
  {
    v22 = 2.20000005;
  }
  v23 = v20 / 0.699999988 * (v9 * v22);
  v24 = v20 / 0.699999988 * (v11 * v22);
  result.y = v24;
  result.x = v23;
  return result;
}

- (void)setCardIndex:(int64_t)a3 animated:(BOOL)a4 duration:(double)a5
{
  -[THNoteCardLayer setCardIndex:forceHidden:animated:duration:](self, "setCardIndex:forceHidden:animated:duration:", a3, 0, a4, a5);
}

- (void)setCardIndex:(int64_t)a3 forceHidden:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  __int16 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CABasicAnimation *v20;
  double zPosition;
  double v22;
  CABasicAnimation *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CABasicAnimation *v28;
  id v29;
  _BOOL4 v30;
  __int16 v31;
  int64_t v33;
  __int16 v34;
  BOOL v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[21];
  _OWORD v42[8];
  _OWORD v43[8];
  int64_t v44;
  __int16 v45;
  BOOL v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[21];
  double v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  double v62;
  double v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[3];

  v7 = a5;
  v30 = a5;
  v8 = a4;
  -[THNoteCardLayer p_willUnsettle](self, "p_willUnsettle");
  v11 = *(_WORD *)&self->_transformParams.flipped;
  v31 = v11;
  v12 = *(__int128 *)((char *)&self->_transformParams.flownOutDirection + 3);
  v13 = *(_OWORD *)((char *)&self->_transformParams.filteredOutDirection.y + 3);
  v68 = *(_OWORD *)(&self->_transformParams.filteredOut + 3);
  v69[0] = v13;
  *(_QWORD *)((char *)v69 + 13) = *(_QWORD *)&self->_transformParams.useDarkerBackground;
  v14 = *(_OWORD *)((char *)&self->_transformParams.dragAnchor.y + 3);
  v64 = *(_OWORD *)(&self->_transformParams.forceHidden + 1);
  v65 = v14;
  v66 = *(_OWORD *)((char *)&self->_transformParams.dragOffset.y + 3);
  v67 = v12;
  v44 = a3;
  v45 = v11;
  v46 = v8;
  v15 = *(_OWORD *)(&self->_transformParams.forceHidden + 1);
  v16 = *(_OWORD *)((char *)&self->_transformParams.dragAnchor.y + 3);
  v49 = *(_OWORD *)((char *)&self->_transformParams.dragOffset.y + 3);
  v48 = v16;
  v47 = v15;
  v17 = *(__int128 *)((char *)&self->_transformParams.flownOutDirection + 3);
  v18 = *(_OWORD *)(&self->_transformParams.filteredOut + 3);
  v19 = *(_OWORD *)((char *)&self->_transformParams.filteredOutDirection.y + 3);
  *(_QWORD *)&v52[13] = *(_QWORD *)&self->_transformParams.useDarkerBackground;
  *(_OWORD *)v52 = v19;
  v51 = v18;
  v50 = v17;
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", &v44);
  if (!v7)
    a6 = 0.0;
  v20 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("zPosition"));
  zPosition = self->_transform.zPosition;
  *(float *)&zPosition = zPosition;
  -[CABasicAnimation setFromValue:](v20, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", zPosition));
  HIDWORD(v22) = HIDWORD(v53);
  *(float *)&v22 = v53;
  -[CABasicAnimation setToValue:](v20, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
  -[CABasicAnimation setTimingFunction:](v20, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  v23 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform"));
  v24 = *(_OWORD *)&self->_transform.xform.m33;
  v43[4] = *(_OWORD *)&self->_transform.xform.m31;
  v43[5] = v24;
  v25 = *(_OWORD *)&self->_transform.xform.m43;
  v43[6] = *(_OWORD *)&self->_transform.xform.m41;
  v43[7] = v25;
  v26 = *(_OWORD *)&self->_transform.xform.m13;
  v43[0] = *(_OWORD *)&self->_transform.xform.m11;
  v43[1] = v26;
  v27 = *(_OWORD *)&self->_transform.xform.m23;
  v43[2] = *(_OWORD *)&self->_transform.xform.m21;
  v43[3] = v27;
  -[CABasicAnimation setFromValue:](v23, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v43));
  v42[4] = v58;
  v42[5] = v59;
  v42[6] = v60;
  v42[7] = v61;
  v42[0] = v54;
  v42[1] = v55;
  v42[2] = v56;
  v42[3] = v57;
  -[CABasicAnimation setToValue:](v23, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v42));
  -[CABasicAnimation setTimingFunction:](v23, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  v28 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position"));
  -[CABasicAnimation setFromValue:](v28, "setFromValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", self->_transform.position.x, self->_transform.position.y));
  -[CABasicAnimation setToValue:](v28, "setToValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v62, v63));
  -[CABasicAnimation setTimingFunction:](v28, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  v29 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
  objc_msgSend(v29, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v20, v23, v28, 0));
  objc_msgSend(v29, "setDuration:", a6);
  objc_msgSend(v29, "setDelegate:", self);
  -[THNoteCardLayer addAnimation:forKey:](self, "addAnimation:forKey:", v29, CFSTR("cardIndexAnimation"));
  v39 = v67;
  v40 = v68;
  *(_OWORD *)v41 = v69[0];
  v36 = v64;
  v37 = v65;
  v33 = a3;
  v34 = v31;
  v35 = v8;
  *(_QWORD *)&v41[13] = *(_QWORD *)((char *)v69 + 13);
  v38 = v66;
  -[THNoteCardContentLayer setDisplayAttributes:animated:duration:](self->_frontLayer, "setDisplayAttributes:animated:duration:", (unint64_t)-[THNoteCardLayer p_displayAttributesForParameters:](self, "p_displayAttributesForParameters:", &v33) & 0xFFFFFFFFFFLL, v30, a6);
  -[THNoteCardLayer setForceHidden:](self, "setForceHidden:", v8);
  -[THNoteCardLayer setCardIndex:](self, "setCardIndex:", a3);
}

- (void)flipAnimated:(BOOL)a3 duration:(double)a4
{
  _BOOL4 v5;
  double v7;
  NSNumber *v8;
  double v9;
  NSNumber *v10;
  double v11;
  NSNumber *v12;
  double v13;
  NSArray *v14;
  CAKeyframeAnimation *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSNumber *v23;
  double v24;
  NSNumber *v25;
  double v26;
  NSNumber *v27;
  double v28;
  double v29;
  CAKeyframeAnimation *v30;
  NSValue *v31;
  NSValue *v32;
  NSValue *v33;
  id v34;
  CATransform3D v35;
  CATransform3D v36;
  CATransform3D v37;
  CATransform3D v38;
  CATransform3D v39;
  CATransform3D v40;
  CATransform3D v41;
  CATransform3D v42;
  CATransform3D v43;
  CATransform3D v44;
  CATransform3D v45;
  CATransform3D v46;
  CATransform3D v47;
  CATransform3D v48;
  CATransform3D v49;
  CATransform3D v50;
  CATransform3D v51;
  CATransform3D v52;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v55;
  CATransform3D v56;

  v5 = a3;
  -[THNoteCardLayer p_willUnsettle](self, "p_willUnsettle");
  if (v5)
  {
    LODWORD(v7) = 0;
    v8 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7);
    LODWORD(v9) = 1051372203;
    v10 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9);
    LODWORD(v11) = 1059760811;
    v12 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11);
    LODWORD(v13) = 1.0;
    v14 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, v10, v12, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13), 0);
    v15 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("zPosition"));
    -[THNoteCardLayer zPosition](self, "zPosition");
    v17 = v16;
    -[THNoteCardLayer zPosition](self, "zPosition");
    v19 = v18;
    -[THNoteCardLayer bounds](self, "bounds");
    v21 = v19 + (v20 + 20.0) * 0.5;
    -[CAKeyframeAnimation setKeyTimes:](v15, "setKeyTimes:", v14);
    *(float *)&v17 = v17;
    LODWORD(v22) = LODWORD(v17);
    v23 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22);
    *(float *)&v24 = v21;
    v25 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v24);
    LODWORD(v26) = LODWORD(v17);
    v27 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v26);
    LODWORD(v28) = LODWORD(v17);
    -[CAKeyframeAnimation setValues:](v15, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v23, v25, v27, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v28), 0));
    -[CAKeyframeAnimation setTimingFunctions:](v15, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), 0));
    if (self->_transformParams.flipped)
      v29 = -1.0;
    else
      v29 = 1.0;
    v30 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("sublayerTransform"));
    memset(&v56, 0, sizeof(v56));
    -[THNoteCardLayer sublayerTransform](self, "sublayerTransform");
    v55 = v56;
    a = v56;
    CATransform3DMakeRotation(&b, v29 * -90.0 * 0.0174532925, 0.0, 1.0, 0.0);
    CATransform3DConcat(&v55, &a, &b);
    v51 = v55;
    CATransform3DMakeRotation(&v50, v29 * -2.0 * 0.0174532925, 0.0, 0.0, 1.0);
    CATransform3DConcat(&v52, &v51, &v50);
    v55 = v52;
    v49 = v52;
    CATransform3DMakeTranslation(&v48, v29 * 160.0, 0.0, 0.0);
    CATransform3DConcat(&v52, &v49, &v48);
    v55 = v52;
    v52 = v56;
    v47 = v56;
    CATransform3DMakeRotation(&v46, v29 * -180.0 * 0.0174532925, 0.0, 1.0, 0.0);
    CATransform3DConcat(&v52, &v47, &v46);
    v44 = v52;
    CATransform3DMakeRotation(&v43, v29 * -1.25 * 0.0174532925, 0.0, 0.0, 1.0);
    CATransform3DConcat(&v45, &v44, &v43);
    v52 = v45;
    v42 = v45;
    CATransform3DMakeTranslation(&v41, v29 * 10.0, 0.0, 0.0);
    CATransform3DConcat(&v45, &v42, &v41);
    v52 = v45;
    v45 = v56;
    v40 = v56;
    CATransform3DMakeRotation(&v39, v29 * -180.0 * 0.0174532925, 0.0, 1.0, 0.0);
    CATransform3DConcat(&v45, &v40, &v39);
    -[CAKeyframeAnimation setKeyTimes:](v30, "setKeyTimes:", v14);
    -[CAKeyframeAnimation setTimingFunctions:](v30, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), 0));
    v38 = v56;
    v31 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v38);
    v37 = v55;
    v32 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v37);
    v36 = v52;
    v33 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v36);
    v35 = v45;
    -[CAKeyframeAnimation setValues:](v30, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v31, v32, v33, +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v35), 0));
    v34 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
    objc_msgSend(v34, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v15, v30, 0));
    objc_msgSend(v34, "setDuration:", a4);
    objc_msgSend(v34, "setDelegate:", self);
    -[THNoteCardLayer addAnimation:forKey:](self, "addAnimation:forKey:", v34, CFSTR("cardFlipAnimation"));
  }
  -[THNoteCardLayer setFlipped:](self, "setFlipped:", -[THNoteCardLayer isFlipped](self, "isFlipped") ^ 1);
}

- (void)popAnimated:(BOOL)a3 duration:(double)a4
{
  _BOOL4 v5;
  CABasicAnimation *v7;
  double v8;
  double v9;

  v5 = a3;
  -[THNoteCardLayer p_willUnsettle](self, "p_willUnsettle");
  if ((self->_transformParams.poppedState | 2) == 2)
  {
    if (!v5)
      a4 = 0.0;
    v7 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("zPosition"));
    -[CABasicAnimation setAdditive:](v7, "setAdditive:", 1);
    LODWORD(v8) = 0;
    -[CABasicAnimation setFromValue:](v7, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
    LODWORD(v9) = 1119092736;
    -[CABasicAnimation setToValue:](v7, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
    -[CABasicAnimation setDelegate:](v7, "setDelegate:", self);
    -[CABasicAnimation setRemovedOnCompletion:](v7, "setRemovedOnCompletion:", 0);
    -[CABasicAnimation setFillMode:](v7, "setFillMode:", kCAFillModeBoth);
    -[CABasicAnimation setDuration:](v7, "setDuration:", a4);
    -[THNoteCardLayer addAnimation:forKey:](self, "addAnimation:forKey:", v7, CFSTR("cardPopAnimation"));
  }
  -[THNoteCardLayer setPoppedState:](self, "setPoppedState:", 1);
}

- (void)unpopAnimated:(BOOL)a3 duration:(double)a4
{
  CABasicAnimation *v6;
  double v7;
  double v8;

  if ((self->_transformParams.poppedState | 2) == 3)
  {
    if (!a3)
      a4 = 0.0;
    v6 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("zPosition"));
    -[CABasicAnimation setAdditive:](v6, "setAdditive:", 1);
    LODWORD(v7) = 0;
    -[CABasicAnimation setFromValue:](v6, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
    LODWORD(v8) = -1028390912;
    -[CABasicAnimation setToValue:](v6, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
    -[CABasicAnimation setDelegate:](v6, "setDelegate:", self);
    -[CABasicAnimation setRemovedOnCompletion:](v6, "setRemovedOnCompletion:", 0);
    -[CABasicAnimation setFillMode:](v6, "setFillMode:", kCAFillModeBoth);
    -[CABasicAnimation setDuration:](v6, "setDuration:", a4);
    -[THNoteCardLayer addAnimation:forKey:](self, "addAnimation:forKey:", v6, CFSTR("cardUnpopAnimation"));
  }
  -[THNoteCardLayer setPoppedState:](self, "setPoppedState:", 2);
}

- (void)cancelDragAnimated:(BOOL)a3 duration:(double)a4
{
  _BOOL4 v5;
  int v7;
  CGPoint dragAnchor;
  __int128 v9;
  __int128 v10;
  CGPoint v11;
  CABasicAnimation *v12;
  double zPosition;
  double v14;
  CABasicAnimation *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CABasicAnimation *v20;
  id v21;
  _OWORD v22[8];
  _OWORD v23[8];
  int64_t cardIndex;
  int v25;
  int v26;
  CGPoint v27;
  CGPoint v28;
  __int128 v29;
  __int128 v30;
  CGPoint filteredOutDirection;
  __int128 v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  double v42;
  double v43;
  CGPoint v44;
  CGPoint v45;

  v5 = a3;
  -[THNoteCardLayer p_willUnsettle](self, "p_willUnsettle");
  cardIndex = self->_transformParams.cardIndex;
  v7 = *(_DWORD *)&self->_transformParams.flipped;
  dragAnchor = self->_transformParams.dragAnchor;
  v9 = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v29 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v30 = v9;
  v10 = *(_OWORD *)&self->_transformParams.scaleFactor;
  filteredOutDirection = self->_transformParams.filteredOutDirection;
  v32 = v10;
  v11 = CGPointZero;
  v44 = dragAnchor;
  v45 = v11;
  v25 = v7;
  v26 = 0;
  v27 = dragAnchor;
  v28 = v11;
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", &cardIndex);
  if (!v5)
    a4 = 0.0;
  v12 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("zPosition"));
  zPosition = self->_transform.zPosition;
  *(float *)&zPosition = zPosition;
  -[CABasicAnimation setFromValue:](v12, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", zPosition));
  HIDWORD(v14) = HIDWORD(v33);
  *(float *)&v14 = v33;
  -[CABasicAnimation setToValue:](v12, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));
  -[CABasicAnimation setTimingFunction:](v12, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn));
  v15 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform"));
  v16 = *(_OWORD *)&self->_transform.xform.m33;
  v23[4] = *(_OWORD *)&self->_transform.xform.m31;
  v23[5] = v16;
  v17 = *(_OWORD *)&self->_transform.xform.m43;
  v23[6] = *(_OWORD *)&self->_transform.xform.m41;
  v23[7] = v17;
  v18 = *(_OWORD *)&self->_transform.xform.m13;
  v23[0] = *(_OWORD *)&self->_transform.xform.m11;
  v23[1] = v18;
  v19 = *(_OWORD *)&self->_transform.xform.m23;
  v23[2] = *(_OWORD *)&self->_transform.xform.m21;
  v23[3] = v19;
  -[CABasicAnimation setFromValue:](v15, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v23));
  v22[4] = v38;
  v22[5] = v39;
  v22[6] = v40;
  v22[7] = v41;
  v22[0] = v34;
  v22[1] = v35;
  v22[2] = v36;
  v22[3] = v37;
  -[CABasicAnimation setToValue:](v15, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v22));
  -[CABasicAnimation setTimingFunction:](v15, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  v20 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position"));
  -[CABasicAnimation setFromValue:](v20, "setFromValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", self->_transform.position.x, self->_transform.position.y));
  -[CABasicAnimation setToValue:](v20, "setToValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v42, v43));
  -[CABasicAnimation setTimingFunction:](v20, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  v21 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
  objc_msgSend(v21, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v15, v20, 0));
  objc_msgSend(v21, "setDuration:", a4);
  objc_msgSend(v21, "setDelegate:", self);
  -[THNoteCardLayer addAnimation:forKey:](self, "addAnimation:forKey:", v21, CFSTR("cancelDragAnimation"));
  -[THNoteCardLayer setDragOffset:](self, "setDragOffset:", CGPointZero.x, CGPointZero.y);
  -[THNoteCardLayer setPoppedState:](self, "setPoppedState:", 0);
  -[THNoteCardLayer setDragAnchor:](self, "setDragAnchor:", CGPointZero.x, CGPointZero.y);
}

- (void)completeDragInDirection:(CGPoint)a3 newCardIndex:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  _BOOL8 v9;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;

  v9 = a5;
  y = a3.y;
  x = a3.x;
  -[THNoteCardLayer p_willUnsettle](self, "p_willUnsettle");
  -[THNoteCardLayer extendedDragOffsetInDirection:](self, "extendedDragOffsetInDirection:", x, y);
  v15 = v14;
  v17 = v16;
  if (-[THNoteCardLayer isFlipped](self, "isFlipped"))
    -[THNoteCardLayer p_completeFlippedDragViaDragOffset:newCardIndex:animated:duration:completion:](self, "p_completeFlippedDragViaDragOffset:newCardIndex:animated:duration:completion:", a4, v9, a7, v15, v17, a6);
  else
    -[THNoteCardLayer p_completeDragViaDragOffset:newCardIndex:animated:duration:completion:](self, "p_completeDragViaDragOffset:newCardIndex:animated:duration:completion:", a4, v9, a7, v15, v17, a6);
}

- (void)shuffleToIndex:(unint64_t)a3 animated:(BOOL)a4 delay:(double)a5 duration:(double)a6 completion:(id)a7
{
  _BOOL4 v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t cardIndex;
  int v17;
  int poppedState;
  CGFloat x;
  CGFloat y;
  __int128 v21;
  int v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSNumber *v31;
  double v32;
  NSNumber *v33;
  double v34;
  NSNumber *v35;
  double v36;
  CAKeyframeAnimation *v37;
  double v38;
  NSNumber *v39;
  double v40;
  NSNumber *v41;
  double v42;
  NSNumber *v43;
  double v44;
  double v45;
  NSNumber *v46;
  double v47;
  NSNumber *v48;
  double v49;
  NSNumber *v50;
  double v51;
  CAMediaTimingFunction *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CAMediaTimingFunction *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CAKeyframeAnimation *v62;
  NSValue *v63;
  NSValue *v64;
  NSValue *v65;
  CAKeyframeAnimation *v66;
  NSValue *v67;
  NSValue *v68;
  NSValue *v69;
  id v70;
  NSArray *v71;
  int v72;
  int v73;
  _BOOL4 v74;
  unint64_t v76;
  int v77;
  int v78;
  CGPoint v79;
  CGFloat v80;
  CGFloat v81;
  int v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[28];
  _OWORD v86[8];
  _OWORD v87[8];
  _OWORD v88[8];
  _OWORD v89[8];
  unint64_t v90;
  int v91;
  int v92;
  CGPoint v93;
  CGFloat v94;
  CGFloat v95;
  int v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[28];
  double v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  double v109;
  double v110;
  unint64_t v111;
  int v112;
  int v113;
  CGPoint v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[28];
  double v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  double v130;
  double v131;
  int64_t v132;
  int v133;
  int v134;
  CGPoint v135;
  CGFloat v136;
  CGFloat v137;
  int v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[28];
  double v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  double v151;
  double v152;
  int64_t v153;
  int v154;
  int v155;
  CGPoint v156;
  CGFloat v157;
  CGFloat v158;
  int v159;
  __int128 v160;
  __int128 v161;
  _BYTE v162[28];
  double v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  double v172;
  double v173;
  __int128 v174;
  __int128 v175;
  _OWORD v176[2];
  CGPoint dragAnchor;

  v10 = a4;
  v74 = a4;
  -[THNoteCardLayer p_willUnsettle](self, "p_willUnsettle");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", a7);
  -[THNoteCardLayerDelegate shuffleOffset:](self->_delegate, "shuffleOffset:", -[THNoteCardLayer cardIndex](self, "cardIndex") & 1);
  v13 = v12;
  v15 = v14;
  cardIndex = self->_transformParams.cardIndex;
  v17 = *(_DWORD *)&self->_transformParams.flipped;
  poppedState = self->_transformParams.poppedState;
  dragAnchor = self->_transformParams.dragAnchor;
  x = self->_transformParams.dragOffset.x;
  y = self->_transformParams.dragOffset.y;
  v21 = *(_OWORD *)((char *)&self->_transformParams.flownOutDirection.y + 4);
  v174 = *(_OWORD *)&self->_transformParams.flownOut;
  v175 = v21;
  v176[0] = *(CGPoint *)((char *)&self->_transformParams.filteredOutDirection + 4);
  *(_OWORD *)((char *)v176 + 12) = *(_OWORD *)&self->_transformParams.scaleFactor;
  v153 = cardIndex;
  v154 = v17;
  v22 = v17;
  v155 = poppedState;
  v23 = poppedState;
  v73 = poppedState;
  v156 = self->_transformParams.dragAnchor;
  v157 = x;
  v158 = y;
  v159 = 1;
  v24 = *(_OWORD *)&self->_transformParams.flownOut;
  v25 = *(_OWORD *)((char *)&self->_transformParams.flownOutDirection.y + 4);
  v26 = *(__int128 *)((char *)&self->_transformParams.filteredOutDirection + 4);
  *(_OWORD *)&v162[12] = *(_OWORD *)&self->_transformParams.scaleFactor;
  *(_OWORD *)v162 = v26;
  v161 = v25;
  v160 = v24;
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", &v153);
  v135 = dragAnchor;
  v139 = v174;
  v132 = cardIndex;
  v133 = v22;
  v134 = 3;
  v136 = x;
  v137 = y;
  v138 = 1;
  v140 = v175;
  *(_OWORD *)v141 = v176[0];
  *(_OWORD *)&v141[12] = *(_OWORD *)((char *)v176 + 12);
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", &v132);
  v111 = a3;
  v112 = v22;
  v72 = v22;
  v113 = 3;
  v114 = dragAnchor;
  v115 = v13;
  v116 = v15;
  v117 = 2;
  v118 = v174;
  v119 = v175;
  *(_OWORD *)v120 = v176[0];
  *(_OWORD *)&v120[12] = *(_OWORD *)((char *)v176 + 12);
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", &v111);
  v93 = dragAnchor;
  v97 = v174;
  v90 = a3;
  v91 = v22;
  v92 = v23;
  v94 = x;
  v95 = y;
  v96 = 3;
  v98 = v175;
  *(_OWORD *)v99 = v176[0];
  *(_OWORD *)&v99[12] = *(_OWORD *)((char *)v176 + 12);
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", &v90);
  if (v10)
    v27 = a5 + a6;
  else
    v27 = 0.0;
  v28 = (a5 + a6 * 0.1) / v27;
  v29 = a5 + a6 * 0.5;
  v30 = v29 / v27;
  LODWORD(v29) = 0;
  v31 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v29);
  *(float *)&v32 = v28;
  v33 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v32);
  *(float *)&v34 = v30;
  v35 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34);
  LODWORD(v36) = 1.0;
  v71 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v31, v33, v35, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v36), 0);
  v37 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("zPosition"));
  -[CAKeyframeAnimation setKeyTimes:](v37, "setKeyTimes:", v71);
  -[CAKeyframeAnimation setCalculationMode:](v37, "setCalculationMode:", kCAAnimationCubic);
  LODWORD(v38) = -0.5;
  v39 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v38);
  LODWORD(v40) = -0.5;
  v41 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v40);
  LODWORD(v42) = -0.5;
  v43 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v42);
  LODWORD(v44) = -0.5;
  -[CAKeyframeAnimation setTensionValues:](v37, "setTensionValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v39, v41, v43, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v44), 0));
  HIDWORD(v45) = HIDWORD(v163);
  *(float *)&v45 = v163;
  v46 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v45);
  HIDWORD(v47) = HIDWORD(v142);
  *(float *)&v47 = v142;
  v48 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v47);
  HIDWORD(v49) = HIDWORD(v121);
  *(float *)&v49 = v121;
  v50 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v49);
  HIDWORD(v51) = HIDWORD(v100);
  *(float *)&v51 = v100;
  -[CAKeyframeAnimation setValues:](v37, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v46, v48, v50, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v51), 0));
  v52 = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn);
  LODWORD(v53) = 1036831949;
  LODWORD(v54) = 1054280253;
  LODWORD(v55) = 0.5;
  LODWORD(v56) = 1.0;
  v57 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v53, v54, v55, v56);
  LODWORD(v58) = 1045220557;
  LODWORD(v59) = 1066192077;
  LODWORD(v60) = 2.0;
  LODWORD(v61) = 0.75;
  -[CAKeyframeAnimation setTimingFunctions:](v37, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v52, v57, +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v58, v60, v61, v59), 0));
  v62 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform"));
  -[CAKeyframeAnimation setKeyTimes:](v62, "setKeyTimes:", v71);
  -[CAKeyframeAnimation setCalculationMode:](v62, "setCalculationMode:", kCAAnimationCubic);
  v89[4] = v168;
  v89[5] = v169;
  v89[6] = v170;
  v89[7] = v171;
  v89[0] = v164;
  v89[1] = v165;
  v89[2] = v166;
  v89[3] = v167;
  v63 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v89);
  v88[4] = v147;
  v88[5] = v148;
  v88[6] = v149;
  v88[7] = v150;
  v88[0] = v143;
  v88[1] = v144;
  v88[2] = v145;
  v88[3] = v146;
  v64 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v88);
  v87[4] = v126;
  v87[5] = v127;
  v87[6] = v128;
  v87[7] = v129;
  v87[0] = v122;
  v87[1] = v123;
  v87[2] = v124;
  v87[3] = v125;
  v65 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v87);
  v86[4] = v105;
  v86[5] = v106;
  v86[6] = v107;
  v86[7] = v108;
  v86[0] = v101;
  v86[1] = v102;
  v86[2] = v103;
  v86[3] = v104;
  -[CAKeyframeAnimation setValues:](v62, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v63, v64, v65, +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v86), 0));
  -[CAKeyframeAnimation setTimingFunctions:](v62, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), 0));
  v66 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("position"));
  -[CAKeyframeAnimation setKeyTimes:](v66, "setKeyTimes:", v71);
  v67 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v172, v173);
  v68 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v151, v152);
  v69 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v130, v131);
  -[CAKeyframeAnimation setValues:](v66, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v67, v68, v69, +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v109, v110), 0));
  -[CAKeyframeAnimation setTimingFunctions:](v66, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), 0));
  v70 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
  objc_msgSend(v70, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v37, v62, v66, 0));
  objc_msgSend(v70, "setDuration:", v27);
  objc_msgSend(v70, "setDelegate:", self);
  objc_msgSend(v70, "setRemovedOnCompletion:", 0);
  -[THNoteCardLayer addAnimation:forKey:](self, "addAnimation:forKey:", v70, CFSTR("shuffleAnimation"));
  v76 = a3;
  v77 = v72;
  v78 = v73;
  v79 = dragAnchor;
  v80 = x;
  v81 = y;
  v82 = 3;
  v83 = v174;
  v84 = v175;
  *(_OWORD *)v85 = v176[0];
  *(_OWORD *)&v85[12] = *(_OWORD *)((char *)v176 + 12);
  -[THNoteCardContentLayer setDisplayAttributes:animated:duration:](self->_frontLayer, "setDisplayAttributes:animated:duration:", (unint64_t)-[THNoteCardLayer p_displayAttributesForParameters:](self, "p_displayAttributesForParameters:", &v76) & 0xFFFFFFFFFFLL, v74, v27);
  +[CATransaction commit](CATransaction, "commit");
  -[THNoteCardLayer setDragOffset:](self, "setDragOffset:", CGPointZero.x, CGPointZero.y);
  -[THNoteCardLayer setDragAnchor:](self, "setDragAnchor:", CGPointZero.x, CGPointZero.y);
  -[THNoteCardLayer setCardIndex:](self, "setCardIndex:", a3);
  -[THNoteCardLayer setFlipped:](self, "setFlipped:", 0);
}

- (void)setFilteredOut:(BOOL)a3 direction:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  _BOOL4 v9;
  double y;
  double x;
  _BOOL8 v12;
  __int128 v14;
  CGPoint dragAnchor;
  int v16;
  CABasicAnimation *v17;
  double zPosition;
  double v19;
  CABasicAnimation *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CABasicAnimation *v25;
  id v26;
  _OWORD v27[8];
  _OWORD v28[8];
  _OWORD v29[4];
  CGFloat v30;
  BOOL v31;
  _BYTE v32[7];
  double v33;
  double v34;
  __int128 v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  double v45;
  double v46;
  _DWORD v47[6];

  v9 = a5;
  y = a4.y;
  x = a4.x;
  v12 = a3;
  -[THNoteCardLayer p_willUnsettle](self, "p_willUnsettle");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", a7);
  v14 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v29[2] = self->_transformParams.dragOffset;
  v29[3] = v14;
  v30 = self->_transformParams.flownOutDirection.y;
  dragAnchor = self->_transformParams.dragAnchor;
  v29[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v29[1] = dragAnchor;
  v47[0] = *(_DWORD *)(&self->_transformParams.filteredOut + 1);
  *(_DWORD *)((char *)v47 + 3) = *((_DWORD *)&self->_transformParams.filteredOut + 1);
  v16 = *(_DWORD *)((char *)v47 + 3);
  v35 = *(_OWORD *)&self->_transformParams.scaleFactor;
  self->_transformParams.filteredOut = v12;
  self->_transformParams.filteredOutDirection.x = x;
  self->_transformParams.filteredOutDirection.y = y;
  v31 = v12;
  *(_DWORD *)&v32[3] = v16;
  *(_DWORD *)v32 = v47[0];
  v33 = x;
  v34 = y;
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", v29);
  if (!v9)
    a6 = 0.0;
  v17 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("zPosition"));
  zPosition = self->_transform.zPosition;
  *(float *)&zPosition = zPosition;
  -[CABasicAnimation setFromValue:](v17, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", zPosition));
  HIDWORD(v19) = HIDWORD(v36);
  *(float *)&v19 = v36;
  -[CABasicAnimation setToValue:](v17, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19));
  -[CABasicAnimation setTimingFunction:](v17, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  v20 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform"));
  v21 = *(_OWORD *)&self->_transform.xform.m33;
  v28[4] = *(_OWORD *)&self->_transform.xform.m31;
  v28[5] = v21;
  v22 = *(_OWORD *)&self->_transform.xform.m43;
  v28[6] = *(_OWORD *)&self->_transform.xform.m41;
  v28[7] = v22;
  v23 = *(_OWORD *)&self->_transform.xform.m13;
  v28[0] = *(_OWORD *)&self->_transform.xform.m11;
  v28[1] = v23;
  v24 = *(_OWORD *)&self->_transform.xform.m23;
  v28[2] = *(_OWORD *)&self->_transform.xform.m21;
  v28[3] = v24;
  -[CABasicAnimation setFromValue:](v20, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v28));
  v27[4] = v41;
  v27[5] = v42;
  v27[6] = v43;
  v27[7] = v44;
  v27[0] = v37;
  v27[1] = v38;
  v27[2] = v39;
  v27[3] = v40;
  -[CABasicAnimation setToValue:](v20, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v27));
  -[CABasicAnimation setTimingFunction:](v20, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  v25 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position"));
  -[CABasicAnimation setFromValue:](v25, "setFromValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", self->_transform.position.x, self->_transform.position.y));
  -[CABasicAnimation setToValue:](v25, "setToValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v45, v46));
  -[CABasicAnimation setTimingFunction:](v25, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  v26 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
  objc_msgSend(v26, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v17, v20, v25, 0));
  objc_msgSend(v26, "setDuration:", a6);
  objc_msgSend(v26, "setDelegate:", self);
  -[THNoteCardLayer addAnimation:forKey:](self, "addAnimation:forKey:", v26, CFSTR("cardIndexAnimation"));
  +[CATransaction commit](CATransaction, "commit");
  -[THNoteCardLayer setFilteredOut:direction:](self, "setFilteredOut:direction:", v12, x, y);
}

- (void)setFlownOut:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5
{
  -[THNoteCardLayer setFlownOut:direction:animated:duration:](self, "setFlownOut:direction:animated:duration:", a3, a4, 1.0, 0.0, a5);
}

- (void)setFlownOut:(BOOL)a3 direction:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6
{
  CGFloat y;
  CGFloat x;
  _BOOL4 v9;
  CGPoint dragAnchor;
  CABasicAnimation *v12;
  double zPosition;
  double v14;
  CABasicAnimation *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CAMediaTimingFunction *v24;
  CABasicAnimation *v25;
  id v26;
  _BOOL4 v27;
  _QWORD v28[5];
  BOOL v29;
  _OWORD v30[8];
  _OWORD v31[8];
  _OWORD v32[3];
  int shuffleAnimationState;
  BOOL v34;
  __int16 v35;
  char v36;
  CGFloat v37;
  CGFloat v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  double v51;
  double v52;
  __int16 v53;
  char v54;

  v27 = a5;
  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[THNoteCardLayer p_willUnsettle](self, "p_willUnsettle");
  +[CATransaction begin](CATransaction, "begin");
  dragAnchor = self->_transformParams.dragAnchor;
  v32[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v32[1] = dragAnchor;
  v32[2] = self->_transformParams.dragOffset;
  shuffleAnimationState = self->_transformParams.shuffleAnimationState;
  v53 = *(_WORD *)(&self->_transformParams.flownOut + 1);
  v54 = *(&self->_transformParams.flownOut + 3);
  v39 = *(_OWORD *)&self->_transformParams.filteredOut;
  v40 = *(_OWORD *)&self->_transformParams.filteredOutDirection.y;
  v41 = *(_QWORD *)&self->_transformParams.useDarkerBackground;
  self->_transformParams.flownOut = v9;
  self->_transformParams.flownOutDirection.x = x;
  self->_transformParams.flownOutDirection.y = y;
  v34 = v9;
  v36 = v54;
  v35 = v53;
  v37 = x;
  v38 = y;
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", v32);
  v12 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("zPosition"));
  zPosition = self->_transform.zPosition;
  *(float *)&zPosition = zPosition;
  -[CABasicAnimation setFromValue:](v12, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", zPosition));
  HIDWORD(v14) = HIDWORD(v42);
  *(float *)&v14 = v42;
  -[CABasicAnimation setToValue:](v12, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));
  -[CABasicAnimation setTimingFunction:](v12, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  v15 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform"));
  v16 = *(_OWORD *)&self->_transform.xform.m33;
  v31[4] = *(_OWORD *)&self->_transform.xform.m31;
  v31[5] = v16;
  v17 = *(_OWORD *)&self->_transform.xform.m43;
  v31[6] = *(_OWORD *)&self->_transform.xform.m41;
  v31[7] = v17;
  v18 = *(_OWORD *)&self->_transform.xform.m13;
  v31[0] = *(_OWORD *)&self->_transform.xform.m11;
  v31[1] = v18;
  v19 = *(_OWORD *)&self->_transform.xform.m23;
  v31[2] = *(_OWORD *)&self->_transform.xform.m21;
  v31[3] = v19;
  -[CABasicAnimation setFromValue:](v15, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v31));
  v30[4] = v47;
  v30[5] = v48;
  v30[6] = v49;
  v30[7] = v50;
  v30[0] = v43;
  v30[1] = v44;
  v30[2] = v45;
  v30[3] = v46;
  -[CABasicAnimation setToValue:](v15, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v30));
  if (v9)
  {
    v24 = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut);
  }
  else
  {
    LODWORD(v21) = -1110651699;
    LODWORD(v20) = 0.75;
    LODWORD(v22) = 0.5;
    LODWORD(v23) = 1.0;
    v24 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v20, v21, v22, v23);
  }
  -[CABasicAnimation setTimingFunction:](v15, "setTimingFunction:", v24);
  if (!v27)
    a6 = 0.0;
  v25 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position"));
  -[CABasicAnimation setFromValue:](v25, "setFromValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", self->_transform.position.x, self->_transform.position.y));
  -[CABasicAnimation setToValue:](v25, "setToValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v51, v52));
  -[CABasicAnimation setTimingFunction:](v25, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  -[THNoteCardLayer setPosition:](self, "setPosition:", v51, v52);
  v26 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
  objc_msgSend(v26, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v15, v25, 0));
  objc_msgSend(v26, "setFillMode:", kCAFillModeBoth);
  objc_msgSend(v26, "setDuration:", a6);
  objc_msgSend(v26, "setDelegate:", self);
  -[THNoteCardLayer addAnimation:forKey:](self, "addAnimation:forKey:", v26, CFSTR("cardIndexAnimation"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_CC04C;
  v28[3] = &unk_427268;
  v28[4] = self;
  v29 = v9;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v28);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)updateTransformAnimated:(BOOL)a3 duration:(double)a4
{
  _BOOL4 v5;
  CGPoint filteredOutDirection;
  CGPoint dragAnchor;
  __int128 v9;
  CABasicAnimation *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CABasicAnimation *v15;
  CABasicAnimation *v16;
  double zPosition;
  double v18;
  id v19;
  _BYTE __dst[280];
  _OWORD v21[8];
  _OWORD v22[8];
  _OWORD v23[7];
  double __src[35];

  v5 = a3;
  -[THNoteCardLayer p_willUnsettle](self, "p_willUnsettle");
  filteredOutDirection = self->_transformParams.filteredOutDirection;
  v23[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v23[5] = filteredOutDirection;
  v23[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
  dragAnchor = self->_transformParams.dragAnchor;
  v23[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v23[1] = dragAnchor;
  v9 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v23[2] = self->_transformParams.dragOffset;
  v23[3] = v9;
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", v23);
  if (v5)
  {
    v10 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform"));
    v11 = *(_OWORD *)&self->_transform.xform.m33;
    v22[4] = *(_OWORD *)&self->_transform.xform.m31;
    v22[5] = v11;
    v12 = *(_OWORD *)&self->_transform.xform.m43;
    v22[6] = *(_OWORD *)&self->_transform.xform.m41;
    v22[7] = v12;
    v13 = *(_OWORD *)&self->_transform.xform.m13;
    v22[0] = *(_OWORD *)&self->_transform.xform.m11;
    v22[1] = v13;
    v14 = *(_OWORD *)&self->_transform.xform.m23;
    v22[2] = *(_OWORD *)&self->_transform.xform.m21;
    v22[3] = v14;
    -[CABasicAnimation setFromValue:](v10, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v22));
    v21[4] = *(_OWORD *)&__src[9];
    v21[5] = *(_OWORD *)&__src[11];
    v21[6] = *(_OWORD *)&__src[13];
    v21[7] = *(_OWORD *)&__src[15];
    v21[0] = *(_OWORD *)&__src[1];
    v21[1] = *(_OWORD *)&__src[3];
    v21[2] = *(_OWORD *)&__src[5];
    v21[3] = *(_OWORD *)&__src[7];
    -[CABasicAnimation setToValue:](v10, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v21));
    v15 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position"));
    -[CABasicAnimation setFromValue:](v15, "setFromValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", self->_transform.position.x, self->_transform.position.y));
    -[CABasicAnimation setToValue:](v15, "setToValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", __src[33], __src[34]));
    v16 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("zPosition"));
    zPosition = self->_transform.zPosition;
    *(float *)&zPosition = zPosition;
    -[CABasicAnimation setFromValue:](v16, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", zPosition));
    HIDWORD(v18) = HIDWORD(__src[0]);
    *(float *)&v18 = __src[0];
    -[CABasicAnimation setToValue:](v16, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
    v19 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
    objc_msgSend(v19, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v16, v10, v15, 0));
    objc_msgSend(v19, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
    objc_msgSend(v19, "setDuration:", a4);
    objc_msgSend(v19, "setDelegate:", self);
    -[THNoteCardLayer addAnimation:forKey:](self, "addAnimation:forKey:", v19, CFSTR("transform"));
    memcpy(__dst, __src, sizeof(__dst));
    -[THNoteCardLayer p_applyNoteTransform:](self, "p_applyNoteTransform:", __dst);
  }
  else
  {
    memcpy(__dst, __src, sizeof(__dst));
    -[THNoteCardLayer p_applyNoteTransform:](self, "p_applyNoteTransform:", __dst);
    -[THNoteCardLayer p_mayHaveSettled](self, "p_mayHaveSettled");
  }
}

- (void)setScaleFactor:(double)a3 darkerBackground:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6
{
  _BOOL4 v7;
  CGPoint filteredOutDirection;
  CGPoint dragAnchor;
  __int128 v13;
  CABasicAnimation *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGPoint v19;
  CGPoint v20;
  __int128 v21;
  _OWORD v22[7];
  _BYTE __dst[280];
  _OWORD v24[8];
  _OWORD v25[8];
  _OWORD v26[7];
  _QWORD __src[35];

  v7 = a5;
  -[THNoteCardLayer p_willUnsettle](self, "p_willUnsettle");
  self->_transformParams.useDarkerBackground = a4;
  self->_transformParams.scaleFactor = a3;
  filteredOutDirection = self->_transformParams.filteredOutDirection;
  v26[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v26[5] = filteredOutDirection;
  v26[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
  dragAnchor = self->_transformParams.dragAnchor;
  v26[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v26[1] = dragAnchor;
  v13 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v26[2] = self->_transformParams.dragOffset;
  v26[3] = v13;
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", v26);
  if (v7)
  {
    v14 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform"));
    v15 = *(_OWORD *)&self->_transform.xform.m33;
    v25[4] = *(_OWORD *)&self->_transform.xform.m31;
    v25[5] = v15;
    v16 = *(_OWORD *)&self->_transform.xform.m43;
    v25[6] = *(_OWORD *)&self->_transform.xform.m41;
    v25[7] = v16;
    v17 = *(_OWORD *)&self->_transform.xform.m13;
    v25[0] = *(_OWORD *)&self->_transform.xform.m11;
    v25[1] = v17;
    v18 = *(_OWORD *)&self->_transform.xform.m23;
    v25[2] = *(_OWORD *)&self->_transform.xform.m21;
    v25[3] = v18;
    -[CABasicAnimation setFromValue:](v14, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v25));
    v24[4] = *(_OWORD *)&__src[9];
    v24[5] = *(_OWORD *)&__src[11];
    v24[6] = *(_OWORD *)&__src[13];
    v24[7] = *(_OWORD *)&__src[15];
    v24[0] = *(_OWORD *)&__src[1];
    v24[1] = *(_OWORD *)&__src[3];
    v24[2] = *(_OWORD *)&__src[5];
    v24[3] = *(_OWORD *)&__src[7];
    -[CABasicAnimation setToValue:](v14, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v24));
    -[CABasicAnimation setDelegate:](v14, "setDelegate:", self);
    -[THNoteCardLayer addAnimation:forKey:](self, "addAnimation:forKey:", v14, CFSTR("scaleAnimation"));
  }
  memcpy(__dst, __src, sizeof(__dst));
  -[THNoteCardLayer p_applyNoteTransform:](self, "p_applyNoteTransform:", __dst);
  v19 = self->_transformParams.filteredOutDirection;
  v22[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v22[5] = v19;
  v22[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
  v20 = self->_transformParams.dragAnchor;
  v22[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v22[1] = v20;
  v21 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v22[2] = self->_transformParams.dragOffset;
  v22[3] = v21;
  -[THNoteCardContentLayer setDisplayAttributes:animated:duration:](self->_frontLayer, "setDisplayAttributes:animated:duration:", (unint64_t)-[THNoteCardLayer p_displayAttributesForParameters:](self, "p_displayAttributesForParameters:", v22) & 0xFFFFFFFFFFLL, 1, a6);
}

- (void)layoutSublayers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNoteCardLayer;
  -[THNoteCardLayer layoutSublayers](&v3, "layoutSublayers");
  -[THNoteCardContentLayer setFrame:](self->_frontLayer, "setFrame:", TSDRectWithSize(-[THNoteCardLayer bounds](self, "bounds")));
  -[THNoteCardContentLayer setFrame:](self->_backLayer, "setFrame:", TSDRectWithSize(-[THNoteCardLayer bounds](self, "bounds")));
}

- (void)removeFromSuperlayer
{
  objc_super v3;

  self->_delegate = 0;
  -[THNoteCardLayer removeAllAnimations](self, "removeAllAnimations");
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardLayer;
  -[THNoteCardLayer removeFromSuperlayer](&v3, "removeFromSuperlayer");
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  const __CFString *v6;
  void (**completionAnimationCompletionBlock)(void);

  +[CATransaction begin](CATransaction, "begin", a3, a4);
  if (-[THNoteCardLayer animationForKey:](self, "animationForKey:", CFSTR("cardPopAnimation")) == a3)
  {
    if (self->_transformParams.poppedState == 1)
      self->_transformParams.poppedState = 3;
    v6 = CFSTR("cardPopAnimation");
    goto LABEL_10;
  }
  if (-[THNoteCardLayer animationForKey:](self, "animationForKey:", CFSTR("cardUnpopAnimation")) == a3)
  {
    if (self->_transformParams.poppedState == 2)
      self->_transformParams.poppedState = 0;
    v6 = CFSTR("cardUnpopAnimation");
LABEL_10:
    -[THNoteCardLayer removeAnimationForKey:](self, "removeAnimationForKey:", v6);
    goto LABEL_11;
  }
  self->_transformParams.poppedState = 0;
LABEL_11:
  if (-[THNoteCardLayer animationForKey:](self, "animationForKey:", CFSTR("completeDragAnimation")) == a3
    || -[THNoteCardLayer animationForKey:](self, "animationForKey:", CFSTR("completeFlippedDragAnimation")) == a3)
  {
    completionAnimationCompletionBlock = (void (**)(void))self->_completionAnimationCompletionBlock;
    if (completionAnimationCompletionBlock)
    {
      completionAnimationCompletionBlock[2]();

      self->_completionAnimationCompletionBlock = 0;
    }
    -[THNoteCardLayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("completeDragAnimation"));
    -[THNoteCardLayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("completeFlippedDragAnimation"));
  }
  -[THNoteCardLayer p_rebuildNoteTransform](self, "p_rebuildNoteTransform");
  +[CATransaction commit](CATransaction, "commit");
  -[THNoteCardLayer p_mayHaveSettled](self, "p_mayHaveSettled");
}

- (void)p_commonInitWithDarkMode:(BOOL)a3
{
  _BOOL8 v3;
  THNoteCardContentLayer *v5;
  id v6;
  uint64_t v7;
  THNoteCardContentLayer *backLayer;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  CATransform3D v15;
  CATransform3D v16;

  v3 = a3;
  v5 = -[THNoteCardContentLayer initFrontContentLayerWithDarkMode:]([THNoteCardContentLayer alloc], "initFrontContentLayerWithDarkMode:", a3);
  self->_frontLayer = v5;
  -[THNoteCardContentLayer setDoubleSided:](v5, "setDoubleSided:", 0);
  -[THNoteCardContentLayer setDelegate:](self->_frontLayer, "setDelegate:", self);
  v6 = -[THNoteCardContentLayer setShouldRasterize:](self->_frontLayer, "setShouldRasterize:", 1);
  -[THNoteCardContentLayer setRasterizationScale:](self->_frontLayer, "setRasterizationScale:", TSUScreenScale(v6, v7));
  -[THNoteCardLayer addSublayer:](self, "addSublayer:", self->_frontLayer);
  self->_backLayer = (THNoteCardContentLayer *)-[THNoteCardContentLayer initBackContentLayerWithDarkMode:]([THNoteCardContentLayer alloc], "initBackContentLayerWithDarkMode:", v3);
  CATransform3DMakeRotation(&v16, 3.14159265, 0.0, 1.0, 0.0);
  backLayer = self->_backLayer;
  v15 = v16;
  -[THNoteCardContentLayer setTransform:](backLayer, "setTransform:", &v15);
  -[THNoteCardContentLayer setDoubleSided:](self->_backLayer, "setDoubleSided:", 0);
  -[THNoteCardContentLayer setDelegate:](self->_backLayer, "setDelegate:", self);
  v9 = -[THNoteCardContentLayer setShouldRasterize:](self->_backLayer, "setShouldRasterize:", 1);
  -[THNoteCardContentLayer setRasterizationScale:](self->_backLayer, "setRasterizationScale:", TSUScreenScale(v9, v10));
  v11 = -[THNoteCardLayer addSublayer:](self, "addSublayer:", self->_backLayer);
  v13 = -[THNoteCardContentLayer setContentsScale:](self->_frontLayer, "setContentsScale:", TSUScreenScale(v11, v12));
  -[THNoteCardContentLayer setContentsScale:](self->_backLayer, "setContentsScale:", TSUScreenScale(v13, v14));
}

- (void)p_willUnsettle
{
  -[THNoteCardLayerDelegate noteCardWillUnsettle:](self->_delegate, "noteCardWillUnsettle:", self);
}

- (void)p_mayHaveSettled
{
  if (!objc_msgSend(-[THNoteCardLayer animationKeys](self, "animationKeys"), "count")
    && -[THNoteCardLayer isTopCard](self, "isTopCard")
    && (-[THNoteCardLayerDelegate isDraggingTopCard](self->_delegate, "isDraggingTopCard") & 1) == 0)
  {
    -[THNoteCardLayer p_didSettle](self, "p_didSettle");
  }
}

- (void)p_didSettle
{
  -[THNoteCardLayerDelegate noteCardDidSettle:](self->_delegate, "noteCardDidSettle:", self);
}

- (void)p_completeDragViaDragOffset:(CGPoint)a3 newCardIndex:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  double y;
  double x;
  _THNoteTransformParameters *p_transformParams;
  CGPoint filteredOutDirection;
  CGPoint dragAnchor;
  __int128 v15;
  int *p_shuffleAnimationState;
  _BOOL8 v17;
  _BOOL4 v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  NSNumber *v24;
  double v25;
  NSNumber *v26;
  double v27;
  NSArray *v28;
  double zPosition;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  double v34;
  double v35;
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int16 v43;
  __int128 v44;
  CAKeyframeAnimation *v45;
  double v46;
  NSNumber *v47;
  double v48;
  NSNumber *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CAMediaTimingFunction *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CAKeyframeAnimation *v60;
  NSValue *v61;
  NSValue *v62;
  CAKeyframeAnimation *v63;
  NSValue *v64;
  NSValue *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CAMediaTimingFunction *v70;
  id v71;
  _BOOL4 v72;
  _BOOL4 v74;
  int64_t v75;
  int64_t v76;
  char v77;
  __int16 v78;
  char v79;
  int v80;
  CGPoint v81;
  CGPoint v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _OWORD v87[8];
  _OWORD v88[8];
  _OWORD v89[8];
  int64_t v90;
  char v91;
  __int16 v92;
  char v93;
  int v94;
  CGPoint v95;
  CGPoint v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  double v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  double v110;
  double v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  CGPoint v116;
  CGPoint v117;
  __int16 v118;
  char v119;
  int64_t cardIndex;
  int v121;
  int v122;
  CGPoint v123;
  double v124;
  double v125;
  __int128 v126;
  __int128 v127;
  CGPoint v128;
  __int128 v129;
  double v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  double v139;
  double v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _OWORD v149[8];

  v74 = a5;
  y = a3.y;
  x = a3.x;
  p_transformParams = &self->_transformParams;
  filteredOutDirection = self->_transformParams.filteredOutDirection;
  v149[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v149[5] = filteredOutDirection;
  v149[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
  dragAnchor = self->_transformParams.dragAnchor;
  v149[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v149[1] = dragAnchor;
  v15 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v149[2] = self->_transformParams.dragOffset;
  v149[3] = v15;
  p_shuffleAnimationState = &self->_transformParams.shuffleAnimationState;
  v17 = -[THNoteCardLayer p_isBottomCardParameters:](self, "p_isBottomCardParameters:", v149);
  v18 = v17;
  v19 = TSDPointLength(v17, p_transformParams->dragOffset.x, p_transformParams->dragOffset.y);
  v21 = TSDPointLength(v20, x, y);
  v22 = (vabdd_f64(v21, v19) / v21 + 1.0) * 0.300000012;
  v23 = v22 * 0.5;
  LODWORD(v22) = 0;
  v24 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22);
  *(float *)&v25 = v23;
  v26 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25);
  LODWORD(v27) = 1.0;
  v28 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v24, v26, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v27), 0);
  zPosition = self->_transform.zPosition;
  v30 = *(_OWORD *)&self->_transform.xform.m33;
  v145 = *(_OWORD *)&self->_transform.xform.m31;
  v146 = v30;
  v31 = *(_OWORD *)&self->_transform.xform.m43;
  v147 = *(_OWORD *)&self->_transform.xform.m41;
  v148 = v31;
  v32 = *(_OWORD *)&self->_transform.xform.m13;
  v141 = *(_OWORD *)&self->_transform.xform.m11;
  v142 = v32;
  v33 = *(_OWORD *)&self->_transform.xform.m23;
  v143 = *(_OWORD *)&self->_transform.xform.m21;
  v144 = v33;
  v34 = self->_transform.position.x;
  v35 = self->_transform.position.y;
  cardIndex = p_transformParams->cardIndex;
  v36 = *(_DWORD *)&p_transformParams->flipped;
  v37 = *(_OWORD *)&p_transformParams->scaleFactor;
  v128 = p_transformParams->filteredOutDirection;
  v129 = v37;
  v38 = *(_OWORD *)&p_transformParams->flownOutDirection.y;
  v126 = *(_OWORD *)&p_transformParams->shuffleAnimationState;
  v127 = v38;
  v121 = v36;
  v122 = 0;
  v123 = CGPointZero;
  v124 = x;
  v125 = y;
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", &cardIndex);
  v72 = v18;
  if (v18)
    v130 = v130 + -1.0;
  v118 = *(_WORD *)&p_transformParams->flattenFlipped;
  v119 = *(&p_transformParams->forceHidden + 1);
  v39 = *((_OWORD *)p_shuffleAnimationState + 1);
  v112 = *(_OWORD *)p_shuffleAnimationState;
  v113 = v39;
  v40 = *((_OWORD *)p_shuffleAnimationState + 3);
  v42 = *(_OWORD *)p_shuffleAnimationState;
  v41 = *((_OWORD *)p_shuffleAnimationState + 1);
  v114 = *((_OWORD *)p_shuffleAnimationState + 2);
  v115 = v40;
  v116 = CGPointZero;
  v117 = CGPointZero;
  v75 = a4;
  v90 = a4;
  v91 = 0;
  v43 = *(_WORD *)&p_transformParams->flattenFlipped;
  v93 = *(&p_transformParams->forceHidden + 1);
  v92 = v43;
  v94 = 0;
  v95 = CGPointZero;
  v96 = v95;
  v44 = *((_OWORD *)p_shuffleAnimationState + 3);
  v99 = *((_OWORD *)p_shuffleAnimationState + 2);
  v100 = v44;
  v97 = v42;
  v98 = v41;
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", &v90);
  v45 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("zPosition"));
  -[CAKeyframeAnimation setKeyTimes:](v45, "setKeyTimes:", v28);
  *(float *)&v46 = zPosition;
  v47 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v46);
  HIDWORD(v48) = HIDWORD(v130);
  *(float *)&v48 = v130;
  v49 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v48);
  HIDWORD(v50) = HIDWORD(v101);
  *(float *)&v50 = v101;
  -[CAKeyframeAnimation setValues:](v45, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v47, v49, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v50), 0));
  LODWORD(v51) = 0;
  LODWORD(v52) = 0.5;
  LODWORD(v53) = 1.0;
  LODWORD(v54) = 1054280253;
  v55 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v51, v54, v52, v53);
  LODWORD(v56) = 1045220557;
  LODWORD(v57) = 1066192077;
  LODWORD(v58) = 2.0;
  LODWORD(v59) = 0.75;
  -[CAKeyframeAnimation setTimingFunctions:](v45, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v55, +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v56, v58, v59, v57), 0));
  v60 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform"));
  -[CAKeyframeAnimation setKeyTimes:](v60, "setKeyTimes:", v28);
  v89[4] = v145;
  v89[5] = v146;
  v89[6] = v147;
  v89[7] = v148;
  v89[0] = v141;
  v89[1] = v142;
  v89[2] = v143;
  v89[3] = v144;
  v61 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v89);
  v88[4] = v135;
  v88[5] = v136;
  v88[6] = v137;
  v88[7] = v138;
  v88[0] = v131;
  v88[1] = v132;
  v88[2] = v133;
  v88[3] = v134;
  v62 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v88);
  v87[4] = v106;
  v87[5] = v107;
  v87[6] = v108;
  v87[7] = v109;
  v87[0] = v102;
  v87[1] = v103;
  v87[2] = v104;
  v87[3] = v105;
  -[CAKeyframeAnimation setValues:](v60, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v61, v62, +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v87), 0));
  -[CAKeyframeAnimation setTimingFunctions:](v60, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), 0));
  v63 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("position"));
  -[CAKeyframeAnimation setKeyTimes:](v63, "setKeyTimes:", v28);
  v64 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v34, v35);
  v65 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v139, v140);
  -[CAKeyframeAnimation setValues:](v63, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v64, v65, +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v110, v111), 0));
  if (v72)
  {
    v70 = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut);
  }
  else
  {
    LODWORD(v68) = 1058306785;
    LODWORD(v67) = -0.25;
    LODWORD(v69) = 1.0;
    LODWORD(v66) = 1054280253;
    v70 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v66, v67, v68, v69);
  }
  if (!v74)
    a6 = 0.0;
  -[CAKeyframeAnimation setTimingFunctions:](v63, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), v70, 0));

  self->_completionAnimationCompletionBlock = objc_msgSend(a7, "copy");
  v71 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
  objc_msgSend(v71, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v45, v60, v63, 0));
  objc_msgSend(v71, "setDuration:", a6);
  objc_msgSend(v71, "setDelegate:", self);
  objc_msgSend(v71, "setRemovedOnCompletion:", 0);
  -[THNoteCardLayer addAnimation:forKey:](self, "addAnimation:forKey:", v71, CFSTR("completeDragAnimation"));
  v76 = v75;
  v77 = 0;
  v78 = v118;
  v79 = v119;
  v80 = 0;
  v81 = v117;
  v82 = v116;
  v85 = v114;
  v86 = v115;
  v83 = v112;
  v84 = v113;
  -[THNoteCardContentLayer setDisplayAttributes:animated:duration:](self->_frontLayer, "setDisplayAttributes:animated:duration:", (unint64_t)-[THNoteCardLayer p_displayAttributesForParameters:](self, "p_displayAttributesForParameters:", &v76) & 0xFFFFFFFFFFLL, v74, a6);
  -[THNoteCardLayer setDragOffset:](self, "setDragOffset:", CGPointZero.x, CGPointZero.y);
  -[THNoteCardLayer setDragAnchor:](self, "setDragAnchor:", CGPointZero.x, CGPointZero.y);
  -[THNoteCardLayer setCardIndex:](self, "setCardIndex:", v75);
  -[THNoteCardLayer setFlipped:](self, "setFlipped:", 0);
}

- (void)p_completeFlippedDragViaDragOffset:(CGPoint)a3 newCardIndex:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  double y;
  double x;
  _THNoteTransformParameters *p_transformParams;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  NSNumber *v17;
  double v18;
  NSNumber *v19;
  double v20;
  NSNumber *v21;
  double v22;
  NSArray *v23;
  double v24;
  NSNumber *v25;
  double v26;
  NSNumber *v27;
  double v28;
  NSNumber *v29;
  double v30;
  double zPosition;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CGPoint filteredOutDirection;
  double v41;
  double v42;
  BOOL flattenFlipped;
  __int16 v44;
  int poppedState;
  BOOL v46;
  double v47;
  double v48;
  int64_t v49;
  __int128 v50;
  double v51;
  double v52;
  double v53;
  BOOL v54;
  __int16 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  CAKeyframeAnimation *v61;
  double v62;
  NSNumber *v63;
  double v64;
  NSNumber *v65;
  double v66;
  NSNumber *v67;
  double v68;
  double v69;
  NSNumber *v70;
  double v71;
  NSNumber *v72;
  double v73;
  NSNumber *v74;
  double v75;
  CAKeyframeAnimation *v76;
  NSValue *v77;
  NSValue *v78;
  NSValue *v79;
  CAKeyframeAnimation *v80;
  NSValue *v81;
  NSValue *v82;
  NSValue *v83;
  CABasicAnimation *v84;
  id completionAnimationCompletionBlock;
  double v86;
  id v87;
  CAKeyframeAnimation *v88;
  CAKeyframeAnimation *v89;
  __int16 v90;
  BOOL v91;
  double v92;
  _BOOL4 v94;
  NSArray *v96;
  int64_t v97;
  BOOL v98;
  char v99;
  __int16 v100;
  int v101;
  CGPoint v102;
  CGPoint v103;
  __int128 v104;
  __int128 v105;
  CGPoint v106;
  __int128 v107;
  char v108[128];
  char v109[128];
  _OWORD v110[8];
  _OWORD v111[8];
  _OWORD v112[8];
  _OWORD v113[8];
  int64_t v114;
  BOOL v115;
  char v116;
  __int16 v117;
  int v118;
  CGPoint v119;
  CGPoint v120;
  __int128 v121;
  __int128 v122;
  CGPoint v123;
  __int128 v124;
  double v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  double v134;
  double v135;
  __int128 v136;
  __int128 v137;
  CGPoint v138;
  __int128 v139;
  CGPoint v140;
  CGPoint v141;
  int64_t v142;
  BOOL v143;
  char v144;
  __int16 v145;
  int v146;
  CGPoint v147;
  double v148;
  double v149;
  __int128 v150;
  __int128 v151;
  CGPoint v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  CGPoint v156;
  __int128 v157;
  int64_t cardIndex;
  BOOL flipped;
  int64_t v160;
  BOOL v161;
  BOOL v162;
  __int16 v163;
  int v164;
  CGPoint v165;
  double v166;
  double v167;
  __int128 v168;
  __int128 v169;
  CGPoint v170;
  __int128 v171;
  double v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  double v181;
  double v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  CGPoint v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;

  v94 = a5;
  y = a3.y;
  x = a3.x;
  p_transformParams = &self->_transformParams;
  v12 = TSDPointLength(self, self->_transformParams.dragOffset.x, self->_transformParams.dragOffset.y);
  v14 = TSDPointLength(v13, x, y);
  v15 = (vabdd_f64(v14, v12) / v14 + 1.0) * 0.200000003;
  v16 = v15 * 0.5;
  LODWORD(v15) = 0;
  v17 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v15);
  *(float *)&v18 = v16;
  v19 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18);
  v20 = (v16 + 0.600000024) * 0.5;
  *(float *)&v20 = v20;
  v21 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20);
  LODWORD(v22) = 1.0;
  v23 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v17, v19, v21, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22), 0);
  v92 = a6;
  if (v12 > v14)
  {
    LODWORD(v24) = 0;
    v25 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v24);
    LODWORD(v26) = 0;
    v27 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v26);
    v28 = (v16 + 1.0) * 0.5;
    *(float *)&v28 = v28;
    v29 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v28);
    LODWORD(v30) = 1.0;
    v96 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v25, v27, v29, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v30), 0);
  }
  else
  {
    v96 = v23;
  }
  zPosition = self->_transform.zPosition;
  v32 = *(_OWORD *)&self->_transform.xform.m33;
  v196 = *(_OWORD *)&self->_transform.xform.m31;
  v197 = v32;
  v33 = *(_OWORD *)&self->_transform.xform.m43;
  v198 = *(_OWORD *)&self->_transform.xform.m41;
  v199 = v33;
  v34 = *(_OWORD *)&self->_transform.xform.m13;
  v192 = *(_OWORD *)&self->_transform.xform.m11;
  v193 = v34;
  v35 = *(_OWORD *)&self->_transform.xform.m23;
  v194 = *(_OWORD *)&self->_transform.xform.m21;
  v195 = v35;
  v36 = *(_OWORD *)&p_transformParams->flownOutDirection.y;
  v154 = *(_OWORD *)&p_transformParams->shuffleAnimationState;
  v155 = v36;
  v37 = *(_OWORD *)&p_transformParams->scaleFactor;
  v39 = *(_OWORD *)&p_transformParams->shuffleAnimationState;
  v38 = *(_OWORD *)&p_transformParams->flownOutDirection.y;
  filteredOutDirection = p_transformParams->filteredOutDirection;
  v156 = filteredOutDirection;
  v157 = v37;
  v191 = CGPointZero;
  v42 = self->_transform.position.x;
  v41 = self->_transform.position.y;
  cardIndex = p_transformParams->cardIndex;
  flipped = p_transformParams->flipped;
  flattenFlipped = p_transformParams->flattenFlipped;
  v44 = *(_WORD *)&p_transformParams->forceHidden;
  poppedState = p_transformParams->poppedState;
  v46 = v12 <= v14;
  if (v12 > v14)
  {
    v47 = p_transformParams->dragOffset.x;
  }
  else
  {
    poppedState = 0;
    v47 = x;
  }
  if (v46)
    v48 = y;
  else
    v48 = p_transformParams->dragOffset.y;
  v49 = p_transformParams->cardIndex;
  v161 = p_transformParams->flipped;
  v160 = v49;
  v162 = flattenFlipped;
  v163 = v44;
  v164 = poppedState;
  v165 = CGPointZero;
  v166 = v47;
  v167 = v48;
  v50 = *(_OWORD *)&p_transformParams->scaleFactor;
  v170 = filteredOutDirection;
  v171 = v50;
  v168 = v39;
  v169 = v38;
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", &v160);
  v187 = v177;
  v188 = v178;
  v189 = v179;
  v190 = v180;
  v183 = v173;
  v184 = v174;
  v185 = v175;
  v186 = v176;
  v51 = v172;
  v52 = v181;
  v53 = v182;
  v147 = v191;
  v143 = flipped;
  v142 = cardIndex;
  v144 = 1;
  v145 = v44;
  v146 = 0;
  v148 = v47;
  v149 = v48;
  v150 = v154;
  v151 = v155;
  v152 = v156;
  v153 = v157;
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", &v142);
  v172 = -550.0;
  v54 = p_transformParams->flipped;
  v55 = *(_WORD *)&p_transformParams->forceHidden;
  v56 = *(_OWORD *)&p_transformParams->flownOutDirection.y;
  v136 = *(_OWORD *)&p_transformParams->shuffleAnimationState;
  v137 = v56;
  v57 = *(_OWORD *)&p_transformParams->scaleFactor;
  v59 = *(_OWORD *)&p_transformParams->shuffleAnimationState;
  v58 = *(_OWORD *)&p_transformParams->flownOutDirection.y;
  v138 = p_transformParams->filteredOutDirection;
  v139 = v57;
  v140 = CGPointZero;
  v141 = v140;
  v114 = a4;
  v90 = v55;
  v91 = v54;
  v115 = v54;
  v116 = 1;
  v117 = v55;
  v118 = 0;
  v119 = CGPointZero;
  v120 = v119;
  v60 = *(_OWORD *)&p_transformParams->scaleFactor;
  v123 = p_transformParams->filteredOutDirection;
  v124 = v60;
  v121 = v59;
  v122 = v58;
  -[THNoteCardLayer p_noteTransformForParameters:](self, "p_noteTransformForParameters:", &v114);
  v61 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("zPosition"));
  -[CAKeyframeAnimation setKeyTimes:](v61, "setKeyTimes:", v96);
  -[CAKeyframeAnimation setCalculationMode:](v61, "setCalculationMode:");
  LODWORD(v62) = -0.5;
  v63 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v62);
  LODWORD(v64) = -0.5;
  v65 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v64);
  LODWORD(v66) = -0.5;
  v67 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v66);
  LODWORD(v68) = -0.5;
  -[CAKeyframeAnimation setTensionValues:](v61, "setTensionValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v63, v65, v67, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v68), 0));
  *(float *)&v69 = zPosition;
  v70 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v69);
  *(float *)&v71 = v51;
  v72 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v71);
  HIDWORD(v73) = HIDWORD(v172);
  *(float *)&v73 = v172;
  v74 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v73);
  HIDWORD(v75) = HIDWORD(v125);
  *(float *)&v75 = v125;
  -[CAKeyframeAnimation setValues:](v61, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v70, v72, v74, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v75), 0));
  v89 = v61;
  -[CAKeyframeAnimation setTimingFunctions:](v61, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), 0));
  v76 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform"));
  -[CAKeyframeAnimation setKeyTimes:](v76, "setKeyTimes:", v96);
  -[CAKeyframeAnimation setCalculationMode:](v76, "setCalculationMode:", kCAAnimationCubic);
  v113[4] = v196;
  v113[5] = v197;
  v113[6] = v198;
  v113[7] = v199;
  v113[0] = v192;
  v113[1] = v193;
  v113[2] = v194;
  v113[3] = v195;
  v77 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v113);
  v112[4] = v187;
  v112[5] = v188;
  v112[6] = v189;
  v112[7] = v190;
  v112[0] = v183;
  v112[1] = v184;
  v112[2] = v185;
  v112[3] = v186;
  v78 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v112);
  v111[4] = v177;
  v111[5] = v178;
  v111[6] = v179;
  v111[7] = v180;
  v111[0] = v173;
  v111[1] = v174;
  v111[2] = v175;
  v111[3] = v176;
  v79 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v111);
  v110[4] = v130;
  v110[5] = v131;
  v110[6] = v132;
  v110[7] = v133;
  v110[0] = v126;
  v110[1] = v127;
  v110[2] = v128;
  v110[3] = v129;
  -[CAKeyframeAnimation setValues:](v76, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v77, v78, v79, +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v110), 0));
  v88 = v76;
  -[CAKeyframeAnimation setTimingFunctions:](v76, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), 0));
  v80 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("position"));
  -[CAKeyframeAnimation setKeyTimes:](v80, "setKeyTimes:", v96);
  -[CAKeyframeAnimation setCalculationMode:](v80, "setCalculationMode:", kCAAnimationCubic);
  v81 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v42, v41);
  v82 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v52, v53);
  v83 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v181, v182);
  -[CAKeyframeAnimation setValues:](v80, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v81, v82, v83, +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v134, v135), 0));
  -[CAKeyframeAnimation setTimingFunctions:](v80, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), 0));
  v84 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("sublayerTransform"));
  -[THNoteCardLayer sublayerTransform](self, "sublayerTransform");
  -[CABasicAnimation setFromValue:](v84, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v109));
  -[THNoteCardLayer sublayerTransform](self, "sublayerTransform");
  -[CABasicAnimation setToValue:](v84, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v108));
  completionAnimationCompletionBlock = self->_completionAnimationCompletionBlock;
  if (completionAnimationCompletionBlock)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardLayer p_completeFlippedDragViaDragOffset:newCardIndex:animated:duration:completion:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardLayer.mm"), 1545, CFSTR("already have a completion block"));
    completionAnimationCompletionBlock = self->_completionAnimationCompletionBlock;
  }
  if (v94)
    v86 = v92;
  else
    v86 = 0.0;

  self->_completionAnimationCompletionBlock = objc_msgSend(a7, "copy");
  v87 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
  objc_msgSend(v87, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v89, v88, v80, v84, 0));
  objc_msgSend(v87, "setDuration:", v86);
  objc_msgSend(v87, "setDelegate:", self);
  objc_msgSend(v87, "setRemovedOnCompletion:", 0);
  -[THNoteCardLayer addAnimation:forKey:](self, "addAnimation:forKey:", v87, CFSTR("completeFlippedDragAnimation"));
  v97 = a4;
  v98 = v91;
  v99 = 1;
  v100 = v90;
  v101 = 0;
  v102 = v141;
  v103 = v140;
  v104 = v136;
  v105 = v137;
  v106 = v138;
  v107 = v139;
  -[THNoteCardContentLayer setDisplayAttributes:animated:duration:](self->_frontLayer, "setDisplayAttributes:animated:duration:", (unint64_t)-[THNoteCardLayer p_displayAttributesForParameters:](self, "p_displayAttributesForParameters:", &v97) & 0xFFFFFFFFFFLL, v94, v86);
  -[THNoteCardLayer setDragOffset:](self, "setDragOffset:", CGPointZero.x, CGPointZero.y);
  -[THNoteCardLayer setDragAnchor:](self, "setDragAnchor:", CGPointZero.x, CGPointZero.y);
  -[THNoteCardLayer setCardIndex:](self, "setCardIndex:", a4);
  -[THNoteCardLayer setFlipped:](self, "setFlipped:", 0);
}

- (THNoteCardInfo)noteCardInfo
{
  return self->_noteCardInfo;
}

- (void)setNoteCardInfo:(id)a3
{
  self->_noteCardInfo = (THNoteCardInfo *)a3;
}

- (THNoteCardLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (THNoteCardContentLayer)frontLayer
{
  return self->_frontLayer;
}

- (THNoteCardContentLayer)backLayer
{
  return self->_backLayer;
}

- (id).cxx_construct
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  *((_DWORD *)self + 13) = 0;
  *((_QWORD *)self + 5) = 0;
  *(_DWORD *)((char *)self + 47) = 0;
  *(CGPoint *)((char *)self + 56) = CGPointZero;
  *(CGPoint *)((char *)self + 72) = CGPointZero;
  *((_BYTE *)self + 92) = 0;
  *((CGPoint *)self + 6) = CGPointZero;
  *((_BYTE *)self + 112) = 0;
  *(CGPoint *)((char *)self + 120) = CGPointZero;
  *((_QWORD *)self + 17) = 0x3FF0000000000000;
  *((_BYTE *)self + 144) = 0;
  *((_QWORD *)self + 19) = 0;
  v2 = *(_OWORD *)&CATransform3DIdentity.m31;
  v3 = *(_OWORD *)&CATransform3DIdentity.m33;
  v4 = *(_OWORD *)&CATransform3DIdentity.m41;
  *((_OWORD *)self + 17) = *(_OWORD *)&CATransform3DIdentity.m43;
  *((_OWORD *)self + 16) = v4;
  *((_OWORD *)self + 15) = v3;
  *((_OWORD *)self + 14) = v2;
  v5 = *(_OWORD *)&CATransform3DIdentity.m11;
  v6 = *(_OWORD *)&CATransform3DIdentity.m13;
  v7 = *(_OWORD *)&CATransform3DIdentity.m21;
  *((_OWORD *)self + 13) = *(_OWORD *)&CATransform3DIdentity.m23;
  *((_OWORD *)self + 12) = v7;
  *((_OWORD *)self + 11) = v6;
  *((_OWORD *)self + 10) = v5;
  v8 = *(_OWORD *)&CATransform3DIdentity.m21;
  v9 = *(_OWORD *)&CATransform3DIdentity.m23;
  v10 = *(_OWORD *)&CATransform3DIdentity.m13;
  *((_OWORD *)self + 18) = *(_OWORD *)&CATransform3DIdentity.m11;
  *((_OWORD *)self + 21) = v9;
  *((_OWORD *)self + 20) = v8;
  *((_OWORD *)self + 19) = v10;
  v11 = *(_OWORD *)&CATransform3DIdentity.m41;
  v12 = *(_OWORD *)&CATransform3DIdentity.m43;
  v13 = *(_OWORD *)&CATransform3DIdentity.m33;
  *((_OWORD *)self + 22) = *(_OWORD *)&CATransform3DIdentity.m31;
  *((_OWORD *)self + 25) = v12;
  *((_OWORD *)self + 24) = v11;
  *((_OWORD *)self + 23) = v13;
  *((CGPoint *)self + 26) = CGPointZero;
  return self;
}

@end
