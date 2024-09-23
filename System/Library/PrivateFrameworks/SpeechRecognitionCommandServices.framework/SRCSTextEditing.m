@implementation SRCSTextEditing

- (void)selectCurrentCharacter
{
  void *v3;
  void *v4;
  id v5;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markerRangeForEnumerationType:desiredBlock:count:options:", 2, 1, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SRCSTextEditing provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelectionToTextMarkerRange:", v5);

  }
}

- (void)selectPreviousCharacterWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 2, 2, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v7);

  }
}

- (void)selectNextCharacterWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 2, 0, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v7);

  }
}

- (void)selectCurrentWord
{
  void *v3;
  void *v4;
  id v5;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 1, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SRCSTextEditing provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelectionToTextMarkerRange:", v5);

  }
}

- (void)selectPreviousWordWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 2, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v7);

  }
}

- (void)selectNextWordWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 0, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v7);

  }
}

- (void)selectCurrentSentence
{
  void *v3;
  void *v4;
  id v5;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 1, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SRCSTextEditing provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelectionToTextMarkerRange:", v5);

  }
}

- (void)selectNextSentenceWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 0, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v7);

  }
}

- (void)selectPreviousSentenceWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 2, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v7);

  }
}

- (void)selectCurrentParagraph
{
  void *v3;
  void *v4;
  id v5;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 1, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SRCSTextEditing provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelectionToTextMarkerRange:", v5);

  }
}

- (void)selectNextParagraphWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 0, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v7);

  }
}

- (void)selectPreviousParagraphWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 2, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v7);

  }
}

- (void)selectCurrentLine
{
  void *v3;
  void *v4;
  id v5;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markerRangeForEnumerationType:desiredBlock:count:options:", 0, 1, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SRCSTextEditing provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelectionToTextMarkerRange:", v5);

  }
}

- (void)selectNextLineWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 0, 0, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v7);

  }
}

- (void)selectPreviousLineWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 0, 2, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v7);

  }
}

- (void)extendSelectionToEnd
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

  -[SRCSTextEditing provider](self, "provider");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "textMarkerRangeClass");
  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionTextMarkerRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startMarker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPositionTextMarker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markerRangeWithStartMarker:endMarker:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelectionToTextMarkerRange:", v10);

}

- (void)extendSelectionToBeginning
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

  -[SRCSTextEditing provider](self, "provider");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "textMarkerRangeClass");
  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstPositionTextMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionTextMarkerRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endMarker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markerRangeWithStartMarker:endMarker:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelectionToTextMarkerRange:", v10);

}

- (void)extendSelectionForwardCharactersWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 2, 0, a3, 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    -[SRCSTextEditing provider](self, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectionTextMarkerRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startMarker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v13);

  }
}

- (void)extendSelectionBackwardCharactersWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 2, 2, a3, 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v14, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionTextMarkerRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v13);

  }
}

- (void)extendSelectionForwardWordsWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 0, a3, 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    -[SRCSTextEditing provider](self, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectionTextMarkerRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startMarker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v13);

  }
}

- (void)extendSelectionBackwardWordsWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 2, a3, 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v14, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionTextMarkerRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v13);

  }
}

- (void)extendSelectionForwardSentencesWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 0, a3, 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    -[SRCSTextEditing provider](self, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectionTextMarkerRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startMarker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v13);

  }
}

- (void)extendSelectionBackwardSentencesWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 2, a3, 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v14, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionTextMarkerRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v13);

  }
}

- (void)extendSelectionForwardParagraphsWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 0, a3, 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    -[SRCSTextEditing provider](self, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectionTextMarkerRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startMarker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v13);

  }
}

- (void)extendSelectionBackwardParagraphsWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 2, a3, 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v14, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionTextMarkerRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v13);

  }
}

- (void)extendSelectionForwardLinesWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 0, 0, a3, 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    -[SRCSTextEditing provider](self, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectionTextMarkerRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startMarker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v13);

  }
}

- (void)extendSelectionBackwardLinesWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 0, 2, a3, 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v14, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionTextMarkerRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v13);

  }
}

- (void)selectFromPhraseVariants:(id)a3 insertionString:(id)a4 commandIdentifer:(id)a5
{
  -[SRCSTextEditing selectFromPhraseVariants:insertionString:recognizedParameters:commandIdentifer:](self, "selectFromPhraseVariants:insertionString:recognizedParameters:commandIdentifer:", a3, a4, 0, a5);
}

- (void)selectFromPhraseVariants:(id)a3 insertionString:(id)a4 recognizedParameters:(id)a5 commandIdentifer:(id)a6
{
  -[SRCSTextEditing selectFromPhraseVariants:insertionString:range:recognizedParameters:commandIdentifer:](self, "selectFromPhraseVariants:insertionString:range:recognizedParameters:commandIdentifer:", a3, a4, 0, a5, a6);
}

- (id)_actOnStrings:(id)a3 range:(id)a4 ambiguityResolution:(id)a5 substringSearchGranularity:(int)a6 alwaysCallActionOnClosestMatch:(BOOL)a7 options:(id)a8 provider:(id)a9 actionBlock:(id)a10
{
  if (a4)
    objc_msgSend(a9, "actOnRange:options:actionBlock:", a4, a8, a10, *(_QWORD *)&a6, a7);
  else
    objc_msgSend(a9, "actOnStrings:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:actionBlock:", a3, a5, *(_QWORD *)&a6, a7, a8, a10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)selectFromPhraseVariants:(id)a3 insertionString:(id)a4 range:(id)a5 recognizedParameters:(id)a6 commandIdentifer:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  SRCSTextEditing *v42;
  _QWORD v43[4];
  id v44;
  SRCSTextEditing *v45;
  _QWORD v46[4];
  id v47;
  SRCSTextEditing *v48;
  _QWORD v49[4];
  id v50;
  SRCSTextEditing *v51;
  _QWORD v52[4];
  id v53;
  SRCSTextEditing *v54;
  _QWORD v55[4];
  id v56;
  SRCSTextEditing *v57;
  _QWORD v58[4];
  id v59;
  SRCSTextEditing *v60;
  _QWORD v61[4];
  id v62;
  SRCSTextEditing *v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  SRCSTextEditing *v68;
  id v69;
  _QWORD v70[4];
  id v71;
  SRCSTextEditing *v72;
  _QWORD v73[4];
  id v74;
  SRCSTextEditing *v75;
  id v76;
  _QWORD v77[4];
  id v78;
  SRCSTextEditing *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83;
  SRCSTextEditing *v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  void *v89;
  _QWORD v90[2];
  _QWORD v91[4];

  v91[2] = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v34 = a5;
  v13 = a6;
  v14 = a7;
  -[SRCSTextEditing _prunedStringsFromCandidateStrings:](self, "_prunedStringsFromCandidateStrings:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing _strippedPhraseStringsFromStrings:](self, "_strippedPhraseStringsFromStrings:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SRCSTextEditing provider](self, "provider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "searchGranularity");

  -[SRCSTextEditing provider](self, "provider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v13)
    objc_msgSend(v20, "setObject:forKey:", v13, CFSTR("RecognizedParameters"));
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.SelectPrevious")))
  {
    if (objc_msgSend(v19, "isNextPreviousResolverSpokenCommandEmojiBased"))
      v18 = 1;
    else
      v18 = v18;
    objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65ABD8);
    v22 = v12;
    if (objc_msgSend(v19, "isNextPreviousResolverSpokenCommandEmojiBased")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v19, "emojisMatchingTextInStrings:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 1;
    }
    else
    {
      v24 = 0;
      v23 = v16;
    }
    v87[0] = MEMORY[0x24BDAC760];
    v87[1] = 3221225472;
    v87[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke;
    v87[3] = &unk_24F652838;
    v88 = v19;
    -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v23, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestBeforeSelection"), v18, 0, v21, v88, v87);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v24)

    v28 = v88;
LABEL_28:
    v12 = v22;
    goto LABEL_29;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.SelectNext")))
  {
    if (objc_msgSend(v19, "isNextPreviousResolverSpokenCommandEmojiBased"))
      v18 = 1;
    else
      v18 = v18;
    objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65AC00);
    v22 = v12;
    if (objc_msgSend(v19, "isNextPreviousResolverSpokenCommandEmojiBased")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v19, "emojisMatchingTextInStrings:", v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 1;
    }
    else
    {
      v26 = 0;
      v25 = v16;
    }
    v85[0] = MEMORY[0x24BDAC760];
    v85[1] = 3221225472;
    v85[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_2;
    v85[3] = &unk_24F652838;
    v86 = v19;
    -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v25, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestAfterSelection"), v18, 0, v21, v86, v85);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v26)

    v28 = v86;
    goto LABEL_28;
  }
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("Text.ChangePhrase")))
  {
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.InsertAfterPhrase")))
    {
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65AC28);
      v77[0] = MEMORY[0x24BDAC760];
      v77[1] = 3221225472;
      v77[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_5;
      v77[3] = &unk_24F6528D8;
      v78 = v19;
      v79 = self;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v78, v77);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v78;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.InsertPhraseAfterPhrase")))
    {
      objc_msgSend(v19, "registerInsertedStringCategoryIdentifer:", kSRCSCommandParameterDictation2[0]);
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65AC50);
      v73[0] = MEMORY[0x24BDAC760];
      v73[1] = 3221225472;
      v73[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_7;
      v73[3] = &unk_24F652900;
      v74 = v19;
      v75 = self;
      v76 = v12;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v74, v73);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v28 = v74;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.InsertBeforePhrase")))
    {
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65AC78);
      v70[0] = MEMORY[0x24BDAC760];
      v70[1] = 3221225472;
      v70[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_9;
      v70[3] = &unk_24F6528D8;
      v71 = v19;
      v72 = self;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v71, v70);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v71;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.InsertPhraseBeforePhrase")))
    {
      objc_msgSend(v19, "registerInsertedStringCategoryIdentifer:", kSRCSCommandParameterDictation2[0]);
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65ACA0);
      v66[0] = MEMORY[0x24BDAC760];
      v66[1] = 3221225472;
      v66[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_11;
      v66[3] = &unk_24F652900;
      v67 = v19;
      v68 = self;
      v69 = v12;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v67, v66);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v28 = v67;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.DeletePhrase")))
    {
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65ACC8);
      v64[0] = MEMORY[0x24BDAC760];
      v64[1] = 3221225472;
      v64[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_13;
      v64[3] = &unk_24F652838;
      v65 = v19;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v65, v64);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v65;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.CapitalizePhrase")))
    {
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65ACF0);
      v61[0] = MEMORY[0x24BDAC760];
      v61[1] = 3221225472;
      v61[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_15;
      v61[3] = &unk_24F6528D8;
      v62 = v19;
      v63 = self;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v62, v61);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v62;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.LowercasePhrase")))
    {
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65AD18);
      v58[0] = MEMORY[0x24BDAC760];
      v58[1] = 3221225472;
      v58[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_17;
      v58[3] = &unk_24F6528D8;
      v59 = v19;
      v60 = self;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v59, v58);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v59;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.UppercasePhrase")))
    {
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65AD40);
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_19;
      v55[3] = &unk_24F6528D8;
      v56 = v19;
      v57 = self;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v56, v55);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v56;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.FormatItalicPhrase")))
    {
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65AD68);
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_21;
      v52[3] = &unk_24F6528D8;
      v53 = v19;
      v54 = self;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v53, v52);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v53;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.CorrectPhrase")))
    {
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65AD90);
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_23;
      v49[3] = &unk_24F6528D8;
      v50 = v19;
      v51 = self;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v50, v49);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v50;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.FormatBoldPhrase")))
    {
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65ADB8);
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_25;
      v46[3] = &unk_24F6528D8;
      v47 = v19;
      v48 = self;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v47, v46);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v47;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.FormatUnderlinePhrase")))
    {
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65ADE0);
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_27;
      v43[3] = &unk_24F6528D8;
      v44 = v19;
      v45 = self;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v44, v43);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v44;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("Text.PutDoubleQuotesAroundPhrase")) & 1) != 0
           || (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.PutDoubleCurlyQuotesAroundPhrase")) & 1) != 0
           || (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.PutSingleQuotesAroundPhrase")) & 1) != 0
           || (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.PutSingleCurlyQuotesAroundPhrase")) & 1) != 0
           || (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.PutParenthesesAroundPhrase")) & 1) != 0
           || (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.PutSquareBracketsAroundPhrase")) & 1) != 0
           || objc_msgSend(v14, "isEqualToString:", CFSTR("Text.PutCurlyBracesAroundPhrase")))
    {
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65AE08);
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_29;
      v39[3] = &unk_24F652900;
      v40 = v19;
      v41 = v14;
      v42 = self;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v40, v39);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v28 = v40;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Text.SelectEmojiWithPhrase")))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v19, "emojisMatchingTextInStrings:", v16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }
      if (objc_msgSend(v28, "count"))
      {
        objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65AE30);
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_31;
        v37[3] = &unk_24F652838;
        v38 = v19;
        -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v28, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), 1, 1, v21, v38, v37);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v27 = 0;
      }
    }
    else
    {
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v16, "objectAtIndex:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("\n\n"));

        if (v33)
        {
          -[SRCSTextEditing selectNextParagraphWithCount:](self, "selectNextParagraphWithCount:", 1);
          v27 = CFSTR("\n\n");
          goto LABEL_32;
        }
      }
      objc_msgSend(v21, "addEntriesFromDictionary:", &unk_24F65AE58);
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_32;
      v35[3] = &unk_24F652838;
      v36 = v19;
      -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 1, v21, v36, v35);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v36;
    }
