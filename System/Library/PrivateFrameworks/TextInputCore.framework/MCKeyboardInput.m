@implementation MCKeyboardInput

- (MCKeyboardInput)init
{
  return -[MCKeyboardInput initWithSourceKeyboardState:](self, "initWithSourceKeyboardState:", 0);
}

- (MCKeyboardInput)initWithSourceKeyboardState:(id)a3
{
  id v5;
  MCKeyboardInput *v6;
  MCKeyboardInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCKeyboardInput;
  v6 = -[MCKeyboardInput init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_composingInputIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v6->_sourceKeyboardState, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    if (self->_mutableInputs)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_mutableInputs, 1);
      v7 = *(void **)(v5 + 8);
      *(_QWORD *)(v5 + 8) = v6;
    }
    else
    {
      v7 = *(void **)(v4 + 8);
      *(_QWORD *)(v4 + 8) = 0;
    }

    *(_QWORD *)(v5 + 16) = self->_composingInputIndex;
    objc_storeStrong((id *)(v5 + 24), self->_sourceKeyboardState);
  }
  return (id)v5;
}

- (id)shortDescription
{
  return -[MCKeyboardInput shortDescriptionWithLeadingString:](self, "shortDescriptionWithLeadingString:", CFSTR("    "));
}

- (id)shortDescriptionWithLeadingString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCKeyboardInput shortDescriptionExcludingSubInputs](self, "shortDescriptionExcludingSubInputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@: %@"), v8, v6);

  if (objc_msgSend(v6, "length"))
    objc_msgSend(v5, "appendString:", CFSTR(" "));
  -[MCKeyboardInput inputs](self, "inputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v25 = v6;
    objc_msgSend(v5, "appendString:", CFSTR("(\n"));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[MCKeyboardInput inputs](self, "inputs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14);
          objc_msgSend(v5, "appendString:", v4);
          -[MCKeyboardInput composingInput](self, "composingInput");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 == v16)
            objc_msgSend(v5, "appendString:", CFSTR("*"));
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, v4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "shortDescriptionWithLeadingString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v18);

          -[MCKeyboardInput inputs](self, "inputs");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 != v20)
            objc_msgSend(v5, "appendString:", CFSTR(","));
          objc_msgSend(v5, "appendString:", CFSTR("\n"));

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v12);
    }

    v21 = objc_msgSend(v4, "length");
    v22 = objc_msgSend(CFSTR("    "), "length");
    if (v21 - v22 >= 1)
    {
      objc_msgSend(v4, "substringToIndex:", (v21 - v22));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v23);

    }
    objc_msgSend(v5, "appendString:", CFSTR(")"));
    v6 = v25;
  }

  return v5;
}

- (id)shortDescriptionExcludingSubInputs
{
  return &stru_1EA1081D0;
}

- (NSMutableArray)mutableInputs
{
  NSMutableArray *mutableInputs;
  NSMutableArray *v4;
  NSMutableArray *v5;

  mutableInputs = self->_mutableInputs;
  if (!mutableInputs)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_mutableInputs;
    self->_mutableInputs = v4;

    mutableInputs = self->_mutableInputs;
  }
  return mutableInputs;
}

