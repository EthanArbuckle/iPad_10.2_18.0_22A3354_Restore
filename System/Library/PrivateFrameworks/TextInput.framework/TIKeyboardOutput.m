@implementation TIKeyboardOutput

- (TIKeyboardOutput)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardOutput *v5;
  uint64_t v6;
  TIKeyboardCandidate *acceptedCandidate;
  uint64_t v8;
  NSString *textToCommit;
  void *v10;
  uint64_t v11;
  NSString *insertionText;
  void *v13;
  uint64_t v14;
  NSString *insertionTextAfterSelection;
  uint64_t v16;
  TIKeyboardCandidate *shortcutConversion;
  void *v18;
  uint64_t v19;
  NSIndexSet *handwritingStrokesToDelete;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSMutableDictionary *customInfo;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)TIKeyboardOutput;
  v5 = -[TIKeyboardOutput init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acceptedCandidate"));
    v6 = objc_claimAutoreleasedReturnValue();
    acceptedCandidate = v5->_acceptedCandidate;
    v5->_acceptedCandidate = (TIKeyboardCandidate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textToCommit"));
    v8 = objc_claimAutoreleasedReturnValue();
    textToCommit = v5->_textToCommit;
    v5->_textToCommit = (NSString *)v8;

    v5->_unmarkIfNecessary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_unmarkIfNecessary"));
    v5->_positionOffset = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("positionOffset"));
    v5->_deletionCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deletionCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("insertionText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    insertionText = v5->_insertionText;
    v5->_insertionText = (NSString *)v11;

    v5->_forwardDeletionCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("forwardDeletionCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("insertionTextAfterSelection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    insertionTextAfterSelection = v5->_insertionTextAfterSelection;
    v5->_insertionTextAfterSelection = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutConversion"));
    v16 = objc_claimAutoreleasedReturnValue();
    shortcutConversion = v5->_shortcutConversion;
    v5->_shortcutConversion = (TIKeyboardCandidate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handwritingStrokesToDelete"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    handwritingStrokesToDelete = v5->_handwritingStrokesToDelete;
    v5->_handwritingStrokesToDelete = (NSIndexSet *)v19;

    v5->_shouldSendCurrentLocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSendCurrentLocation"));
    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, v23, v24, v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("customInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "mutableCopy");
    customInfo = v5->_customInfo;
    v5->_customInfo = (NSMutableDictionary *)v29;

    v5->_producedByDeleteInput = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("producedByDeleteInput"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  TIKeyboardCandidate *acceptedCandidate;
  NSString *textToCommit;
  unint64_t deletionCount;
  NSString *insertionText;
  void *v8;
  unint64_t forwardDeletionCount;
  NSString *insertionTextAfterSelection;
  TIKeyboardCandidate *shortcutConversion;
  NSIndexSet *handwritingStrokesToDelete;
  NSMutableDictionary *customInfo;
  id v14;

  v14 = a3;
  acceptedCandidate = self->_acceptedCandidate;
  if (acceptedCandidate)
    objc_msgSend(v14, "encodeObject:forKey:", acceptedCandidate, CFSTR("acceptedCandidate"));
  textToCommit = self->_textToCommit;
  if (textToCommit)
    objc_msgSend(v14, "encodeObject:forKey:", textToCommit, CFSTR("textToCommit"));
  if (self->_unmarkIfNecessary)
    objc_msgSend(v14, "encodeBool:forKey:", 1, CFSTR("unmarkIfNecessary"));
  if (self->_positionOffset)
    objc_msgSend(v14, "encodeInteger:forKey:", -[TIKeyboardOutput positionOffset](self, "positionOffset"), CFSTR("positionOffset"));
  deletionCount = self->_deletionCount;
  if (deletionCount)
    objc_msgSend(v14, "encodeInteger:forKey:", deletionCount, CFSTR("deletionCount"));
  insertionText = self->_insertionText;
  v8 = v14;
  if (insertionText)
  {
    objc_msgSend(v14, "encodeObject:forKey:", insertionText, CFSTR("insertionText"));
    v8 = v14;
  }
  forwardDeletionCount = self->_forwardDeletionCount;
  if (forwardDeletionCount)
  {
    objc_msgSend(v14, "encodeInteger:forKey:", forwardDeletionCount, CFSTR("forwardDeletionCount"));
    v8 = v14;
  }
  insertionTextAfterSelection = self->_insertionTextAfterSelection;
  if (insertionTextAfterSelection)
  {
    objc_msgSend(v14, "encodeObject:forKey:", insertionTextAfterSelection, CFSTR("insertionTextAfterSelection"));
    v8 = v14;
  }
  shortcutConversion = self->_shortcutConversion;
  if (shortcutConversion)
  {
    objc_msgSend(v14, "encodeObject:forKey:", shortcutConversion, CFSTR("shortcutConversion"));
    v8 = v14;
  }
  handwritingStrokesToDelete = self->_handwritingStrokesToDelete;
  if (handwritingStrokesToDelete)
  {
    objc_msgSend(v14, "encodeObject:forKey:", handwritingStrokesToDelete, CFSTR("handwritingStrokesToDelete"));
    v8 = v14;
  }
  if (self->_shouldSendCurrentLocation)
  {
    objc_msgSend(v14, "encodeBool:forKey:", 1, CFSTR("shouldSendCurrentLocation"));
    v8 = v14;
  }
  customInfo = self->_customInfo;
  if (customInfo)
  {
    objc_msgSend(v14, "encodeObject:forKey:", customInfo, CFSTR("customInfo"));
    v8 = v14;
  }
  if (self->_producedByDeleteInput)
  {
    objc_msgSend(v14, "encodeBool:forKey:", 1, CFSTR("producedByDeleteInput"));
    v8 = v14;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  int v47;
  void *v48;
  void *v49;
  _BOOL4 v51;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[TIKeyboardOutput acceptedCandidate](self, "acceptedCandidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acceptedCandidate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[TIKeyboardOutput acceptedCandidate](self, "acceptedCandidate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "acceptedCandidate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_33;
    }
    -[TIKeyboardOutput textToCommit](self, "textToCommit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textToCommit");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[TIKeyboardOutput textToCommit](self, "textToCommit");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textToCommit");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (!v18)
        goto LABEL_33;
    }
    v19 = -[TIKeyboardOutput unmarkIfNecessary](self, "unmarkIfNecessary");
    if (v19 != objc_msgSend(v5, "unmarkIfNecessary"))
      goto LABEL_33;
    v20 = -[TIKeyboardOutput positionOffset](self, "positionOffset");
    if (v20 != objc_msgSend(v5, "positionOffset"))
      goto LABEL_33;
    v21 = -[TIKeyboardOutput deletionCount](self, "deletionCount");
    if (v21 != objc_msgSend(v5, "deletionCount"))
      goto LABEL_33;
    -[TIKeyboardOutput insertionText](self, "insertionText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertionText");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v22 == (void *)v23)
    {

    }
    else
    {
      v24 = (void *)v23;
      -[TIKeyboardOutput insertionText](self, "insertionText");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertionText");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqualToString:", v26);

      if (!v27)
        goto LABEL_33;
    }
    v28 = -[TIKeyboardOutput forwardDeletionCount](self, "forwardDeletionCount");
    if (v28 == objc_msgSend(v5, "forwardDeletionCount"))
    {
      -[TIKeyboardOutput insertionTextAfterSelection](self, "insertionTextAfterSelection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertionTextAfterSelection");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v29 == (void *)v30)
      {

      }
      else
      {
        v31 = (void *)v30;
        -[TIKeyboardOutput insertionTextAfterSelection](self, "insertionTextAfterSelection");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "insertionTextAfterSelection");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqualToString:", v33);

        if (!v34)
          goto LABEL_33;
      }
      -[TIKeyboardOutput shortcutConversion](self, "shortcutConversion");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortcutConversion");
      v36 = objc_claimAutoreleasedReturnValue();
      if (v35 == (void *)v36)
      {

      }
      else
      {
        v37 = (void *)v36;
        -[TIKeyboardOutput shortcutConversion](self, "shortcutConversion");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "shortcutConversion");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v38, "isEqual:", v39);

        if (!v40)
          goto LABEL_33;
      }
      -[TIKeyboardOutput handwritingStrokesToDelete](self, "handwritingStrokesToDelete");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handwritingStrokesToDelete");
      v42 = objc_claimAutoreleasedReturnValue();
      if (v41 == (void *)v42)
      {

      }
      else
      {
        v43 = (void *)v42;
        -[TIKeyboardOutput handwritingStrokesToDelete](self, "handwritingStrokesToDelete");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handwritingStrokesToDelete");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v44, "isEqual:", v45);

        if (!v46)
          goto LABEL_33;
      }
      v47 = -[TIKeyboardOutput shouldSendCurrentLocation](self, "shouldSendCurrentLocation");
      if (v47 == objc_msgSend(v5, "shouldSendCurrentLocation"))
      {
        -[TIKeyboardOutput customInfo](self, "customInfo");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "customInfo");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48 == v49)
        {
          v51 = -[TIKeyboardOutput producedByDeleteInput](self, "producedByDeleteInput");
          v12 = v51 ^ objc_msgSend(v5, "producedByDeleteInput") ^ 1;
          goto LABEL_34;
        }
      }
    }