LABEL_29:

    if (v27)
      goto LABEL_32;
    goto LABEL_30;
  }
  if (v12)
  {
    v90[0] = CFSTR("ActionIdentifier");
    v90[1] = CFSTR("ReplacementString");
    v91[0] = CFSTR("AXSelectTextActivityFindAndSelect");
    v91[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addEntriesFromDictionary:", v29);

    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_3;
    v80[3] = &unk_24F652888;
    v81 = v12;
    v82 = v19;
    v83 = v13;
    v84 = self;
    -[SRCSTextEditing _actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:](self, "_actOnStrings:range:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:provider:actionBlock:", v16, v34, CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"), v18, 0, v21, v82, v80);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v28 = v81;
    goto LABEL_29;
  }
LABEL_30:
  objc_msgSend(v16, "firstObject");
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v16, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleErrorIdentifier:withObjects:", CFSTR("ErrorMessage.TextNotFound"), v31);

    v27 = 0;
  }
LABEL_32:

}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", a2);
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", a2);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  uint64_t v24;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "length") && objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "registerInsertedStringCategoryIdentifer:", kSRCSCommandParameterDictation[0]);
    objc_msgSend(*(id *)(a1 + 40), "setSelectionToTextMarkerRange:", v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("SRCSClientDictationRecognizerModeIsSpelling"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v6, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uppercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", v10) & 1) == 0)
      {
        if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") < 2
          || (objc_msgSend(*(id *)(a1 + 32), "uppercaseString"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 32)),
              v12,
              (v13 & 1) == 0))
        {
          objc_msgSend(v6, "substringToIndex:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "substringToIndex:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          objc_msgSend(v7, "substringToIndex:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if ((v16 & 1) != 0)
            objc_msgSend(v17, "uppercaseString");
          else
            objc_msgSend(v17, "lowercaseString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "replaceCharactersInRange:withString:", 0, 1, v19);

        }
      }

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_4;
    block[3] = &unk_24F652860;
    v22 = *(id *)(a1 + 40);
    v23 = v7;
    v24 = *(_QWORD *)(a1 + 56);
    v20 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "delayAfterSelectionBeforeExecutingAction");
  return objc_msgSend(v1, "performSelector:withObject:afterDelay:", sel_insertString_, v2);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", v3);
  objc_msgSend(*(id *)(a1 + 40), "delayAfterSelectionBeforeExecutingAction");
  v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_6;
  v7[3] = &unk_24F6528B0;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v6 = v3;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], v7);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(v2, "textMarkerRangeClass");
  objc_msgSend(*(id *)(a1 + 40), "endMarker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endMarker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markerRangeWithStartMarker:endMarker:", v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectionToTextMarkerRange:", v5);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_7(id *a1, uint64_t a2)
{
  double v3;
  dispatch_time_t v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;
  id v9;

  objc_msgSend(a1[4], "setSelectionToTextMarkerRange:", a2);
  objc_msgSend(a1[5], "delayAfterSelectionBeforeExecutingAction");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_8;
  block[3] = &unk_24F652860;
  v6 = *((int8x16_t *)a1 + 2);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v9 = a1[6];
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_8(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "moveToEndOfSelection");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(*(id *)(a1 + 40), "shouldInsertInterWordSpaces"))
  {
    objc_msgSend(*(id *)(a1 + 40), "insertString:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@"), *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "insertString:", v3);

  }
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", v3);
  objc_msgSend(*(id *)(a1 + 40), "delayAfterSelectionBeforeExecutingAction");
  v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_10;
  v7[3] = &unk_24F6528B0;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v6 = v3;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], v7);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(v2, "textMarkerRangeClass");
  objc_msgSend(*(id *)(a1 + 40), "startMarker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "startMarker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markerRangeWithStartMarker:endMarker:", v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectionToTextMarkerRange:", v5);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_11(id *a1, uint64_t a2)
{
  double v3;
  dispatch_time_t v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;
  id v9;

  objc_msgSend(a1[4], "setSelectionToTextMarkerRange:", a2);
  objc_msgSend(a1[5], "delayAfterSelectionBeforeExecutingAction");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_12;
  block[3] = &unk_24F652860;
  v6 = *((int8x16_t *)a1 + 2);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v9 = a1[6];
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_12(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "moveToStartOfSelection");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(*(id *)(a1 + 40), "shouldInsertInterWordSpaces"))
  {
    objc_msgSend(*(id *)(a1 + 40), "insertString:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ "), *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "insertString:", v3);

  }
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", v3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_14;
  v5[3] = &unk_24F6528B0;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteTextAtTextMarkerRange:", *(_QWORD *)(a1 + 40));
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", a2);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_16;
  block[3] = &unk_24F652860;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  v12 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_16(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_capitalizedStringFromString:", *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "delayAfterSelectionBeforeExecutingAction");
  objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel_insertString_, v3);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", a2);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_18;
  block[3] = &unk_24F652860;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 40);
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_18(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lowercaseString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "delayAfterSelectionBeforeExecutingAction");
  objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel_insertString_, v3);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", a2);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_20;
  block[3] = &unk_24F652860;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 40);
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_20(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uppercaseString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "delayAfterSelectionBeforeExecutingAction");
  objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel_insertString_, v3);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_21(uint64_t a1, uint64_t a2)
{
  double v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", a2);
  objc_msgSend(*(id *)(a1 + 40), "delayAfterSelectionBeforeExecutingAction");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_22;
  block[3] = &unk_24F652928;
  v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);

}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "formatSelectionItalics");
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_23(uint64_t a1, uint64_t a2)
{
  double v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", a2);
  objc_msgSend(*(id *)(a1 + 40), "delayAfterSelectionBeforeExecutingAction");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_24;
  block[3] = &unk_24F652928;
  v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);

}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCorrectionRequestWithStrings:", 0);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_25(uint64_t a1, uint64_t a2)
{
  double v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", a2);
  objc_msgSend(*(id *)(a1 + 40), "delayAfterSelectionBeforeExecutingAction");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_26;
  block[3] = &unk_24F652928;
  v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);

}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "formatSelectionBold");
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_27(uint64_t a1, uint64_t a2)
{
  double v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", a2);
  objc_msgSend(*(id *)(a1 + 40), "delayAfterSelectionBeforeExecutingAction");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_28;
  block[3] = &unk_24F652928;
  v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);

}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "formatSelectionUnderline");
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", a2);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_30;
  v9[3] = &unk_24F652950;
  v10 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_30(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Text.PutDoubleQuotesAroundPhrase")))
  {
    v3 = *(void **)(a1 + 40);
    v2 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.StraightDoubleQuote.Opening"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    v6 = CFSTR("SurroundInPunctuation.StraightDoubleQuote.Closing");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Text.PutDoubleCurlyQuotesAroundPhrase")))
  {
    v3 = *(void **)(a1 + 40);
    v2 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.CurlyDoubleQuote.Opening"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    v6 = CFSTR("SurroundInPunctuation.CurlyDoubleQuote.Closing");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Text.PutSingleQuotesAroundPhrase")))
  {
    v3 = *(void **)(a1 + 40);
    v2 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.StraightSingleQuote.Opening"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    v6 = CFSTR("SurroundInPunctuation.StraightSingleQuote.Closing");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Text.PutSingleCurlyQuotesAroundPhrase")))
  {
    v3 = *(void **)(a1 + 40);
    v2 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.CurlySingleQuote.Opening"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    v6 = CFSTR("SurroundInPunctuation.CurlySingleQuote.Closing");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Text.PutParenthesesAroundPhrase")))
  {
    v3 = *(void **)(a1 + 40);
    v2 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.Parenthesis.Opening"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    v6 = CFSTR("SurroundInPunctuation.Parenthesis.Closing");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Text.PutSquareBracketsAroundPhrase")))
  {
    v3 = *(void **)(a1 + 40);
    v2 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.SquareBracket.Opening"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    v6 = CFSTR("SurroundInPunctuation.SquareBracket.Closing");
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Text.PutCurlyBracesAroundPhrase")))
      return;
    v3 = *(void **)(a1 + 40);
    v2 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.CurlyBrace.Opening"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    v6 = CFSTR("SurroundInPunctuation.CurlyBrace.Closing");
  }
  objc_msgSend(v5, "_localizedPunctuationStringForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stringBySurroundingString:withPrefixString:suffixString:", v4, v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "delayAfterSelectionBeforeExecutingAction");
  objc_msgSend(v3, "performSelector:withObject:afterDelay:", sel_insertString_, v8);

}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_31(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", a2);
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_32(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectionToTextMarkerRange:", a2);
}

- (id)_prunedStringsFromCandidateStrings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        +[SRCSTextEditing wordsFromString:](SRCSTextEditing, "wordsFromString:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "count")
          || +[SRCSTextEditing doesArrayOfWords:containArrayOfArrayWords:](SRCSTextEditing, "doesArrayOfWords:containArrayOfArrayWords:", v12, v5) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v5, "addObject:", v12);
          objc_msgSend(v4, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v4;
}

- (int64_t)_indexOfFirstPhraseMatchResultPairBeforeInsertion:(BOOL)a3 fromArray:(id)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL4 v21;
  id v22;

  v4 = a3;
  v22 = a4;
  v5 = objc_msgSend(v22, "count");
  if (v5 >= 2)
  {
    v6 = v5;
    v7 = 1;
    v21 = v4;
    do
    {
      v8 = v7 - 1;
      objc_msgSend(v22, "objectAtIndex:", v7 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("Context"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v4)
      {
        if (!objc_msgSend(v12, "isEqualToString:", CFSTR("Suffix")))
          goto LABEL_10;
        objc_msgSend(v10, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("Context"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Prefix"));

        v4 = v21;
        if ((v16 & 1) != 0)
          goto LABEL_14;
      }
      else
      {
        if (!objc_msgSend(v12, "isEqualToString:", CFSTR("Prefix")))
        {
LABEL_10:

          goto LABEL_11;
        }
        objc_msgSend(v10, "userInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", CFSTR("Context"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Suffix"));

        v4 = v21;
        if (v19)
        {
LABEL_14:

          goto LABEL_13;
        }
      }
LABEL_11:

      ++v7;
    }
    while (v6 != v7);
  }
  v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:

  return v8;
}

- (void)selectFromPhraseVariants:(id)a3 throughPhraseVariants:(id)a4 commandIdentifer:(id)a5
{
  -[SRCSTextEditing selectFromPhraseVariants:throughPhraseVariants:recognizedParameters:commandIdentifer:](self, "selectFromPhraseVariants:throughPhraseVariants:recognizedParameters:commandIdentifer:", a3, a4, 0, a5);
}

- (void)selectFromPhraseVariants:(id)a3 throughPhraseVariants:(id)a4 recognizedParameters:(id)a5 commandIdentifer:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  const __CFString *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int64_t v51;
  int64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  int64_t v65;
  int64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int64_t v75;
  void *v76;
  int64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  BOOL v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  __CFString *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  void *v124;
  _QWORD v125[4];
  id v126;
  id v127;
  id v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD v132[4];
  id v133;
  id v134;
  id v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD v139[4];
  id v140;
  id v141;
  id v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  _QWORD v146[4];
  id v147;
  id v148;
  id v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  _QWORD block[4];
  id v154;
  id v155;
  id v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _QWORD v176[2];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  uint64_t v181;

  v181 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v123 = a4;
  v11 = a5;
  v12 = a6;
  -[SRCSTextEditing provider](self, "provider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "searchGranularity");
  v115 = v13;
  objc_msgSend(v13, "selectionTextMarkerRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "nsRange");
  v18 = v17;

  v120 = v11;
  v118 = v12;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Text.SelectPrevious")) & 1) != 0)
  {
    v19 = CFSTR("AXSelectTextAmbiguityResolutionClosestBeforeSelection");
  }
  else
  {
    v20 = objc_msgSend(v12, "isEqualToString:", CFSTR("Text.SelectNext"));
    v16 += v18 >> (v20 ^ 1u);
    v19 = CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection");
    if (v20)
      v19 = CFSTR("AXSelectTextAmbiguityResolutionClosestAfterSelection");
  }
  v116 = (__CFString *)v19;
  -[SRCSTextEditing _strippedPhraseStringsFromStrings:](self, "_strippedPhraseStringsFromStrings:", v10);
  v21 = objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing orderedPhraseMatchesFromStrings:forwardDirection:referenceLocation:substringSearchGranularity:](self, "orderedPhraseMatchesFromStrings:forwardDirection:referenceLocation:substringSearchGranularity:", v21, 0, v16, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = (void *)v21;
  -[SRCSTextEditing orderedPhraseMatchesFromStrings:forwardDirection:referenceLocation:substringSearchGranularity:](self, "orderedPhraseMatchesFromStrings:forwardDirection:referenceLocation:substringSearchGranularity:", v21, 1, v16, v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = 0u;
  v173 = 0u;
  v174 = 0u;
  v175 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v172, v180, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v173;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v173 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v172 + 1) + 8 * i), "setUserInfo:", &unk_24F65AE80);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v172, v180, 16);
    }
    while (v26);
  }

  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  v29 = v23;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v168, v179, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v169;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v169 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v168 + 1) + 8 * j), "setUserInfo:", &unk_24F65AEA8);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v168, v179, 16);
    }
    while (v31);
  }
  v119 = v10;

  -[SRCSTextEditing _strippedPhraseStringsFromStrings:](self, "_strippedPhraseStringsFromStrings:", v123);
  v34 = objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing orderedPhraseMatchesFromStrings:forwardDirection:referenceLocation:substringSearchGranularity:](self, "orderedPhraseMatchesFromStrings:forwardDirection:referenceLocation:substringSearchGranularity:", v34, 0, v16, v14);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (void *)v34;
  -[SRCSTextEditing orderedPhraseMatchesFromStrings:forwardDirection:referenceLocation:substringSearchGranularity:](self, "orderedPhraseMatchesFromStrings:forwardDirection:referenceLocation:substringSearchGranularity:", v34, 1, v16, v14);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  v37 = v35;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v164, v178, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v165;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v165 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v164 + 1) + 8 * k), "setUserInfo:", &unk_24F65AED0);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v164, v178, 16);
    }
    while (v39);
  }

  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v42 = v36;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v160, v177, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v161;
    do
    {
      for (m = 0; m != v44; ++m)
      {
        if (*(_QWORD *)v161 != v45)
          objc_enumerationMutation(v42);
        objc_msgSend(*(id *)(*((_QWORD *)&v160 + 1) + 8 * m), "setUserInfo:", &unk_24F65AEF8);
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v160, v177, 16);
    }
    while (v44);
  }

  v47 = (void *)objc_opt_new();
  if (objc_msgSend(v24, "count") && objc_msgSend(v37, "count"))
  {
    objc_msgSend(v47, "addObjectsFromArray:", v24);
    objc_msgSend(v47, "addObjectsFromArray:", v37);
    objc_msgSend(v47, "sortUsingComparator:", &__block_literal_global);
  }
  v48 = (void *)objc_opt_new();
  v49 = v121;
  if (objc_msgSend(v29, "count") && objc_msgSend(v42, "count"))
  {
    objc_msgSend(v48, "addObjectsFromArray:", v29);
    objc_msgSend(v48, "addObjectsFromArray:", v42);
    objc_msgSend(v48, "sortUsingComparator:", &__block_literal_global_183);
  }
  v122 = v48;
  v50 = v124;
  v114 = v47;
  if (!-[__CFString isEqualToString:](v116, "isEqualToString:", CFSTR("AXSelectTextAmbiguityResolutionClosestBeforeSelection")))
  {
    if (-[__CFString isEqualToString:](v116, "isEqualToString:", CFSTR("AXSelectTextAmbiguityResolutionClosestAfterSelection")))
    {
      v65 = -[SRCSTextEditing _indexOfFirstPhraseMatchResultPairBeforeInsertion:fromArray:](self, "_indexOfFirstPhraseMatchResultPairBeforeInsertion:fromArray:", 0, v122);
      if (v65 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_74;
      v66 = v65;
      objc_msgSend(v122, "objectAtIndex:", v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "objectAtIndex:", v66 + 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "markerRange");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "nsRange");
      v72 = v71;

      v73 = objc_msgSend(v67, "location");
      v74 = v70 + v72 - objc_msgSend(v67, "location");
      v146[0] = MEMORY[0x24BDAC760];
      v146[1] = 3221225472;
      v146[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_4;
      v146[3] = &unk_24F6529D8;
      v147 = v115;
      v148 = v120;
      v149 = v67;
      v150 = v68;
      v151 = v73;
      v61 = v115;
      v49 = v121;
      v152 = v74;
      v62 = v68;
      v63 = v67;
      dispatch_async(MEMORY[0x24BDAC9B8], v146);

      v64 = v147;
    }
    else
    {
      v75 = -[SRCSTextEditing _indexOfFirstPhraseMatchResultPairBeforeInsertion:fromArray:](self, "_indexOfFirstPhraseMatchResultPairBeforeInsertion:fromArray:", 1, v47);
      if (v75 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v117 = -1;
      }
      else
      {
        objc_msgSend(v47, "objectAtIndex:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = v16 - objc_msgSend(v76, "location");

      }
      v77 = -[SRCSTextEditing _indexOfFirstPhraseMatchResultPairBeforeInsertion:fromArray:](self, "_indexOfFirstPhraseMatchResultPairBeforeInsertion:fromArray:", 0, v122);
      if (v77 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v78 = -1;
      }
      else
      {
        objc_msgSend(v122, "objectAtIndex:", v77);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v79, "location") - v16;

      }
      v50 = v124;
      if (objc_msgSend(v24, "count") && objc_msgSend(v42, "count"))
      {
        objc_msgSend(v24, "firstObject");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "userInfo");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "objectForKey:", CFSTR("Context"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v80, "isEqualToString:", CFSTR("Prefix")) & 1) != 0)
        {
          objc_msgSend(v42, "firstObject");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "userInfo");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "objectForKey:", CFSTR("Context"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend(v81, "isEqualToString:", CFSTR("Suffix"));

          v50 = v124;
          if (v110)
          {
            objc_msgSend(v24, "firstObject");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = v16 - objc_msgSend(v82, "location");

            v50 = v124;
            if ((v83 & 0x8000000000000000) == 0)
            {
              if (v117 == -1
                || (v83 < v117 ? (v84 = v117 <= -1) : (v84 = 1),
                    !v84 || v78 == -1 || (v78 & 0x8000000000000000) == 0 && v83 < v78))
              {
                objc_msgSend(v24, "firstObject");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "firstObject");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "markerRange");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v88 = objc_msgSend(v87, "nsRange");
                v90 = v89;

                v91 = objc_msgSend(v85, "location");
                v92 = v88 + v90 - objc_msgSend(v85, "location");
                v139[0] = MEMORY[0x24BDAC760];
                v139[1] = 3221225472;
                v139[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_5;
                v139[3] = &unk_24F6529D8;
                v140 = v115;
                v141 = v120;
                v142 = v85;
                v143 = v86;
                v144 = v91;
                v61 = v115;
                v145 = v92;
                v62 = v86;
                v63 = v85;
                dispatch_async(MEMORY[0x24BDAC9B8], v139);

                v64 = v140;
                v49 = v121;
                goto LABEL_75;
              }
            }
          }
        }
        else
        {

        }
      }
      if ((v117 & 0x8000000000000000) == 0 && (v78 == -1 || (v78 & 0x8000000000000000) == 0 && v117 < v78))
      {
        v47 = v114;
        objc_msgSend(v114, "objectAtIndex:", v75);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "objectAtIndex:", v75 + 1);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "markerRange");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend(v95, "nsRange");
        v98 = v97;

        v99 = objc_msgSend(v94, "location");
        v100 = v96 + v98 - objc_msgSend(v94, "location");
        v132[0] = MEMORY[0x24BDAC760];
        v132[1] = 3221225472;
        v132[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_6;
        v132[3] = &unk_24F6529D8;
        v133 = v115;
        v134 = v120;
        v135 = v94;
        v136 = v93;
        v137 = v99;
        v61 = v115;
        v138 = v100;
        v62 = v93;
        v63 = v94;
        dispatch_async(MEMORY[0x24BDAC9B8], v132);

        v64 = v133;
        v49 = v121;
        goto LABEL_76;
      }
      v49 = v121;
      if (v78 < 0)
        goto LABEL_74;
      objc_msgSend(v122, "objectAtIndex:", v77);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "objectAtIndex:", v77 + 1);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "markerRange");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = objc_msgSend(v103, "nsRange");
      v106 = v105;

      v107 = objc_msgSend(v101, "location");
      v108 = v104 + v106 - objc_msgSend(v101, "location");
      v125[0] = MEMORY[0x24BDAC760];
      v125[1] = 3221225472;
      v125[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_7;
      v125[3] = &unk_24F6529D8;
      v126 = v115;
      v127 = v120;
      v128 = v101;
      v129 = v102;
      v130 = v107;
      v61 = v115;
      v49 = v121;
      v131 = v108;
      v62 = v102;
      v63 = v101;
      dispatch_async(MEMORY[0x24BDAC9B8], v125);

      v64 = v126;
    }