- (NSArray)inputs
{
  if (self->_mutableInputs)
    return (NSArray *)self->_mutableInputs;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (MCKeyboardInput)composingInput
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[MCKeyboardInput composingInputIndex](self, "composingInputIndex");
  -[MCKeyboardInput inputs](self, "inputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v4, "count"))
  {
    v6 = 0;
  }
  else
  {
    -[MCKeyboardInput inputs](self, "inputs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", -[MCKeyboardInput composingInputIndex](self, "composingInputIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (MCKeyboardInput *)v6;
}

- (void)setComposingInput:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  MCKeyboardInput *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    v7 = self;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:
    -[MCKeyboardInput setComposingInputIndex:](v7, "setComposingInputIndex:", v8);
    goto LABEL_7;
  }
  -[MCKeyboardInput inputs](self, "inputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObjectIdenticalTo:", v9);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = self;
    v8 = v5;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("|composingInput| is not an input of this input"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise");

LABEL_7:
}

- (BOOL)canComposeNew:(id)a3
{
  return 1;
}

- (void)composeNew:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[MCKeyboardInput canComposeNew:](self, "canComposeNew:"))
  {
    v4 = -[MCKeyboardInput composingInputIndex](self, "composingInputIndex");
    -[MCKeyboardInput mutableInputs](self, "mutableInputs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v4 >= v6)
    {
      -[MCKeyboardInput mutableInputs](self, "mutableInputs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCKeyboardInput setComposingInputIndex:](self, "setComposingInputIndex:", objc_msgSend(v7, "count"));

    }
    else
    {
      -[MCKeyboardInput setComposingInputIndex:](self, "setComposingInputIndex:", -[MCKeyboardInput composingInputIndex](self, "composingInputIndex") + 1);
    }
    -[MCKeyboardInput mutableInputs](self, "mutableInputs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertObject:atIndex:", v9, -[MCKeyboardInput composingInputIndex](self, "composingInputIndex"));

  }
}

- (void)removeAllInputs
{
  void *v3;

  -[MCKeyboardInput mutableInputs](self, "mutableInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[MCKeyboardInput setComposingInput:](self, "setComposingInput:", 0);
}

- (void)removeComposingInput
{
  void *v3;
  void *v4;

  -[MCKeyboardInput composingInput](self, "composingInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MCKeyboardInput mutableInputs](self, "mutableInputs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectAtIndex:", -[MCKeyboardInput composingInputIndex](self, "composingInputIndex"));

    if (-[MCKeyboardInput composingInputIndex](self, "composingInputIndex"))
      -[MCKeyboardInput setComposingInputIndex:](self, "setComposingInputIndex:", -[MCKeyboardInput composingInputIndex](self, "composingInputIndex") - 1);
    else
      -[MCKeyboardInput setComposingInput:](self, "setComposingInput:", 0);
  }
}

- (void)removeInputAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[MCKeyboardInput inputs](self, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    -[MCKeyboardInput inputs](self, "inputs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCKeyboardInput composingInput](self, "composingInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      -[MCKeyboardInput removeComposingInput](self, "removeComposingInput");
    }
    else
    {
      -[MCKeyboardInput mutableInputs](self, "mutableInputs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectAtIndex:", a3);

      if (-[MCKeyboardInput composingInputIndex](self, "composingInputIndex") > a3)
        -[MCKeyboardInput setComposingInputIndex:](self, "setComposingInputIndex:", -[MCKeyboardInput composingInputIndex](self, "composingInputIndex") - 1);
    }
  }
}

- (void)replaceInputAtIndex:(unint64_t)a3 with:(id)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[MCKeyboardInput inputs](self, "inputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a3)
  {
    -[MCKeyboardInput inputs](self, "inputs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCKeyboardInput composingInput](self, "composingInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MCKeyboardInput removeInputAtIndex:](self, "removeInputAtIndex:", a3);
    -[MCKeyboardInput insertInput:atIndex:](self, "insertInput:atIndex:", v11, a3);
    if (v9 == v10)
      -[MCKeyboardInput setComposingInput:](self, "setComposingInput:", v11);
  }

}

- (void)replaceComposingInputWith:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MCKeyboardInput composingInput](self, "composingInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[MCKeyboardInput replaceInputAtIndex:with:](self, "replaceInputAtIndex:with:", -[MCKeyboardInput composingInputIndex](self, "composingInputIndex"), v5);

}

- (void)insertInput:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  v6 = a3;
  -[MCKeyboardInput inputs](self, "inputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 < a4)
  {
    -[MCKeyboardInput inputs](self, "inputs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = objc_msgSend(v9, "count");

  }
  -[MCKeyboardInput mutableInputs](self, "mutableInputs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertObject:atIndex:", v6, a4);

  -[MCKeyboardInput composingInput](self, "composingInput");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = -[MCKeyboardInput composingInputIndex](self, "composingInputIndex");

    if (a4 <= v13)
      -[MCKeyboardInput setComposingInputIndex:](self, "setComposingInputIndex:", -[MCKeyboardInput composingInputIndex](self, "composingInputIndex") + 1);
  }
}

- (BOOL)hasKindOf:(Class)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MCKeyboardInput inputs](self, "inputs", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (unint64_t)totalDrawSamples
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MCKeyboardInput inputs](self, "inputs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "inputs");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v5 += objc_msgSend(v9, "count");

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)composingInputIndex
{
  return self->_composingInputIndex;
}

- (void)setComposingInputIndex:(unint64_t)a3
{
  self->_composingInputIndex = a3;
}

- (MCKeyboardState)sourceKeyboardState
{
  return self->_sourceKeyboardState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceKeyboardState, 0);
  objc_storeStrong((id *)&self->_mutableInputs, 0);
}

- (id)asInlineText
{
  return -[MCKeyboardInput _asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:](self, "_asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:", 0, 0, 0, 0, 0);
}

