@implementation RTIInputSourceState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *inputMode;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  inputMode = self->_inputMode;
  v5 = v8;
  if (inputMode)
  {
    objc_msgSend(v8, "encodeObject:forKey:", inputMode, CFSTR("im"));
    v5 = v8;
  }
  objc_msgSend(v5, "encodeInt32:forKey:", self->_inputSourceStateMask.integerValue, CFSTR("mask"));
  if (!CGRectIsNull(self->_leftSplitFrame))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", self->_leftSplitFrame.origin.x, self->_leftSplitFrame.origin.y, self->_leftSplitFrame.size.width, self->_leftSplitFrame.size.height);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("lsf"));

  }
  if (!CGRectIsNull(self->_rightSplitFrame))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", self->_rightSplitFrame.origin.x, self->_rightSplitFrame.origin.y, self->_rightSplitFrame.size.width, self->_rightSplitFrame.size.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("rsf"));

  }
}

- (RTIInputSourceState)init
{
  RTIInputSourceState *result;
  CGPoint v3;
  CGSize v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTIInputSourceState;
  result = -[RTIInputSourceState init](&v5, sel_init);
  if (result)
  {
    result->_inputSourceStateMask.integerValue = 0;
    v3 = (CGPoint)*MEMORY[0x1E0C9D628];
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_leftSplitFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_leftSplitFrame.size = v4;
    result->_rightSplitFrame.origin = v3;
    result->_rightSplitFrame.size = v4;
  }
  return result;
}