LABEL_75:
    v47 = v114;
    goto LABEL_76;
  }
  v51 = -[SRCSTextEditing _indexOfFirstPhraseMatchResultPairBeforeInsertion:fromArray:](self, "_indexOfFirstPhraseMatchResultPairBeforeInsertion:fromArray:", 1, v47);
  if (v51 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_74:
    objc_msgSend(v49, "firstObject");
    v63 = (id)objc_claimAutoreleasedReturnValue();
    v176[0] = v63;
    objc_msgSend(v50, "firstObject");
    v62 = (id)objc_claimAutoreleasedReturnValue();
    v176[1] = v62;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v176, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v115;
    objc_msgSend(v115, "handleErrorIdentifier:withObjects:", CFSTR("ErrorMessage.TextThroughTextNotFound"), v64);
    goto LABEL_75;
  }
  v52 = v51;
  objc_msgSend(v47, "objectAtIndex:", v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectAtIndex:", v52 + 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "markerRange");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "nsRange");
  v58 = v57;

  v59 = objc_msgSend(v54, "location");
  v60 = v56 + v58 - objc_msgSend(v54, "location");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_3;
  block[3] = &unk_24F6529D8;
  v61 = v115;
  v154 = v115;
  v155 = v120;
  v156 = v54;
  v157 = v53;
  v158 = v59;
  v159 = v60;
  v49 = v121;
  v62 = v53;
  v63 = v54;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  v64 = v154;
LABEL_76:

}

BOOL __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "location");
  v6 = objc_msgSend(v4, "location");

  return v5 < v6;
}

BOOL __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "location");
  v6 = objc_msgSend(v4, "location");

  return v5 > v6;
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "matchedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v10[0] = kSRCSCommandParameterDictation[0];
      objc_msgSend(*(id *)(a1 + 48), "matchedString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      v10[1] = kSRCSCommandParameterDictation2[0];
      objc_msgSend(*(id *)(a1 + 56), "matchedString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v3, v7);

    }
    else
    {
      objc_msgSend(v2, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v3, 0);
    }

  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_msgSend(v8, "textMarkerRangeClass"), "markerRangeWithNSRange:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectionToTextMarkerRange:", v9);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "matchedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v10[0] = kSRCSCommandParameterDictation[0];
      objc_msgSend(*(id *)(a1 + 48), "matchedString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      v10[1] = kSRCSCommandParameterDictation2[0];
      objc_msgSend(*(id *)(a1 + 56), "matchedString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v3, v7);

    }
    else
    {
      objc_msgSend(v2, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v3, 0);
    }

  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_msgSend(v8, "textMarkerRangeClass"), "markerRangeWithNSRange:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectionToTextMarkerRange:", v9);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "matchedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v10[0] = kSRCSCommandParameterDictation[0];
      objc_msgSend(*(id *)(a1 + 48), "matchedString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      v10[1] = kSRCSCommandParameterDictation2[0];
      objc_msgSend(*(id *)(a1 + 56), "matchedString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v3, v7);

    }
    else
    {
      objc_msgSend(v2, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v3, 0);
    }

  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_msgSend(v8, "textMarkerRangeClass"), "markerRangeWithNSRange:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectionToTextMarkerRange:", v9);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "matchedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v10[0] = kSRCSCommandParameterDictation[0];
      objc_msgSend(*(id *)(a1 + 48), "matchedString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      v10[1] = kSRCSCommandParameterDictation2[0];
      objc_msgSend(*(id *)(a1 + 56), "matchedString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v3, v7);

    }
    else
    {
      objc_msgSend(v2, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v3, 0);
    }

  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_msgSend(v8, "textMarkerRangeClass"), "markerRangeWithNSRange:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectionToTextMarkerRange:", v9);

}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "matchedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v10[0] = kSRCSCommandParameterDictation[0];
      objc_msgSend(*(id *)(a1 + 48), "matchedString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      v10[1] = kSRCSCommandParameterDictation2[0];
      objc_msgSend(*(id *)(a1 + 56), "matchedString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v3, v7);

    }
    else
    {
      objc_msgSend(v2, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v3, 0);
    }

  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_msgSend(v8, "textMarkerRangeClass"), "markerRangeWithNSRange:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectionToTextMarkerRange:", v9);

}

- (void)selectFromRange:(id)a3 insertionString:(id)a4 commandIdentifier:(id)a5 recognizedParamaters:(id)a6
{
  if (a3)
    -[SRCSTextEditing selectFromPhraseVariants:insertionString:range:recognizedParameters:commandIdentifer:](self, "selectFromPhraseVariants:insertionString:range:recognizedParameters:commandIdentifer:", MEMORY[0x24BDBD1A8], a4, a3, a6, a5);
}

- (void)selectAll
{
  void *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  id *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  void *v11;
  _QWORD block[4];
  void *v13;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionTextMarkerRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForTextMarkerRange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    -[SRCSTextEditing moveToStartOfTextArea](self, "moveToStartOfTextArea");
    v6 = dispatch_time(0, 250000000);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __39__SRCSTextEditing_Selection__selectAll__block_invoke_2;
    v10[3] = &unk_24F652928;
    v7 = &v11;
    v11 = v3;
    v8 = v3;
    dispatch_after(v6, MEMORY[0x24BDAC9B8], v10);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__SRCSTextEditing_Selection__selectAll__block_invoke;
    block[3] = &unk_24F652928;
    v7 = &v13;
    v13 = v3;
    v9 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __39__SRCSTextEditing_Selection__selectAll__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performTextSelectAll");
}