- (id)asCommittedText
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = 0;
  -[MCKeyboardInput _asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:](self, "_asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:", 0, &v5, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringToIndex:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)asInlineTextCursorIndex
{
  id v2;
  unint64_t v4;

  v4 = 0;
  v2 = -[MCKeyboardInput _asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:](self, "_asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:", &v4, 0, 0, 0, 0);
  return v4;
}

- (unint64_t)asSearchTextCursorIndex
{
  id v2;
  unint64_t v4;

  v4 = 0;
  v2 = -[MCKeyboardInput _asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:](self, "_asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:", &v4, 0, 0, 1, 0);
  return v4;
}

- (BOOL)hasRemainingComposingInput
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v14;

  if (!-[MCKeyboardInput hasDrawInput](self, "hasDrawInput"))
  {
    v14 = 0;
    -[MCKeyboardInput _asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:](self, "_asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:", 0, &v14, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    v11 = v12 < objc_msgSend(v5, "length");
LABEL_11:

    return v11;
  }
  -[MCKeyboardInput composingInput](self, "composingInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MCKeyboardInput composingInput](self, "composingInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertedInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    objc_msgSend(v5, "remainingMecabraInputs");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
    {
      if (v8)
      {
        objc_msgSend(v5, "remainingMecabraInputs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count") != 0;

      }
      else
      {
        v11 = 1;
      }
    }
    else
    {
      v11 = v8 != 0;
    }

    goto LABEL_11;
  }
  return 1;
}

- (id)asSearchString
{
  return -[MCKeyboardInput _asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:](self, "_asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:", 0, 0, 0, 1, 0);
}

