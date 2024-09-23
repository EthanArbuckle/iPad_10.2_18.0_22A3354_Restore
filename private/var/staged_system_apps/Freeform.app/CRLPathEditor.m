@implementation CRLPathEditor

+ (void)initialize
{
  objc_opt_class(CRLPathEditor, a2);
}

- (void)dealloc
{
  objc_super v3;

  -[CRLPathEditor p_closeCommandGroupBookkeepingAndUnregisterForOpenGroupNotifications](self, "p_closeCommandGroupBookkeepingAndUnregisterForOpenGroupNotifications");
  v3.receiver = self;
  v3.super_class = (Class)CRLPathEditor;
  -[CRLPathEditor dealloc](&v3, "dealloc");
}

- (void)didBecomeCurrentEditorForEditorController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[CRLPathEditor invalidateKnobs](self, "invalidateKnobs");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v5, "addDecorator:", self);

  if (-[CRLPathEditor isCreatingPath](self, "isCreatingPath"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "p_didScroll:", CFSTR("CRLCanvasDidScrollNotification"), v7);

  }
  v8.receiver = self;
  v8.super_class = (Class)CRLPathEditor;
  -[CRLBoardItemEditor didBecomeCurrentEditorForEditorController:](&v8, "didBecomeCurrentEditorForEditorController:", v4);

}

- (BOOL)wantsDoneButtonWhenEditing
{
  return 0;
}

- (_TtP8Freeform20CRLKeyInputReceiving_)keyInputReceiver
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return (_TtP8Freeform20CRLKeyInputReceiving_ *)sub_100221E08(self, 1, v2, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL____TtP8Freeform20CRLKeyInputReceiving_);
}

- (CRLTextInputReceiving)textInputReceiver
{
  return 0;
}

- (BOOL)wantsVisibleKeyboard
{
  return 0;
}

- (CRLTextSelecting)textSelectionDelegate
{
  return 0;
}

- (BOOL)shouldBeginTextInputWith:(id)a3
{
  return 0;
}

- (BOOL)wantsToInterceptDeleteEvents
{
  return 1;
}

- (BOOL)wantsToReceiveTextInput
{
  return 0;
}

- (BOOL)wantsRawArrowKeyEvents
{
  return 0;
}

- (BOOL)handlesSpacebar
{
  return 0;
}

- (void)willResignCurrentEditor
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CRLPathEditor;
  -[CRLBoardItemEditor willResignCurrentEditor](&v2, "willResignCurrentEditor");
}

- (void)didResignTextInputEditor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (BYTE1(self->_lastGhostPosition.y))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "commandController"));

    -[CRLPathEditor p_closeCommandGroupBookkeepingAndUnregisterForOpenGroupNotifications](self, "p_closeCommandGroupBookkeepingAndUnregisterForOpenGroupNotifications");
    objc_msgSend(*(id *)(&self->_willBecomeCurrentEditorAgain + 1), "setCommitSelectionPath:", 0);
    objc_msgSend(*(id *)(&self->_willBecomeCurrentEditorAgain + 1), "setPersistableForwardSelectionPath:", 0);
    objc_msgSend(v4, "closeGroup");

  }
  -[CRLPathEditor invalidateKnobs](self, "invalidateKnobs");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v5, "removeDecorator:", self);

  if (!BYTE1(self->_creatingInfo))
  {
    v6 = *(void **)(&self->_willBecomeCurrentEditorAgain + 1);
    *(_QWORD *)(&self->_willBecomeCurrentEditorAgain + 1) = 0;

  }
  if (-[CRLPathEditor isCreatingPath](self, "isCreatingPath"))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("CRLCanvasDidScrollNotification"), v7);

  }
}

- (void)invalidateKnobs
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v8);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repsForInfo:", v9, 0));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "invalidateKnobs");
              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v12);
        }

        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

}

- (BOOL)canAddKnobsForRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (void)addKnobsForRep:(id)a3 toArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *i;
  char *v15;
  void *v16;
  CRLPathKnob *v17;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CRLPathKnob *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CRLPathKnob *v33;
  id v34;
  id v35;
  _QWORD *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id obj;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  id v55;
  char *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editablePathSource"));
  if (v7)
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v40 = v7;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subpaths"));
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v43)
    {
      v8 = 0;
      v42 = *(_QWORD *)v63;
      v50 = v5;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v63 != v42)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nodes"));
          v47 = v10;
          v44 = v9;
          if (objc_msgSend(v10, "isClosed"))
            v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
          else
            v12 = 0;
          v61 = 0u;
          v59 = 0u;
          v60 = 0u;
          v58 = 0u;
          v13 = v11;
          v48 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
          if (v48)
          {
            v49 = 0;
            v46 = *(_QWORD *)v59;
            do
            {
              for (i = 0; i != v48; i = (char *)i + 1)
              {
                if (*(_QWORD *)v59 != v46)
                  objc_enumerationMutation(v13);
                v15 = (char *)i + v49;
                v16 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
                v17 = -[CRLPathKnob initWithNode:onRep:]([CRLPathKnob alloc], "initWithNode:onRep:", v16, v5);
                -[CRLPathKnob setNodeIndex:](v17, "setNodeIndex:", (char *)i + v49);
                -[CRLPathKnob setSubpathIndex:](v17, "setSubpathIndex:", v8);
                objc_msgSend(v6, "addObject:", v17);
                v18 = (unint64_t)i + v49 + 1;
                if ((objc_msgSend(v47, "isClosed") & 1) != 0
                  || v18 < (unint64_t)objc_msgSend(v13, "count"))
                {
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", v18 % (unint64_t)objc_msgSend(v13, "count")));
                }
                else
                {
                  v19 = 0;
                }
                if (objc_msgSend(v16, "isSelected") && objc_msgSend(v16, "type") == (id)2)
                {
                  if (v12)
                  {
                    objc_msgSend(v16, "nodePoint");
                    v21 = v20;
                    v23 = v22;
                    objc_msgSend(v16, "inControlPoint");
                    if (v21 != v25 || v23 != v24)
                    {
                      v26 = -[CRLPathKnob initWithInControlForNode:onRep:]([CRLPathKnob alloc], "initWithInControlForNode:onRep:", v16, v5);

                      -[CRLPathKnob setNodeIndex:](v26, "setNodeIndex:", v15);
                      -[CRLPathKnob setSubpathIndex:](v26, "setSubpathIndex:", v8);
                      objc_msgSend(v6, "addObject:", v26);
                      v17 = v26;
                      v5 = v50;
                    }
                  }
                  if (-[CRLPathEditor isCreatingPath](self, "isCreatingPath") || v19)
                  {
                    objc_msgSend(v16, "nodePoint");
                    v28 = v27;
                    v30 = v29;
                    objc_msgSend(v16, "outControlPoint");
                    if (v28 != v32 || v30 != v31)
                    {
                      v33 = -[CRLPathKnob initWithOutControlForNode:onRep:]([CRLPathKnob alloc], "initWithOutControlForNode:onRep:", v16, v5);

                      -[CRLPathKnob setNodeIndex:](v33, "setNodeIndex:", v15);
                      -[CRLPathKnob setSubpathIndex:](v33, "setSubpathIndex:", v8);
                      objc_msgSend(v6, "addObject:", v33);
                      v17 = v33;
                      v5 = v50;
                    }
                  }
                }
                v51[0] = _NSConcreteStackBlock;
                v51[1] = 3221225472;
                v51[2] = sub_1001A63A4;
                v51[3] = &unk_101240050;
                v51[4] = v16;
                v52 = v5;
                v53 = v19;
                v34 = v12;
                v54 = v34;
                v56 = (char *)i + v49;
                v57 = v8;
                v55 = v6;
                v35 = v19;
                v36 = objc_retainBlock(v51);
                v37 = v36;
                if (v35)
                {
                  v38 = ((uint64_t (*)(_QWORD *, uint64_t))v36[2])(v36, 22);
                  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
                  objc_msgSend(v39, "setTValue:", 0.5);

                }
                v12 = v16;

                v5 = v50;
              }
              v48 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
              v49 += (uint64_t)i;
            }
            while (v48);
          }

          ++v8;
          v9 = v44 + 1;
        }
        while ((id)(v44 + 1) != v43);
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      }
      while (v43);
    }

    -[CRLPathEditor updatePositionsOfKnobs:forRep:](self, "updatePositionsOfKnobs:forRep:", v6, v5);
    v7 = v40;
  }

}

