@implementation CRLTextInputResponder

- (void)forwardInvocation:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _TtC8Freeform21CRLTextInputResponder *v15;

  v4 = a3;
  v15 = 0;
  objc_msgSend(v4, "getArgument:atIndex:", &v15, 2);
  if (!+[CRLCanvasEditor physicalKeyboardIsSender:](CRLCanvasEditor, "physicalKeyboardIsSender:", v15)
    || !-[CRLTextInputResponder isIgnoringKeyboardInput](self, "isIgnoringKeyboardInput"))
  {
    v5 = (char *)objc_msgSend(v4, "selector");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponder icc](self, "icc"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layerHost"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asiOSCVC"));

    if (objc_msgSend(v8, "respondsToSelector:withSender:", v5, v15))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
      objc_msgSend(v9, "hideMenu");

      objc_msgSend(v4, "invokeWithTarget:", v8);
    }
    else if ((v15 == self || objc_msgSend(CFSTR("UIEditingInteraction"), "isEqual:"))
           && (v5 == "cut:" || v5 == "copy:" || v5 == "paste:"))
    {
      v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230128);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DED630(v10, v11);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230148);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTextInputResponder(ObjCExtension) forwardInvocation:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLTextInputResponder.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 62, 0, "The OS undo gestures should not be sending us selectors we can't respond to!");

    }
    else if (!-[CRLTextInputResponder p_workAround17828487ForSelector:](self, "p_workAround17828487ForSelector:", v5))
    {
      -[CRLTextInputResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", v5);
    }

  }
}

- (BOOL)p_workAround17828487ForSelector:(SEL)a3
{
  return "cut:" == a3 || "copy:" == a3;
}

- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:(SEL)a3 withSender:(id)a4
{
  NSString *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(&off_1012CAD50, "containsObject:", v5);

  return v6;
}

- (id)_crlaxEditingTextRep
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v16;
  char v17;

  v17 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponder editor](self, "editor"));
  objc_opt_class(_TtC8Freeform11CRLWPEditor, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v17);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v17)
    goto LABEL_4;
  v7 = (void *)v6;

  v16 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editingReps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anyObject"));

  objc_opt_class(CRLWPRep, v10);
  v12 = __CRLAccessibilityCastAsClass(v11, (uint64_t)v9, 1, &v16);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (v16)
LABEL_4:
    abort();
  v14 = (void *)v13;

  return v14;
}

- (id)_accessibilitySpeakTextSelectionViews
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponder _crlaxEditingTextRep](self, "_crlaxEditingTextRep"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxValueForKey:", CFSTR("_selectionHighlightLayer")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "overlayRenderables"));
    v37 = 0;
    v6 = v3;
    objc_opt_class(CRLCanvasRepAccessibility, v7);
    v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v6, 1, &v37);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (v37)
      abort();
    v11 = (void *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxRetainedTarget"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "knobs"));

    v14 = objc_opt_new(NSMutableArray);
    v15 = v14;
    if (v4)
      -[NSMutableArray addObject:](v14, "addObject:", v4);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v16 = v5;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), "layer"));
          -[NSMutableArray addObject:](v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v18);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = v13;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j), "crlaxValueForKey:", CFSTR("layer"), (_QWORD)v29));
          if (v27)
            -[NSMutableArray addObject:](v15, "addObject:", v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v24);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (CGRect)_accessibilitySpeakRectForRange:(id)a3
{
  id v4;
  CGSize size;
  id v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  char v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  void *v41;
  CGPoint origin;
  CGSize v43;
  CGRect result;

  v4 = a3;
  v38 = 0;
  v39 = (double *)&v38;
  v41 = &unk_1010E66AB;
  v40 = 0x4010000000;
  size = CGRectZero.size;
  origin = CGRectZero.origin;
  v43 = size;
  v37 = 0;
  v6 = v4;
  objc_opt_class(_TtC8Freeform12CRLTextRange, v7);
  v9 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v6, 1, &v37);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v37)
    abort();
  v11 = (void *)v10;

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponder _crlaxEditingTextRep](self, "_crlaxEditingTextRep"));
    v13 = v12;
    if (v12)
    {
      v37 = 0;
      v14 = v12;
      objc_opt_class(CRLCanvasRepAccessibility, v15);
      v17 = __CRLAccessibilityCastAsSafeCategory(v16, (uint64_t)v14, 1, &v37);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (v37)
        abort();
      v19 = (void *)v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "crlaxRetainedTarget"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "canvas"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "canvasController"));

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10019EB4C;
      v32[3] = &unk_101234D30;
      v33 = v11;
      v36 = &v38;
      v34 = v14;
      v23 = v22;
      v35 = v23;
      if (__CRLAccessibilityPerformSafeBlock((uint64_t)v32))
        abort();

    }
  }
  v24 = v39[4];
  v25 = v39[5];
  v26 = v39[6];
  v27 = v39[7];

  _Block_object_dispose(&v38, 8);
  v28 = v24;
  v29 = v25;
  v30 = v26;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (UIView)selectionContainerViewBelowText
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  id v3;

  v2 = self;
  v3 = sub_10064888C();

  return (UIView *)v3;
}

