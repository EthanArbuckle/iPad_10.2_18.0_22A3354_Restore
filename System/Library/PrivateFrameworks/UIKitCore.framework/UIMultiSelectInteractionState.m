@implementation UIMultiSelectInteractionState

- (UIMultiSelectInteractionState)initWithCurrentSelection:(id)a3
{
  id v4;
  UIMultiSelectInteractionState *v5;
  UIMultiSelectInteractionState *v6;
  void *v7;

  v4 = a3;
  v5 = -[UIMultiSelectInteractionState init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[UIMultiSelectInteractionState setOriginallySelectedIndexPaths:](v5, "setOriginallySelectedIndexPaths:", v4);
    objc_msgSend(v4, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMultiSelectInteractionState setStartIndexPath:](v6, "setStartIndexPath:", v7);

    -[UIMultiSelectInteractionState setSelecting:](v6, "setSelecting:", 1);
  }

  return v6;
}

- (void)setOriginallySelectedIndexPaths:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_originallySelectedIndexPaths, a3);
  v5 = a3;
  -[UIMultiSelectInteractionState setAllSelectedIndexPaths:](self, "setAllSelectedIndexPaths:", v5);

}

- (void)ignoreSelectionChangedNotificationsWithBlock:(id)a3
{
  ++self->_ignoringSelectionChangedNotificationsCounter;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --self->_ignoringSelectionChangedNotificationsCounter;
}

- (BOOL)ignoringSelectionChangedNotifications
{
  return self->_ignoringSelectionChangedNotificationsCounter != 0;
}

- (BOOL)stillValidForSelectedIndexPaths:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[UIMultiSelectInteractionState allSelectedIndexPaths](self, "allSelectedIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToArray:", v4);

  return v6;
}

- (void)updateStateWithDifferenceFromCurrentSelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  if (!-[UIMultiSelectInteractionState ignoringSelectionChangedNotifications](self, "ignoringSelectionChangedNotifications"))
  {
    -[UIMultiSelectInteractionState allSelectedIndexPaths](self, "allSelectedIndexPaths");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[UIMultiSelectInteractionState setSelecting:](self, "setSelecting:", 1);
      objc_msgSend(v20, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIMultiSelectInteractionState setStartIndexPath:](self, "setStartIndexPath:", v8);

      -[UIMultiSelectInteractionState setEndIndexPath:](self, "setEndIndexPath:", 0);
      -[UIMultiSelectInteractionState setAllSelectedIndexPaths:](self, "setAllSelectedIndexPaths:", v20);
LABEL_14:
      -[UIMultiSelectInteractionState setOriginallySelectedIndexPaths:](self, "setOriginallySelectedIndexPaths:", 0);
      goto LABEL_15;
    }
    -[UIMultiSelectInteractionState allSelectedIndexPaths](self, "allSelectedIndexPaths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "differenceFromArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "insertions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {

    }
    else
    {
      objc_msgSend(v6, "removals");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (!v10)
      {
        -[UIMultiSelectInteractionState setSelecting:](self, "setSelecting:", 1);
        objc_msgSend(v20, "lastObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIMultiSelectInteractionState setStartIndexPath:](self, "setStartIndexPath:", v19);
        goto LABEL_12;
      }
    }
    objc_msgSend(v6, "insertions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      -[UIMultiSelectInteractionState setSelecting:](self, "setSelecting:", 1);
      objc_msgSend(v6, "insertions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "removals");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (!v15)
      {
LABEL_13:

        goto LABEL_14;
      }
      -[UIMultiSelectInteractionState setSelecting:](self, "setSelecting:", 0);
      objc_msgSend(v6, "removals");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = v13;
    objc_msgSend(v13, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "object");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMultiSelectInteractionState setStartIndexPath:](self, "setStartIndexPath:", v18);

    -[UIMultiSelectInteractionState startIndexPath](self, "startIndexPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMultiSelectInteractionState setEndIndexPath:](self, "setEndIndexPath:", v19);
LABEL_12:

    goto LABEL_13;
  }
LABEL_15:

}

- (void)updateStateWithStartingIndexPath:(id)a3 otherSelectedIndexPaths:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    -[UIMultiSelectInteractionState setAllSelectedIndexPaths:](self, "setAllSelectedIndexPaths:", 0);
    -[UIMultiSelectInteractionState setOriginallySelectedIndexPaths:](self, "setOriginallySelectedIndexPaths:", 0);
    -[UIMultiSelectInteractionState setSelecting:](self, "setSelecting:", objc_msgSend(v6, "containsObject:", v9) ^ 1);
    -[UIMultiSelectInteractionState setOriginallySelectedIndexPaths:](self, "setOriginallySelectedIndexPaths:", v6);
    -[UIMultiSelectInteractionState setStartIndexPath:](self, "setStartIndexPath:", v9);
  }
  else
  {
    -[UIMultiSelectInteractionState startIndexPath](self, "startIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMultiSelectInteractionState setSelecting:](self, "setSelecting:", objc_msgSend(v6, "containsObject:", v7));

  }
  -[UIMultiSelectInteractionState originallySelectedIndexPaths](self, "originallySelectedIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[UIMultiSelectInteractionState setOriginallySelectedIndexPaths:](self, "setOriginallySelectedIndexPaths:", v6);

}

- (void)beginSelectingWithStartingIndexPath:(id)a3 otherSelectedIndexPaths:(id)a4 keepCurrentSelection:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  UIMultiSelectInteractionState *v9;
  id v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  v9 = self;
  if (v5)
  {
    v10 = v8;
  }
  else
  {
    -[UIMultiSelectInteractionState setAllSelectedIndexPaths:](self, "setAllSelectedIndexPaths:", 0);
    v10 = (id)MEMORY[0x1E0C9AA60];
    v9 = self;
  }
  -[UIMultiSelectInteractionState setOriginallySelectedIndexPaths:](v9, "setOriginallySelectedIndexPaths:", v10);
  if (v11)
    -[UIMultiSelectInteractionState setStartIndexPath:](self, "setStartIndexPath:", v11);
  -[UIMultiSelectInteractionState setSelecting:](self, "setSelecting:", 1);

}