- (void)updatePositionsOfKnobs:(id)a3 forRep:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __int128 v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0uLL;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  if (v6)
  {
    objc_msgSend(v6, "naturalToEditablePathSpaceTransform");
    v8 = 0uLL;
  }
  v23 = v8;
  v24 = v8;
  v21 = v8;
  v22 = v8;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_opt_class(CRLPathKnob, v11);
        v17 = sub_100221D0C(v16, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = v18;
        if (v18)
        {
          v20[0] = v25;
          v20[1] = v26;
          v20[2] = v27;
          objc_msgSend(v18, "updatePositionWithTransform:", v20);
        }

      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v12);
  }

}

- (id)newTrackerForKnob:(id)a3 forRep:(id)a4
{
  id v5;
  id v6;
  CRLPathKnobTracker *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CRLPathKnobTracker initWithRep:knob:]([CRLPathKnobTracker alloc], "initWithRep:knob:", v5, v6);

  return v7;
}

- (void)editPathsOnPathEditableRepsWithActionString:(id)a3 usingBlock:(id)a4 filterWithBlock:(id)a5
{
  id v8;
  unsigned int (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  CRLEditableBezierPathSourceMorphInfo *v30;
  void *v31;
  void (**v32)(id, void *);
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v8 = a3;
  v32 = (void (**)(id, void *))a4;
  v9 = (unsigned int (**)(id, void *))a5;
  -[CRLPathEditor setCurrentCommandsPathRelated:](self, "setCurrentCommandsPathRelated:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "commandController"));

  objc_msgSend(v11, "openGroup");
  v31 = v8;
  objc_msgSend(v11, "setCurrentGroupActionString:", v8);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "repForInfo:", v17));
        objc_opt_class(CRLCanvasRep, v20);
        v27 = sub_10022209C(v19, v21, 1, v22, v23, v24, v25, v26, (uint64_t)&OBJC_PROTOCOL___CRLPathEditableRep);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

        if (v28 && v9[2](v9, v28))
        {
          objc_msgSend(v28, "dynamicOperationDidBeginWithRealTimeCommands:", 0);
          objc_msgSend(v28, "dynamicMovePathKnobDidBegin");
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "editablePathSource"));
          v30 = -[CRLEditableBezierPathSourceMorphInfo initWithEditableBezierPathSource:]([CRLEditableBezierPathSourceMorphInfo alloc], "initWithEditableBezierPathSource:", v29);
          v32[2](v32, v28);
          objc_msgSend(v29, "morphWithMorphInfo:", v30);
          objc_msgSend(v28, "dynamicMovePathKnobDidEndWithTracker:", 0);
          objc_msgSend(v28, "dynamicOperationDidEnd");

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "closeGroup");
  -[CRLPathEditor setCurrentCommandsPathRelated:](self, "setCurrentCommandsPathRelated:", 0);

}

- (void)selectAll:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Select All"), 0, CFSTR("UndoStrings")));
  -[CRLPathEditor editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:](self, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v4, &stru_101240090, &stru_1012400D0);

}

- (void)deselectAll:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Deselect All"), 0, CFSTR("UndoStrings")));
  -[CRLPathEditor editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:](self, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v4, &stru_1012400F0, &stru_101240110);

}

- (id)p_ghostRenderable
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *(void **)(&self->super.mIsChangingStrokeWidth + 1);
  if (!v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    v5 = *(void **)(&self->super.mIsChangingStrokeWidth + 1);
    *(_QWORD *)(&self->super.mIsChangingStrokeWidth + 1) = v4;

    objc_msgSend(*(id *)(&self->super.mIsChangingStrokeWidth + 1), "setLineWidth:", 2.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", 0.0, 0.3));
    objc_msgSend(*(id *)(&self->super.mIsChangingStrokeWidth + 1), "setStrokeColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(*(id *)(&self->super.mIsChangingStrokeWidth + 1), "setFillColor:", 0);
    objc_msgSend(*(id *)(&self->super.mIsChangingStrokeWidth + 1), "setZPosition:", -1.0);
    v3 = *(void **)(&self->super.mIsChangingStrokeWidth + 1);
  }
  return v3;
}

- (void)p_setGhostStrokeColor
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathEditor creatingRep](self, "creatingRep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stroke"));

  if (v10)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "color"));
    objc_msgSend(v5, "alphaComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", v6 * 0.3));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", 0.0, 0.3));
  }
  v8 = objc_msgSend(v7, "CGColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathEditor p_ghostRenderable](self, "p_ghostRenderable"));
  objc_msgSend(v9, "setStrokeColor:", v8);

}

- (NSArray)decoratorOverlayRenderables
{
  void *v3;
  void *v4;
  void *v6;

  -[CRLPathEditor p_setGhostStrokeColor](self, "p_setGhostStrokeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathEditor p_ghostRenderable](self, "p_ghostRenderable"));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return (NSArray *)v4;
}

- (CRLPathEditableRep)creatingRep
{
  void *v3;
  void *v4;

  if (*(CRLPathKnob **)((char *)&self->_hoveringKnob + 1))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForInfo:createIfNeeded:", *(CRLPathKnob **)((char *)&self->_hoveringKnob + 1), 1));

  }
  else
  {
    v4 = 0;
  }
  return (CRLPathEditableRep *)v4;
}

- (void)setCreatingRep:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  CRLPathKnob *v11;
  CRLPathKnob *obj;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info", v6));

  v10 = sub_100221D0C(v8, v9);
  obj = (CRLPathKnob *)objc_claimAutoreleasedReturnValue(v10);

  v11 = obj;
  if (obj != *(CRLPathKnob **)((char *)&self->_hoveringKnob + 1))
  {
    objc_storeStrong((id *)((char *)&self->_hoveringKnob + 1), obj);
    v11 = obj;
  }

}

