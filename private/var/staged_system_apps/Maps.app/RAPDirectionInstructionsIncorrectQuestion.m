@implementation RAPDirectionInstructionsIncorrectQuestion

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Directions [Report an Issue category]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (int64_t)questionCategory
{
  return 6;
}

- (int)userAction
{
  return 10101;
}

- (RAPDirectionInstructionsIncorrectQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 direction:(id)a5
{
  id v9;
  RAPDirectionInstructionsIncorrectQuestion *v10;
  RAPDirectionInstructionsIncorrectQuestion *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RAPDirectionInstructionsIncorrectQuestion;
  v10 = -[RAPQuestion initWithReport:parentQuestion:](&v13, "initWithReport:parentQuestion:", a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_selectedValue, a5);

  return v11;
}

- (id)instructionCorrectionQuestionForStep:(id)a3 listItem:(id)a4
{
  id v6;
  id v7;
  RAPInstructionCorrectionQuestion *v8;
  RAPInstructionCorrectionQuestion *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (RAPInstructionCorrectionQuestion *)objc_claimAutoreleasedReturnValue(-[RAPDirectionInstructionsIncorrectQuestion _correctionforComposedRouteStep:listItem:](self, "_correctionforComposedRouteStep:listItem:", v6, v7));
  if (!v8)
  {
    v9 = [RAPInstructionCorrectionQuestion alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    v8 = -[RAPInstructionCorrectionQuestion initWithReport:parentQuestion:composedRouteStep:listItem:](v9, "initWithReport:parentQuestion:composedRouteStep:listItem:", v10, self, v6, v7);

  }
  return v8;
}

- (id)_correctionforComposedRouteStep:(id)a3 listItem:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_incorrectInstructions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "composedRouteStep", (_QWORD)v16));
        if (v13 == v6)
        {
          v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "listItem"));

          if (v14 == v7)
          {
            v9 = v12;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  return v9;
}

- (void)saveCorrection:(id)a3
{
  id v4;
  NSMutableArray *incorrectInstructions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  incorrectInstructions = self->_incorrectInstructions;
  v12 = v4;
  if (!incorrectInstructions)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_incorrectInstructions;
    self->_incorrectInstructions = v6;

    v4 = v12;
    incorrectInstructions = self->_incorrectInstructions;
  }
  if ((-[NSMutableArray containsObject:](incorrectInstructions, "containsObject:", v4) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "comment"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9));
    v11 = objc_msgSend(v10, "length");

    if (!v11)
      -[NSMutableArray removeObject:](self->_incorrectInstructions, "removeObject:", v12);
  }
  else
  {
    -[NSMutableArray addObject:](self->_incorrectInstructions, "addObject:", v12);
  }
  -[RAPQuestion _didChange](self, "_didChange");

}

- (BOOL)isComplete
{
  NSMutableArray *incorrectInstructions;

  incorrectInstructions = self->_incorrectInstructions;
  if (incorrectInstructions)
    LOBYTE(incorrectInstructions) = -[NSMutableArray count](incorrectInstructions, "count") != 0;
  return (char)incorrectInstructions;
}

- (BOOL)hasCorrectionForRouteStep:(id)a3 transitListItem:(id)a4
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionInstructionsIncorrectQuestion _correctionforComposedRouteStep:listItem:](self, "_correctionforComposedRouteStep:listItem:", a3, a4));
  v5 = v4 != 0;

  return v5;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_incorrectInstructions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9), "_fillSubmissionParameters:", v4, (_QWORD)v18);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "setType:", 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));

  if (!v10)
  {
    v11 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    objc_msgSend(v4, "setCommonContext:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details", (_QWORD)v18));

  if (!v12)
  {
    v13 = objc_alloc_init((Class)GEORPFeedbackDetails);
    objc_msgSend(v4, "setDetails:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "directionsFeedback"));

  if (!v15)
  {
    v15 = objc_alloc_init((Class)GEORPDirectionsFeedback);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
    objc_msgSend(v16, "setDirectionsFeedback:", v15);

  }
  objc_msgSend(v15, "setCorrectionType:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));
  objc_msgSend(v17, "addUserPath:", 43);

}

- (RAPUserDirectionRequest)selectedValue
{
  return self->_selectedValue;
}

- ($C79183323B9A0D5602617FF3BE5395AC)routeStepMapRect
{
  double x;
  double y;
  double width;
  double height;
  $C79183323B9A0D5602617FF3BE5395AC result;

  x = self->_routeStepMapRect.origin.x;
  y = self->_routeStepMapRect.origin.y;
  width = self->_routeStepMapRect.size.width;
  height = self->_routeStepMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedValue, 0);
  objc_storeStrong((id *)&self->_incorrectInstructions, 0);
}

@end