uint64_t __39__SRCSTextEditing_Selection__selectAll__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performTextSelectAll");
}

- (void)selectPreviousTextInsertion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionTextMarkerRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v4))
  {
    v5 = v4;
  }
  else
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textMarkerRangeFromPreviousTextInsertion");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (-[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v8))
    {
      -[SRCSTextEditing provider](self, "provider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSelectionToTextMarkerRange:", v8);

    }
    v5 = v8;
  }

}

- (void)surroundSelectionWithPunctuationForCommandIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  dispatch_time_t v11;
  id *v12;
  id *v13;
  NSObject *v14;
  _QWORD *v15;
  _QWORD block[4];
  _QWORD v17[2];
  id v18;
  _QWORD v19[4];
  _QWORD v20[2];
  id v21;
  _QWORD v22[4];
  _QWORD v23[2];
  id v24;
  _QWORD v25[4];
  _QWORD v26[2];
  id v27;
  _QWORD v28[4];
  _QWORD v29[2];
  id v30;
  _QWORD v31[4];
  _QWORD v32[2];
  id v33;
  _QWORD v34[4];
  _QWORD v35[2];
  id v36;

  v4 = a3;
  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionTextMarkerRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompletionDeterminedManually:", 1);
  if (-[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v6))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "textMarkerRangeFromPreviousTextInsertion");
    v8 = objc_claimAutoreleasedReturnValue();

    if (-[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v8))
    {
      objc_msgSend(v5, "setSelectionToTextMarkerRange:", v8);
      -[SRCSTextEditing delayAfterSelectionBeforeExecutingAction](self, "delayAfterSelectionBeforeExecutingAction");
      v7 = (uint64_t)(v9 * 1000000000.0);
    }
    else
    {
      v7 = 0;
    }
    v6 = (void *)v8;
  }
  objc_msgSend(v5, "stringForTextMarkerRange:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text.PutDoubleQuotesAroundSelection")))
    {
      v11 = dispatch_time(0, v7);
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke;
      v34[3] = &unk_24F652860;
      v12 = (id *)v35;
      v35[0] = v5;
      v35[1] = self;
      v13 = &v36;
      v36 = v10;
      v14 = MEMORY[0x24BDAC9B8];
      v15 = v34;
LABEL_22:
      dispatch_after(v11, v14, v15);

      goto LABEL_23;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text.PutDoubleCurlyQuotesAroundSelection")))
    {
      v11 = dispatch_time(0, v7);
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_2;
      v31[3] = &unk_24F652860;
      v12 = (id *)v32;
      v32[0] = v5;
      v32[1] = self;
      v13 = &v33;
      v33 = v10;
      v14 = MEMORY[0x24BDAC9B8];
      v15 = v31;
      goto LABEL_22;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text.PutSingleQuotesAroundSelection")))
    {
      v11 = dispatch_time(0, v7);
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_3;
      v28[3] = &unk_24F652860;
      v12 = (id *)v29;
      v29[0] = v5;
      v29[1] = self;
      v13 = &v30;
      v30 = v10;
      v14 = MEMORY[0x24BDAC9B8];
      v15 = v28;
      goto LABEL_22;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text.PutSingleCurlyQuotesAroundSelection")))
    {
      v11 = dispatch_time(0, v7);
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_4;
      v25[3] = &unk_24F652860;
      v12 = (id *)v26;
      v26[0] = v5;
      v26[1] = self;
      v13 = &v27;
      v27 = v10;
      v14 = MEMORY[0x24BDAC9B8];
      v15 = v25;
      goto LABEL_22;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text.PutParenthesesAroundSelection")))
    {
      v11 = dispatch_time(0, v7);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_5;
      v22[3] = &unk_24F652860;
      v12 = (id *)v23;
      v23[0] = v5;
      v23[1] = self;
      v13 = &v24;
      v24 = v10;
      v14 = MEMORY[0x24BDAC9B8];
      v15 = v22;
      goto LABEL_22;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text.PutSquareBracketsAroundSelection")))
    {
      v11 = dispatch_time(0, v7);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_6;
      v19[3] = &unk_24F652860;
      v12 = (id *)v20;
      v20[0] = v5;
      v20[1] = self;
      v13 = &v21;
      v21 = v10;
      v14 = MEMORY[0x24BDAC9B8];
      v15 = v19;
      goto LABEL_22;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text.PutCurlyBracesAroundSelection")))
    {
      v11 = dispatch_time(0, v7);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_7;
      block[3] = &unk_24F652860;
      v12 = (id *)v17;
      v17[0] = v5;
      v17[1] = self;
      v13 = &v18;
      v18 = v10;
      v14 = MEMORY[0x24BDAC9B8];
      v15 = block;
      goto LABEL_22;
    }
  }
LABEL_23:

}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "targetApplicationBundleIdentifier"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.microsoft.")),
        v2,
        v3))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.StraightDoubleQuote.Opening"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertString:", v5);

    objc_msgSend(*(id *)(a1 + 32), "insertString:", *(_QWORD *)(a1 + 48));
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.StraightDoubleQuote.Closing"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertString:", v7);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v9, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.StraightDoubleQuote.Opening"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.StraightDoubleQuote.Closing"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_stringBySurroundingString:withPrefixString:suffixString:", v10, v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertString:", v12);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.CurlyDoubleQuote.Opening"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.CurlyDoubleQuote.Closing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stringBySurroundingString:withPrefixString:suffixString:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertString:", v7);

  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "targetApplicationBundleIdentifier"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.microsoft.")),
        v2,
        v3))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.StraightSingleQuote.Opening"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertString:", v5);

    objc_msgSend(*(id *)(a1 + 32), "insertString:", *(_QWORD *)(a1 + 48));
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.StraightSingleQuote.Closing"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertString:", v7);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v9, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.StraightSingleQuote.Opening"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.StraightSingleQuote.Closing"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_stringBySurroundingString:withPrefixString:suffixString:", v10, v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertString:", v12);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.CurlySingleQuote.Opening"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.CurlySingleQuote.Closing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stringBySurroundingString:withPrefixString:suffixString:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertString:", v7);

  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.Parenthesis.Opening"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.Parenthesis.Closing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stringBySurroundingString:withPrefixString:suffixString:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertString:", v7);

  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.SquareBracket.Opening"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.SquareBracket.Closing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stringBySurroundingString:withPrefixString:suffixString:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertString:", v7);

  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.CurlyBrace.Opening"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_localizedPunctuationStringForIdentifier:", CFSTR("SurroundInPunctuation.CurlyBrace.Closing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stringBySurroundingString:withPrefixString:suffixString:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertString:", v7);

  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

- (void)applyFormatWithCommandIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  dispatch_time_t v11;
  id *v12;
  void *v13;
  dispatch_time_t v14;
  dispatch_time_t v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD block[4];
  _QWORD v32[2];
  id v33;

  v4 = a3;
  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionTextMarkerRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompletionDeterminedManually:", 1);
  if (-[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v6))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "textMarkerRangeFromPreviousTextInsertion");
    v8 = objc_claimAutoreleasedReturnValue();

    if (-[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v8))
    {
      objc_msgSend(v5, "setSelectionToTextMarkerRange:", v8);
      -[SRCSTextEditing delayAfterSelectionBeforeExecutingAction](self, "delayAfterSelectionBeforeExecutingAction");
      v7 = (uint64_t)(v9 * 1000000000.0);
    }
    else
    {
      v7 = 0;
    }
    v6 = (void *)v8;
  }
  objc_msgSend(v5, "stringForTextMarkerRange:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text.CapitalizeSelection")))
    {
      v11 = dispatch_time(0, v7);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke;
      block[3] = &unk_24F652860;
      v12 = (id *)v32;
      v32[0] = v5;
      v32[1] = self;
      v33 = v10;
      dispatch_after(v11, MEMORY[0x24BDAC9B8], block);
      v13 = v33;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text.LowercaseSelection")))
    {
      v14 = dispatch_time(0, v7);
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_2;
      v28[3] = &unk_24F6528B0;
      v12 = &v29;
      v29 = v5;
      v30 = v10;
      dispatch_after(v14, MEMORY[0x24BDAC9B8], v28);
      v13 = v30;
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Text.UppercaseSelection")))
      {
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text.FormatBold")))
        {
          v16 = dispatch_time(0, v7);
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_4;
          v23[3] = &unk_24F652928;
          v12 = &v24;
          v24 = v5;
          v17 = MEMORY[0x24BDAC9B8];
          v18 = v23;
        }
        else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text.FormatItalic")))
        {
          v16 = dispatch_time(0, v7);
          v21[0] = MEMORY[0x24BDAC760];
          v21[1] = 3221225472;
          v21[2] = __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_5;
          v21[3] = &unk_24F652928;
          v12 = &v22;
          v22 = v5;
          v17 = MEMORY[0x24BDAC9B8];
          v18 = v21;
        }
        else
        {
          if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Text.FormatUnderline")))
            goto LABEL_16;
          v16 = dispatch_time(0, v7);
          v19[0] = MEMORY[0x24BDAC760];
          v19[1] = 3221225472;
          v19[2] = __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_6;
          v19[3] = &unk_24F652928;
          v12 = &v20;
          v20 = v5;
          v17 = MEMORY[0x24BDAC9B8];
          v18 = v19;
        }
        dispatch_after(v16, v17, v18);
        goto LABEL_15;
      }
      v15 = dispatch_time(0, v7);
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_3;
      v25[3] = &unk_24F6528B0;
      v12 = &v26;
      v26 = v5;
      v27 = v10;
      dispatch_after(v15, MEMORY[0x24BDAC9B8], v25);
      v13 = v27;
    }

LABEL_15:
  }
LABEL_16:

}

uint64_t __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_capitalizedStringFromString:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertString:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

uint64_t __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertString:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

uint64_t __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertString:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

uint64_t __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "formatSelectionBold");
  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

uint64_t __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "formatSelectionItalics");
  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

uint64_t __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "formatSelectionUnderline");
  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

- (void)pasteboardPaste
{
  id v2;

  -[SRCSTextEditing provider](self, "provider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performTextPaste");

}

- (void)pasteboardCopy
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionTextMarkerRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v4))
  {
    objc_msgSend(v3, "performTextCopy");
    v5 = v4;
  }
  else
  {
    objc_msgSend(v3, "textMarkerRangeFromPreviousTextInsertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v5))
    {
      objc_msgSend(v3, "setCompletionDeterminedManually:", 1);
      objc_msgSend(v3, "setSelectionToTextMarkerRange:", v5);
      -[SRCSTextEditing delayAfterSelectionBeforeExecutingAction](self, "delayAfterSelectionBeforeExecutingAction");
      v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __44__SRCSTextEditing_Selection__pasteboardCopy__block_invoke;
      block[3] = &unk_24F652928;
      v9 = v3;
      dispatch_after(v7, MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      objc_msgSend(v3, "performTextCopy");
    }
  }

}

uint64_t __44__SRCSTextEditing_Selection__pasteboardCopy__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "performTextCopy");
  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

- (void)pasteboardCut
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionTextMarkerRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v4))
  {
    objc_msgSend(v3, "performTextCut");
    v5 = v4;
  }
  else
  {
    objc_msgSend(v3, "textMarkerRangeFromPreviousTextInsertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v5))
    {
      objc_msgSend(v3, "setCompletionDeterminedManually:", 1);
      objc_msgSend(v3, "setSelectionToTextMarkerRange:", v5);
      -[SRCSTextEditing delayAfterSelectionBeforeExecutingAction](self, "delayAfterSelectionBeforeExecutingAction");
      v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __43__SRCSTextEditing_Selection__pasteboardCut__block_invoke;
      block[3] = &unk_24F652928;
      v9 = v3;
      dispatch_after(v7, MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      objc_msgSend(v3, "performTextCut");
    }
  }

}

uint64_t __43__SRCSTextEditing_Selection__pasteboardCut__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "performTextCut");
  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

- (void)correctSelection
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionTextMarkerRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v4))
  {
    objc_msgSend(v3, "handleCorrectionRequestWithStrings:", 0);
    v5 = v4;
  }
  else
  {
    objc_msgSend(v3, "textMarkerRangeFromPreviousTextInsertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v5))
    {
      objc_msgSend(v3, "setCompletionDeterminedManually:", 1);
      objc_msgSend(v3, "setSelectionToTextMarkerRange:", v5);
      -[SRCSTextEditing delayAfterSelectionBeforeExecutingAction](self, "delayAfterSelectionBeforeExecutingAction");
      v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__SRCSTextEditing_Selection__correctSelection__block_invoke;
      block[3] = &unk_24F652928;
      v9 = v3;
      dispatch_after(v7, MEMORY[0x24BDAC9B8], block);

    }
  }

}

uint64_t __46__SRCSTextEditing_Selection__correctSelection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "nBestListFromPreviousTextInsertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleCorrectionRequestWithStrings:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