- (UIView)selectionContainerViewAboveText
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  id v3;

  v2 = self;
  v3 = sub_1006488C8();

  return (UIView *)v3;
}

- (int64_t)textInputInProgress
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress);
}

- (void)setTextInputInProgress:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress) = (Class)a3;
}

- (BOOL)scribbleInProgress
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_scribbleInProgress);
}

- (void)setScribbleInProgress:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_scribbleInProgress) = a3;
}

- (BOOL)ignorePencilInputSource
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_ignorePencilInputSource);
}

- (void)setIgnorePencilInputSource:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_ignorePencilInputSource) = a3;
}

- (_TtC8Freeform18CRLTextInputLogger)inputLogger
{
  return (_TtC8Freeform18CRLTextInputLogger *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                      + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inputLogger));
}

- (void)setInputLogger:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inputLogger);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inputLogger) = (Class)a3;
  v3 = a3;

}

- (BOOL)iccAllowsTextEditing
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  char v3;

  v2 = self;
  v3 = sub_100648A3C();

  return v3 & 1;
}

- (BOOL)shouldChangeFirstResponderFor:(id)a3
{
  _TtC8Freeform21CRLTextInputResponder *v5;
  char v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = sub_100648B20(a3);
  swift_unknownObjectRelease(a3);

  return v6 & 1;
}

- (BOOL)editorIsChanging
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editorIsChanging);
}

- (void)setEditorIsChanging:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editorIsChanging) = a3;
}

- (_TtP8Freeform18CRLTextInputEditor_)editor
{
  return (_TtP8Freeform18CRLTextInputEditor_ *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor));
}

- (void)setEditor:(id)a3
{
  sub_10064BDF0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor);
}

- (void)setNeedsInputViewsReloaded
{
  _TtC8Freeform21CRLTextInputResponder *v2;

  v2 = self;
  sub_100648CC8();

}

- (BOOL)keyboardIsAnimating
{
  return objc_msgSend((id)objc_opt_self(CRLiOSKeyboardMonitor), "keyboardIsAnimating");
}

- (void)reloadInputViews
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  objc_super v3;

  v2 = self;
  sub_1006490B8();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CRLTextInputResponder();
  -[CRLTextInputResponder reloadInputViews](&v3, "reloadInputViews");

}

- (void)textWillChange
{
  _TtC8Freeform21CRLTextInputResponder *v2;

  v2 = self;
  sub_100649354();

}

- (void)textDidChange
{
  _TtC8Freeform21CRLTextInputResponder *v2;

  v2 = self;
  sub_100649408();

}

- (void)setEditor:(id)a3 withFlags:(unint64_t)a4
{
  char v4;
  _TtC8Freeform21CRLTextInputResponder *v7;

  v4 = a4;
  swift_unknownObjectRetain(a3);
  v7 = self;
  sub_1006494BC((uint64_t)a3, v4);

  swift_unknownObjectRelease(a3);
}

- (UIResponder)nextInChain
{
  return (UIResponder *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_nextInChain);
}

- (void)setNextInChain:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_nextInChain, a3);
}