- (id)pathsToSelectForInterpolatedIndexPaths:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  -[UIMultiSelectInteractionState originallySelectedIndexPaths](self, "originallySelectedIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIMultiSelectInteractionState isSelecting](self, "isSelecting"))
    objc_msgSend(v7, "unionSet:", v5);
  else
    objc_msgSend(v7, "minusSet:", v5);

  return v7;
}

- (id)pathsToDeselectForInterpolatedIndexPaths:(id)a3 currentlySelectedIndexPaths:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[UIMultiSelectInteractionState pathsToSelectForInterpolatedIndexPaths:](self, "pathsToSelectForInterpolatedIndexPaths:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v10, "minusSet:", v9);
  if (!-[UIMultiSelectInteractionState isSelecting](self, "isSelecting"))
    objc_msgSend(v10, "unionSet:", v6);

  return v10;
}

- (BOOL)isInMultiselectInteraction
{
  return self->_multiselectInteractionCounter != 0;
}

- (void)beginMultiselectInteraction
{
  ++self->_multiselectInteractionCounter;
}

- (void)endMultiselectInteraction
{
  unint64_t multiselectInteractionCounter;
  void *v5;

  multiselectInteractionCounter = self->_multiselectInteractionCounter;
  if (!multiselectInteractionCounter)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMultiSelectInteractionState.m"), 172, CFSTR("Unable to end multiselect interaction. No interaction ongoing."));

    multiselectInteractionCounter = self->_multiselectInteractionCounter;
  }
  self->_multiselectInteractionCounter = multiselectInteractionCounter - 1;
}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  self->_startPoint = a3;
}

- (NSIndexPath)startIndexPath
{
  return self->_startIndexPath;
}

- (void)setStartIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_startIndexPath, a3);
}

- (NSIndexPath)endIndexPath
{
  return self->_endIndexPath;
}

- (void)setEndIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_endIndexPath, a3);
}

- (BOOL)isSelecting
{
  return self->_selecting;
}

- (void)setSelecting:(BOOL)a3
{
  self->_selecting = a3;
}

- (NSArray)originallySelectedIndexPaths
{
  return self->_originallySelectedIndexPaths;
}

- (NSArray)allSelectedIndexPaths
{
  return self->_allSelectedIndexPaths;
}

- (void)setAllSelectedIndexPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSelectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_originallySelectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_endIndexPath, 0);
  objc_storeStrong((id *)&self->_startIndexPath, 0);
}

@end
