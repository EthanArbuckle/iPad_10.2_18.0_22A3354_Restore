@implementation _UITintColorVisitor

- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6
{
  int *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  BOOL v30;
  char v31;

  if (-[_UIViewVisitor tracksHierarchy](self, "tracksHierarchy"))
  {
    if ((id)objc_msgSend(a4, "superview") != a3)
      return 0;
    if (objc_msgSend(a4, "_interactionTintColor"))
    {
      if (a4)
      {
        if ((*((_QWORD *)a4 + 14) & 0x1800000000) != 0 || *((_WORD *)a4 + 108))
          return 0;
        v13 = objc_msgSend(a3, "window");
LABEL_12:
        v14 = 0;
        v15 = (*((_QWORD *)a4 + 14) >> 44) & 1;
        if (a3)
          goto LABEL_13;
        goto LABEL_18;
      }
      v13 = objc_msgSend(a3, "window");
    }
    else
    {
      v13 = objc_msgSend(a3, "window");
      if (a4)
        goto LABEL_12;
    }
    LODWORD(v15) = 0;
    v14 = 1;
    if (a3)
    {
LABEL_13:
      v16 = *((_QWORD *)a3 + 14);
      if ((_DWORD)v15 != ((v16 >> 44) & 1))
      {
        v17 = 0;
        if ((v14 & 1) == 0)
        {
          v18 = *((_QWORD *)a4 + 14);
          v19 = (v18 >> 45) & 1;
          v20 = 3;
LABEL_40:
          if ((_DWORD)v19 != ((v16 >> 45) & 1))
          {
LABEL_50:
            self->_reasons = v20;
            self->_originalVisitedView = (UIView *)a3;
            v12 = &OBJC_IVAR____UITintColorVisitor__changedSubview;
            goto LABEL_5;
          }
          if ((v18 & v16 & 0x200000000000) != 0)
            goto LABEL_44;
LABEL_42:
          if ((v16 & 0x1800000000) != 0 || *((_WORD *)a3 + 108))
          {
LABEL_44:
            v23 = objc_msgSend(a6, "tintAdjustmentMode");
            v24 = objc_msgSend(a3, "tintAdjustmentMode");
            if (v23 == v24)
              v20 = 1;
            if (!v17 || v23 != v24)
              goto LABEL_50;
            goto LABEL_48;
          }
LABEL_55:
          if (!v13 || (id)v13 == a5)
          {
            if (!v17)
            {
LABEL_49:
              v20 = 1;
              goto LABEL_50;
            }
LABEL_48:
            v25 = +[UIView _defaultInteractionTintColorForIdiom:](UIView, "_defaultInteractionTintColorForIdiom:", objc_msgSend(a6, "_userInterfaceIdiom"));
            if (v25 == +[UIView _defaultInteractionTintColorForIdiom:](UIView, "_defaultInteractionTintColorForIdiom:", objc_msgSend(a3, "_userInterfaceIdiom")))return 0;
            goto LABEL_49;
          }
LABEL_57:
          if (a5)
          {
            *((_QWORD *)&v26 + 1) = *((unsigned int *)a5 + 30);
            *(_QWORD *)&v26 = *((_QWORD *)a5 + 14);
            v27 = (v26 >> 35) & 3;
            if (((v26 >> 35) & 3) == 0)
              v27 = 2 * (*((_WORD *)a5 + 108) != 0);
          }
          else
          {
            v27 = 0;
          }
          *((_QWORD *)&v28 + 1) = *(unsigned int *)(v13 + 120);
          *(_QWORD *)&v28 = *(_QWORD *)(v13 + 112);
          v29 = (v28 >> 35) & 3;
          if (((v28 >> 35) & 3) == 0)
            v29 = 2 * (*(_WORD *)(v13 + 216) != 0);
          v30 = v27 == v29;
          if (v27 == v29)
            v31 = v17;
          else
            v31 = 0;
          if (v30)
            v20 = 1;
          if ((v31 & 1) == 0)
            goto LABEL_50;
          goto LABEL_48;
        }
        v20 = 3;
LABEL_73:
        if ((v16 & 0x200000000000) != 0)
          goto LABEL_50;
        goto LABEL_42;
      }
LABEL_24:
      if ((v14 & 1) == 0
        && a3
        && (*((_QWORD *)a4 + 14) & 0x100000000000) != 0
        && (*((_QWORD *)a3 + 14) & 0x100000000000) != 0
        || objc_msgSend(a3, "_definesTintColor"))
      {
        v21 = (void *)objc_msgSend(a6, "_normalInheritedTintColor");
        if (v21 == (void *)objc_msgSend(a3, "_normalInheritedTintColor")
          && (objc_msgSend(v21, "isEqual:", v21) & 1) != 0)
        {
          v17 = 1;
          goto LABEL_51;
        }
      }
      else
      {
        v17 = 1;
        v20 = 2;
        if (!v13 || (id)v13 == a5)
        {
LABEL_37:
          if ((v14 & 1) != 0)
          {
LABEL_52:
            if (!a3)
              goto LABEL_55;
            v16 = *((_QWORD *)a3 + 14);
            goto LABEL_73;
          }
LABEL_38:
          v18 = *((_QWORD *)a4 + 14);
          if (!a3)
          {
            if ((v18 & 0x200000000000) != 0)
              goto LABEL_50;
            goto LABEL_55;
          }
          v19 = (v18 >> 45) & 1;
          v16 = *((_QWORD *)a3 + 14);
          goto LABEL_40;
        }
        v22 = (void *)objc_msgSend(a5, "_normalInheritedTintColor");
        if (v22 == (void *)objc_msgSend((id)v13, "_normalInheritedTintColor")
          && !objc_msgSend(v22, "isEqual:", v22))
        {
LABEL_51:
          v20 = 2;
          if ((v14 & 1) != 0)
            goto LABEL_52;
          goto LABEL_38;
        }
      }
      v17 = 0;
      v20 = 3;
      goto LABEL_37;
    }
LABEL_18:
    if ((v15 & 1) != 0)
    {
      if ((v14 & 1) == 0 && (*((_QWORD *)a4 + 14) & 0x200000000000) != 0)
      {
        v20 = 3;
        goto LABEL_50;
      }
      v20 = 1;
      if (!v13 || (id)v13 == a5)
        goto LABEL_50;
      LOBYTE(v17) = 0;
      v20 = 3;
      goto LABEL_57;
    }
    goto LABEL_24;
  }
  v12 = &OBJC_IVAR____UITintColorVisitor__originalVisitedView;
  a4 = a3;
LABEL_5:
  *(Class *)((char *)&self->super.super.isa + *v12) = (Class)a4;
  return 1;
}