- (UIResponder)nextResponder
{
  return (UIResponder *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_nextInChain);
}

- (CRLInteractiveCanvasController)icc
{
  return (CRLInteractiveCanvasController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_icc);
}

- (void)setIcc:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_icc, a3);
}

- (_TtC8Freeform21CRLTextInputResponder)initWithNextResponder:(id)a3 icc:(id)a4
{
  return (_TtC8Freeform21CRLTextInputResponder *)sub_100649990(a3, a4);
}

- (void)applicationDidEnterBackgroundWithNotification:(id)a3
{
  void *v3;
  id v5;
  id v6;
  id v7;
  _TtC8Freeform21CRLTextInputResponder *v8;

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor);
  if (v3)
  {
    v5 = a3;
    v8 = self;
    v6 = objc_msgSend(v3, "textInputReceiver");
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "abortMarkedText");

      swift_unknownObjectRelease(v7);
    }
    else
    {

    }
  }
}

- (void)applicationWillEnterForegroundWithNotification:(id)a3
{
  id v4;
  _TtC8Freeform21CRLTextInputResponder *v5;

  v4 = a3;
  v5 = self;
  sub_1006506B0();

}

- (void)firstResponderChangedWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform21CRLTextInputResponder *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100649E44((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)becomeFirstResponder
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100649FB8();

  return v3 & 1;
}

- (void)scribbleWillBegin
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_scribbleInProgress) = 1;
}

- (void)scribbleDidEnd
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_scribbleInProgress) = 0;
}

- (BOOL)endTextInputWhenFirstResponderResigns
{
  return *((_BYTE *)&self->super.super.isa
         + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_endTextInputWhenFirstResponderResigns);
}

- (void)setEndTextInputWhenFirstResponderResigns:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_endTextInputWhenFirstResponderResigns) = a3;
}

- (BOOL)resigningFirstResponder
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_resigningFirstResponder);
}

- (void)setResigningFirstResponder:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_resigningFirstResponder) = a3;
}

- (BOOL)resignFirstResponder
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10064A204();

  return v3 & 1;
}

- (BOOL)disallowBecomingFirstResponder
{
  return *((_BYTE *)&self->super.super.isa
         + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_disallowBecomingFirstResponder);
}

- (void)setDisallowBecomingFirstResponder:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_disallowBecomingFirstResponder) = a3;
}

- (BOOL)canBecomeFirstResponder
{
  return (*((_BYTE *)&self->super.super.isa
          + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_disallowBecomingFirstResponder) & 1) == 0
      && *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor) != 0;
}

- (BOOL)ignoreKeyboard
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_ignoreKeyboard);
}

- (void)setIgnoreKeyboard:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_ignoreKeyboard) = a3;
}

- (void)textSelectionWillChange
{
  _TtC8Freeform21CRLTextInputResponder *v2;

  v2 = self;
  sub_10064A524();

}

- (void)textSelectionDidChange
{
  _TtC8Freeform21CRLTextInputResponder *v2;

  v2 = self;
  sub_10064A5F8();

}

- (id)textInRange:(id)a3
{
  id v4;
  _TtC8Freeform21CRLTextInputResponder *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = a3;
  v5 = self;
  sub_10064A6CC(v4);
  v7 = v6;

  if (v7)
  {
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8Freeform21CRLTextInputResponder *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_10064A82C(v9, v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)textInput:(id)a3
{
  void (**v4)(const void *);
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  objc_class *v8;
  void (**v9)(const void *);
  void (*v10)(const void *);
  uint64_t v11;
  objc_class *v12;
  _TtC8Freeform21CRLTextInputResponder *v13;

  v4 = (void (**)(const void *))_Block_copy(a3);
  v5 = OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress;
  v6 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress);
  v7 = __OFADD__(v6, 1);
  v8 = (objc_class *)(v6 + 1);
  if (v7)
  {
    __break(1u);
  }
  else
  {
    v9 = v4;
    *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress) = v8;
    v10 = v4[2];
    v13 = self;
    v10(v9);
    v11 = *(uint64_t *)((char *)&self->super.super.isa + v5);
    v7 = __OFSUB__(v11, 1);
    v12 = (objc_class *)(v11 - 1);
    if (!v7)
    {
      *(Class *)((char *)&self->super.super.isa + v5) = v12;
      _Block_release(v9);

      return;
    }
  }
  __break(1u);
}