- (void)setIsCreatingPath:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (BYTE1(self->_insertSelectionBehavior) != a3)
  {
    v3 = a3;
    BYTE1(self->_insertSelectionBehavior) = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v6, "addObserver:selector:name:object:", self, "p_didScroll:", CFSTR("CRLCanvasDidScrollNotification"), v5);
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("CRLCanvasDidScrollNotification"), v5);
    }

  }
}

- (void)p_didScroll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[CRLPathEditor isCreatingPath](self, "isCreatingPath", a3))
  {
    if (*(CRLPathKnob **)((char *)&self->_hoveringKnob + 1))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "repForInfo:createIfNeeded:", *(CRLPathKnob **)((char *)&self->_hoveringKnob + 1), 0));

      if (!v5)
      {
        if (!+[NSThread isMainThread](NSThread, "isMainThread"))
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101240130);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E058A0();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101240150);
          v6 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor p_didScroll:]"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 499, 0, "This operation must only be performed on the main thread.");

        }
        -[CRLPathEditor endPathEditing](self, "endPathEditing");
      }
    }
  }
}

- (CGPoint)constrainedUnscaledPointForPathCreation:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  long double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  *(_QWORD *)&v6 = objc_opt_class(CRLPathKnob, a2).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v6));
  v33 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hitKnobAtPoint:inputType:returningRep:", 1, &v33, x, y));
  v11 = sub_100221D0C(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathEditor creatingRep](self, "creatingRep"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "editablePathSource"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nodes"));
    if (objc_msgSend(v15, "count"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathEditor creatingRep](self, "creatingRep"));
      objc_msgSend(v16, "convertNaturalPointFromUnscaledCanvas:", x, y);
      v18 = v17;
      v20 = v19;
      if (-[CRLPathEditor isCreatingReversed](self, "isCreatingReversed"))
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
      else
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
      v22 = v21;
      objc_msgSend(v21, "nodePoint");
      v24 = v23;
      v25 = sub_1000603B8(v18, v20, v23);
      v27 = sub_100061F98(v25, v26);
      objc_msgSend(v16, "convertNaturalPointToUnscaledCanvas:", sub_1000603D0(v27, v28, v24));
      x = v29;
      y = v30;

    }
  }
  -[CRLPathEditor p_snappedPointForCanvasBackgroundAlignmentProvider:](self, "p_snappedPointForCanvasBackgroundAlignmentProvider:", x, y);
  result.y = v32;
  result.x = v31;
  return result;
}

- (void)endMovingKnob
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (BYTE1(self->_lastGhostPosition.y) && -[CRLPathEditor isCreatingPath](self, "isCreatingPath"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathEditor creatingRep](self, "creatingRep"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editablePathSource"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nodes"));
    v5 = objc_msgSend(v4, "count");

    if ((unint64_t)v5 >= 2)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandController"));

      -[CRLPathEditor p_closeCommandGroupBookkeepingAndUnregisterForOpenGroupNotifications](self, "p_closeCommandGroupBookkeepingAndUnregisterForOpenGroupNotifications");
      objc_msgSend(v7, "closeGroup");
      v8 = *(void **)(&self->_willBecomeCurrentEditorAgain + 1);
      *(_QWORD *)(&self->_willBecomeCurrentEditorAgain + 1) = 0;

    }
  }
}

- (void)p_resetAfterRebase
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CRLPathKnob *v9;
  void *v10;

  -[CRLPathEditor setResetAfterRebase:](self, "setResetAfterRebase:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v4 = objc_msgSend(v3, "count");

  if (v4 != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240170);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E05920();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240190);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor p_resetAfterRebase]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 741, 0, "Can only reset editing state if we have a single info selected");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v9 = (CRLPathKnob *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anyObject"));
  v10 = *(CRLPathKnob **)((char *)&self->_hoveringKnob + 1);
  *(CRLPathKnob **)((char *)&self->_hoveringKnob + 1) = v9;

  BYTE1(self->_insertSelectionBehavior) = 1;
}

- (void)updateGhostForNodeCreationAtPoint:(CGPoint)a3
{
  CRLCanvasShapeRenderable *v4;
  uint64_t v5;
  CRLCanvasShapeRenderable *v6;
  uint64_t v7;

  -[CRLPathEditor p_snappedPointForCanvasBackgroundAlignmentProvider:](self, "p_snappedPointForCanvasBackgroundAlignmentProvider:", a3.x, a3.y);
  if (*(_QWORD *)(&self->super.mIsChangingStrokeWidth + 1))
  {
    v6 = v4;
    v7 = v5;
    if (-[CRLPathEditor isCreatingPath](self, "isCreatingPath"))
    {
      if (-[CRLPathEditor resetAfterRebase](self, "resetAfterRebase"))
        -[CRLPathEditor p_resetAfterRebase](self, "p_resetAfterRebase");
      *(CRLCanvasShapeRenderable **)((char *)&self->_ghostPathRenderable + 1) = v6;
      *(_QWORD *)((char *)&self->_lastGhostPosition.x + 1) = v7;
      -[CRLPathEditor updateGhost](self, "updateGhost");
    }
  }
}

- (void)updateGhost
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CRLEditableBezierPathSourceMorphInfo *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  void *v47;
  double v48;
  CGFloat v49;
  void *v50;
  void *v51;
  void *v52;
  CRLEditableBezierPathSourceMorphInfo *v53;
  CGAffineTransform v54;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v57;
  _QWORD v58[5];
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathEditor creatingRep](self, "creatingRep"));
  if (!v3 || !-[CRLPathEditor isCreatingPath](self, "isCreatingPath"))
  {
    v4 = 0;
    goto LABEL_7;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editablePathSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bezierPath"));
  v6 = (uint64_t)objc_msgSend(v5, "elementCount");

  if (v6 < 1)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  *(_QWORD *)&v8 = objc_opt_class(CRLPathKnob, v7).n128_u64[0];
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v8));
  v12 = (double *)((char *)&self->_ghostPathRenderable + 1);
  v59 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hitKnobAtPoint:inputType:returningRep:", 1, &v59, *(double *)((char *)&self->_ghostPathRenderable + 1), *(double *)((char *)&self->_lastGhostPosition.x + 1)));
  v14 = sub_100221D0C(v10, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subpaths"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastObject"));

  if ((objc_msgSend(v17, "isClosed") & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nodes"));
    if (objc_msgSend(v20, "count"))
    {

    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subpaths"));
      v22 = objc_msgSend(v21, "count");

      if ((unint64_t)v22 >= 2)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subpaths"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subpaths"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndex:", (char *)objc_msgSend(v24, "count") - 2));

        v18 = objc_msgSend(v25, "isClosed") ^ 1;
        v17 = v25;
        goto LABEL_15;
      }
    }
    v18 = 1;
    goto LABEL_15;
  }
  v18 = 0;