- (id)_strippedPhraseStringsFromStrings:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v9 = objc_msgSend(&unk_24F65AF20, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (!v9)
          goto LABEL_17;
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v10; ++j)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(&unk_24F65AF20);
            v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
            if (objc_msgSend(v8, "hasPrefix:", v14))
              v11 = objc_msgSend(v14, "length");
          }
          v10 = objc_msgSend(&unk_24F65AF20, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v10);
        if (v11)
        {
          objc_msgSend(v8, "substringFromIndex:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v16);

        }
        else
        {
LABEL_17:
          objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v15);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

  return v20;
}

- (id)_capitalizedStringFromString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocalizations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "length");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59__SRCSTextEditing_Selection___capitalizedStringFromString___block_invoke;
  v16[3] = &unk_24F652A00;
  v17 = v8;
  v11 = v9;
  v18 = v11;
  v12 = v8;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 3, v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

void __59__SRCSTextEditing_Selection___capitalizedStringFromString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  objc_msgSend(a2, "capitalizedStringWithLocale:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", a3, a4, v7);

}

- (id)_stringBySurroundingString:(id)a3 withPrefixString:(id)a4 suffixString:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  __CFString *v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v7;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v11);
  v14 = v13;

  if (v12)
    v15 = 1;
  else
    v15 = v14 == 0;
  if (v15 || v14 >= objc_msgSend(v10, "length"))
  {
    v16 = &stru_24F657348;
    v17 = v10;
  }
  else
  {
    objc_msgSend(v10, "substringWithRange:", v12, v14);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringFromIndex:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@%@"), v16, v8, v17, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_insertComponentsIndividuallyBySurroundingString:(id)a3 withPrefixString:(id)a4 suffixString:(id)a5 retainedProvider:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  __CFString *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  id v25;

  v10 = a3;
  v11 = a6;
  v25 = v10;
  v12 = (void *)MEMORY[0x24BDD14A8];
  v13 = a5;
  v14 = a4;
  objc_msgSend(v12, "whitespaceAndNewlineCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v25, "rangeOfCharacterFromSet:", v15);
  v18 = v17;

  if (v16)
    v19 = 1;
  else
    v19 = v18 == 0;
  if (v19 || v18 >= objc_msgSend(v25, "length"))
  {
    v20 = &stru_24F657348;
    v21 = v25;
  }
  else
  {
    objc_msgSend(v25, "substringWithRange:", v16, v18);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "substringFromIndex:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[__CFString length](v20, "length"))
  {
    -[SRCSTextEditing delayAfterSelectionBeforeExecutingAction](self, "delayAfterSelectionBeforeExecutingAction");
    objc_msgSend(v11, "performSelector:withObject:afterDelay:", sel_insertString_, v20);
  }
  -[SRCSTextEditing delayAfterSelectionBeforeExecutingAction](self, "delayAfterSelectionBeforeExecutingAction");
  objc_msgSend(v11, "performSelector:withObject:afterDelay:", sel_insertString_, v14, v22 + 0.01);

  -[SRCSTextEditing delayAfterSelectionBeforeExecutingAction](self, "delayAfterSelectionBeforeExecutingAction");
  objc_msgSend(v11, "performSelector:withObject:afterDelay:", sel_insertString_, v21, v23 + 0.02);
  -[SRCSTextEditing delayAfterSelectionBeforeExecutingAction](self, "delayAfterSelectionBeforeExecutingAction");
  objc_msgSend(v11, "performSelector:withObject:afterDelay:", sel_insertString_, v13, v24 + 0.03);

}

- (id)_localizedPunctuationStringForIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_24F657348, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SRCSTextEditing)init
{
  SRCSTextEditing *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SRCSTextEditing;
  result = -[SRCSTextEditing init](&v3, sel_init);
  if (result)
    result->_delayAfterSelectionBeforeExecutingAction = 0.125;
  return result;
}

- (unint64_t)characterLengthOfTextMarkerRange:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;

  v4 = a3;
  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startMarker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "lengthFromMarker:toMarker:", v8, v9);

  }
  else
  {
    objc_msgSend(v4, "nsRange");
    v10 = v11;
  }

  return v10;
}

- (SRCSTextEditingProviderProtocol)provider
{
  return (SRCSTextEditingProviderProtocol *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (double)delayAfterSelectionBeforeExecutingAction
{
  return self->_delayAfterSelectionBeforeExecutingAction;
}

- (void)setDelayAfterSelectionBeforeExecutingAction:(double)a3
{
  self->_delayAfterSelectionBeforeExecutingAction = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
}

- (void)moveToStartOfTextArea
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SRCSTextEditing provider](self, "provider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "textMarkerRangeClass");
  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstPositionTextMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstPositionTextMarker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markerRangeWithStartMarker:endMarker:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelectionToTextMarkerRange:", v9);

}

- (void)moveToEndOfTextArea
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SRCSTextEditing provider](self, "provider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "textMarkerRangeClass");
  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPositionTextMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPositionTextMarker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markerRangeWithStartMarker:endMarker:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelectionToTextMarkerRange:", v9);

}

- (void)moveToStartOfSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionTextMarkerRange");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SRCSTextEditing provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "textMarkerRangeClass");
    objc_msgSend(v10, "startMarker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startMarker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "markerRangeWithStartMarker:endMarker:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelectionToTextMarkerRange:", v9);

  }
}

- (void)moveToEndOfSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionTextMarkerRange");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SRCSTextEditing provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "textMarkerRangeClass");
    objc_msgSend(v10, "endMarker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endMarker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "markerRangeWithStartMarker:endMarker:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelectionToTextMarkerRange:", v9);

  }
}

- (void)moveToStartOfWordWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 1, a3, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)moveToEndOfWordWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 1, a3, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "endMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)moveToStartOfSentenceWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 1, a3, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)moveToEndOfSentenceWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 1, a3, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "endMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)moveToStartOfParagraphWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 1, a3, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)moveToEndOfParagraphWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 1, a3, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "endMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)moveToStartOfLineWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 0, 1, a3, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)moveToEndOfLineWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 0, 1, a3, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "endMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)moveForwardCharactersWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 > 0)
    v7 = a3 + 1;
  else
    v7 = 2;
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 2, 0, v7, 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[SRCSTextEditing provider](self, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[SRCSTextEditing provider](self, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "textMarkerRangeClass");
    objc_msgSend(v18, "startMarker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "markerRangeWithStartMarker:endMarker:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelectionToTextMarkerRange:", v13);
    v14 = v8;
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v8, "selectionTextMarkerRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "nsRange");
  if (v15)
  {
    -[SRCSTextEditing provider](self, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v11, "textMarkerRangeClass");
    objc_msgSend(v14, "endMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endMarker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "markerRangeWithStartMarker:endMarker:", v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSelectionToTextMarkerRange:", v17);

    goto LABEL_8;
  }
LABEL_9:

}

- (void)moveBackwardCharactersWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 2, 2, a3, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[SRCSTextEditing provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v16, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);
    v12 = v6;
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v6, "selectionTextMarkerRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v12, "nsRange") && v13)
  {
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v9, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markerRangeWithStartMarker:endMarker:", v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectionToTextMarkerRange:", v15);

    goto LABEL_6;
  }
LABEL_7:

}

- (void)moveForwardWordsWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 0, 1, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "startMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionTextMarkerRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endMarker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  -[SRCSTextEditing provider](self, "provider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 0, a3 + v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "markerRangeWithStartMarker:endMarker:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSelectionToTextMarkerRange:", v18);

  }
}

- (void)moveBackwardWordsWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 2, a3, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)moveForwardSentencesWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 0, 1, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "startMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionTextMarkerRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endMarker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  -[SRCSTextEditing provider](self, "provider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 0, a3 + v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "markerRangeWithStartMarker:endMarker:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSelectionToTextMarkerRange:", v18);

  }
}

- (void)moveBackwardSentencesWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 2, a3, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)moveForwardParagraphsWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 0, 1, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "startMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionTextMarkerRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endMarker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  -[SRCSTextEditing provider](self, "provider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 0, a3 + v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "markerRangeWithStartMarker:endMarker:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSelectionToTextMarkerRange:", v18);

  }
}

- (void)moveBackwardParagraphsWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 2, a3, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)moveForwardLinesWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 0, 0, a3, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)moveBackwardLinesWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 0, 2, a3, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "textMarkerRangeClass");
    objc_msgSend(v12, "startMarker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markerRangeWithStartMarker:endMarker:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectionToTextMarkerRange:", v11);

  }
}

- (void)deleteCurrentCharacter
{
  void *v3;
  void *v4;
  id v5;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markerRangeForEnumerationType:desiredBlock:count:options:", 2, 1, 0, 8);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SRCSTextEditing provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteTextAtTextMarkerRange:", v5);

  }
}

- (void)deletePreviousCharacterWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 2, 2, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteTextAtTextMarkerRange:", v7);

  }
}

- (void)deleteNextCharacterWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 2, 0, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteTextAtTextMarkerRange:", v7);

  }
}

- (void)deleteCurrentWord
{
  void *v3;
  void *v4;
  id v5;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 1, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SRCSTextEditing provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteTextAtTextMarkerRange:", v5);

  }
}

- (void)deletePreviousWordWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 2, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteTextAtTextMarkerRange:", v7);

  }
}

- (void)deleteNextWordWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 3, 0, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteTextAtTextMarkerRange:", v7);

  }
}

- (void)deleteCurrentSentence
{
  void *v3;
  void *v4;
  id v5;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 1, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SRCSTextEditing provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteTextAtTextMarkerRange:", v5);

  }
}

- (void)deleteNextSentenceWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 0, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteTextAtTextMarkerRange:", v7);

  }
}

- (void)deletePreviousSentenceWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 4, 2, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteTextAtTextMarkerRange:", v7);

  }
}

- (void)deleteCurrentParagraph
{
  void *v3;
  void *v4;
  id v5;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 1, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SRCSTextEditing provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteTextAtTextMarkerRange:", v5);

  }
}

- (void)deleteNextParagraphWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 0, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteTextAtTextMarkerRange:", v7);

  }
}

- (void)deletePreviousParagraphWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 1, 2, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteTextAtTextMarkerRange:", v7);

  }
}

- (void)deleteCurrentLine
{
  void *v3;
  void *v4;
  id v5;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markerRangeForEnumerationType:desiredBlock:count:options:", 0, 1, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SRCSTextEditing provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteTextAtTextMarkerRange:", v5);

  }
}

- (void)deleteNextLineWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 0, 0, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteTextAtTextMarkerRange:", v7);

  }
}

- (void)deletePreviousLineWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerRangeForEnumerationType:desiredBlock:count:options:", 0, 2, a3, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SRCSTextEditing provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteTextAtTextMarkerRange:", v7);

  }
}

- (void)deleteAll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "textMarkerRangeClass");
  -[SRCSTextEditing provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstPositionTextMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPositionTextMarker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markerRangeWithStartMarker:endMarker:", v6, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SRCSTextEditing provider](self, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deleteTextAtTextMarkerRange:", v10);

  }
}

- (void)deleteSelection
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;

  -[SRCSTextEditing provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionTextMarkerRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v4);
  -[SRCSTextEditing provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "deleteText");
    v10 = v4;
  }
  else
  {
    objc_msgSend(v6, "textMarkerRangeFromPreviousTextInsertion");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v8 = -[SRCSTextEditing characterLengthOfTextMarkerRange:](self, "characterLengthOfTextMarkerRange:", v10);
    -[SRCSTextEditing provider](self, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v8)
      objc_msgSend(v9, "deleteTextAtTextMarkerRange:", v10);
    else
      objc_msgSend(v9, "deleteText");
  }

}