LABEL_33:
    LOBYTE(v12) = 0;
LABEL_34:

    goto LABEL_35;
  }
  LOBYTE(v12) = 0;
LABEL_35:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  -[TIKeyboardOutput acceptedCandidate](self, "acceptedCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[TIKeyboardOutput textToCommit](self, "textToCommit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + 257 * v4;

  v7 = 257 * (257 * v6 + -[TIKeyboardOutput positionOffset](self, "positionOffset"));
  v8 = 257 * (v7 + -[TIKeyboardOutput deletionCount](self, "deletionCount"));
  -[TIKeyboardOutput insertionText](self, "insertionText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 + objc_msgSend(v9, "hash");

  v11 = 257 * (257 * v10 + -[TIKeyboardOutput forwardDeletionCount](self, "forwardDeletionCount"));
  -[TIKeyboardOutput insertionTextAfterSelection](self, "insertionTextAfterSelection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash") + v11;

  -[TIKeyboardOutput shortcutConversion](self, "shortcutConversion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash") + 257 * v13;

  -[TIKeyboardOutput handwritingStrokesToDelete](self, "handwritingStrokesToDelete");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash") + 257 * v15;

  -[TIKeyboardOutput customInfo](self, "customInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash") + 257 * v17;

  return 257 * v19 + -[TIKeyboardOutput producedByDeleteInput](self, "producedByDeleteInput");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardOutput acceptedCandidate](self, "acceptedCandidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TIKeyboardOutput acceptedCandidate](self, "acceptedCandidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; acceptedCandidate = %@"), v9);

  }
  -[TIKeyboardOutput textToCommit](self, "textToCommit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TIKeyboardOutput textToCommit](self, "textToCommit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; textToCommit = %@"), v11);

  }
  if (-[TIKeyboardOutput unmarkIfNecessary](self, "unmarkIfNecessary"))
    objc_msgSend(v6, "appendString:", CFSTR("; unmarkIfNecessary = YES"));
  if (-[TIKeyboardOutput positionOffset](self, "positionOffset"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; positionOffset = %d"),
      -[TIKeyboardOutput positionOffset](self, "positionOffset"));
  if (-[TIKeyboardOutput deletionCount](self, "deletionCount"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; delete %u"), -[TIKeyboardOutput deletionCount](self, "deletionCount"));
  -[TIKeyboardOutput insertionText](self, "insertionText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TIKeyboardOutput insertionText](self, "insertionText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; insert %@"), v13);

  }
  if (-[TIKeyboardOutput forwardDeletionCount](self, "forwardDeletionCount"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; delete forward %u"),
      -[TIKeyboardOutput forwardDeletionCount](self, "forwardDeletionCount"));
  -[TIKeyboardOutput insertionTextAfterSelection](self, "insertionTextAfterSelection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TIKeyboardOutput insertionTextAfterSelection](self, "insertionTextAfterSelection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; insert %@ (after selection)"), v15);

  }
  -[TIKeyboardOutput shortcutConversion](self, "shortcutConversion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[TIKeyboardOutput shortcutConversion](self, "shortcutConversion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "candidate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; shortcutConversion = %@"), v18);

  }
  -[TIKeyboardOutput handwritingStrokesToDelete](self, "handwritingStrokesToDelete");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[TIKeyboardOutput handwritingStrokesToDelete](self, "handwritingStrokesToDelete");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; handwritingStrokesToDelete = %@"), v20);

  }
  if (-[TIKeyboardOutput shouldSendCurrentLocation](self, "shouldSendCurrentLocation"))
    objc_msgSend(v6, "appendString:", CFSTR("; shouldSendCurrentLocation = YES"));
  -[TIKeyboardOutput customInfo](self, "customInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[TIKeyboardOutput customInfo](self, "customInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; secureCandidateInfo = %@"), v22);

  }
  if (-[TIKeyboardOutput producedByDeleteInput](self, "producedByDeleteInput"))
    objc_msgSend(v6, "appendString:", CFSTR("; producedByDeleteInput = YES"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void)insertText:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  -[TIKeyboardOutput insertionText](self, "insertionText");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (id)v5;
  else
    v7 = v4;
  -[TIKeyboardOutput setInsertionText:](self, "setInsertionText:", v7);

}

- (void)deleteBackward:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[TIKeyboardOutput insertionText](self, "insertionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  for (; a3 && v6; --a3)
  {
    -[TIKeyboardOutput insertionText](self, "insertionText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "_rangeOfBackwardDeletionClusterAtIndex:", v6 - 1);

  }
  if (v6)
  {
    -[TIKeyboardOutput insertionText](self, "insertionText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringToIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardOutput setInsertionText:](self, "setInsertionText:", v9);

  }
  else
  {
    -[TIKeyboardOutput setInsertionText:](self, "setInsertionText:", 0);
  }
  self->_deletionCount += a3;
}

- (void)deleteBackward
{
  -[TIKeyboardOutput deleteBackward:](self, "deleteBackward:", 1);
}

- (void)insertTextAfterSelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TIKeyboardOutput insertionTextAfterSelection](self, "insertionTextAfterSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TIKeyboardOutput insertionTextAfterSelection](self, "insertionTextAfterSelection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardOutput setInsertionTextAfterSelection:](self, "setInsertionTextAfterSelection:", v6);

  }
  else
  {
    -[TIKeyboardOutput setInsertionTextAfterSelection:](self, "setInsertionTextAfterSelection:", v7);
  }

}

- (void)deleteForward:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  -[TIKeyboardOutput insertionTextAfterSelection](self, "insertionTextAfterSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  v7 = 0;
  v8 = v6 != 0;
  if (a3 && v6)
  {
    v7 = 0;
    do
    {
      -[TIKeyboardOutput insertionTextAfterSelection](self, "insertionTextAfterSelection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "rangeOfComposedCharacterSequenceAtIndex:", v7);
      v12 = v11;

      v7 = v10 + v12;
      v8 = v7 < v6;
      --a3;
    }
    while (a3 && v7 < v6);
  }
  if (v8)
  {
    -[TIKeyboardOutput insertionTextAfterSelection](self, "insertionTextAfterSelection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "substringFromIndex:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardOutput setInsertionTextAfterSelection:](self, "setInsertionTextAfterSelection:", v14);

  }
  else
  {
    -[TIKeyboardOutput setInsertionTextAfterSelection:](self, "setInsertionTextAfterSelection:", 0);
  }
  self->_forwardDeletionCount += a3;
}

- (void)deleteForward
{
  -[TIKeyboardOutput deleteForward:](self, "deleteForward:", 1);
}

- (TIKeyboardCandidate)acceptedCandidate
{
  return self->_acceptedCandidate;
}

- (void)setAcceptedCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedCandidate, a3);
}