LABEL_15:
  if (v15 && !-[CRLPathEditor canClosePathToKnob:](self, "canClosePathToKnob:", v15))
  {

    goto LABEL_8;
  }

  if (!v18)
  {
LABEL_8:
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.0);
    objc_msgSend(*(id *)(&self->super.mIsChangingStrokeWidth + 1), "setPath:", 0);
    +[CATransaction commit](CATransaction, "commit");
    v19 = v4;
    goto LABEL_9;
  }
  v19 = objc_msgSend(v4, "copy");

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subpaths"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastObject"));

  v28 = -[CRLEditableBezierPathSourceMorphInfo initWithEditableBezierPathSource:]([CRLEditableBezierPathSourceMorphInfo alloc], "initWithEditableBezierPathSource:", v19);
  if (v15 && -[CRLPathEditor canClosePathToKnob:](self, "canClosePathToKnob:", v15))
  {
    v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstNode"));
    if (objc_msgSend(v29, "type") == (id)3)
      objc_msgSend(v29, "setType:", 1);
    objc_msgSend(v19, "closePath");
  }
  else if (-[CRLPathEditor isCreatingReversed](self, "isCreatingReversed"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "nodes"));
    v29 = objc_msgSend(v30, "mutableCopy");

    objc_msgSend(v3, "convertNaturalPointFromUnscaledCanvas:", *v12, *(double *)((char *)&self->_lastGhostPosition.x + 1));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:"));
    objc_msgSend(v29, "insertObject:atIndex:", v31, 0);

    objc_msgSend(v27, "setNodes:", v29);
  }
  else
  {
    objc_msgSend(v3, "convertNaturalPointFromUnscaledCanvas:", *v12, *(double *)((char *)&self->_lastGhostPosition.x + 1));
    v29 = (id)objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:"));
    objc_msgSend(v27, "addNode:", v29);
  }

  v53 = v28;
  objc_msgSend(v19, "morphWithMorphInfo:", v28);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "nodes"));
  v34 = (char *)objc_msgSend(v33, "count") - 1;

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "nodes"));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1001A7AF0;
  v58[3] = &unk_1012401B0;
  v58[4] = v34;
  v36 = objc_msgSend(v35, "indexOfObjectWithOptions:passingTest:", 2, v58);

  if (v36 == (id)0x7FFFFFFFFFFFFFFFLL)
    v37 = 0;
  else
    v37 = v36;
  objc_msgSend(v27, "appendToBezierPath:selectedNodesOnly:fromIndex:", v32, 0, v37);
  v38 = objc_msgSend(v32, "elementCount");
  if (v38)
  {
    v39 = v38;
    v40 = 0;
    while (1)
    {
      v41 = objc_msgSend(v32, "elementAtIndex:associatedPoints:", v40, &v60);
      if ((unint64_t)v41 < 2)
        break;
      if (v41 == (id)2)
      {
        v44 = (double)rand() * 4.65661288e-15;
        rand();
        v62 = sub_1000603D0(v62, v63, v44);
        v63 = v45;
        goto LABEL_36;
      }
LABEL_37:
      if (v39 == (id)++v40)
        goto LABEL_38;
    }
    v42 = (double)rand() * 4.65661288e-15;
    rand();
    v60 = sub_1000603D0(v60, v61, v42);
    v61 = v43;
LABEL_36:
    objc_msgSend(v32, "setAssociatedPoints:atIndex:", &v60, v40);
    goto LABEL_37;
  }
LABEL_38:
  v46 = objc_retainAutorelease(v32);
  objc_msgSend(*(id *)(&self->super.mIsChangingStrokeWidth + 1), "setPath:", objc_msgSend(v46, "CGPath"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v47, "viewScale");
  v49 = v48;

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
  v51 = v50;
  if (v50)
    objc_msgSend(v50, "pureTransformInRoot");
  else
    memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeScale(&t2, v49, v49);
  CGAffineTransformConcat(&v57, &t1, &t2);
  v52 = *(void **)(&self->super.mIsChangingStrokeWidth + 1);
  v54 = v57;
  objc_msgSend(v52, "setAffineTransform:", &v54);

  objc_msgSend(*(id *)(&self->super.mIsChangingStrokeWidth + 1), "setLineWidth:", 2.0 / v49);
  +[CATransaction commit](CATransaction, "commit");

LABEL_9:
}

- (void)closeLastSubpath
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (-[CRLPathEditor isCreatingPath](self, "isCreatingPath"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathEditor creatingRep](self, "creatingRep"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Close Path"), 0, CFSTR("UndoStrings")));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001A7C64;
    v7[3] = &unk_1012401F8;
    v8 = v3;
    v6 = v3;
    -[CRLPathEditor editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:](self, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v5, &stru_1012401D0, v7);

  }
}

- (BOOL)canContinuePathFromKnob:(id)a3 reversed:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  if (objc_msgSend(v5, "tag") == (id)17)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathEditableRep"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editablePathSource"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subpaths"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "subpathIndex")));

    v10 = objc_msgSend(v5, "nodeIndex");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nodes"));
    v12 = v10 == (char *)objc_msgSend(v11, "count") - 1 || objc_msgSend(v5, "nodeIndex") == 0;

    if (a4)
      *a4 = objc_msgSend(v5, "nodeIndex") == 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)canClosePathToKnob:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  char *v16;
  char *v17;
  void *v18;
  char *v19;
  void *v20;

  v4 = a3;
  if (-[CRLPathEditor isCreatingPath](self, "isCreatingPath"))
  {
    if (objc_msgSend(v4, "tag") == (id)17)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathEditableRep"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathEditor creatingRep](self, "creatingRep"));

      if (v5 == v6)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathEditableRep"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editablePathSource"));

        v11 = (char *)objc_msgSend(v4, "subpathIndex");
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subpaths"));
        v13 = (char *)objc_msgSend(v12, "count") - 1;

        if (v11 != v13)
        {
          v7 = 0;
LABEL_16:

          goto LABEL_5;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subpaths"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));

        LODWORD(v14) = -[CRLPathEditor isCreatingReversed](self, "isCreatingReversed");
        v16 = (char *)objc_msgSend(v4, "nodeIndex");
        v17 = v16;
        if ((_DWORD)v14)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nodes"));
          v19 = (char *)objc_msgSend(v18, "count") - 1;

          if (v17 != v19)
            goto LABEL_13;
        }
        else if (v16)
        {
          goto LABEL_13;
        }
        if ((objc_msgSend(v15, "isClosed") & 1) == 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nodes"));
          v7 = (unint64_t)objc_msgSend(v20, "count") > 1;

          goto LABEL_15;
        }
LABEL_13:
        v7 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
  }
  v7 = 0;
LABEL_5:

  return v7;
}

- (BOOL)canEndPathCreationWithKnob:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  char *v16;
  char *v17;
  void *v18;
  char *v19;

  v4 = a3;
  if (-[CRLPathEditor isCreatingPath](self, "isCreatingPath"))
  {
    if (objc_msgSend(v4, "tag") == (id)17)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathEditableRep"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathEditor creatingRep](self, "creatingRep"));

      if (v5 == v6)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathEditableRep"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editablePathSource"));

        v11 = (char *)objc_msgSend(v4, "subpathIndex");
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subpaths"));
        v13 = (char *)objc_msgSend(v12, "count") - 1;

        if (v11 != v13)
        {
          LOBYTE(v7) = 0;
LABEL_14:

          goto LABEL_5;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subpaths"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));

        LODWORD(v14) = -[CRLPathEditor isCreatingReversed](self, "isCreatingReversed");
        v16 = (char *)objc_msgSend(v4, "nodeIndex");
        v17 = v16;
        if ((_DWORD)v14)
        {
          if (v16)
          {
LABEL_9:
            LOBYTE(v7) = 0;
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nodes"));
          v19 = (char *)objc_msgSend(v18, "count") - 1;

          if (v17 != v19)
            goto LABEL_9;
        }
        v7 = objc_msgSend(v15, "isClosed") ^ 1;
        goto LABEL_13;
      }
    }
  }
  LOBYTE(v7) = 0;
