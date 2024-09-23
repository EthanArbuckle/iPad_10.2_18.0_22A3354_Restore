@implementation UISlidingBarStateRequest

- (UISlidingBarStateRequest)init
{
  UISlidingBarStateRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISlidingBarStateRequest;
  result = -[UISlidingBarStateRequest init](&v3, sel_init);
  if (result)
    result->_userInitiated = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[UISlidingBarStateRequest leadingWidth](self, "leadingWidth");
  objc_msgSend(v4, "setLeadingWidth:");
  -[UISlidingBarStateRequest leadingOffscreenWidth](self, "leadingOffscreenWidth");
  objc_msgSend(v4, "setLeadingOffscreenWidth:");
  -[UISlidingBarStateRequest trailingWidth](self, "trailingWidth");
  objc_msgSend(v4, "setTrailingWidth:");
  -[UISlidingBarStateRequest trailingOffscreenWidth](self, "trailingOffscreenWidth");
  objc_msgSend(v4, "setTrailingOffscreenWidth:");
  -[UISlidingBarStateRequest supplementaryWidth](self, "supplementaryWidth");
  objc_msgSend(v4, "setSupplementaryWidth:");
  -[UISlidingBarStateRequest supplementaryOffscreenWidth](self, "supplementaryOffscreenWidth");
  objc_msgSend(v4, "setSupplementaryOffscreenWidth:");
  -[UISlidingBarStateRequest rubberBandInset](self, "rubberBandInset");
  objc_msgSend(v4, "setRubberBandInset:");
  -[UISlidingBarStateRequest mainWidth](self, "mainWidth");
  objc_msgSend(v4, "setMainWidth:");
  objc_msgSend(v4, "setUserInitiated:", -[UISlidingBarStateRequest userInitiated](self, "userInitiated"));
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void (**v6)(void *, const __CFString *, double);
  id v7;
  _QWORD aBlock[4];
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UISlidingBarStateRequest;
  -[UISlidingBarStateRequest description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__UISlidingBarStateRequest_description__block_invoke;
  aBlock[3] = &unk_1E16C1930;
  v5 = v4;
  v10 = v5;
  v6 = (void (**)(void *, const __CFString *, double))_Block_copy(aBlock);
  v6[2](v6, CFSTR("leading"), self->_leadingWidth);
  v6[2](v6, CFSTR("leadingOffscreen"), self->_leadingOffscreenWidth);
  v6[2](v6, CFSTR("trailing"), self->_trailingWidth);
  v6[2](v6, CFSTR("trailingOffscreen"), self->_trailingOffscreenWidth);
  v6[2](v6, CFSTR("supplementary"), self->_supplementaryWidth);
  v6[2](v6, CFSTR("supplementaryOffscreen"), self->_supplementaryOffscreenWidth);
  if (self->_rubberBandInset != 0.0)
    objc_msgSend(v5, "appendFormat:", CFSTR(" %@=%g"), CFSTR("rubberBandInset"), *(_QWORD *)&self->_rubberBandInset);
  v6[2](v6, CFSTR("main"), self->_mainWidth);
  if (self->_userInitiated)
    objc_msgSend(v5, "appendString:", CFSTR(" userInitiated"));
  v7 = v5;

  return v7;
}

uint64_t __39__UISlidingBarStateRequest_description__block_invoke(uint64_t result, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a3 > 0.0)
    return objc_msgSend(*(id *)(result + 32), "appendFormat:", CFSTR(" %@Width=%g"), a2, *(_QWORD *)&a3, v3, v4);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[UISlidingBarStateRequest leadingWidth](self, "leadingWidth");
    v7 = v6;
    objc_msgSend(v5, "leadingWidth");
    if (v7 != v8)
      goto LABEL_12;
    -[UISlidingBarStateRequest leadingOffscreenWidth](self, "leadingOffscreenWidth");
    v10 = v9;
    objc_msgSend(v5, "leadingOffscreenWidth");
    if (v10 != v11)
      goto LABEL_12;
    -[UISlidingBarStateRequest trailingWidth](self, "trailingWidth");
    v13 = v12;
    objc_msgSend(v5, "trailingWidth");
    if (v13 != v14)
      goto LABEL_12;
    -[UISlidingBarStateRequest trailingOffscreenWidth](self, "trailingOffscreenWidth");
    v16 = v15;
    objc_msgSend(v5, "trailingOffscreenWidth");
    if (v16 != v17)
      goto LABEL_12;
    -[UISlidingBarStateRequest supplementaryWidth](self, "supplementaryWidth");
    v19 = v18;
    objc_msgSend(v5, "supplementaryWidth");
    if (v19 != v20)
      goto LABEL_12;
    -[UISlidingBarStateRequest supplementaryOffscreenWidth](self, "supplementaryOffscreenWidth");
    v22 = v21;
    objc_msgSend(v5, "supplementaryOffscreenWidth");
    if (v22 == v23
      && (-[UISlidingBarStateRequest rubberBandInset](self, "rubberBandInset"),
          v25 = v24,
          objc_msgSend(v5, "rubberBandInset"),
          v25 == v26))
    {
      -[UISlidingBarStateRequest mainWidth](self, "mainWidth");
      v28 = v27;
      objc_msgSend(v5, "mainWidth");
      v30 = v28 == v29;
    }
    else
    {
LABEL_12:
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  double v5;
  unint64_t v6;
  double v7;

  -[UISlidingBarStateRequest leadingWidth](self, "leadingWidth");
  v4 = (unint64_t)v3;
  -[UISlidingBarStateRequest trailingWidth](self, "trailingWidth");
  v6 = (unint64_t)v5 ^ v4;
  -[UISlidingBarStateRequest supplementaryWidth](self, "supplementaryWidth");
  return v6 ^ (unint64_t)v7;
}

- (id)_matchingState:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  double v8;

  v8 = 0.0;
  -[UISlidingBarStateRequest _closestState:returningDistance:](self, "_closestState:returningDistance:", a3, &v8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v8 == 0.0)
    v5 = (void *)v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)_closestState:(id)a3
{
  return -[UISlidingBarStateRequest _closestState:returningDistance:](self, "_closestState:returningDistance:", a3, 0);
}