- (UITextRange)selectedTextRange
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  id v3;

  v2 = self;
  v3 = sub_10064AB40();

  return (UITextRange *)v3;
}

- (void)setSelectedTextRange:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  objc_class *v6;
  _TtC8Freeform21CRLTextInputResponder *v9;
  uint64_t v10;
  objc_class *v11;
  id v12;

  v3 = OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress;
  v4 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress);
  v5 = __OFADD__(v4, 1);
  v6 = (objc_class *)(v4 + 1);
  if (v5)
  {
    __break(1u);
  }
  else
  {
    *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress) = v6;
    v12 = a3;
    v9 = self;
    sub_10064AC34(a3, (uint64_t)v9);
    v10 = *(uint64_t *)((char *)&self->super.super.isa + v3);
    v5 = __OFSUB__(v10, 1);
    v11 = (objc_class *)(v10 - 1);
    if (!v5)
    {
      *(Class *)((char *)&self->super.super.isa + v3) = v11;

      return;
    }
  }
  __break(1u);
}

- (BOOL)isSettingMarkedText
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_isSettingMarkedText);
}

- (void)setIsSettingMarkedText:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_isSettingMarkedText) = a3;
}

- (UITextRange)markedTextRange
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  id v3;

  v2 = self;
  v3 = sub_10064AEE4();

  return (UITextRange *)v3;
}

- (NSDictionary)markedTextStyle
{
  return (NSDictionary *)0;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  void *v8;
  void *v9;
  _TtC8Freeform21CRLTextInputResponder *v10;

  length = a4.length;
  location = a4.location;
  if (a3)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = self;
  sub_10064AFF8(v7, v9, location, length);

  swift_bridgeObjectRelease(v9);
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  _TtC8Freeform21CRLTextInputResponder *v9;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = self;
  sub_10064B25C(a3, location, length);

}

- (void)unmarkText
{
  _TtC8Freeform21CRLTextInputResponder *v2;

  v2 = self;
  sub_10064B490();

}

- (int64_t)autocorrectionType
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_autocorrectionType);
}

- (void)setAutocorrectionType:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_autocorrectionType) = (Class)a3;
}

- (int64_t)inlinePredictionType
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inlinePredictionType);
}

- (void)setInlinePredictionType:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inlinePredictionType) = (Class)a3;
}

- (UITextPosition)beginningOfDocument
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  id v3;

  v2 = self;
  v3 = sub_10064B5F0();

  return (UITextPosition *)v3;
}

- (UITextPosition)endOfDocument
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  id v3;

  v2 = self;
  v3 = sub_10064B62C();

  return (UITextPosition *)v3;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  _TtC8Freeform21CRLTextInputResponder *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v15;

  v6 = qword_1013DCB58;
  v7 = a3;
  v8 = a4;
  v9 = self;
  if (v6 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v10 = (void *)qword_10147ECB0;
  v11 = v7;
  v12 = v8;
  v13 = v10;
  sub_10064B6C8((uint64_t)v9, (uint64_t)v11, (uint64_t)v12, &v15);

  return v15;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  id v6;
  _TtC8Freeform21CRLTextInputResponder *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_10064B910(v6, a4);

  return v8;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  uint64_t v8;
  id v9;
  _TtC8Freeform21CRLTextInputResponder *v10;
  void *v11;
  id v12;
  id v13;
  id v15;

  v8 = qword_1013DCB58;
  v9 = a3;
  v10 = self;
  if (v8 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v11 = (void *)qword_10147ECB0;
  v12 = v9;
  v13 = v11;
  sub_10064BA90((uint64_t)v10, (uint64_t)v12, a4, a5, &v15);

  return v15;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform21CRLTextInputResponder *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10064BC28((uint64_t)v6, (uint64_t)v7);

  return (int64_t)v9;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform21CRLTextInputResponder *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10064BC94((uint64_t)v6, (uint64_t)v7);

  return (int64_t)v9;
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inputDelegate));
}