- (id)asMecabraGestures:(BOOL *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  MCKeyboardInput *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  MCTypeInput *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v27;
  id v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t TypeGestureWithTouchEvent;
  id v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const void *CPGesture;
  void *v55;
  double v56;
  void *v57;
  unint64_t v58;
  id v59;
  const void *v60;
  void *v61;
  double v62;
  void *v63;
  id v64;
  uint64_t v65;
  int v66;
  void *v67;
  int v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  const void *TypeGesture;
  void *v74;
  unint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  unint64_t v83;
  const void *v84;
  void *v85;
  uint64_t v86;
  void *v89;
  MCKeyboardInput *v90;
  MCKeyboardInput *v91;
  char v92;
  uint64_t v93;
  id obj;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int16 v99;
  _QWORD v100[6];
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  char v104;
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = objc_claimAutoreleasedReturnValue();
  v89 = (void *)v5;
  if (-[MCKeyboardInput hasKindOf:](self, "hasKindOf:", objc_opt_class()))
  {
    v101 = 0;
    v102 = &v101;
    v103 = 0x2020000000;
    v104 = 0;
    -[MCKeyboardInput inputs](self, "inputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = MEMORY[0x1E0C809B0];
    v100[1] = 3221225472;
    v100[2] = __54__MCKeyboardInput_ChineseJapanese__asMecabraGestures___block_invoke;
    v100[3] = &unk_1EA100050;
    v100[4] = self;
    v100[5] = &v101;
    v7 = objc_msgSend(v6, "indexOfObjectWithOptions:passingTest:", 2, v100);

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = self;
      v92 = 0;
LABEL_23:
      _Block_object_dispose(&v101, 8);
      goto LABEL_24;
    }
    v90 = (MCKeyboardInput *)objc_opt_new();
    -[MCKeyboardInput inputs](self, "inputs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*((_BYTE *)v102 + 24))
      goto LABEL_12;
    objc_msgSend(v11, "remainingInputString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v11, "remainingInputString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        v14 = 0;
        do
        {
          v99 = 0;
          v99 = objc_msgSend(v13, "characterAtIndex:", v14);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v99, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[MCTypeInput initWithCharacters:nearbyKeys:]([MCTypeInput alloc], "initWithCharacters:nearbyKeys:", v15, 0);
          -[MCKeyboardInput composeNew:](v90, "composeNew:", v16);

          ++v14;
        }
        while (objc_msgSend(v13, "length") > v14);
        v92 = 0;
      }
      else
      {
        v92 = 0;
      }
      goto LABEL_16;
    }
    if (!*((_BYTE *)v102 + 24))
    {
LABEL_12:
      objc_msgSend(v11, "remainingMecabraInputs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v11, "remainingMecabraInputs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v13);
        v92 = 1;
LABEL_16:

        goto LABEL_17;
      }
    }
    v92 = 0;
LABEL_17:
    -[MCKeyboardInput inputs](self, "inputs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    v8 = v90;
    if (v19 > (int)v7 + 1)
    {
      v20 = (int)v7 + 1;
      v21 = v7 + 2;
      do
      {
        -[MCKeyboardInput inputs](self, "inputs");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCKeyboardInput composeNew:](v90, "composeNew:", v23);

        v20 = v21;
        -[MCKeyboardInput inputs](self, "inputs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

      }
      while (v25 > v21++);
    }
    if (!-[MCKeyboardInput hasKindOf:](v90, "hasKindOf:", objc_opt_class()))
    {
      v27 = objc_opt_new();
      v28 = -[MCKeyboardInput _asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:](v90, "_asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:", 0, 0, v27, 1, 0);

      v8 = (MCKeyboardInput *)v27;
    }

    goto LABEL_23;
  }
  v8 = (MCKeyboardInput *)objc_opt_new();
  v9 = -[MCKeyboardInput _asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:](self, "_asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:", 0, 0, v8, 1, v5);
  v92 = 0;
LABEL_24:
  v29 = s_interface_idiom_is_pad;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v91 = v8;
  -[MCKeyboardInput inputs](v8, "inputs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
  if (!v30)
    goto LABEL_78;
  v31 = v30;
  if (v29)
    v32 = -3.0;
  else
    v32 = -2.0;
  v33 = *(_QWORD *)v96;
  v93 = *(_QWORD *)v96;
  do
  {
    v34 = 0;
    do
    {
      if (*(_QWORD *)v96 != v33)
        objc_enumerationMutation(obj);
      v35 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v34);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v44 = v35;
          objc_msgSend(v44, "inputs");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "count");

          if (v46)
          {
            v47 = 0;
            do
            {
              objc_msgSend(v44, "inputs");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "objectAtIndexedSubscript:", v47);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v44, "inputs");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "firstObject");
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              if (v49 != v51)
              {
                objc_msgSend(v44, "inputs");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "lastObject");
                v53 = (void *)objc_claimAutoreleasedReturnValue();

                if (v49 == v53)
                  objc_msgSend(v44, "isComplete");
              }
              objc_msgSend(v49, "touchPoint");
              objc_msgSend(v49, "touchPoint");
              objc_msgSend(v49, "timestamp");
              objc_msgSend(v49, "isInflectionPoint");
              CPGesture = (const void *)MecabraCreateCPGesture();
              objc_msgSend(v49, "nearbyKeys");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v56 = v32;
              -[MCKeyboardInput _addNearbyKeys:to:likelihoodThreshold:](self, "_addNearbyKeys:to:likelihoodThreshold:", v55, CPGesture, v56);

              objc_msgSend(v4, "addObject:", CPGesture);
              CFRelease(CPGesture);

              ++v47;
              objc_msgSend(v44, "inputs");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v57, "count");

            }
            while (v58 > v47);
            v92 = 1;
            v33 = v93;
          }
          goto LABEL_73;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_74;
        v59 = v35;
        if (objc_msgSend(v59, "useSubInputsAsSearchString"))
        {
          objc_msgSend(v59, "asSearchString");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_65;
        }
        objc_msgSend(v59, "uncommittedText");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCKeyboardInput inputs](v91, "inputs");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "lastObject");
        v64 = (id)objc_claimAutoreleasedReturnValue();
        if (v59 != v64)
        {

          goto LABEL_60;
        }
        v65 = objc_msgSend(v39, "length");

        if (!v65)
        {
          objc_msgSend(v59, "committedText");
          v63 = v39;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_60:

        }
        v66 = objc_msgSend(v59, "cursorIndex");
        objc_msgSend(v59, "committedText");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v66 - objc_msgSend(v67, "length");
        v69 = v68;

        if (v68 >= 1 && objc_msgSend(v39, "length") >= (unint64_t)v68)
          goto LABEL_67;
        -[MCKeyboardInput inputs](v91, "inputs");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "count");

        if (v71 == 1)