LABEL_5:

  return v7;
}

- (BOOL)currentShapeIsValid
{
  return BYTE1(self->_lastGhostPosition.y) == 0;
}

- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_opt_class(CRLPathSelection, v16);
  v18 = sub_100221D0C(v17, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (v19)
  {
    v20 = 0;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)CRLPathEditor;
    v21 = -[CRLBoardItemEditor selectionWillChangeFromSelection:toSelection:withFlags:inSelectionPath:withNewEditors:](&v23, "selectionWillChangeFromSelection:toSelection:withFlags:inSelectionPath:withNewEditors:", v12, v13, a5, v14, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
  }

  return v20;
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  objc_opt_class(CRLPathSelection, v10);
  v12 = sub_100221D0C(v11, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (!v13)
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLPathEditor;
    -[CRLBoardItemEditor selectionDidChangeFromSelection:toSelection:withFlags:](&v14, "selectionDidChangeFromSelection:toSelection:withFlags:", v8, v9, a5);
  }

}

- (BOOL)p_shouldKeepEditingInfos:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  double v10;
  objc_class *v11;
  objc_class *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v5 = objc_msgSend(v6, "isEqual:", v4);

  LOBYTE(v6) = 1;
  if (v4 && (v5 & 1) == 0 && objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == (id)1
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems")),
          v8 = objc_msgSend(v7, "count"),
          v7,
          v8 == (id)1))
    {
      *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v9).n128_u64[0];
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject", v10));
      v14 = sub_1002223BC(v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "id"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "id"));
      LODWORD(v6) = objc_msgSend(v17, "isEqual:", v18);

      if ((_DWORD)v6)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v15));
        -[CRLBoardItemEditor setBoardItems:](self, "setBoardItems:", v19);

        if (BYTE1(self->_insertSelectionBehavior))
          -[CRLPathEditor setResetAfterRebase:](self, "setResetAfterRebase:", 1);
      }

    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return (char)v6;
}

- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  *(_QWORD *)&v12 = objc_opt_class(CRLPathEditor, v11).n128_u64[0];
  if (-[CRLPathEditor isMemberOfClass:](self, "isMemberOfClass:", v13, v12))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "infosForSelectionPath:", v9));

    objc_opt_class(CRLPathSelection, v16);
    if ((objc_opt_isKindOfClass(v8, v17) & 1) != 0)
      v18 = -[CRLPathEditor p_shouldKeepEditingInfos:](self, "p_shouldKeepEditingInfos:", v15);
    else
      v18 = 0;

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CRLPathEditor;
    v18 = -[CRLBoardItemEditor shouldRemainOnEditorStackForSelection:inSelectionPath:withNewEditors:](&v20, "shouldRemainOnEditorStackForSelection:inSelectionPath:withNewEditors:", v8, v9, v10);
  }

  return v18;
}

- (BOOL)canRemainDuringDragInsert
{
  return BYTE1(self->_lastGhostPosition.y) == 0;
}

- (BOOL)canRemainDuringUserInitiatedSave
{
  return BYTE1(self->_lastGhostPosition.y) == 0;
}

- (BOOL)canRemainDuringSharedReadOnlyMode
{
  return 0;
}

- (BOOL)canSaveSelectionToArchivedViewState
{
  return 0;
}

- (BOOL)shouldBecomeTextInputEditor
{
  return 1;
}

- (void)p_openCommandGroupBookkeepingAndRegisterForOpenGroupNotifications
{
  BYTE1(self->_lastGhostPosition.y) = 1;
}

- (void)p_closeCommandGroupBookkeepingAndUnregisterForOpenGroupNotifications
{
  BYTE1(self->_lastGhostPosition.y) = 0;
}

- (void)p_commandWillBeEnqueued:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!BYTE1(self->_lastGhostPosition.y))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240218);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E059A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240238);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor p_commandWillBeEnqueued:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1210, 0, "Listening to command notifications when we don't care!");

  }
  if (!-[CRLPathEditor currentCommandsPathRelated](self, "currentCommandsPathRelated"))
    -[CRLPathEditor p_commandGroupSafeEndEditing](self, "p_commandGroupSafeEndEditing");

}

- (void)p_groupWillBeOpened:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!BYTE1(self->_lastGhostPosition.y))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240258);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E05A20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240278);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor p_groupWillBeOpened:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1217, 0, "Listening to command notifications when we don't care!");

  }
  if (!-[CRLPathEditor currentCommandsPathRelated](self, "currentCommandsPathRelated")
    && BYTE1(self->_lastGhostPosition.y))
  {
    -[CRLPathEditor p_commandGroupSafeEndEditing](self, "p_commandGroupSafeEndEditing");
  }

}

- (void)endPathEditing
{
  void *v3;

  if (-[CRLPathEditor isCreatingPath](self, "isCreatingPath") && !BYTE1(self->_lastGhostPosition.y))
  {
    -[CRLPathEditor setIsCreatingPath:](self, "setIsCreatingPath:", 0);
    v3 = *(CRLPathKnob **)((char *)&self->_hoveringKnob + 1);
    *(CRLPathKnob **)((char *)&self->_hoveringKnob + 1) = 0;

    -[CRLPathEditor updateGhost](self, "updateGhost");
  }
  else
  {
    -[CRLPathEditor p_commandGroupSafeEndEditing](self, "p_commandGroupSafeEndEditing");
  }
}

- (void)p_commandGroupSafeEndEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = v3;
  if (BYTE1(self->_lastGhostPosition.y))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasEditor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPathWithInfos:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));
    objc_msgSend(v6, "setSelectionPath:", v5);

  }
  else
  {
    objc_msgSend(v3, "endEditing");
  }

}

- (void)toggleSelectedNodeToType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v16 = v4;
  v17 = v3;
  v18 = v5;
  v19 = v6;
  switch(a3)
  {
    case 0:
    case 4:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101240298);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E05AA0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012402B8);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor toggleSelectedNodeToType:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1343, 0, "Unexpected node type %li", a3);

      goto LABEL_16;
    case 1:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      v14 = CFSTR("Make Sharp Point");
      goto LABEL_14;
    case 2:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      v14 = CFSTR("Make Bézier Point");
      goto LABEL_14;
    case 3:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      v14 = CFSTR("Make Smooth Point");
LABEL_14:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, 0, CFSTR("UndoStrings")));

      if (v10)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1001A8C84;
        v15[3] = &unk_1012402D8;
        v15[4] = a3;
        -[CRLPathEditor editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:](self, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v10, v15, &stru_1012402F8);
        -[CRLPathEditor invalidateKnobs](self, "invalidateKnobs");
LABEL_16:

      }
      break;
    default:
      return;
  }
}

- (void)makeSharp:(id)a3
{
  -[CRLPathEditor toggleSelectedNodeToType:](self, "toggleSelectedNodeToType:", 1);
}