- (_NSRange)rangeOfStrings:(id)a3 referenceRange:(_NSRange)a4 ambiguityResolution:(id)a5 substringSearchGranularity:(int)a6 foundStringRef:(id *)a7
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  int v13;
  _BOOL4 v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSUInteger v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSUInteger v57;
  NSUInteger v58;
  void *v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  NSUInteger v63;
  uint64_t v64;
  id obj;
  SRCSTextEditing *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v73;
  NSUInteger v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  v81 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  if (!objc_msgSend(v11, "count"))
    goto LABEL_79;
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"));
  v14 = length > 1;
  if ((v13 & v14) != 0)
    v15 = 0;
  else
    v15 = length;
  if ((v13 & v14) != 0)
    v16 = length >> 1;
  else
    v16 = 0;
  v17 = v16 + location;
  -[SRCSTextEditing provider](self, "provider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastPositionTextMarker");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "index");

  v67 = self;
  v74 = v15;
  if (v20 >> 5 > 0xC34)
  {
    v17 += v15 >> 1;
    -[SRCSTextEditing provider](self, "provider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v21, "textMarkerRangeClass");
    if (v17 >> 4 > 0xC34)
      v30 = v17 - 50000;
    else
      v30 = 0;
    objc_msgSend(v29, "markerRangeWithNSRange:", v30, 100000);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SRCSTextEditing provider](self, "provider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "textMarkerRangeClass");
    -[SRCSTextEditing provider](self, "provider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstPositionTextMarker");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSTextEditing provider](self, "provider");
    v25 = v11;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lastPositionTextMarker");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "markerRangeWithStartMarker:endMarker:", v24, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v25;
    self = v67;

    v15 = v74;
  }

  v61 = objc_msgSend(v28, "nsRange");
  -[SRCSTextEditing provider](self, "provider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringForTextMarkerRange:", v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v32, "length"))
  {

LABEL_79:
    v55 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_83;
  }
  v59 = v28;
  v60 = v11;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v11;
  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  if (!v75)
  {
    v70 = 0x7FFFFFFFFFFFFFFFLL;
    v35 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_81;
  }
  v71 = v17 - v61;
  v73 = *(_QWORD *)v77;
  v62 = v17 - v61 + v15;
  v63 = v17 + (v15 >> 1);
  v68 = 0x7FFFFFFFFFFFFFFFLL;
  v69 = 0x7FFFFFFFFFFFFFFFLL;
  v33 = 0x7FFFFFFFFFFFFFFFLL;
  v64 = 0x7FFFFFFFFFFFFFFFLL;
  v34 = 0x7FFFFFFFFFFFFFFFLL;
  v70 = 0x7FFFFFFFFFFFFFFFLL;
  v35 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v75; ++i)
    {
      if (*(_QWORD *)v77 != v73)
        objc_enumerationMutation(obj);
      v37 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
      v38 = objc_msgSend(v37, "length");
      if (v15
        || (v39 = v38,
            !objc_msgSend(v12, "isEqualToString:", CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection"))))
      {
        v42 = 0x7FFFFFFFFFFFFFFFLL;
        v43 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        if (v71 >= v39)
          v40 = v71 - v39;
        else
          v40 = 0;
        if (v40 + 2 * v39 >= objc_msgSend(v32, "length"))
          v41 = objc_msgSend(v32, "length") - v40;
        else
          v41 = 2 * v39;
        if (a6)
          v51 = objc_msgSend(v32, "rangeOfString:options:range:", v37, 1, v40, v41);
        else
          v51 = -[SRCSTextEditing _rangeOfWordBasedSearchString:inString:withRange:forwardSearchDirection:](v67, "_rangeOfWordBasedSearchString:inString:withRange:forwardSearchDirection:", v37, v32, v40, v41, 1);
        v42 = v51;
        v43 = v52;
      }
      if (v42 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_63;
      v42 = v33;
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection")) & 1) != 0
        || objc_msgSend(v12, "isEqualToString:", CFSTR("AXSelectTextAmbiguityResolutionClosestBeforeSelection")))
      {
        if (a6)
          v44 = objc_msgSend(v32, "rangeOfString:options:range:", v37, 5, 0, v71);
        else
          v44 = -[SRCSTextEditing _rangeOfWordBasedSearchString:inString:withRange:forwardSearchDirection:](v67, "_rangeOfWordBasedSearchString:inString:withRange:forwardSearchDirection:", v37, v32, 0, v71, 0);
        v34 = v44;
        v68 = v45;
      }
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection")) & 1) != 0
        || objc_msgSend(v12, "isEqualToString:", CFSTR("AXSelectTextAmbiguityResolutionClosestAfterSelection")))
      {
        v46 = objc_msgSend(v32, "length");
        objc_msgSend(v32, "length");
        if (v62 <= v46)
          v47 = v62;
        else
          v47 = v71;
        v64 = v47;
        if (a6)
          v48 = objc_msgSend(v32, "rangeOfString:options:range:", v37, 1);
        else
          v48 = -[SRCSTextEditing _rangeOfWordBasedSearchString:inString:withRange:forwardSearchDirection:](v67, "_rangeOfWordBasedSearchString:inString:withRange:forwardSearchDirection:", v37, v32);
        v42 = v48;
        v69 = v49;
      }
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection")))
      {
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("AXSelectTextAmbiguityResolutionClosestBeforeSelection")) & 1) != 0)
        {
          v33 = v42;
          v43 = v68;
          v42 = v34;
          v50 = v34;
        }
        else
        {
          v43 = v69;
          v33 = v42;
          v50 = v34;
          if (!objc_msgSend(v12, "isEqualToString:", CFSTR("AXSelectTextAmbiguityResolutionClosestAfterSelection")))goto LABEL_75;
        }
LABEL_51:
        if (v42 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_71;
        goto LABEL_64;
      }
      v50 = 0x7FFFFFFFFFFFFFFFLL;
      v43 = v69;
      v33 = v42;
      if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_51;
      if (v42 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v64 - (v34 + v68) >= (unint64_t)(v42 - v64))
          v43 = v69;
        else
          v43 = v68;
        if (v64 - (v34 + v68) < (unint64_t)(v42 - v64))
          v42 = v34;
LABEL_63:
        v50 = v34;
        goto LABEL_64;
      }
      v50 = v34;
      v33 = 0x7FFFFFFFFFFFFFFFLL;
      v42 = v34;
      v43 = v68;
LABEL_64:
      if (v35 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v53 = v42 - v63 + (v43 >> 1);
        if (v53 < 0)
          v53 = -v53;
        v54 = v35 - v63 + (v70 >> 1);
        if (v54 < 0)
          v54 = -v54;
        if (v53 >= (unint64_t)v54 || -[SRCSTextEditing _range:includesRange:](v67, "_range:includesRange:", v35))
        {
LABEL_71:
          v34 = v50;
          goto LABEL_75;
        }
      }
      if (a7)
        *a7 = objc_retainAutorelease(v37);
      v34 = v50;
      v70 = v43;
      v35 = v42;
LABEL_75:
      v15 = v74;
    }
    v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  }
  while (v75);
LABEL_81:

  if (v35 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v60;
    v55 = v70;
LABEL_83:
    v56 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v11 = v60;
    v56 = v35 + v61;
    v55 = v70;
  }

  v57 = v56;
  v58 = v55;
  result.length = v58;
  result.location = v57;
  return result;
}

- (id)actOnRange:(id)a3 options:(id)a4 actionBlock:(id)a5
{
  void (**v7)(id, id, void *);
  id v8;
  void *v9;
  void *v10;

  v7 = (void (**)(id, id, void *))a5;
  v8 = a3;
  -[SRCSTextEditing provider](self, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringForTextMarkerRange:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v8, v10);
  return v10;
}

- (id)actOnStrings:(id)a3 ambiguityResolution:(id)a4 substringSearchGranularity:(int)a5 alwaysCallActionOnClosestMatch:(BOOL)a6 options:(id)a7 actionBlock:(id)a8
{
  _BOOL4 v10;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, void *, id);
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char v38;
  void (**v39)(id, void *, id);
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  char v83;
  void *v84;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  char v96;
  void *v97;
  void *v98;
  unint64_t v99;
  void *v100;
  uint64_t v101;
  unint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  _BOOL4 v106;
  uint64_t v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  __CFString *v113;
  id v114;
  __CFString *v115;
  void *v116;
  __CFString *v117;
  id v118;
  __CFString *v119;
  id v120;
  __CFString *v121;
  id v122;
  __CFString *v123;
  _QWORD v124[3];

  v10 = a6;
  v11 = *(_QWORD *)&a5;
  v124[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = (void (**)(id, void *, id))a8;
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("AXSelectTextAmbiguityResolutionClosestToSelection")))
  {
    -[SRCSTextEditing provider](self, "provider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isTextDisambiguationSupported");

    if (v19)
    {
      v108 = v16;
      -[SRCSTextEditing visiblePhraseMatchesFromStrings:substringSearchGranularity:](self, "visiblePhraseMatchesFromStrings:substringSearchGranularity:", v14, v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v20, "count"))
      {
        -[SRCSTextEditing provider](self, "provider");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "selectionTextMarkerRange");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "nsRange");
        v112 = 0;
        v49 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](self, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v14, v47, v48, v15, v11, &v112);
        v51 = v50;
        v24 = v112;

        if (v49 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = v108;
LABEL_22:

          goto LABEL_23;
        }
        v107 = v49;
        -[SRCSTextEditing provider](self, "provider");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_opt_respondsToSelector();

        v16 = v108;
        if ((v71 & 1) != 0)
        {
          -[SRCSTextEditing provider](self, "provider");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "objectForKey:", CFSTR("RecognizedParameters"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "length"))
          {
            v123 = kSRCSCommandParameterDictation[0];
            v124[0] = v24;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v124, &v123, 1);
            v105 = v51;
            v74 = v73;
            v75 = v72;
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v74, v76);

            v72 = v75;
            v73 = v74;
            v51 = v105;
          }
          else
          {
            objc_msgSend(v72, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v73, 0);
          }

        }
        -[SRCSTextEditing provider](self, "provider");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_msgSend(v22, "textMarkerRangeClass"), "markerRangeWithNSRange:", v107, v51);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v17[2](v17, v90, v24);

LABEL_21:
        goto LABEL_22;
      }
      if (objc_msgSend(v20, "count") == 1)
      {
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "markerRange");
        v22 = (id)objc_claimAutoreleasedReturnValue();

        -[SRCSTextEditing provider](self, "provider");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringForTextMarkerRange:", v22);
        v24 = (id)objc_claimAutoreleasedReturnValue();

        -[SRCSTextEditing provider](self, "provider");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_opt_respondsToSelector();

        if ((v26 & 1) != 0)
        {
          -[SRCSTextEditing provider](self, "provider");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "objectForKey:", CFSTR("RecognizedParameters"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "length"))
          {
            v121 = kSRCSCommandParameterDictation[0];
            v122 = v24;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v28, v29);

          }
          else
          {
            objc_msgSend(v27, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v28, 0);
          }

        }
        v17[2](v17, v22, v24);
        v16 = v108;
        goto LABEL_21;
      }
      v106 = v10;
      -[SRCSTextEditing provider](self, "provider");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "markerRange");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stringForTextMarkerRange:", v54);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      -[SRCSTextEditing provider](self, "provider");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "selectionTextMarkerRange");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "nsRange");
      v111 = 0;
      v59 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](self, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v14, v57, v58, v15, v11, &v111);
      v104 = v20;
      v61 = v60;
      v22 = v111;

      -[SRCSTextEditing provider](self, "provider");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v61;
      LODWORD(v56) = objc_msgSend(v62, "isVisibleTextRange:", v59, v61);

      if ((_DWORD)v56)
      {
        v99 = v59;
        -[SRCSTextEditing provider](self, "provider");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_opt_respondsToSelector();

        v16 = v108;
        v20 = v104;
        if ((v64 & 1) != 0)
        {
          -[SRCSTextEditing provider](self, "provider");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "objectForKey:", CFSTR("RecognizedParameters"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "length"))
          {
            v119 = kSRCSCommandParameterDictation[0];
            v120 = v22;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
            v98 = v65;
            v67 = v66;
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v67, v68);

            v66 = v67;
            v65 = v98;
          }
          else
          {
            objc_msgSend(v65, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v66, 0);
          }

        }
        if (v106)
        {
          -[SRCSTextEditing provider](self, "provider");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_msgSend(v91, "textMarkerRangeClass"), "markerRangeWithNSRange:", v99, v101);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v17[2](v17, v92, v22);

        }
        if (!objc_msgSend(v22, "length"))
          goto LABEL_57;
        v93 = v24;
        v24 = v22;
      }
      else
      {
        v20 = v104;
        objc_msgSend(v104, "firstObject");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "markerRange");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = objc_msgSend(v78, "nsRange");

        -[SRCSTextEditing provider](self, "provider");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (v59 <= v102)
        {
          v86 = objc_opt_respondsToSelector();

          v16 = v108;
          if ((v86 & 1) != 0)
          {
            -[SRCSTextEditing provider](self, "provider");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "objectForKey:", CFSTR("RecognizedParameters"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "length"))
            {
              v117 = kSRCSCommandParameterDictation[0];
              v118 = v24;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v88, v89);

            }
            else
            {
              objc_msgSend(v87, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v88, 0);
            }

            v16 = v108;
          }
          if (!v106)
            goto LABEL_57;
          objc_msgSend(v104, "firstObject");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "markerRange");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v17[2](v17, v94, v24);
        }
        else
        {
          objc_msgSend(v104, "lastObject");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "markerRange");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "stringForTextMarkerRange:", v81);
          v103 = (void *)objc_claimAutoreleasedReturnValue();

          -[SRCSTextEditing provider](self, "provider");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_opt_respondsToSelector();

          v16 = v108;
          if ((v83 & 1) != 0)
          {
            -[SRCSTextEditing provider](self, "provider");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "objectForKey:", CFSTR("RecognizedParameters"));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v103, "length"))
            {
              v115 = kSRCSCommandParameterDictation[0];
              v116 = v103;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v84, v85);

            }
            else
            {
              objc_msgSend(v100, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v84, 0);
            }

          }
          if (!v106)
          {
            v24 = v103;
            goto LABEL_57;
          }
          objc_msgSend(v104, "lastObject");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "markerRange");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v103;
          v17[2](v17, v94, v103);
        }

      }