- (void)setInputDelegate:(id)a3
{
  sub_10064BDF0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inputDelegate);
}

- (UITextInputTokenizer)tokenizer
{
  id v3;
  _TtC8Freeform21CRLTextInputResponder *v4;
  id v5;

  v3 = objc_allocWithZone((Class)type metadata accessor for CRLTextInputResponder.CRLWPInputStringTokenizer());
  v4 = self;
  v5 = objc_msgSend(v3, "initWithTextInput:", v4);

  return (UITextInputTokenizer *)v5;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v6;
  _TtC8Freeform21CRLTextInputResponder *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_10064BE70((uint64_t)v6, a4);

  return v8;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6;
  _TtC8Freeform21CRLTextInputResponder *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_10064BF70(v6, a4);

  return v8;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  id v5;
  _TtC8Freeform21CRLTextInputResponder *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_100650774(v5);

  return v7;
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  id v6;
  _TtC8Freeform21CRLTextInputResponder *v7;

  v6 = a4;
  v7 = self;
  sub_10064C1A0(a3, v6);

}

- (CGRect)firstRectForRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1005E8250(self, (uint64_t)a2, a3, sub_10064C3C4);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1005E8250(self, (uint64_t)a2, a3, sub_10064C5A4);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  _TtC8Freeform21CRLTextInputResponder *v5;
  double *v6;
  Class isa;

  v4 = a3;
  v5 = self;
  v6 = sub_10064C6E8(v4);

  sub_1004B8930(0, (unint64_t *)&qword_1013E6D50, UITextSelectionRect_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform21CRLTextInputResponder *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_10064C940(x, y);

  return v6;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC8Freeform21CRLTextInputResponder *v8;
  id v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  v9 = sub_10064CAE4(v7, x, y);

  return v9;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v5;
  _TtC8Freeform21CRLTextInputResponder *v6;
  id v7;
  id v9;

  y = a3.y;
  x = a3.x;
  v5 = qword_1013DCB58;
  v6 = self;
  if (v5 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v7 = (id)qword_10147ECB0;
  sub_10064CD10((uint64_t)v6, &v9, x, y);

  return v9;
}

- (BOOL)hasText
{
  void *v2;
  _TtC8Freeform21CRLTextInputResponder *v3;
  id v4;
  id v5;
  unsigned __int8 v6;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor);
  if (v2)
  {
    v3 = self;
    v4 = objc_msgSend(v2, "textInputReceiver");
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(v4, "hasText");

      swift_unknownObjectRelease(v5);
      return v6;
    }

  }
  return 0;
}

- (BOOL)keyboardIsHiding
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_keyboardIsHiding);
}

- (void)setKeyboardIsHiding:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_keyboardIsHiding) = a3;
}

- (void)beginTextInput
{
  _TtC8Freeform21CRLTextInputResponder *v2;

  v2 = self;
  sub_10064CED8();

}

- (void)endTextInput:(id)a3
{
  _TtC8Freeform21CRLTextInputResponder *v3;
  _TtC8Freeform21CRLTextInputResponder *v5;
  uint64_t v6;
  _TtC8Freeform21CRLTextInputResponder *v7;
  int v8;
  _TtC8Freeform21CRLTextInputResponder *Strong;
  _TtC8Freeform21CRLTextInputResponder *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  v3 = self;
  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(&v12, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v7 = self;
  }
  v8 = *((unsigned __int8 *)&v3->super.super.isa
       + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_resigningFirstResponder);
  Strong = (_TtC8Freeform21CRLTextInputResponder *)swift_unknownObjectWeakLoadStrong((char *)v3 + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_icc);
  if (Strong)
  {
    v10 = Strong;
    if (v8)
      v11 = 8320;
    else
      v11 = 0x2000;
    -[CRLTextInputResponder endEditingWithFlags:](Strong, "endEditingWithFlags:", v11, v12, v13);

    v3 = v10;
  }

  sub_1004CB800((uint64_t)&v12, &qword_1013E0230);
}