- (void)makeSmooth:(id)a3
{
  -[CRLPathEditor toggleSelectedNodeToType:](self, "toggleSelectedNodeToType:", 3);
}

- (void)makeBezier:(id)a3
{
  -[CRLPathEditor toggleSelectedNodeToType:](self, "toggleSelectedNodeToType:", 2);
}

- (void)split:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Divide Path"), 0, CFSTR("UndoStrings")));
  -[CRLPathEditor editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:](self, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v5, &stru_101240318, &stru_101240338);

  -[CRLPathEditor invalidateKnobs](self, "invalidateKnobs");
}

- (void)join:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Join"), 0, CFSTR("UndoStrings")));
  -[CRLPathEditor editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:](self, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v5, &stru_101240358, &stru_101240378);

  -[CRLPathEditor invalidateKnobs](self, "invalidateKnobs");
}

- (void)close:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Close Path"), 0, CFSTR("UndoStrings")));
  -[CRLPathEditor editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:](self, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v5, &stru_101240398, &stru_1012403B8);

  -[CRLPathEditor invalidateKnobs](self, "invalidateKnobs");
}

- (void)alignDrawablesByLeftEdge:(id)a3
{
  -[CRLPathEditor alignNodesByEdge:](self, "alignNodesByEdge:", 0);
}

- (void)alignDrawablesByRightEdge:(id)a3
{
  -[CRLPathEditor alignNodesByEdge:](self, "alignNodesByEdge:", 2);
}

- (void)alignDrawablesByVerticalCenter:(id)a3
{
  -[CRLPathEditor alignNodesByEdge:](self, "alignNodesByEdge:", 1);
}

- (void)alignDrawablesByTopEdge:(id)a3
{
  -[CRLPathEditor alignNodesByEdge:](self, "alignNodesByEdge:", 3);
}

- (void)alignDrawablesByBottomEdge:(id)a3
{
  -[CRLPathEditor alignNodesByEdge:](self, "alignNodesByEdge:", 5);
}

- (void)alignDrawablesByHorizontalCenter:(id)a3
{
  -[CRLPathEditor alignNodesByEdge:](self, "alignNodesByEdge:", 4);
}

- (void)distributeDrawablesHorizontally:(id)a3
{
  -[CRLPathEditor distributeNodesByEdge:](self, "distributeNodesByEdge:", 1);
}

- (void)distributeDrawablesVertically:(id)a3
{
  -[CRLPathEditor distributeNodesByEdge:](self, "distributeNodesByEdge:", 4);
}

- (BOOL)pathHasSelectedNodes:(unint64_t)a3
{
  void *v3;
  void *v4;
  __objc2_class **p_superclass;
  __objc2_prot **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  void *i;
  NSObject *v31;
  char *v32;
  BOOL v33;
  uint64_t v35;
  id v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  unsigned int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const char *v56;
  _BYTE v57[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infosForCurrentSelectionPath"));
  v36 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
  if (v36)
  {
    p_superclass = &OBJC_METACLASS___CRLAXZorderButton.superclass;
    v6 = &off_1012C6000;
    v7 = *(_QWORD *)v43;
    v35 = *(_QWORD *)v43;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v42 + 1)
                                                                                                 + 8 * (_QWORD)v8)));
        objc_opt_class(p_superclass + 289, v10);
        v17 = sub_10022209C(v9, v11, 1, v12, v13, v14, v15, v16, (uint64_t)v6[251]);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

        if (!v18)
        {
          v19 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012403D8);
          v20 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v48 = v19;
            v49 = 2082;
            v50 = "-[CRLPathEditor pathHasSelectedNodes:]";
            v51 = 2082;
            v52 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m";
            v53 = 1024;
            v54 = 1444;
            v55 = 2082;
            v56 = "rep";
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012403F8);
          v21 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v31 = v21;
            v32 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v48 = v19;
            v49 = 2114;
            v50 = v32;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor pathHasSelectedNodes:]"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 1444, 0, "invalid nil value for '%{public}s'", "rep");

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "editablePathSource"));
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "nodes"));
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v39;
          v29 = a3;
          while (2)
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(_QWORD *)v39 != v28)
                objc_enumerationMutation(v25);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i), "isSelected"))
              {
                if (!--v29)
                {

                  v33 = 1;
                  goto LABEL_30;
                }
              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            if (v27)
              continue;
            break;
          }
        }

        v8 = (char *)v8 + 1;
        v7 = v35;
        p_superclass = (__objc2_class **)(&OBJC_METACLASS___CRLAXZorderButton + 8);
        v6 = &off_1012C6000;
      }
      while (v8 != v36);
      v33 = 0;
      v36 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
    }
    while (v36);
  }
  else
  {
    v33 = 0;
  }
LABEL_30:

  return v33;
}

- (void)alignNodesByEdge:(int)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  _QWORD v9[4];
  int v10;

  switch(a3)
  {
    case 0:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Align Left");
      goto LABEL_9;
    case 1:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Align Center");
      goto LABEL_9;
    case 2:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Align Right");
      goto LABEL_9;
    case 3:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Align Top");
      goto LABEL_9;
    case 4:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Align Middle");
      goto LABEL_9;
    case 5:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Align Bottom");
LABEL_9:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, 0, CFSTR("UndoStrings")));

      break;
    default:
      v8 = 0;
      break;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001A9628;
  v9[3] = &unk_101240418;
  v10 = a3;
  -[CRLPathEditor editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:](self, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v8, v9, &stru_101240438);
  -[CRLPathEditor invalidateKnobs](self, "invalidateKnobs");

}

- (void)distributeNodesByEdge:(int)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  _QWORD v9[4];
  int v10;

  if ((a3 - 3) < 3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("Distribute Vertically");
  }
  else
  {
    if (a3 > 2)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("Distribute Horizontally");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, 0, CFSTR("UndoStrings")));

LABEL_6:
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001A9B28;
  v9[3] = &unk_101240418;
  v10 = a3;
  -[CRLPathEditor editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:](self, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v8, v9, &stru_101240498);
  -[CRLPathEditor invalidateKnobs](self, "invalidateKnobs");

}

