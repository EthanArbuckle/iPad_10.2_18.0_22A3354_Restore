@implementation AENotePopoverEditorController

- (AENotePopoverEditorController)init
{
  AENotePopoverEditorController *v2;
  AENoteEditorViewController *v3;
  AENoteEditorViewController *noteEditorViewController;
  UIPopoverController *v5;
  UIPopoverController *popoverController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AENotePopoverEditorController;
  v2 = -[AENotePopoverEditorController init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(AENoteEditorViewController);
    noteEditorViewController = v2->_noteEditorViewController;
    v2->_noteEditorViewController = v3;

    -[AENoteEditorViewController setDelegate:](v2->_noteEditorViewController, "setDelegate:", v2);
    v5 = (UIPopoverController *)objc_msgSend(objc_alloc((Class)UIPopoverController), "initWithContentViewController:", v2->_noteEditorViewController);
    popoverController = v2->_popoverController;
    v2->_popoverController = v5;

    -[UIPopoverController setDelegate:](v2->_popoverController, "setDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AENoteEditorViewController setDelegate:](self->_noteEditorViewController, "setDelegate:", 0);
  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AENotePopoverEditorController;
  -[AENotePopoverEditorController dealloc](&v3, "dealloc");
}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  CGSize size;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGRect remainder;
  CGRect slice;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = -[AENotePopoverEditorController p_permittedArrowDirectionsWithRect:view:](self, "p_permittedArrowDirectionsWithRect:view:", v9, x, y, width, height);
  if ((v10 & 0xC) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    size = CGRectZero.size;
    slice.origin = CGRectZero.origin;
    slice.size = size;
    remainder.origin = slice.origin;
    remainder.size = size;
    v21 = v13;
    size.width = v15;
    v22 = v17;
    v23 = v19;
    CGRectDivide(*(CGRect *)((char *)&size - 8), &slice, &remainder, v19 * 0.5, CGRectMinYEdge);
    objc_msgSend(v9, "convertRect:fromView:", 0, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    objc_msgSend(v9, "convertRect:fromView:", 0, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    v39 = v33;
    v40 = v32;
    v37 = v35;
    v38 = v34;
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    v49.origin.x = v25;
    v49.origin.y = v27;
    v49.size.width = v29;
    v49.size.height = v31;
    v44 = CGRectIntersection(v43, v49);
    if (v44.size.height > 0.0)
    {
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      v50.origin.y = v39;
      v50.origin.x = v40;
      v50.size.height = v37;
      v50.size.width = v38;
      v46 = CGRectIntersection(v45, v50);
      if (v46.size.height > 0.0)
      {
        v47.origin.x = x;
        v47.origin.y = y;
        v47.size.width = width;
        v47.size.height = height;
        v51.origin.x = v25;
        v51.size.width = v29;
        v51.origin.y = v27;
        v51.size.height = v31;
        v48 = CGRectIntersection(v47, v51);
        x = v48.origin.x;
        y = v48.origin.y;
        width = v48.size.width;
        height = v48.size.height;
      }
    }
  }
  -[AENotePopoverEditorController p_willShow](self, "p_willShow");
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController popoverController](self, "popoverController"));
  objc_msgSend(v36, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v9, v10, 1, x, y, width, height);

  -[AENotePopoverEditorController p_didShow](self, "p_didShow");
}

- (void)hide
{
  void *v3;

  -[AENotePopoverEditorController p_willHide](self, "p_willHide");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController popoverController](self, "popoverController"));
  objc_msgSend(v3, "dismissPopoverAnimated:", 1);

  -[AENotePopoverEditorController p_didHide](self, "p_didHide");
}

- (void)setTheme:(id)a3
{
  IMTheme *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  IMTheme *theme;
  void *v14;
  void *v15;
  IMTheme *v16;

  v5 = (IMTheme *)a3;
  if (self->_theme != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_theme, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController annotation](self, "annotation"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController theme](self, "theme"));
      v8 = objc_msgSend(v7, "annotationPageTheme");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController annotation](self, "annotation"));
      v10 = objc_msgSend(v9, "annotationStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController annotation](self, "annotation"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", v10, v8, objc_msgSend(v11, "annotationIsUnderline")));

      if (v12)
        -[AENotePopoverEditorController setAnnotationTheme:](self, "setAnnotationTheme:", v12);

    }
    theme = self->_theme;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController noteEditorViewController](self, "noteEditorViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textView"));
    -[IMTheme stylizeKeyboard:](theme, "stylizeKeyboard:", v15);

    v5 = v16;
  }

}

- (void)setAnnotationTheme:(id)a3
{
  AEAnnotationTheme *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AEAnnotationTheme *v18;

  v5 = (AEAnnotationTheme *)a3;
  if (self->_annotationTheme != v5)
  {
    v18 = v5;
    objc_storeStrong((id *)&self->_annotationTheme, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController annotationTheme](self, "annotationTheme"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "noteTextColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController noteEditorViewController](self, "noteEditorViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textView"));
    objc_msgSend(v9, "setTextColor:", v7);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController annotationTheme](self, "annotationTheme"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "noteFillColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController popoverController](self, "popoverController"));
    objc_msgSend(v12, "setBackgroundColor:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController annotationTheme](self, "annotationTheme"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "noteFillColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController popoverController](self, "popoverController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "viewIfLoaded"));
    objc_msgSend(v17, "setBackgroundColor:", v14);

    v5 = v18;
  }

}

- (BOOL)popoverControllerShouldDismissPopover:(id)a3
{
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
    -[AENotePopoverEditorController p_willHide](self, "p_willHide");
  return 1;
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  -[AENotePopoverEditorController p_didHide](self, "p_didHide", a3);
}

- (void)noteEditorViewControllerDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController annotation](self, "annotation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textView"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
  objc_msgSend(v8, "editorController:editedAnnotation:toText:", self, v5, v7);

}

- (void)p_willShow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController annotationTheme](self, "annotationTheme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noteFillColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController popoverController](self, "popoverController"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController annotationTheme](self, "annotationTheme"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "noteFillColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController popoverController](self, "popoverController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewIfLoaded"));
  objc_msgSend(v10, "setBackgroundColor:", v7);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v11, "willShowAnnotationEditor:") & 1) != 0)
    objc_msgSend(v11, "willShowAnnotationEditor:", self);

}