- (void)indentParagraphLevel:(id)a3
{
  sub_10064D43C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_10064D3FC);
}

- (void)outdentParagraphLevel:(id)a3
{
  sub_10064D43C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_10064D41C);
}

- (void)insertTab:(id)a3
{
  sub_10064D43C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_10064D4BC);
}

- (BOOL)editorWantsPlainTextDelete
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10064D4DC();

  return v3 & 1;
}

- (void)insertBackTab:(id)a3
{
  sub_10064D43C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_10064D5AC);
}

- (void)insertNewline:(id)a3
{
  sub_10064D43C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_10064D5CC);
}

- (void)escapePressed:(id)a3
{
  sub_10064D43C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_10064D5EC);
}

- (void)insertText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform21CRLTextInputResponder *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_10064D72C(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8Freeform21CRLTextInputResponder *v9;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = self;
  sub_10064D72C(v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)deleteKeyPressed
{
  _TtC8Freeform21CRLTextInputResponder *v2;

  v2 = self;
  sub_10064DA70();

}

- (void)deleteBackward
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  objc_class *v5;
  uint64_t v7;
  objc_class *v8;
  _TtC8Freeform21CRLTextInputResponder *v9;

  v2 = OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress;
  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress);
  v4 = __OFADD__(v3, 1);
  v5 = (objc_class *)(v3 + 1);
  if (v4)
  {
    __break(1u);
  }
  else
  {
    *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress) = v5;
    v9 = self;
    sub_10064DC18((uint64_t)v9);
    v7 = *(uint64_t *)((char *)&self->super.super.isa + v2);
    v4 = __OFSUB__(v7, 1);
    v8 = (objc_class *)(v7 - 1);
    if (!v4)
    {
      *(Class *)((char *)&self->super.super.isa + v2) = v8;

      return;
    }
  }
  __break(1u);
}

- (void)deleteWordBackward
{
  sub_10064DEE8((char *)self, (uint64_t)a2, (SEL *)&selRef_deleteWordBackward_);
}

- (void)deleteWordForward
{
  sub_10064DEE8((char *)self, (uint64_t)a2, (SEL *)&selRef_deleteWordForward_);
}

- (void)spacebarTapped:(id)a3
{
  sub_10064D43C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_10064DF80);
}

- (UIView)inputView
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  id v3;

  v2 = self;
  v3 = sub_10064E0F8();

  return (UIView *)v3;
}

- (UIView)inputAccessoryView
{
  return (UIView *)0;
}

- (UIInputViewController)inputAccessoryViewController
{
  void *v2;
  _TtC8Freeform21CRLTextInputResponder *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor);
  if (!v2)
    goto LABEL_5;
  v3 = self;
  if (!objc_msgSend((id)swift_unknownObjectRetain(v2), "wantsVisibleKeyboard"))
  {

    swift_unknownObjectRelease(v2);
LABEL_5:
    v4 = 0;
    return (UIInputViewController *)v4;
  }
  v4 = objc_msgSend(v2, "inputAccessoryViewController");
  swift_unknownObjectRelease(v2);

  return (UIInputViewController *)v4;
}

- (UIInputViewController)inputViewController
{
  return (UIInputViewController *)0;
}

- (BOOL)isIgnoringKeyboardInput
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_isIgnoringKeyboardInput);
}

- (void)setIsIgnoringKeyboardInput:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_isIgnoringKeyboardInput) = a3;
}