- (void)delete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  unsigned int v26;
  CRLPathEditor *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CRLPathEditor *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  _QWORD v42[5];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Delete"), 0, CFSTR("UndoStrings")));

  if (BYTE1(self->_lastGhostPosition.y))
  {
    -[CRLPathEditor p_commandGroupSafeEndEditing](self, "p_commandGroupSafeEndEditing");
  }
  else if (-[CRLPathEditor pathHasSelectedNodes:](self, "pathHasSelectedNodes:", 1))
  {
    v38 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandController"));

    v35 = v8;
    objc_msgSend(v8, "openGroup");
    v37 = v6;
    -[CRLPathEditor editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:](self, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v6, &stru_1012404B8, &stru_1012404D8);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v36 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "repForInfo:", v14));
          objc_opt_class(CRLCanvasRep, v16);
          v23 = sub_10022209C(v15, v17, 1, v18, v19, v20, v21, v22, (uint64_t)&OBJC_PROTOCOL___CRLPathEditableRep);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "editablePathSource"));
          v26 = objc_msgSend(v25, "deletingSelectedNodesWillDeleteShape");

          if (v26)
            objc_msgSend(v39, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v39, "count"))
    {
      v27 = v36;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](v36, "interactiveCanvasController"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "canvasEditor"));

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "canvasEditorHelper"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "selectionBehaviorForDeletingBoardItems:", v39));

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "selectionPathWithInfos:", v39));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](v36, "editorController"));
      objc_msgSend(v33, "setSelectionPath:", v32);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1001AA3F0;
      v42[3] = &unk_101240500;
      v42[4] = v36;
      v4 = v38;
      v43 = v38;
      objc_msgSend(v33, "enumerateEditorsOnStackUsingBlock:", v42);

    }
    else
    {
      v31 = 0;
      v4 = v38;
      v27 = v36;
    }
    -[CRLPathEditor invalidateKnobs](v27, "invalidateKnobs");
    objc_msgSend(v35, "closeGroupWithSelectionBehavior:", v31);

    v6 = v37;
  }
  else if (-[CRLPathEditor isCreatingPath](self, "isCreatingPath"))
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1001AA474;
    v41[3] = &unk_101240528;
    v41[4] = self;
    -[CRLPathEditor editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:](self, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v6, v41, &stru_101240548);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathEditor creatingRep](self, "creatingRep"));
    objc_msgSend(v34, "invalidateKnobs");

  }
}

- (void)nudgeByDelta:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  _QWORD v8[6];

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Move"), 0, CFSTR("UndoStrings")));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001AA5C0;
  v8[3] = &unk_101240568;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  -[CRLPathEditor editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:](self, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v7, v8, &stru_101240588);

}

- (void)moveUp:(id)a3
{
  -[CRLPathEditor nudgeByDelta:](self, "nudgeByDelta:", a3, 0.0, -1.0);
}

- (void)moveDown:(id)a3
{
  -[CRLPathEditor nudgeByDelta:](self, "nudgeByDelta:", a3, 0.0, 1.0);
}

- (void)moveLeft:(id)a3
{
  -[CRLPathEditor nudgeByDelta:](self, "nudgeByDelta:", a3, -1.0, 0.0);
}

- (void)moveRight:(id)a3
{
  -[CRLPathEditor nudgeByDelta:](self, "nudgeByDelta:", a3, 1.0, 0.0);
}

- (void)moveUpAndModifySelection:(id)a3
{
  -[CRLPathEditor nudgeByDelta:](self, "nudgeByDelta:", a3, 0.0, -10.0);
}

- (void)moveDownAndModifySelection:(id)a3
{
  -[CRLPathEditor nudgeByDelta:](self, "nudgeByDelta:", a3, 0.0, 10.0);
}

- (void)moveLeftAndModifySelection:(id)a3
{
  -[CRLPathEditor nudgeByDelta:](self, "nudgeByDelta:", a3, -10.0, 0.0);
}

- (void)moveRightAndModifySelection:(id)a3
{
  -[CRLPathEditor nudgeByDelta:](self, "nudgeByDelta:", a3, 10.0, 0.0);
}

- (BOOL)pathReturnsTrueForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v9)
        objc_enumerationMutation(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v25 + 1)
                                                                                                + 8 * v10)));
      objc_opt_class(CRLCanvasRep, v12);
      v13 = 1;
      v20 = sub_10022209C(v11, v14, 1, v15, v16, v17, v18, v19, (uint64_t)&OBJC_PROTOCOL___CRLPathEditableRep);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "editablePathSource"));
      v23 = objc_msgSend(v22, "performSelector:", a3);

      if (v23)
        break;
      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
  }

  return v13;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  CRLPathEditor *v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  unsigned int v16;
  const char *v18;
  void *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CRLPathEditor;
  v6 = -[CRLStyledEditor canPerformEditorAction:withSender:](&v24, "canPerformEditorAction:withSender:", a3, a4);
  if ("alignDrawablesByLeftEdge:" == a3
    || "alignDrawablesByRightEdge:" == a3
    || "alignDrawablesByTopEdge:" == a3
    || "alignDrawablesByBottomEdge:" == a3
    || "alignDrawablesByHorizontalCenter:" == a3
    || "alignDrawablesByVerticalCenter:" == a3)
  {
    v12 = self;
    v13 = 2;
LABEL_55:
    v16 = -[CRLPathEditor pathHasSelectedNodes:](v12, "pathHasSelectedNodes:", v13);
    goto LABEL_56;
  }
  if ("distributeDrawablesHorizontally:" == a3 || "distributeDrawablesVertically:" == a3)
  {
    v12 = self;
    v13 = 3;
    goto LABEL_55;
  }
  if ("makeSmooth:" == a3 || "makeSharp:" == a3 || "makeBezier:" == a3)
    goto LABEL_60;
  if ("split:" == a3)
  {
    v18 = "canCutAtSelectedNodes";
LABEL_66:
    v16 = -[CRLPathEditor pathReturnsTrueForSelector:](self, "pathReturnsTrueForSelector:", v18);
LABEL_56:
    if (v16)
      return 1;
    else
      return -1;
  }
  if ("join:" == a3)
  {
    v18 = "canConnectSelectedNodes";
    goto LABEL_66;
  }
  if ("close:" == a3)
  {
    v18 = "canCloseSelectedNodes";
    goto LABEL_66;
  }
  v14 = 1;
  if ("moveUp:" == a3)
    return v14;
  if ("moveDown:" == a3)
    return v14;
  if ("moveLeft:" == a3)
    return v14;
  if ("moveRight:" == a3)
    return v14;
  v14 = 1;
  if ("moveUpAndModifySelection:" == a3
    || "moveDownAndModifySelection:" == a3
    || "moveLeftAndModifySelection:" == a3
    || "moveRightAndModifySelection:" == a3)
  {
    return v14;
  }
  if ("deleteBackward:" == a3
    || "deleteForward:" == a3
    || "deleteToBeginningOfLine:" == a3
    || "deleteToEndOfLine:" == a3
    || "deleteToBeginningOfParagraph:" == a3
    || "deleteToEndOfParagraph:" == a3
    || "deleteWordBackward:" == a3
    || "deleteWordForward:" == a3
    || "delete:" == a3)
  {
LABEL_60:
    if (-[CRLPathEditor pathHasSelectedNodes:](self, "pathHasSelectedNodes:", 1))
      return 1;
    else
      return -1;
  }
  v14 = 1;
  if ("insertTab:" != a3 && "insertBacktab:" != a3)
  {
    v15 = (int64_t)v6;
    if ("selectParent:" == a3)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController"));
      *(_QWORD *)&v21 = objc_opt_class(CRLShapeEditor, v20).n128_u64[0];
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mostSpecificCurrentEditorOfClass:", v22, v21));

      if (v23)
        v14 = 1;
      else
        v14 = v15;

    }
    else
    {
      v14 = 1;
      if ("cancelOperation:" != a3 && "insertNewline:" != a3)
      {
        if ("pasteStyle:" == a3)
        {
          return -(uint64_t)SBYTE1(self->_lastGhostPosition.y);
        }
        else if ("duplicate:" == a3)
        {
          return -1;
        }
        else if (BYTE1(self->_lastGhostPosition.y))
        {
          return -1;
        }
        else
        {
          return (int64_t)v6;
        }
      }
    }
  }
  return v14;
}