- (NSString)textToCommit
{
  return self->_textToCommit;
}

- (void)setTextToCommit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)unmarkIfNecessary
{
  return self->_unmarkIfNecessary;
}

- (void)setUnmarkIfNecessary:(BOOL)a3
{
  self->_unmarkIfNecessary = a3;
}

- (int64_t)positionOffset
{
  return self->_positionOffset;
}

- (void)setPositionOffset:(int64_t)a3
{
  self->_positionOffset = a3;
}

- (unint64_t)deletionCount
{
  return self->_deletionCount;
}

- (void)setDeletionCount:(unint64_t)a3
{
  self->_deletionCount = a3;
}

- (NSString)insertionText
{
  return self->_insertionText;
}

- (void)setInsertionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)forwardDeletionCount
{
  return self->_forwardDeletionCount;
}

- (void)setForwardDeletionCount:(unint64_t)a3
{
  self->_forwardDeletionCount = a3;
}

- (NSString)insertionTextAfterSelection
{
  return self->_insertionTextAfterSelection;
}

- (void)setInsertionTextAfterSelection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (TIKeyboardCandidate)shortcutConversion
{
  return self->_shortcutConversion;
}

- (void)setShortcutConversion:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutConversion, a3);
}

- (NSIndexSet)handwritingStrokesToDelete
{
  return self->_handwritingStrokesToDelete;
}

- (void)setHandwritingStrokesToDelete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)shouldSendCurrentLocation
{
  return self->_shouldSendCurrentLocation;
}

- (void)setShouldSendCurrentLocation:(BOOL)a3
{
  self->_shouldSendCurrentLocation = a3;
}

- (NSMutableDictionary)customInfo
{
  return self->_customInfo;
}

- (void)setCustomInfo:(id)a3
{
  objc_storeStrong((id *)&self->_customInfo, a3);
}

- (BOOL)producedByDeleteInput
{
  return self->_producedByDeleteInput;
}

- (void)setProducedByDeleteInput:(BOOL)a3
{
  self->_producedByDeleteInput = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customInfo, 0);
  objc_storeStrong((id *)&self->_handwritingStrokesToDelete, 0);
  objc_storeStrong((id *)&self->_shortcutConversion, 0);
  objc_storeStrong((id *)&self->_insertionTextAfterSelection, 0);
  objc_storeStrong((id *)&self->_insertionText, 0);
  objc_storeStrong((id *)&self->_textToCommit, 0);
  objc_storeStrong((id *)&self->_acceptedCandidate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