- (NSArray)keyCommands
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10064E4E0();

  if (v3)
  {
    sub_1004B8930(0, &qword_1013E7990, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (NSArray)arrowKeyCommands
{
  return (NSArray *)sub_10064EC2C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_100651470);
}

- (id)keyCommandsForArrowsWithModifiersIn:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform21CRLTextInputResponder *v7;
  _QWORD *v8;
  Class isa;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = sub_100650A24(v4, v6);

  swift_bridgeObjectRelease(v6);
  sub_1004B8930(0, &qword_1013E7990, UIKeyCommand_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (id)keyCommandForArrowIn:(id)a3 with:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  _TtC8Freeform21CRLTextInputResponder *v8;
  NSString v9;
  id v10;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = self;
  v9 = String._bridgeToObjectiveC()();
  v10 = objc_msgSend((id)objc_opt_self(UIKeyCommand), "keyCommandWithInput:modifierFlags:action:", v9, a4, "arrowKeyInputReceivedFrom:");

  objc_msgSend(v10, "setWantsPriorityOverSystemBehavior:", 1);
  swift_bridgeObjectRelease(v7);
  return v10;
}

- (NSArray)tirKeyCommands
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_10064E6F4();

  sub_1004B8930(0, &qword_1013E7990, UIKeyCommand_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (NSArray)deleteKeyCommands
{
  return (NSArray *)sub_10064EC2C((uint64_t)self, (uint64_t)a2, sub_1006508F4);
}

- (id)editorForKeyEvents
{
  id v2;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor);
  if (v2)
    v2 = objc_msgSend(v2, "keyInputReceiver");
  return v2;
}

- (void)arrowKeyInputReceivedFrom:(id)a3
{
  id v4;
  _TtC8Freeform21CRLTextInputResponder *v5;

  v4 = a3;
  v5 = self;
  sub_10064ECB4(v4);

}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  _TtC8Freeform21CRLTextInputResponder *v7;
  uint64_t v8;
  _TtC8Freeform21CRLTextInputResponder *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _OWORD v18[2];
  __int128 v19;
  uint64_t v20;

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v18, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    v9 = self;
  }
  sub_10064EEDC((uint64_t)a3, (uint64_t)v18, &v19);

  sub_1004CB800((uint64_t)v18, &qword_1013E0230);
  v10 = v20;
  if (!v20)
    return 0;
  v11 = sub_1004BB5A4(&v19, v20);
  v12 = *(_QWORD *)(v10 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v12 + 16))(v15, v13);
  v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v15, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(&v19);
  return v16;
}

- (_TtC8Freeform17CRLFloatingCursor)floatingCursorHelper
{
  return (_TtC8Freeform17CRLFloatingCursor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                     + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_floatingCursorHelper));
}

- (void)setFloatingCursorHelper:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_floatingCursorHelper);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_floatingCursorHelper) = (Class)a3;
  v3 = a3;

}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform21CRLTextInputResponder *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_10064F1EC(x, y);

}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v5;
  _TtC8Freeform21CRLTextInputResponder *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  v5 = qword_1013DCB58;
  v6 = self;
  if (v5 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v7 = (id)qword_10147ECB0;
  sub_10064F5AC((uint64_t)v6, x, y);

}

- (void)endFloatingCursor
{
  _TtC8Freeform21CRLTextInputResponder *v2;

  v2 = self;
  sub_10064F7BC();

}

- (CGRect)convertRectToTopResponderView:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_10064FA54(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, sub_10064F8B4);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)convertPointToTopResponderView:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform21CRLTextInputResponder *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_10064F8CC(x, y);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGRect)convertRectFromTopResponderView:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_10064FA54(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, sub_10064F928);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)convertPointFromTopResponderView:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform21CRLTextInputResponder *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_10064FAD0(x, y);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (UIView)topFirstResponderView
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_10064FC48();

  return (UIView *)v3;
}

- (UIView)textInputView
{
  _TtC8Freeform21CRLTextInputResponder *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_10064FE08();

  return (UIView *)v3;
}

- (void)reloadForMathPaperChangesWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform21CRLTextInputResponder *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10064FEAC();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC8Freeform21CRLTextInputResponder)init
{
  _TtC8Freeform21CRLTextInputResponder *result;

  result = (_TtC8Freeform21CRLTextInputResponder *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLTextInputResponder", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_reloadInputViewsTask));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_nextInChain);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_icc);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inputDelegate));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_floatingCursorHelper));
}

- (uint64_t)mathExpressionCompletionType
{
  id v0;
  unint64_t v1;

  v0 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v1 = (unint64_t)objc_msgSend(v0, "integerForKey:", CFSTR("CRLMathRecognitionMode"));

  if (v1 > 2)
    return 0;
  else
    return qword_100EFFD00[v1];
}

@end