- (BOOL)canBeginEditingRepOnDoubleTap:(id)a3
{
  return 0;
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  return 0;
}

- (void)p_selectNextNode:(int64_t)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  unsigned int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  char *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  char v39;
  uint64_t v40;
  void *i;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *j;
  void *v50;
  unsigned int v51;
  CRLPathEditor *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  CRLPathEditor *v57;
  void *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  unsigned int v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  const char *v84;
  _BYTE v85[128];

  v4 = objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = objc_alloc((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v7 = objc_msgSend(v6, "count");
  v8 = v5;
  v9 = (void *)v4;
  v60 = objc_msgSend(v8, "initWithCapacity:", v7);

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v57 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
  v59 = (void *)v4;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v70;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v70 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v69 + 1)
                                                                                                  + 8 * (_QWORD)v14)));
        objc_opt_class(CRLCanvasRep, v16);
        v23 = sub_10022209C(v15, v17, 1, v18, v19, v20, v21, v22, (uint64_t)&OBJC_PROTOCOL___CRLPathEditableRep);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "editablePathSource"));
          objc_msgSend(v60, "addObject:", v25);
        }
        else
        {
          v26 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012405A8);
          v27 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v76 = v26;
            v77 = 2082;
            v78 = "-[CRLPathEditor p_selectNextNode:]";
            v79 = 2082;
            v80 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m";
            v81 = 1024;
            v82 = 1867;
            v83 = 2082;
            v84 = "rep";
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012405C8);
          v28 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v30 = v28;
            v31 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v76 = v26;
            v77 = 2114;
            v78 = v31;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor p_selectNextNode:]"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v29, 1867, 0, "invalid nil value for '%{public}s'", "rep");

          v9 = v59;
        }

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
    }
    while (v12);
  }

  v32 = v60;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectEnumerator"));
  if (a3 == 1)
  {
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "reverseObjectEnumerator"));

    v33 = (void *)v34;
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v35 = v33;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (!v36)
  {

    v52 = v57;
LABEL_47:
    if (a3)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastObject"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "nodes"));
      v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "lastObject"));
    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "firstObject"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "nodes"));
      v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "firstObject"));
    }
    v56 = (void *)v55;

    objc_msgSend(v56, "setSelected:", 1);
LABEL_51:

    goto LABEL_52;
  }
  v37 = v36;
  LOBYTE(v38) = 0;
  v39 = 0;
  v40 = *(_QWORD *)v66;
  while (2)
  {
    for (i = 0; i != v37; i = (char *)i + 1)
    {
      if (*(_QWORD *)v66 != v40)
        objc_enumerationMutation(v35);
      if ((v38 & 1) != 0)
      {
        v53 = v35;
        v52 = v57;
        v32 = v60;
        goto LABEL_51;
      }
      v42 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "nodes"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectEnumerator"));

      if (a3 == 1)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "nodes"));
        v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "reverseObjectEnumerator"));

        v44 = (void *)v46;
      }
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v47 = v44;
      v38 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
      if (v38)
      {
        v48 = *(_QWORD *)v62;
        while (2)
        {
          for (j = 0; j != v38; j = (char *)j + 1)
          {
            if (*(_QWORD *)v62 != v48)
              objc_enumerationMutation(v47);
            v50 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j);
            if ((v39 & 1) != 0)
            {
              LOBYTE(v38) = 1;
              objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j), "setSelected:", 1);
              v39 = 1;
              goto LABEL_41;
            }
            v51 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j), "isSelected");
            v39 = v51;
            if (v51)
              objc_msgSend(v50, "setSelected:", 0);
          }
          v38 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
          if (v38)
            continue;
          break;
        }
      }
LABEL_41:

    }
    v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    if (v37)
      continue;
    break;
  }

  v52 = v57;
  v32 = v60;
  if ((v38 & 1) == 0)
    goto LABEL_47;
LABEL_52:
  -[CRLPathEditor invalidateKnobs](v52, "invalidateKnobs");

}

- (void)insertTab:(id)a3
{
  -[CRLPathEditor p_selectNextNode:](self, "p_selectNextNode:", 0);
}

- (void)insertBacktab:(id)a3
{
  -[CRLPathEditor p_selectNextNode:](self, "p_selectNextNode:", 1);
}

- (CGPoint)p_snappedPointForCanvasBackgroundAlignmentProvider:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasBackground"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alignmentProvider"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = objc_msgSend(v9, "isCanvasBackgroundAlignmentSnappingEnabled");

    if (v10)
    {
      objc_msgSend(v8, "alignmentPointForPoint:", x, y);
      x = v11;
      y = v12;
    }
  }

  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (id)pathCreateBlock
{
  return *(id *)&self->_isCreatingReversed;
}

- (void)setPathCreateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 105);
}

- (BOOL)isCreatingPath
{
  return BYTE1(self->_insertSelectionBehavior);
}

- (BOOL)isCreatingReversed
{
  return BYTE2(self->_insertSelectionBehavior);
}

- (void)setIsCreatingReversed:(BOOL)a3
{
  BYTE2(self->_insertSelectionBehavior) = a3;
}

- (BOOL)shouldCreateNewPath
{
  return BYTE3(self->_insertSelectionBehavior);
}

- (void)setShouldCreateNewPath:(BOOL)a3
{
  BYTE3(self->_insertSelectionBehavior) = a3;
}

- (BOOL)resetAfterRebase
{
  return BYTE4(self->_insertSelectionBehavior);
}

- (void)setResetAfterRebase:(BOOL)a3
{
  BYTE4(self->_insertSelectionBehavior) = a3;
}

- (BOOL)currentCommandsPathRelated
{
  return BYTE5(self->_insertSelectionBehavior);
}

- (void)setCurrentCommandsPathRelated:(BOOL)a3
{
  BYTE5(self->_insertSelectionBehavior) = a3;
}

- (UIInputViewController)inputAccessoryViewController
{
  return *(UIInputViewController **)((char *)&self->_pathCreateBlock + 1);
}

- (NSArray)leadingBarButtonGroups
{
  return *(NSArray **)((char *)&self->inputAccessoryViewController + 1);
}

- (NSArray)trailingBarButtonGroups
{
  return *(NSArray **)((char *)&self->leadingBarButtonGroups + 1);
}

- (BOOL)resignFirstResponderWhenKeyboardHides
{
  return BYTE6(self->_insertSelectionBehavior);
}

- (void)setResignFirstResponderWhenKeyboardHides:(BOOL)a3
{
  BYTE6(self->_insertSelectionBehavior) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->leadingBarButtonGroups + 1), 0);
  objc_storeStrong((id *)((char *)&self->inputAccessoryViewController + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pathCreateBlock + 1), 0);
  objc_storeStrong((id *)&self->_isCreatingReversed, 0);
  objc_storeStrong((id *)(&self->_willBecomeCurrentEditorAgain + 1), 0);
  objc_storeStrong((id *)((char *)&self->_hoveringKnob + 1), 0);
  objc_storeStrong((id *)(&self->_isInCommandGroup + 1), 0);
  objc_storeStrong((id *)(&self->super.mIsChangingStrokeWidth + 1), 0);
}

@end