- (void)p_didShow
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "didShowAnnotationEditor:") & 1) != 0)
    objc_msgSend(v4, "didShowAnnotationEditor:", self);
  if (-[AENotePopoverEditorController editsOnLaunch](self, "editsOnLaunch"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v3, "beginEditing");

  }
}

- (void)p_willHide
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController noteEditorViewController](self, "noteEditorViewController"));
  objc_msgSend(v3, "endEditing");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "willHideAnnotationEditor:") & 1) != 0)
    objc_msgSend(v4, "willHideAnnotationEditor:", self);

}

- (void)p_didHide
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "didHideAnnotationEditor:") & 1) != 0)
    objc_msgSend(v3, "didHideAnnotationEditor:", self);

}

- (unint64_t)p_permittedArrowDirectionsWithRect:(CGRect)a3 view:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  CGFloat *p_y;
  CGFloat *p_height;
  CGSize *p_size;
  double v22;
  double v23;
  double MinY;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  _BOOL4 v34;
  _BOOL4 v35;
  double v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = -[AENotePopoverEditorController preferVerticalPresentation](self, "preferVerticalPresentation");
  -[AENotePopoverEditorController p_popoverSize](self, "p_popoverSize");
  v12 = v11;
  v14 = v13;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v43 = CGRectGetMinY(v46) - v14;
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v41 = v14 + CGRectGetMaxY(v47);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v44 = CGRectGetMinX(v48) - v12;
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v45 = v12 + CGRectGetMaxX(v49);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController noteEditorViewController](self, "noteEditorViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bc_windowForViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "windowScene"));
  v18 = (char *)objc_msgSend(v17, "interfaceOrientation");

  p_y = &CGRectZero.origin.y;
  p_height = &CGRectZero.size.height;
  p_size = &CGRectZero.size;
  v22 = CGRectZero.origin.x;
  if ((unint64_t)(v18 - 1) <= 3)
  {
    p_height = (CGFloat *)((char *)&unk_26A8D8 + 8 * (_QWORD)(v18 - 1));
    p_size = (CGSize *)((char *)&unk_26A8F8 + 8 * (_QWORD)(v18 - 1));
    p_y = (CGFloat *)((char *)&unk_26A918 + 8 * (_QWORD)(v18 - 1));
    v22 = 0.0;
  }
  objc_msgSend(v9, "convertRect:fromView:", 0, v22, *p_y, p_size->width, *p_height, *(_QWORD *)&v41);
  v23 = CGRectGetMinY(v50) + -10.0;
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = width;
  v51.size.height = height;
  MinY = CGRectGetMinY(v51);
  v25 = v23 + -28.5 + -17.5;
  objc_msgSend(v9, "frame", v44);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v52.origin.x = v27;
  v52.origin.y = v29;
  v52.size.width = v31;
  v52.size.height = v33;
  v34 = v45 <= CGRectGetWidth(v52) + -10.0;
  v35 = MinY <= v25 && v44 >= 10.0;
  if (MinY > v25)
    v34 = 0;
  if (v10)
  {
    v36 = v43;
    if (v43 < 10.0 && v42 > v23)
      goto LABEL_11;
    return (v42 <= v23) | (2 * (v36 >= 10.0));
  }
  v36 = v43;
  if (!v35 && !v34)
    return (v42 <= v23) | (2 * (v36 >= 10.0));
LABEL_11:
  v37 = !v34;
  v38 = 4;
  if (v37)
    v38 = 0;
  v37 = !v35;
  v39 = 8;
  if (v37)
    v39 = 0;
  return v38 | v39;
}

- (CGSize)p_popoverSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController noteEditorViewController](self, "noteEditorViewController"));
  objc_msgSend(v2, "preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v6 + 13.0;
  v8 = v4;
  result.height = v7;
  result.width = v8;
  return result;
}

- (AEAnnotationEditorDelegate)delegate
{
  return (AEAnnotationEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AEAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_annotation, a3);
}

- (AEAnnotationTheme)annotationTheme
{
  return self->_annotationTheme;
}

- (IMTheme)theme
{
  return self->_theme;
}

- (BOOL)editsOnLaunch
{
  return self->_editsOnLaunch;
}

- (void)setEditsOnLaunch:(BOOL)a3
{
  self->_editsOnLaunch = a3;
}

- (BOOL)preferVerticalPresentation
{
  return self->_preferVerticalPresentation;
}

- (void)setPreferVerticalPresentation:(BOOL)a3
{
  self->_preferVerticalPresentation = a3;
}

- (AENoteEditorViewController)noteEditorViewController
{
  return self->_noteEditorViewController;
}

- (void)setNoteEditorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_noteEditorViewController, a3);
}

- (UIPopoverController)popoverController
{
  return self->_popoverController;
}

- (void)setPopoverController:(id)a3
{
  objc_storeStrong((id *)&self->_popoverController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_noteEditorViewController, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_annotationTheme, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
