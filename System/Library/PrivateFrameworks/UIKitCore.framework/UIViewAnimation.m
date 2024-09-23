@implementation UIViewAnimation

- (id)initWithView:(void *)a3 indexPath:(int)a4 viewType:(int)a5 endRect:(char)a6 endAlpha:(char)a7 startFraction:(char)a8 endFraction:(double)a9 curve:(double)a10 animateFromCurrentPosition:(double)a11 shouldDeleteAfterAnimation:(double)a12 editing:(double)a13
{
  id v30;
  id v31;
  id *v32;
  void *v34;
  objc_super v35;

  v30 = a2;
  v31 = a3;
  if (a1)
  {
    v35.receiver = a1;
    v35.super_class = (Class)UIViewAnimation;
    v32 = (id *)objc_msgSendSuper2(&v35, sel_init);
    a1 = v32;
    if (v32)
    {
      objc_storeStrong(v32 + 3, a2);
      objc_storeStrong(a1 + 4, a3);
      *((_DWORD *)a1 + 4) = a4;
      *((double *)a1 + 9) = a10;
      *((double *)a1 + 10) = a11;
      *((double *)a1 + 11) = a12;
      *((double *)a1 + 5) = a13;
      *((double *)a1 + 6) = a14;
      *((double *)a1 + 7) = a15;
      *((double *)a1 + 8) = a9;
      if (a15 < a14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithView_indexPath_viewType_endRect_endAlpha_startFraction_endFraction_curve_animateFromCurrentPosition_shouldDeleteAfterAnimation_editing_, a1, CFSTR("UITableViewSupport.m"), 2944, CFSTR("Cell animation stop fraction must be greater than start fraction"));

      }
      *((_DWORD *)a1 + 5) = a5;
      *((_BYTE *)a1 + 8) = a6;
      *((_BYTE *)a1 + 9) = a7;
      *((_BYTE *)a1 + 10) = a8;
      *((_BYTE *)a1 + 11) = 1;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  objc_super v12;

  NSStringFromCGRect(self->_endRect);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)UIViewAnimation;
  -[UIViewAnimation description](&v12, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (self->_animateFromCurrentPosition)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_shouldDeleteAfterAnimation)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (!self->_editing)
    v7 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ view: %@ indexPath: %@ end alpha: %g end rect: %@ fraction: %g->%g curve: %d from current position: %@ delete after anim: %@ editing: %@"), v5, self->_view, self->_indexPath, *(_QWORD *)&self->_endAlpha, v3, *(_QWORD *)&self->_startFraction, *(_QWORD *)&self->_endFraction, self->_curve, v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