- (BOOL)_visitView:(id)a3
{
  _BOOL4 v5;
  uint64_t v6;
  UIView *originalVisitedView;
  uint64_t *v8;
  UIView *v9;
  UIView *changedSubview;
  BOOL v11;
  char v12;
  _QWORD v14[10];
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v5 = -[_UIViewVisitor tracksHierarchy](self, "tracksHierarchy");
  v6 = objc_msgSend(a3, "superview");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __34___UITintColorVisitor__visitView___block_invoke;
  v14[3] = &unk_1E16EC758;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = v6;
  v14[7] = &v24;
  v15 = v5;
  v14[8] = &v20;
  v14[9] = &v16;
  if (v5)
  {
    originalVisitedView = self->_originalVisitedView;
    if (originalVisitedView && originalVisitedView == a3)
    {
      v8 = v25;
LABEL_8:
      *((_BYTE *)v8 + 24) = 1;
      goto LABEL_16;
    }
    changedSubview = self->_changedSubview;
    v11 = changedSubview != a3 || changedSubview == 0;
    if (!v11 || (UIView *)v6 != originalVisitedView)
      __34___UITintColorVisitor__visitView___block_invoke((uint64_t)v14);
  }
  else
  {
    __34___UITintColorVisitor__visitView___block_invoke((uint64_t)v14);
    v9 = self->_originalVisitedView;
    if (v9 && v9 == a3)
    {
      *((_BYTE *)v25 + 24) = 1;
      v8 = v21;
      goto LABEL_8;
    }
  }
LABEL_16:
  if (*((_BYTE *)v21 + 24))
    objc_msgSend(a3, "_tintColorDidChange");
  if (*((_BYTE *)v17 + 24))
    objc_msgSend(a3, "accessibilityApplyInvertFilter");
  v12 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v12;
}

- (_UITintColorVisitor)initWithNotificationReasons:(unint64_t)a3
{
  _UITintColorVisitor *v4;
  _UITintColorVisitor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITintColorVisitor;
  v4 = -[_UIViewVisitor initWithTraversalDirection:](&v7, sel_initWithTraversalDirection_, 2);
  v5 = v4;
  if (v4)
  {
    v4->_reasons = a3;
    -[_UIViewVisitor setVisitMaskViews:](v4, "setVisitMaskViews:", 0);
  }
  return v5;
}

- (_UITintColorVisitor)initWithTraversalDirection:(unint64_t)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIViewVisitors.m"), 430, CFSTR("Please use _UITintColorVisitor's designated initializer, initWithNotificationReasons:"));
  return 0;
}

@end