LABEL_57:
      -[SRCSTextEditing provider](self, "provider");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_opt_respondsToSelector();

      if ((v96 & 1) != 0)
      {
        -[SRCSTextEditing provider](self, "provider");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "handleTextDisambiguationWithPhraseMatchResults:actionBlock:", v20, v17);

      }
      goto LABEL_21;
    }
  }
  -[SRCSTextEditing provider](self, "provider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "selectionTextMarkerRange");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "nsRange");
  v110 = 0;
  v34 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](self, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v14, v32, v33, v15, v11, &v110);
  v36 = v35;
  v24 = v110;

  if (v34 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SRCSTextEditing provider](self, "provider");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_opt_respondsToSelector();

    if ((v38 & 1) != 0)
    {
      v109 = v15;
      v39 = v17;
      v40 = v14;
      -[SRCSTextEditing provider](self, "provider");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v16;
      objc_msgSend(v16, "objectForKey:", CFSTR("RecognizedParameters"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "length"))
      {
        v113 = kSRCSCommandParameterDictation[0];
        v114 = v24;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v43, v44);

      }
      else
      {
        objc_msgSend(v41, "handleSearchResultsWithRecognizedCommandParameters:variantOverrides:", v43, 0);
      }

      v16 = v42;
      v14 = v40;
      v17 = v39;
      v15 = v109;
    }
    -[SRCSTextEditing provider](self, "provider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(v20, "textMarkerRangeClass"), "markerRangeWithNSRange:", v34, v36);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v22, v24);
    goto LABEL_21;
  }
LABEL_23:

  return v24;
}

- (id)visiblePhraseMatchesFromStrings:(id)a3 substringSearchGranularity:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id i;
  void *v26;
  int v27;
  SRCSPhraseMatchResult *v28;
  void *v29;
  void *v30;
  SRCSPhraseMatchResult *v31;
  uint64_t v32;
  void *v34;
  id v35;
  unsigned int v36;
  void *v37;
  SRCSTextEditing *v38;
  unint64_t v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  _QWORD v44[2];

  v4 = *(_QWORD *)&a4;
  v44[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v35 = (id)objc_opt_new();
  v38 = self;
  -[SRCSTextEditing provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPositionTextMarker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "index");

  v9 = v4;
  v34 = v6;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v6);
  v36 = v9;
  if (objc_msgSend(v10, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v10, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v14 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](v38, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v13, 0, 0, CFSTR("AXSelectTextAmbiguityResolutionClosestAfterSelection"), v9, &v42);
      v40 = v42;

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v10, "removeObjectAtIndex:", v11);
      }
      else
      {
        v37 = v12;
        objc_msgSend(v12, "lowercaseString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[SRCSTextEditing wordsFromString:](SRCSTextEditing, "wordsFromString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = v11 + 1;
        if (v11 + 1 < objc_msgSend(v10, "count"))
        {
          v17 = v11 + 1;
          do
          {
            objc_msgSend(v10, "objectAtIndex:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[SRCSTextEditing wordsFromString:](SRCSTextEditing, "wordsFromString:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v19;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = +[SRCSTextEditing doesArrayOfWords:containArrayOfArrayWords:](SRCSTextEditing, "doesArrayOfWords:containArrayOfArrayWords:", v16, v20);

            if (v21 == 0x7FFFFFFFFFFFFFFFLL)
              ++v17;
            else
              objc_msgSend(v10, "removeObjectAtIndex:", v17);

          }
          while (v17 < objc_msgSend(v10, "count"));
        }

        v9 = v36;
        v11 = v39;
        v12 = v37;
      }

    }
    while (v11 < objc_msgSend(v10, "count"));
  }
  v41 = 0;
  v22 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](v38, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v10, 0, 0, CFSTR("AXSelectTextAmbiguityResolutionClosestAfterSelection"), v9, &v41);
  v24 = v23;
  for (i = v41; v22 != 0x7FFFFFFFFFFFFFFFLL; i = v41)
  {
    -[SRCSTextEditing provider](v38, "provider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isVisibleTextRange:", v22, v24);

    if (v27)
    {
      v28 = [SRCSPhraseMatchResult alloc];
      -[SRCSTextEditing provider](v38, "provider");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_msgSend(v29, "textMarkerRangeClass"), "markerRangeWithNSRange:", v22, v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SRCSPhraseMatchResult initWithMarkerRange:matchedString:userInfo:](v28, "initWithMarkerRange:matchedString:userInfo:", v30, i, 0);
      objc_msgSend(v35, "addObject:", v31);

      v9 = v36;
    }

    v41 = 0;
    v22 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](v38, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v10, v22 + v24, 0, CFSTR("AXSelectTextAmbiguityResolutionClosestAfterSelection"), v9, &v41);
    v24 = v32;
  }

  return v35;
}

- (id)orderedPhraseMatchesFromStrings:(id)a3 forwardDirection:(BOOL)a4 referenceLocation:(int64_t)a5 substringSearchGranularity:(int)a6
{
  uint64_t v6;
  _BOOL8 v8;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  SRCSPhraseMatchResult *v17;
  void *v18;
  SRCSTextEditing *v19;
  const __CFString *v20;
  id v21;
  _BOOL8 v22;
  void *v23;
  SRCSPhraseMatchResult *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v29;
  id v30;
  id v31;

  v6 = *(_QWORD *)&a6;
  v8 = a4;
  v10 = a3;
  v11 = objc_opt_new();
  if (v8)
    v12 = CFSTR("AXSelectTextAmbiguityResolutionClosestAfterSelection");
  else
    v12 = CFSTR("AXSelectTextAmbiguityResolutionClosestBeforeSelection");
  v31 = 0;
  v13 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](self, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v10, a5, 0, v12, v6, &v31);
  v15 = v14;
  v16 = v31;
  v30 = (id)v11;
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = v6;
    do
    {
      v17 = [SRCSPhraseMatchResult alloc];
      -[SRCSTextEditing provider](self, "provider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_msgSend(v18, "textMarkerRangeClass"), "markerRangeWithNSRange:", v13, v15);
      v19 = self;
      v20 = v12;
      v21 = v10;
      v22 = v8;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SRCSPhraseMatchResult initWithMarkerRange:matchedString:userInfo:](v17, "initWithMarkerRange:matchedString:userInfo:", v23, v16, 0);
      objc_msgSend(v30, "addObject:", v24);

      v8 = v22;
      v10 = v21;
      v12 = v20;
      self = v19;

      if (v8)
        v25 = v15;
      else
        v25 = 0;
      v26 = v25 + v13;

      v31 = 0;
      v13 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](v19, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v10, v26, 0, v12, v29, &v31);
      v15 = v27;
      v16 = v31;
    }
    while (v13 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v30;
}

- (_NSRange)_rangeOfWordBasedSearchString:(id)a3 inString:(id)a4 withRange:(_NSRange)a5 forwardSearchDirection:(BOOL)a6
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  unint64_t v21;
  NSUInteger v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  NSUInteger v26;
  NSUInteger v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[8];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  _NSRange result;

  v6 = a6;
  length = a5.length;
  location = a5.location;
  v11 = a3;
  v12 = a4;
  v13 = objc_msgSend(v11, "length");
  if (v6)
    v14 = 1;
  else
    v14 = 5;
  v15 = objc_msgSend(v12, "rangeOfString:options:range:", v11, v14);
  v17 = v16;
  -[SRCSTextEditing provider](self, "provider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v11;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SRCSTextEditing provider](self, "provider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "statusOfEmojisFoundInString:", v11);

    if (v20)
    {
      v33 = v17;
      v34 = v15;
      goto LABEL_30;
    }
  }
  else
  {

  }
  v33 = 0x7FFFFFFFFFFFFFFFLL;
  v34 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v21 = v15 >= v13 ? v15 - v13 : 0;
    v22 = length + location;
    v40 = 0;
    v41 = &v40;
    v23 = v15 + v17;
    v42 = 0x2020000000;
    v43 = 0;
    v24 = length + location - (v15 + v17) >= v13 ? v15 + v17 + v13 : length + location;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __99__SRCSTextEditing_Search___rangeOfWordBasedSearchString_inString_withRange_forwardSearchDirection___block_invoke;
    v35[3] = &unk_24F652CA8;
    v35[6] = v15;
    v35[7] = v17;
    v35[4] = &v40;
    v35[5] = &v36;
    objc_msgSend(v12, "enumerateSubstringsInRange:options:usingBlock:", v21, v24 - v21, 3, v35);
    if (!*((_BYTE *)v41 + 24))
      goto LABEL_19;
    if (*((_BYTE *)v37 + 24))
    {
      v25 = 0;
      v33 = v17;
      v34 = v15;
    }
    else
    {
LABEL_19:
      v26 = v22 - v23;
      if (v22 < v23)
        v26 = 0;
      v27 = v15 - location;
      if (v15 < location)
        v27 = 0;
      if (v6)
      {
        location = v15 + v17;
        length = v26;
      }
      else
      {
        length = v27;
      }
      if (length)
      {
        v15 = objc_msgSend(v12, "rangeOfString:options:range:", v32, v31, location, length);
        v17 = v28;
        v25 = 1;
      }
      else
      {
        v25 = 0;
      }
    }
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
  }
  while ((v25 & 1) != 0);
LABEL_30:

  v30 = v33;
  v29 = v34;
  result.length = v30;
  result.location = v29;
  return result;
}

_QWORD *__99__SRCSTextEditing_Search___rangeOfWordBasedSearchString_inString_withRange_forwardSearchDirection___block_invoke(_QWORD *result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, BOOL *a7)
{
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v7 = *(_QWORD *)(result[4] + 8);
  if (!*(_BYTE *)(v7 + 24) && (*(_BYTE *)(v7 + 24) = a3 == result[6], !*(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24))
    || (v8 = *(_QWORD *)(result[5] + 8), !*(_BYTE *)(v8 + 24))
    && (*(_BYTE *)(v8 + 24) = a3 + a4 == result[7] + result[6], !*(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24)))
  {
    if (a3 <= result[6])
    {
      if (*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
      {
        v9 = 0;
        goto LABEL_9;
      }
      goto LABEL_6;
    }
LABEL_8:
    v9 = 1;
    goto LABEL_9;
  }
  if (*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
    goto LABEL_8;
LABEL_6:
  v9 = a3 > result[7] + result[6];
LABEL_9:
  *a7 = v9;
  return result;
}

- (BOOL)_range:(_NSRange)a3 includesRange:(_NSRange)a4
{
  return a4.location >= a3.location && a4.location + a4.length <= a3.location + a3.length;
}

+ (id)wordsFromString:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  __CFStringTokenizer *v6;
  CFRange CurrentTokenRange;
  void *v8;
  CFRange v10;

  v3 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  v6 = +[SRCSSpokenCommandUtilities wordUnitStringTokenizerRefForLocaleIdentifier:](SRCSSpokenCommandUtilities, "wordUnitStringTokenizerRefForLocaleIdentifier:", 0);
  if (v6)
  {
    v10.length = -[__CFString length](v3, "length");
    v10.location = 0;
    CFStringTokenizerSetString(v6, v3, v10);
    while (CFStringTokenizerAdvanceToNextToken(v6))
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
      if (CurrentTokenRange.location != -1)
      {
        -[__CFString substringWithRange:](v3, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v8);

      }
    }
  }
  objc_sync_exit(v5);

  return v4;
}