LABEL_65:
          v69 = objc_msgSend(v39, "length");
        if ((int)v69 >= 1)
        {
LABEL_67:
          v72 = 0;
          do
          {
            objc_msgSend(v39, "characterAtIndex:", v72);
            TypeGesture = (const void *)MecabraCreateTypeGesture();
            objc_msgSend(v4, "addObject:", TypeGesture);
            CFRelease(TypeGesture);
            ++v72;
          }
          while (v69 != v72);
        }
        objc_msgSend(v59, "text");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v59, "cursorIndex");
        if (v75 < objc_msgSend(v74, "length"))
        {
          objc_msgSend(v74, "substringWithRange:", objc_msgSend(v59, "cursorIndex"), objc_msgSend(v74, "length") - objc_msgSend(v59, "cursorIndex"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "appendString:", v76);

        }
        v33 = v93;
LABEL_72:

        goto LABEL_73;
      }
      v36 = v35;
      objc_msgSend(v36, "characters");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "length");

      if (v38)
      {
        objc_msgSend(v36, "sourceKeyboardState");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "userInterfaceIdiom") != 4
          && (objc_msgSend(v39, "userInterfaceIdiom")
           || (objc_msgSend(v39, "isSplitKeyboard") & 1) != 0
           || (objc_msgSend(v39, "isFloatingKeyboard") & 1) != 0
           || (objc_msgSend(v39, "isHardwareKeyboard") & 1) != 0)
          || (objc_msgSend(v36, "nearbyKeys"),
              v40 = (void *)objc_claimAutoreleasedReturnValue(),
              v41 = objc_msgSend(v40, "count"),
              v40,
              !v41))
        {
          objc_msgSend(v36, "characters");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "characterAtIndex:", 0);
          TypeGestureWithTouchEvent = MecabraCreateTypeGesture();
        }
        else
        {
          if (objc_msgSend(v39, "userInterfaceIdiom") == 4)
            v32 = -3.0;
          objc_msgSend(v36, "characters");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "characterAtIndex:", 0);
          objc_msgSend(v36, "point");
          objc_msgSend(v36, "point");
          TypeGestureWithTouchEvent = MecabraCreateTypeGestureWithTouchEvent();
        }
        v60 = (const void *)TypeGestureWithTouchEvent;

        objc_msgSend(v36, "nearbyKeys");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v62 = v32;
        -[MCKeyboardInput _addNearbyKeys:to:likelihoodThreshold:](self, "_addNearbyKeys:to:likelihoodThreshold:", v61, v60, v62);

        objc_msgSend(v4, "addObject:", v60);
        CFRelease(v60);
        goto LABEL_72;
      }
LABEL_73:

LABEL_74:
      ++v34;
    }
    while (v34 != v31);
    v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
    v31 = v77;
  }
  while (v77);
LABEL_78:

  -[MCKeyboardInput inputs](self, "inputs");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "lastObject");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_81;
  -[MCKeyboardInput inputs](self, "inputs");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "lastObject");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v81, "includeSuffixAsSearchString") & 1) != 0)
  {

LABEL_81:
    v82 = v89;
LABEL_82:
    if (objc_msgSend(v82, "length"))
    {
      v83 = 0;
      do
      {
        objc_msgSend(v82, "characterAtIndex:", v83);
        v84 = (const void *)MecabraCreateTypeGesture();
        objc_msgSend(v4, "addObject:", v84);
        CFRelease(v84);
        ++v83;
      }
      while (objc_msgSend(v82, "length") > v83);
    }
  }
  else
  {
    -[MCKeyboardInput inputs](v91, "inputs");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "count");

    v82 = v89;
    if (!v86)
      goto LABEL_82;
  }
  if (a3)
    *a3 = v92 & 1;

  return v4;
}