- (id)_closestState:(id)a3 returningDistance:(double *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    v11 = 1.79769313e308;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
      objc_msgSend(v13, "_absoluteDistanceFromRequest:", self, (_QWORD)v18);
      if (v14 < v11)
      {
        v15 = v14;
        v16 = v13;

        v11 = v15;
        v9 = v16;
        if (v15 == 0.0)
          break;
      }
      if (v8 == ++v12)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v15 = v11;
        v16 = v9;
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v16 = 0;
    v15 = 1.79769313e308;
  }

  if (a4)
    *a4 = v15;

  return v16;
}

- (id)_closestEqualOrLargerState:(id)a3
{
  return -[UISlidingBarStateRequest _closestEqualOrLargerState:returningDistance:](self, "_closestEqualOrLargerState:returningDistance:", a3, 0);
}

- (id)_closestEqualOrLargerState:(id)a3 returningDistance:(double *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  uint64_t v15;
  id v16;
  double v17;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    v11 = 1.79769313e308;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "_distanceFromRequest:", self, (_QWORD)v21);
        v15 = *(_QWORD *)&v14;
        if (v14 == 0.0)
        {
          v16 = v13;

          objc_msgSend(v16, "_absoluteDistanceFromRequest:", self);
          v11 = *(double *)&v15;
          v9 = v16;
          if (v17 == 0.0)
            goto LABEL_19;
        }
        else if (v14 >= 0.0 && v14 < v11)
        {
          v19 = v13;

          v11 = *(double *)&v15;
          v9 = v19;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v15 = *(_QWORD *)&v11;
      v16 = v9;
    }
    while (v8);
  }
  else
  {
    v16 = 0;
    v15 = 0x7FEFFFFFFFFFFFFFLL;
  }
LABEL_19:

  if (a4)
    *(_QWORD *)a4 = v15;

  return v16;
}

- (double)leadingWidth
{
  return self->_leadingWidth;
}

- (void)setLeadingWidth:(double)a3
{
  self->_leadingWidth = a3;
}

- (double)leadingOffscreenWidth
{
  return self->_leadingOffscreenWidth;
}

- (void)setLeadingOffscreenWidth:(double)a3
{
  self->_leadingOffscreenWidth = a3;
}

- (double)trailingWidth
{
  return self->_trailingWidth;
}

- (void)setTrailingWidth:(double)a3
{
  self->_trailingWidth = a3;
}

- (double)trailingOffscreenWidth
{
  return self->_trailingOffscreenWidth;
}

- (void)setTrailingOffscreenWidth:(double)a3
{
  self->_trailingOffscreenWidth = a3;
}

- (double)supplementaryWidth
{
  return self->_supplementaryWidth;
}

- (void)setSupplementaryWidth:(double)a3
{
  self->_supplementaryWidth = a3;
}

- (double)supplementaryOffscreenWidth
{
  return self->_supplementaryOffscreenWidth;
}

- (void)setSupplementaryOffscreenWidth:(double)a3
{
  self->_supplementaryOffscreenWidth = a3;
}

- (double)rubberBandInset
{
  return self->_rubberBandInset;
}

- (void)setRubberBandInset:(double)a3
{
  self->_rubberBandInset = a3;
}

- (double)mainWidth
{
  return self->_mainWidth;
}

- (void)setMainWidth:(double)a3
{
  self->_mainWidth = a3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

@end