+ (int64_t)doesArrayOfWords:(id)a3 containArrayOfArrayWords:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  int64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v31;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v25 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      v24 = v8;
      v27 = v7;
      do
      {
        v12 = v10;
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
        v14 = objc_msgSend(v5, "count", v24);
        v15 = objc_msgSend(v13, "count");
        v16 = v14 - v15;
        if (v14 <= v15)
        {
          v10 = v12;
        }
        else
        {
          v17 = v15;
          v10 = v8;
          if (v15 >= 1)
          {
            v26 = v12;
            v18 = 0;
            v29 = v16 + 1;
            do
            {
              v19 = 0;
              while (1)
              {
                objc_msgSend(v5, "objectAtIndexedSubscript:", v18 + v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "objectAtIndexedSubscript:", v19);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v20, "isEqualToString:", v21);

                if ((v22 & 1) == 0)
                  break;
                if (v17 == ++v19)
                {
                  v10 = v8;
                  goto LABEL_16;
                }
              }
              ++v18;
            }
            while (v18 != v29);
            v10 = v26;
LABEL_16:
            v9 = v25;
            v7 = v27;
          }
        }
        ++v8;
        ++v11;
      }
      while (v11 != v7);
      v8 = v24 + v7;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)markerRangeForEnumerationType:(int64_t)a3 desiredBlock:(int)a4 count:(unint64_t)a5 options:(int)a6
{
  uint64_t v6;
  uint64_t v8;
  void *v11;
  void *v12;
  void *v13;

  v6 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a4;
  -[SRCSTextEditing provider](self, "provider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectionTextMarkerRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing markerRangeForEnumerationType:markerRange:desiredBlock:count:options:](self, "markerRangeForEnumerationType:markerRange:desiredBlock:count:options:", a3, v12, v8, a5, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)markerRangeForEnumerationType:(int64_t)a3 markerRange:(id)a4 desiredBlock:(int)a5 count:(unint64_t)a6 options:(int)a7
{
  uint64_t v7;
  uint64_t v9;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  SRCSTextEditing *v18;
  int64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  SRCSTextEditing *v26;
  int64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a5;
  v12 = a4;
  v13 = v12;
  if (!a3)
  {
    -[SRCSTextEditing markerRangeForLineInDesiredBlock:markerRange:count:options:](self, "markerRangeForLineInDesiredBlock:markerRange:count:options:", v9, v12, a6, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  switch((_DWORD)v9)
  {
    case 0:
      objc_msgSend(v12, "endMarker");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SRCSTextEditing provider](self, "provider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "textMarkerRangeClass");
      v25 = v7;
      v26 = self;
      v27 = a3;
      v28 = a6;
LABEL_10:
      v29 = -[SRCSTextEditing _findRangeForEnumerationType:atRelativeIncrement:fromPosition:options:](v26, "_findRangeForEnumerationType:atRelativeIncrement:fromPosition:options:", v27, v28, v22, v25);
      objc_msgSend(v24, "markerRangeWithNSRange:", v29, v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 2:
      objc_msgSend(v12, "startMarker");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SRCSTextEditing provider](self, "provider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "textMarkerRangeClass");
      v28 = -(uint64_t)a6;
      v25 = v7;
      v26 = self;
      v27 = a3;
      goto LABEL_10;
    case 1:
      v14 = v7;
      if ((v7 & 8) != 0)
      {
        objc_msgSend(v12, "endMarker");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SRCSTextEditing provider](self, "provider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "textMarkerRangeClass");
        v18 = self;
        v19 = a3;
        v20 = -1;
      }
      else
      {
        objc_msgSend(v12, "startMarker");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SRCSTextEditing provider](self, "provider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "textMarkerRangeClass");
        v18 = self;
        v19 = a3;
        v20 = 0;
      }
      v31 = -[SRCSTextEditing _findRangeForEnumerationType:atRelativeIncrement:fromPosition:options:](v18, "_findRangeForEnumerationType:atRelativeIncrement:fromPosition:options:", v19, v20, v15, v14);
      objc_msgSend(v17, "markerRangeWithNSRange:", v31, v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v21 = 0;
      break;
  }
LABEL_14:

  return v21;
}

- (id)markerRangeForLineInDesiredBlock:(int)a3 markerRange:(id)a4 count:(unint64_t)a5 options:(int)a6
{
  char v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  char v45;
  char v46;

  v6 = a6;
  v10 = a4;
  v11 = v10;
  if (a3)
  {
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        -[SRCSTextEditing provider](self, "provider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "startMarker");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "markerRangeForLineAtTextMarker:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
LABEL_30:

        goto LABEL_31;
      }
      goto LABEL_12;
    }
    v31 = objc_msgSend(v10, "nsRange");
    v15 = 0;
    if (a5 > 0x7FFFFFFFFFFFFFFELL)
    {
      v14 = 0;
      goto LABEL_31;
    }
    v32 = v31;
    v14 = 0;
    if (v31 >= 1)
    {
      v46 = v6;
      v14 = 0;
      v15 = 0;
      v33 = 1;
      do
      {
        v34 = v14;
        -[SRCSTextEditing provider](self, "provider");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SRCSTextEditing provider](self, "provider");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_msgSend(v36, "textMarkerClass"), "markerWithIndex:", v32);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "markerRangeForLineAtTextMarker:", v37);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = objc_msgSend(v14, "nsRange");
        if (!v33)
        {
          v39 = v14;

          v15 = v39;
        }
        if ((uint64_t)(a5 + v33) < 2)
          break;
        v32 = v38 - 1;
        --v33;
      }
      while (v32 > 0);
      if (a5 >= 2 && (v46 & 4) != 0 && v15)
      {
        -[SRCSTextEditing provider](self, "provider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v12, "textMarkerRangeClass");
        objc_msgSend(v14, "startMarker");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v15;
LABEL_29:
        objc_msgSend(v41, "endMarker");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "markerRangeWithStartMarker:endMarker:", v13, v42);
        v43 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v43;
        goto LABEL_30;
      }
    }
  }
  else
  {
    v16 = objc_msgSend(v10, "nsRange");
    if (a5 > 0x7FFFFFFFFFFFFFFELL)
    {
LABEL_12:
      v15 = 0;
      v14 = 0;
      goto LABEL_31;
    }
    v45 = v6;
    v18 = 0;
    v15 = 0;
    v19 = v16 + v17 - (v17 > 1);
    v20 = 2;
    while (1)
    {
      -[SRCSTextEditing provider](self, "provider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPositionTextMarker");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "index");

      if (v19 >= v23)
        break;
      -[SRCSTextEditing provider](self, "provider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SRCSTextEditing provider](self, "provider");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_msgSend(v25, "textMarkerClass"), "markerWithIndex:", v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "markerRangeForLineAtTextMarker:", v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_msgSend(v14, "nsRange");
      v29 = v28;
      if (!--v20)
      {
        v30 = v14;

        v15 = v30;
      }
      v19 = v29 + v27 + 1;
      v18 = v14;
      if ((uint64_t)(a5 + v20) <= 1)
        goto LABEL_25;
    }
    v14 = v18;
LABEL_25:
    if (a5 >= 2 && (v45 & 4) != 0 && v15)
    {
      -[SRCSTextEditing provider](self, "provider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v12, "textMarkerRangeClass");
      objc_msgSend(v15, "startMarker");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v14;
      goto LABEL_29;
    }
  }
LABEL_31:

  return v14;
}

- (_NSRange)_findRangeForEnumerationType:(int64_t)a3 atRelativeIncrement:(int64_t)a4 fromPosition:(id)a5 options:(unint64_t)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  int64_t v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSUInteger v52;
  NSUInteger v53;
  NSUInteger v54;
  NSUInteger v55;
  char v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  int64_t v66;
  uint64_t v67;
  int64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  _QWORD v75[3];
  char v76;
  _QWORD v77[4];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  const char *v81;
  __int128 v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  const char *v86;
  __int128 v87;
  _NSRange result;

  v9 = a5;
  v83 = 0;
  v84 = &v83;
  v85 = 0x3010000000;
  v86 = "";
  v87 = xmmword_22BDF3510;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3010000000;
  v81 = "";
  v82 = xmmword_22BDF3510;
  v10 = objc_msgSend(v9, "index");
  -[SRCSTextEditing provider](self, "provider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPositionTextMarker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "index");

  v14 = v13 - 1;
  if (v10 <= v13)
    v15 = v10;
  else
    v15 = v13 - 1;
  v58 = v9;
  switch(a3)
  {
    case 2:
      v16 = 10;
      break;
    case 3:
      v16 = 25;
      break;
    case 4:
      v16 = 750;
      break;
    default:
      v18 = 0;
      goto LABEL_16;
  }
  if (a4 >= 0)
    v17 = -v16;
  else
    v17 = 2 * a4 * v16;
  v18 = v17 + v15;
  if (a4 > 0)
    v16 *= 2 * a4;
  v14 = v16 + v15;
LABEL_16:
  if (v14 < v13)
    v19 = v14 + 1;
  else
    v19 = v13;
  -[SRCSTextEditing provider](self, "provider", a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSTextEditing provider](self, "provider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v18 & ~(v18 >> 63);
  v23 = v19 - v22;
  objc_msgSend((id)objc_msgSend(v21, "textMarkerRangeClass"), "markerRangeWithNSRange:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringForTextMarkerRange:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  if (a4 >= 0)
    v26 = a4;
  else
    v26 = -a4;
  v77[3] = v26;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  v76 = 0;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = __102__SRCSTextEditing_Enumeration___findRangeForEnumerationType_atRelativeIncrement_fromPosition_options___block_invoke;
  v59[3] = &unk_24F652CD0;
  v66 = a4;
  v67 = v15 - v22;
  v61 = v75;
  v62 = v77;
  v68 = a3;
  v27 = v25;
  v60 = v27;
  v63 = &v83;
  v64 = &v71;
  v69 = v22;
  v70 = v23;
  v65 = &v78;
  objc_msgSend(v27, "enumerateSubstringsInRange:options:usingBlock:", 0, v23, a3 | ((unint64_t)a4 >> 63 << 8), v59);
  v28 = v84;
  v29 = v84[4];
  if (v29 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = v79[4];
    if (v30 != 0x7FFFFFFFFFFFFFFFLL && a3 == 2 && v79[5] + v30 == v13 && a4 >= 1 && !*((_BYTE *)v72 + 24))
    {
      v84[4] = v13;
      v28[5] = 0;
    }
    goto LABEL_63;
  }
  switch(a3)
  {
    case 1:
      if ((v57 & 1) == 0)
      {
        v39 = v29 - v22 + v84[5];
        if (v39 >= 0 && v39 < v23)
        {
          objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v27, "rangeOfCharacterFromSet:options:range:", v40, 0, v39, 1);
          v43 = v42;

          if (v41 != 0x7FFFFFFFFFFFFFFFLL && v41 == v39)
          {
            v37 = v84;
            v38 = v84[5] + v43;
            goto LABEL_49;
          }
        }
      }
      break;
    case 3:
      v44 = v29 - v22 + v84[5];
      if (v44 >= 0 && v23 > v44)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v27, "rangeOfCharacterFromSet:options:range:", v45, 0, v44, v23 - v44);
        v48 = v47;

        if (v46 != 0x7FFFFFFFFFFFFFFFLL && v46 == v44)
        {
          v37 = v84;
          v38 = v84[5] + v48;
          goto LABEL_49;
        }
      }
      break;
    case 4:
      if ((v57 & 1) != 0)
      {
        v31 = v84[5];
        if (v31)
        {
          objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v29 - v22;
          v34 = objc_msgSend(v27, "rangeOfCharacterFromSet:options:range:", v32, 4, v29 - v22, v31);
          v36 = v35;

          if (v34 != 0x7FFFFFFFFFFFFFFFLL && v34 + v36 == v31 + v33)
          {
            v37 = v84;
            v38 = v84[5] - v36;
LABEL_49:
            v37[5] = v38;
          }
        }
      }
      break;
    default:
      if (a3 == 2 && !*((_BYTE *)v72 + 24) && a4 >= 1 && v84[5] + v29 == v13)
      {
        v84[4] = v13;
        v28[5] = 0;
      }
      break;
  }
  if ((v57 & 4) != 0)
  {
    v49 = v79[4];
    v28 = v84;
    if (v49 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v50 = v84[4];
      if (v50 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a4 < 0)
        {
          v84[5] = v49 - v50 + v79[5];
        }
        else if (a4)
        {
          v51 = v50 - v49 + v84[5];
          v84[4] = v49;
          v28[5] = v51;
        }
      }
    }
  }
  else
  {
    v28 = v84;
  }
LABEL_63:
  v52 = v28[4];
  v53 = v28[5];

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(v75, 8);
  _Block_object_dispose(v77, 8);

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v83, 8);

  v54 = v52;
  v55 = v53;
  result.length = v55;
  result.location = v54;
  return result;
}

void __102__SRCSTextEditing_Enumeration___findRangeForEnumerationType_atRelativeIncrement_fromPosition_options___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  BOOL v28;
  id v29;

  v11 = a2;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v12 + 24))
    goto LABEL_19;
  v14 = *(_QWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 88);
  if (v14 < 0)
  {
    if (a4 && v13 == a3 + a4)
    {
LABEL_17:
      *(_BYTE *)(v12 + 24) = 1;
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(_QWORD *)(v18 + 24);
      v17 = v19 < 1;
      v20 = v19 - 1;
      if (!v17)
        *(_QWORD *)(v18 + 24) = v20;
      goto LABEL_19;
    }
  }
  else if (v13 == a3)
  {
    goto LABEL_17;
  }
  if (v13 < a3 || v13 > a3 + a4 || (v15 = *(_QWORD *)(a1 + 96), v15 == 2))
  {
    v16 = v14 < 0;
    if (v13 >= a3)
      v16 = 1;
    v17 = v13 > a3 && v14 <= -1;
    if (v17 || !v16)
      goto LABEL_17;
  }
  else
  {
    if (v14 < 0)
    {
      v27 = 1;
      if (v13 == a3 + a4 - 1 && v15 == 4 && a4 >= 2)
      {
        v29 = v11;
        v28 = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:") == 10;
        v11 = v29;
        v27 = !v28;
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      }
    }
    else
    {
      v27 = 1;
    }
    *(_BYTE *)(v12 + 24) = v27;
  }
LABEL_19:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    goto LABEL_39;
  v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (!v21)
  {
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_QWORD *)(v26 + 32) == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_QWORD *)(v26 + 32) = *(_QWORD *)(a1 + 104) + a3;
      *(_QWORD *)(v26 + 40) = a4;
      if (!*(_QWORD *)(a1 + 80) && *(_QWORD *)(a1 + 88) == a3 + a4 && *(_QWORD *)(a1 + 96) != 1)
        goto LABEL_38;
    }
    else if (*(_QWORD *)(a1 + 80) || *(_QWORD *)(a1 + 88) == a3 || *(_QWORD *)(a1 + 96) == 1)
    {
      *(_QWORD *)(v26 + 32) = *(_QWORD *)(a1 + 104) + a3;
      *(_QWORD *)(v26 + 40) = a4;
    }
    *a7 = 1;
LABEL_38:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    goto LABEL_39;
  }
  v22 = *(_QWORD *)(a1 + 80);
  if (v22 < 0)
    v22 = -v22;
  if (v21 == v22 - 1 && (v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8), *(_QWORD *)(v23 + 32) == 0x7FFFFFFFFFFFFFFFLL))
  {
    *(_QWORD *)(v23 + 32) = *(_QWORD *)(a1 + 104) + a3;
    v24 = (unint64_t *)(v23 + 40);
  }
  else
  {
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    *(_QWORD *)(v25 + 32) = *(_QWORD *)(a1 + 104) + a3;
    v24 = (unint64_t *)(v25 + 40);
  }
  *v24 = a4;
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
LABEL_39:

}

@end