- (RTIInputSourceState)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  objc_super v23;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v23.receiver = self;
  v23.super_class = (Class)RTIInputSourceState;
  v5 = -[RTIInputSourceState init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("im"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    *((_DWORD *)v5 + 2) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("mask"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lsf"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "rectValue");
      *((_QWORD *)v5 + 3) = v10;
      *((_QWORD *)v5 + 4) = v11;
      *((_QWORD *)v5 + 5) = v12;
      *((_QWORD *)v5 + 6) = v13;
    }
    else
    {
      v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)(v5 + 24) = *MEMORY[0x1E0C9D628];
      *(_OWORD *)(v5 + 40) = v14;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rsf"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "rectValue");
      *((_QWORD *)v5 + 7) = v17;
      *((_QWORD *)v5 + 8) = v18;
      *((_QWORD *)v5 + 9) = v19;
      *((_QWORD *)v5 + 10) = v20;
    }
    else
    {
      v21 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)(v5 + 56) = *MEMORY[0x1E0C9D628];
      *(_OWORD *)(v5 + 72) = v21;
    }

  }
  return (RTIInputSourceState *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGRect v16;
  CGRect v17;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[RTIInputSourceState inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputMode = %@"), v4);

  if (-[RTIInputSourceState minimized](self, "minimized"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; minimized = %d"), -[RTIInputSourceState minimized](self, "minimized"));
  if (-[RTIInputSourceState hardwareKeyboardMode](self, "hardwareKeyboardMode"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; hardwareKeyboardMode = %d"),
      -[RTIInputSourceState hardwareKeyboardMode](self, "hardwareKeyboardMode"));
  if (-[RTIInputSourceState centerFilled](self, "centerFilled"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; centerFilled = %d"),
      -[RTIInputSourceState centerFilled](self, "centerFilled"));
  if (-[RTIInputSourceState split](self, "split"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("; split = %d"), -[RTIInputSourceState split](self, "split"));
    -[RTIInputSourceState leftSplitFrame](self, "leftSplitFrame");
    if (!CGRectIsNull(v16))
    {
      -[RTIInputSourceState leftSplitFrame](self, "leftSplitFrame");
      _RTI_NSStringFromCGRect(v5, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("; leftSplitFrame = %@"), v9);

    }
    -[RTIInputSourceState rightSplitFrame](self, "rightSplitFrame");
    if (!CGRectIsNull(v17))
    {
      -[RTIInputSourceState rightSplitFrame](self, "rightSplitFrame");
      _RTI_NSStringFromCGRect(v10, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("; rightSplitFrame = %@"), v14);

    }
  }
  if (-[RTIInputSourceState floating](self, "floating"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; floating = %d"), -[RTIInputSourceState floating](self, "floating"));
  if (-[RTIInputSourceState showingEmojiSearch](self, "showingEmojiSearch"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; showingEmojiSearch = %d"),
      -[RTIInputSourceState showingEmojiSearch](self, "showingEmojiSearch"));
  if (-[RTIInputSourceState usesCandidateSelection](self, "usesCandidateSelection"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; usesCandidateSelection = %d"),
      -[RTIInputSourceState usesCandidateSelection](self, "usesCandidateSelection"));
  if (-[RTIInputSourceState showsCandidateBar](self, "showsCandidateBar"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; showsCandidateBar = %d"),
      -[RTIInputSourceState showsCandidateBar](self, "showsCandidateBar"));
  if (-[RTIInputSourceState supportsSetPhraseBoundary](self, "supportsSetPhraseBoundary"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; supportsSetPhraseBoundary = %d"),
      -[RTIInputSourceState supportsSetPhraseBoundary](self, "supportsSetPhraseBoundary"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  RTIInputSourceState *v4;
  RTIInputSourceState *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  _BOOL4 v41;
  _BOOL4 v42;
  _BOOL4 v43;
  _BOOL4 v44;
  _BOOL4 v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v4 = (RTIInputSourceState *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTIInputSourceState inputMode](self, "inputMode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIInputSourceState inputMode](v5, "inputMode");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[RTIInputSourceState inputMode](self, "inputMode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIInputSourceState inputMode](v5, "inputMode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_19;
      }
      v13 = -[RTIInputSourceState minimized](self, "minimized");
      if (v13 == -[RTIInputSourceState minimized](v5, "minimized"))
      {
        v14 = -[RTIInputSourceState hardwareKeyboardMode](self, "hardwareKeyboardMode");
        if (v14 == -[RTIInputSourceState hardwareKeyboardMode](v5, "hardwareKeyboardMode"))
        {
          v15 = -[RTIInputSourceState centerFilled](self, "centerFilled");
          if (v15 == -[RTIInputSourceState centerFilled](v5, "centerFilled"))
          {
            v16 = -[RTIInputSourceState split](self, "split");
            if (v16 == -[RTIInputSourceState split](v5, "split"))
            {
              -[RTIInputSourceState leftSplitFrame](self, "leftSplitFrame");
              v18 = v17;
              v20 = v19;
              v22 = v21;
              v24 = v23;
              -[RTIInputSourceState leftSplitFrame](self, "leftSplitFrame");
              v49.origin.x = v25;
              v49.origin.y = v26;
              v49.size.width = v27;
              v49.size.height = v28;
              v47.origin.x = v18;
              v47.origin.y = v20;
              v47.size.width = v22;
              v47.size.height = v24;
              if (CGRectEqualToRect(v47, v49))
              {
                -[RTIInputSourceState rightSplitFrame](self, "rightSplitFrame");
                v30 = v29;
                v32 = v31;
                v34 = v33;
                v36 = v35;
                -[RTIInputSourceState rightSplitFrame](self, "rightSplitFrame");
                v50.origin.x = v37;
                v50.origin.y = v38;
                v50.size.width = v39;
                v50.size.height = v40;
                v48.origin.x = v30;
                v48.origin.y = v32;
                v48.size.width = v34;
                v48.size.height = v36;
                if (CGRectEqualToRect(v48, v50))
                {
                  v41 = -[RTIInputSourceState floating](self, "floating");
                  if (v41 == -[RTIInputSourceState floating](v5, "floating"))
                  {
                    v42 = -[RTIInputSourceState showingEmojiSearch](self, "showingEmojiSearch");
                    if (v42 == -[RTIInputSourceState showingEmojiSearch](v5, "showingEmojiSearch"))
                    {
                      v43 = -[RTIInputSourceState usesCandidateSelection](self, "usesCandidateSelection");
                      if (v43 == -[RTIInputSourceState usesCandidateSelection](v5, "usesCandidateSelection"))
                      {
                        v44 = -[RTIInputSourceState showsCandidateBar](self, "showsCandidateBar");
                        if (v44 == -[RTIInputSourceState showsCandidateBar](v5, "showsCandidateBar"))
                        {
                          v46 = -[RTIInputSourceState supportsSetPhraseBoundary](self, "supportsSetPhraseBoundary");
                          v12 = v46 ^ -[RTIInputSourceState supportsSetPhraseBoundary](v5, "supportsSetPhraseBoundary") ^ 1;
                          goto LABEL_20;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_19:
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    LOBYTE(v12) = 0;
  }
LABEL_21:

  return v12;
}

- (BOOL)minimized
{
  return self->_inputSourceStateMask.integerValue & 1;
}

- (void)setMinimized:(BOOL)a3
{
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFFE | a3;
}

- (BOOL)hardwareKeyboardMode
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 1) & 1;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFFD | v3;
}

- (BOOL)centerFilled
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 2) & 1;
}

- (void)setCenterFilled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFFB | v3;
}

- (BOOL)split
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 3) & 1;
}

- (void)setSplit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFF7 | v3;
}

- (BOOL)floating
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 4) & 1;
}

- (void)setFloating:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFEF | v3;
}

- (BOOL)showingEmojiSearch
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 5) & 1;
}

- (void)setShowingEmojiSearch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFDF | v3;
}

- (BOOL)usesCandidateSelection
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 7) & 1;
}

- (void)setUsesCandidateSelection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFF7F | v3;
}

- (BOOL)showsCandidateBar
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 6) & 1;
}

- (void)setShowsCandidateBar:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFBF | v3;
}

- (BOOL)supportsSetPhraseBoundary
{
  return HIBYTE(LOWORD(self->_inputSourceStateMask.integerValue)) & 1;
}

- (void)setSupportsSetPhraseBoundary:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFEFF | v3;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_inputMode, a3);
}

- (CGRect)leftSplitFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_leftSplitFrame.origin.x;
  y = self->_leftSplitFrame.origin.y;
  width = self->_leftSplitFrame.size.width;
  height = self->_leftSplitFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLeftSplitFrame:(CGRect)a3
{
  self->_leftSplitFrame = a3;
}

- (CGRect)rightSplitFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rightSplitFrame.origin.x;
  y = self->_rightSplitFrame.origin.y;
  width = self->_rightSplitFrame.size.width;
  height = self->_rightSplitFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRightSplitFrame:(CGRect)a3
{
  self->_rightSplitFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end