- (void)_addNearbyKeys:(id)a3 to:(void *)a4 likelihoodThreshold:(float)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  float v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v14, "logLikelihood", (_QWORD)v16);
          if (v15 < a5)
          {

            goto LABEL_14;
          }
          if (objc_msgSend(v14, "character"))
          {
            objc_msgSend(v14, "character");
            objc_msgSend(v14, "logLikelihood");
            MecabraGestureAddKeyAndLoglikelihoodPair();
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

- (id)_asInputStringWithCursorIndex:(unint64_t *)a3 remainingComposingInputIndex:(unint64_t *)a4 typeInputs:(id)a5 forSearch:(BOOL)a6 suffix:(id)a7
{
  id v11;
  id v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  MCKeyboardInput *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  unint64_t v31;
  __CFString *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  uint64_t v59;
  id v60;
  unint64_t v61;
  void *v62;
  int v63;
  unint64_t v64;
  void *v65;
  BOOL v66;
  char v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  void *v78;
  unint64_t v79;
  void *v80;
  int v81;
  void *v82;
  unint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  uint64_t v91;
  __CFString *v92;
  void *v93;
  unint64_t v94;
  void *v95;
  uint64_t v96;
  unint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  unint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  unint64_t v107;
  uint64_t v108;
  MCTypeInput *v109;
  void *v110;
  MCTypeInput *v111;
  unint64_t *v113;
  unint64_t *v114;
  unint64_t *v115;
  unint64_t *v116;
  id v117;
  void *v118;
  id v119;
  void *v120;
  MCKeyboardInput *v121;
  id obj;
  void *v123;
  unint64_t v124;
  _BOOL4 v125;
  int v126;
  char v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;

  v125 = a6;
  v143 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || v125 && (-[MCKeyboardInput useSubInputsAsSearchString](self, "useSubInputsAsSearchString") & 1) != 0)
  {
    v123 = v11;
    if (-[MCKeyboardInput hasDrawInput](self, "hasDrawInput"))
    {
      v113 = a4;
      v115 = a3;
      v117 = v12;
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v137 = 0u;
      v138 = 0u;
      v139 = 0u;
      v140 = 0u;
      -[MCKeyboardInput inputs](self, "inputs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v137, v142, 16);
      if (!v15)
      {
        v17 = 0;
        goto LABEL_42;
      }
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v138;
      while (1)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v138 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = v20;

            objc_msgSend(v21, "convertedInput");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {

            }
            else
            {
              objc_msgSend(v21, "candidateText");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "rangeOfString:", v13);

              if (!v25)
                -[__CFString setString:](v13, "setString:", &stru_1EA1081D0);
            }
            objc_msgSend(v21, "candidateText");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v21;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            objc_msgSend(v20, "committedText");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[__CFString appendString:](v13, "appendString:", v23);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v137, v142, 16);
        if (!v16)
        {
LABEL_42:

          if (v113)
            *v113 = -[__CFString length](v13, "length");
          objc_msgSend(v17, "remainingInputString");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v123;
          v12 = v117;
          if (v39)
          {
            objc_msgSend(v17, "remainingInputString");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v13, "appendString:", v40);

          }
          if (v115)
            *v115 = -[__CFString length](v13, "length");
          objc_msgSend(v17, "remainingInputString");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = (void *)v41;
          v43 = &stru_1EA1081D0;
          if (v41)
            v43 = (__CFString *)v41;
          v44 = v43;

          if (v125)
            v45 = v44;
          else
            v45 = v13;
          v32 = v45;

          goto LABEL_153;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MCKeyboardInput characters](self, "characters");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (__CFString *)objc_msgSend(v29, "copy");

      objc_msgSend(v11, "composeNew:", self);
      v31 = 0;
      if (v30)
        goto LABEL_28;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MCKeyboardInput convertedInput](self, "convertedInput");
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v31 = -[__CFString length](v30, "length");
        if (v30)
        {
LABEL_28:
          if (!a3)
          {
LABEL_30:
            if (a4)
              *a4 = v31;
            v32 = v30;
LABEL_129:

            goto LABEL_153;
          }
LABEL_29:
          *a3 = -[__CFString length](v30, "length");
          goto LABEL_30;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = 0;
          v30 = &stru_1EA1081D0;
          if (!a3)
            goto LABEL_30;
          goto LABEL_29;
        }
      }
    }
    v114 = a4;
    v116 = a3;
    v118 = v12;
    v47 = (void *)objc_opt_new();
    v48 = (void *)objc_opt_new();
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v121 = self;
    -[MCKeyboardInput inputs](self, "inputs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v141, 16);
    if (!v129)
    {
      v50 = 0;
      v124 = 0;
      goto LABEL_119;
    }
    v49 = 0;
    v127 = 0;
    v50 = 0;
    v124 = 0;
    v128 = *(_QWORD *)v134;
    v120 = v47;
LABEL_61:
    v51 = 0;
    while (1)
    {
      if (*(_QWORD *)v134 != v128)
        objc_enumerationMutation(obj);
      v52 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v51);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v131 = 0;
        v132 = 0;
        objc_msgSend(v52, "_asInputStringWithCursorIndex:remainingComposingInputIndex:typeInputs:forSearch:suffix:", &v132, &v131, v11, v125, v48);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "appendString:", v56);
        if ((v49 & 1) == 0)
        {
          v124 += v132;
          if (v124 > objc_msgSend(v47, "length"))
            v124 = objc_msgSend(v47, "length");
        }
        -[MCKeyboardInput composingInput](v121, "composingInput", v114);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v52 == v57;

        if ((v127 & 1) != 0)
        {
          v59 = objc_msgSend(v56, "length");
          v127 = 1;
        }
        else
        {
          v59 = v131;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v60 = v52;
            v61 = v50;
            v62 = v48;
            v63 = v49;
            v64 = objc_msgSend(v60, "cursorIndex");
            objc_msgSend(v60, "committedText");
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            v66 = v64 >= objc_msgSend(v65, "length");
            v49 = v63;
            v48 = v62;
            v50 = v61;
            v47 = v120;
            v67 = !v66;
            v127 = v67;

          }
          else
          {
            v127 = 0;
          }
        }
        v49 |= v58;
        v50 += v59;

        v11 = v123;
        goto LABEL_115;
      }
      v126 = v49;
      v53 = v52;
      objc_msgSend(v47, "appendString:", v48);
      objc_msgSend(v48, "deleteCharactersInRange:", 0, objc_msgSend(v48, "length"));
      objc_msgSend(v53, "convertedInput");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "length"))
        break;
      objc_msgSend(v53, "candidateText");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v68, "length"))
        goto LABEL_110;
      v69 = objc_msgSend(v47, "length");

      if (v50 <= v69)
        goto LABEL_80;
LABEL_114:

      v49 = v126;
LABEL_115:
      if (++v51 == v129)
      {
        v129 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v141, 16);
        if (!v129)
        {
LABEL_119:

          objc_msgSend(v118, "appendString:", v48);
          if (objc_msgSend(v48, "length"))
          {
            objc_msgSend(v47, "stringByAppendingString:", v48);
            v89 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v89 = v47;
          }
          v90 = v89;
          v91 = v124;
          if (v116)
          {
            if (-[MCKeyboardInput hasKindOf:](v121, "hasKindOf:", objc_opt_class()))
              v91 = objc_msgSend(v90, "length");
            *v116 = v91;
          }
          if (v114)
            *v114 = v50;
          v32 = v90;

          v12 = v118;
          goto LABEL_129;
        }
        goto LABEL_61;
      }
    }
    v55 = objc_msgSend(v47, "length");

    if (v50 > v55)
      goto LABEL_114;
LABEL_80:
    v70 = objc_msgSend(v47, "length", v114);
    objc_msgSend(v53, "convertedInput");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "length");
    objc_msgSend(v53, "candidateText");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v73;
    if (v72)
    {
      if ((objc_msgSend(v73, "isEqualToString:", v47) & 1) != 0)
        objc_msgSend(v53, "candidateText");
      else
        objc_msgSend(v53, "convertedInput");
      v74 = objc_claimAutoreleasedReturnValue();

      v54 = (void *)v74;
    }

    if (objc_msgSend(v54, "isEqualToString:", CFSTR("☻")))
    {
      v75 = objc_msgSend(v47, "length");
      v76 = 0;
    }
    else
    {
      v76 = objc_msgSend(v47, "rangeOfString:options:range:", v54, 1, v50, v70 - v50);
      v75 = v77;
    }
    if (v76 == v50 && v75 <= objc_msgSend(v47, "length") - v50)
    {
      if (v124 >= v75)
        v79 = v124 - v75;
      else
        v79 = 0;
      if (v125)
      {
        v124 = v79;
        objc_msgSend(v47, "deleteCharactersInRange:", v76, v75);
        if (v75)
        {
          v11 = v123;
          do
          {
            objc_msgSend(v123, "removeInputAtIndex:", 0);
            --v75;
          }
          while (v75);
          goto LABEL_113;
        }
      }
      else
      {
        objc_msgSend(v53, "candidateText");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = objc_msgSend(v86, "length") + v79;

        objc_msgSend(v53, "candidateText");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "replaceCharactersInRange:withString:", v76, v75, v87);

        objc_msgSend(v53, "candidateText");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v50 += objc_msgSend(v88, "length");

      }
      v11 = v123;
    }
    else if (!v125)
    {
      objc_msgSend(v53, "convertedInput");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v78, "length"))
      {

      }
      else
      {
        objc_msgSend(v53, "candidateText");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v47, "isEqualToString:", v80);

        if (v81)
        {
          v50 = objc_msgSend(v47, "length");
          goto LABEL_113;
        }
      }
      if (v50 >= objc_msgSend(v47, "length"))
      {
        objc_msgSend(v53, "candidateText");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "appendString:", v85);

      }
      else
      {
        objc_msgSend(v53, "remainingMecabraInputs");
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v82)
          goto LABEL_113;
        v83 = objc_msgSend(v47, "length") - v50;
        objc_msgSend(v53, "candidateText");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "replaceCharactersInRange:withString:", v50, v83, v84);

      }
      objc_msgSend(v53, "candidateText");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v50 += objc_msgSend(v68, "length");
LABEL_110:

    }
LABEL_113:

    goto LABEL_114;
  }
  v26 = self;
  -[MCKeyboardInput text](v26, "text");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCKeyboardInput uncommittedText](v26, "uncommittedText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    if (!v125)
    {
      -[MCKeyboardInput committedText](v26, "committedText");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = objc_msgSend(v46, "length");

      if (!a3)
        goto LABEL_132;
      goto LABEL_55;
    }
    *a4 = 0;
    if (!a3)
      goto LABEL_132;
  }
  else
  {
    if (!a3)
      goto LABEL_132;
    if (!v125)
      goto LABEL_55;
  }
  -[MCKeyboardInput uncommittedText](v26, "uncommittedText");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "length");

  if (!v34)
  {
LABEL_55:
    *a3 = -[MCKeyboardInput cursorIndex](v26, "cursorIndex");
    goto LABEL_132;
  }
  v35 = -[MCKeyboardInput cursorIndex](v26, "cursorIndex");
  -[MCKeyboardInput committedText](v26, "committedText");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35 <= objc_msgSend(v36, "length"))
  {
    *a3 = 0;
  }
  else
  {
    v37 = -[MCKeyboardInput cursorIndex](v26, "cursorIndex");
    -[MCKeyboardInput committedText](v26, "committedText");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = v37 - objc_msgSend(v38, "length");

  }
LABEL_132:
  v92 = v27;
  -[__CFString substringWithRange:](v92, "substringWithRange:", -[MCKeyboardInput cursorIndex](v26, "cursorIndex"), -[__CFString length](v92, "length") - -[MCKeyboardInput cursorIndex](v26, "cursorIndex"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = -[MCKeyboardInput cursorIndex](v26, "cursorIndex");
  v130 = v28;
  if (!v125)
  {
    v32 = v92;
    if (v94 < -[__CFString length](v92, "length"))
    {
      objc_msgSend(v12, "appendString:", v93);
      -[__CFString substringToIndex:](v92, "substringToIndex:", -[MCKeyboardInput cursorIndex](v26, "cursorIndex"));
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_148;
  }
  -[MCKeyboardInput committedText](v26, "committedText");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v94 <= objc_msgSend(v95, "length"))
  {
    v96 = objc_msgSend(v28, "length");

    if (v96)
    {

      objc_msgSend(v12, "appendString:", v28);
      v32 = &stru_1EA1081D0;
      goto LABEL_148;
    }
  }
  else
  {

  }
  v97 = -[MCKeyboardInput cursorIndex](v26, "cursorIndex");
  -[MCKeyboardInput committedText](v26, "committedText");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (v97 <= objc_msgSend(v98, "length"))
  {

  }
  else
  {
    v99 = objc_msgSend(v28, "length");

    if (v99)
    {
      v100 = -[MCKeyboardInput cursorIndex](v26, "cursorIndex");
      -[MCKeyboardInput committedText](v26, "committedText");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v100 - objc_msgSend(v101, "length");

      objc_msgSend(v28, "substringWithRange:", 0, v102);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_147:
      objc_msgSend(v12, "appendString:", v93);
      goto LABEL_148;
    }
  }
  v103 = -[MCKeyboardInput cursorIndex](v26, "cursorIndex");
  -[MCKeyboardInput committedText](v26, "committedText");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (v103 > objc_msgSend(v104, "length"))
  {

    v32 = v92;
    goto LABEL_148;
  }
  v105 = objc_msgSend(v28, "length");

  v32 = v92;
  if (!v105)
  {
    -[MCKeyboardInput committedText](v26, "committedText");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "substringWithRange:", 0, -[MCKeyboardInput cursorIndex](v26, "cursorIndex"));
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_147;
  }
LABEL_148:
  v119 = v12;
  if (v11 && -[__CFString length](v32, "length"))
  {
    v107 = 0;
    v108 = MEMORY[0x1E0C9AA60];
    do
    {
      v109 = [MCTypeInput alloc];
      -[__CFString substringWithRange:](v32, "substringWithRange:", v107, 1);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = -[MCTypeInput initWithCharacters:nearbyKeys:](v109, "initWithCharacters:nearbyKeys:", v110, v108);

      objc_msgSend(v11, "composeNew:", v111);
      ++v107;
    }
    while (-[__CFString length](v32, "length") > v107);
  }

  v12 = v119;
LABEL_153:

  return v32;
}

- (BOOL)hasDrawInput
{
  return -[MCKeyboardInput hasKindOf:](self, "hasKindOf:", objc_opt_class());
}

uint64_t __54__MCKeyboardInput_ChineseJapanese__asMecabraGestures___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(*(id *)(a1 + 32), "inputs"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "lastObject"),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8 == v6))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 1;
    *a4 = 1;
  }

  return v9;
}

@end
