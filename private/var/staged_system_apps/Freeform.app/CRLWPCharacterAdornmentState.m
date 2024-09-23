@implementation CRLWPCharacterAdornmentState

- (CRLWPCharacterAdornmentState)init
{
  CRLWPCharacterAdornmentState *v2;
  CRLWPCharacterAdornmentState *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLWPCharacterAdornmentState;
  v2 = -[CRLWPCharacterAdornmentState init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CRLWPCharacterAdornmentState resetFillState](v2, "resetFillState");
    -[CRLWPCharacterAdornmentState resetStrokeState](v3, "resetStrokeState");
  }
  return v3;
}

- (void)setStateWithStroke:(id)a3 range:(_NSRange)a4 rect:(CGRect)a5 paths:(id)a6 rubyPaths:(id)a7 shadow:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSUInteger length;
  NSUInteger location;
  CRLStroke *v18;
  CRLShadow *v19;
  CRLStroke *currentAdornmentStroke;
  id v21;
  id v22;
  uint64_t v23;
  double v24;
  id v25;
  TSUSparseArray *v26;
  TSUSparseArray *currentStrokePaths;
  uint64_t v28;
  double v29;
  id v30;
  TSUSparseArray *v31;
  TSUSparseArray *currentRubyStrokePaths;
  CRLShadow *currentStrokeShadow;
  CRLStroke *v34;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  length = a4.length;
  location = a4.location;
  v18 = (CRLStroke *)a3;
  v19 = (CRLShadow *)a8;
  self->_hasValidStrokeState = 1;
  currentAdornmentStroke = self->_currentAdornmentStroke;
  self->_currentAdornmentStroke = v18;
  v34 = v18;
  v21 = a7;
  v22 = a6;

  self->_currentStrokeRange.location = location;
  self->_currentStrokeRange.length = length;
  self->_currentStrokeRect.origin.x = x;
  self->_currentStrokeRect.origin.y = y;
  self->_currentStrokeRect.size.width = width;
  self->_currentStrokeRect.size.height = height;
  *(_QWORD *)&v24 = objc_opt_class(self, v23).n128_u64[0];
  v26 = (TSUSparseArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "p_deepCopyPathArray:", v22, v24));

  currentStrokePaths = self->_currentStrokePaths;
  self->_currentStrokePaths = v26;

  *(_QWORD *)&v29 = objc_opt_class(self, v28).n128_u64[0];
  v31 = (TSUSparseArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "p_deepCopyPathArray:", v21, v29));

  currentRubyStrokePaths = self->_currentRubyStrokePaths;
  self->_currentRubyStrokePaths = v31;

  currentStrokeShadow = self->_currentStrokeShadow;
  self->_currentStrokeShadow = v19;

}

- (void)resetStrokeState
{
  CRLStroke *currentAdornmentStroke;
  CGSize size;
  TSUSparseArray *v5;
  TSUSparseArray *currentStrokePaths;
  TSUSparseArray *v7;
  TSUSparseArray *currentRubyStrokePaths;
  CRLShadow *currentStrokeShadow;

  self->_hasValidStrokeState = 0;
  currentAdornmentStroke = self->_currentAdornmentStroke;
  self->_currentAdornmentStroke = 0;

  self->_currentStrokeRange = (_NSRange)xmmword_100EEE418;
  size = CGRectNull.size;
  self->_currentStrokeRect.origin = CGRectNull.origin;
  self->_currentStrokeRect.size = size;
  v5 = (TSUSparseArray *)objc_claimAutoreleasedReturnValue(+[TSUSparseArray array](TSUSparseArray, "array"));
  currentStrokePaths = self->_currentStrokePaths;
  self->_currentStrokePaths = v5;

  v7 = (TSUSparseArray *)objc_claimAutoreleasedReturnValue(+[TSUSparseArray array](TSUSparseArray, "array"));
  currentRubyStrokePaths = self->_currentRubyStrokePaths;
  self->_currentRubyStrokePaths = v7;

  currentStrokeShadow = self->_currentStrokeShadow;
  self->_currentStrokeShadow = 0;

}

- (void)setStateWithFill:(id)a3 range:(_NSRange)a4 rect:(CGRect)a5 paths:(id)a6 rubyPaths:(id)a7 shadow:(id)a8 fillsCurrentTextContainer:(BOOL)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSUInteger length;
  NSUInteger location;
  CRLFill *v19;
  CRLShadow *v20;
  CRLFill *currentAdornmentFill;
  CRLFill *v22;
  id v23;
  id v24;
  uint64_t v25;
  double v26;
  id v27;
  TSUSparseArray *v28;
  TSUSparseArray *currentFillPaths;
  uint64_t v30;
  double v31;
  id v32;
  TSUSparseArray *v33;
  TSUSparseArray *currentRubyFillPaths;
  CRLShadow *currentFillShadow;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  length = a4.length;
  location = a4.location;
  v19 = (CRLFill *)a3;
  v20 = (CRLShadow *)a8;
  self->_hasValidFillState = 1;
  currentAdornmentFill = self->_currentAdornmentFill;
  self->_currentAdornmentFill = v19;
  v22 = v19;
  v23 = a7;
  v24 = a6;

  self->_currentFillRange.location = location;
  self->_currentFillRange.length = length;
  self->_currentFillRect.origin.x = x;
  self->_currentFillRect.origin.y = y;
  self->_currentFillRect.size.width = width;
  self->_currentFillRect.size.height = height;
  *(_QWORD *)&v26 = objc_opt_class(self, v25).n128_u64[0];
  v28 = (TSUSparseArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "p_deepCopyPathArray:", v24, v26));

  currentFillPaths = self->_currentFillPaths;
  self->_currentFillPaths = v28;

  *(_QWORD *)&v31 = objc_opt_class(self, v30).n128_u64[0];
  v33 = (TSUSparseArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "p_deepCopyPathArray:", v23, v31));

  currentRubyFillPaths = self->_currentRubyFillPaths;
  self->_currentRubyFillPaths = v33;

  currentFillShadow = self->_currentFillShadow;
  self->_currentFillShadow = v20;

  self->_fillsCurrentTextContainer = a9;
}

- (void)resetFillState
{
  CRLFill *currentAdornmentFill;
  CGSize size;
  TSUSparseArray *v5;
  TSUSparseArray *currentFillPaths;
  TSUSparseArray *v7;
  TSUSparseArray *currentRubyFillPaths;
  CRLShadow *currentFillShadow;
  NSMutableSet *v10;
  NSMutableSet *currentDropCapAdornments;

  self->_hasValidFillState = 0;
  currentAdornmentFill = self->_currentAdornmentFill;
  self->_currentAdornmentFill = 0;

  self->_currentFillRange = (_NSRange)xmmword_100EEE418;
  size = CGRectNull.size;
  self->_currentFillRect.origin = CGRectNull.origin;
  self->_currentFillRect.size = size;
  v5 = (TSUSparseArray *)objc_claimAutoreleasedReturnValue(+[TSUSparseArray array](TSUSparseArray, "array"));
  currentFillPaths = self->_currentFillPaths;
  self->_currentFillPaths = v5;

  v7 = (TSUSparseArray *)objc_claimAutoreleasedReturnValue(+[TSUSparseArray array](TSUSparseArray, "array"));
  currentRubyFillPaths = self->_currentRubyFillPaths;
  self->_currentRubyFillPaths = v7;

  currentFillShadow = self->_currentFillShadow;
  self->_currentFillShadow = 0;

  self->_fillsCurrentTextContainer = 0;
  v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  currentDropCapAdornments = self->_currentDropCapAdornments;
  self->_currentDropCapAdornments = v10;

}

+ (id)p_deepCopyPathArray:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSUSparseArray array](TSUSparseArray, "array"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10045CCC0;
  v6[3] = &unk_101241C10;
  v6[4] = v4;
  objc_msgSend(v3, "foreach:", v6);

  return v4;
}

- (BOOL)hasValidFillState
{
  return self->_hasValidFillState;
}

- (void)setHasValidFillState:(BOOL)a3
{
  self->_hasValidFillState = a3;
}

- (CRLFill)currentAdornmentFill
{
  return self->_currentAdornmentFill;
}

- (void)setCurrentAdornmentFill:(id)a3
{
  objc_storeStrong((id *)&self->_currentAdornmentFill, a3);
}

- (_NSRange)currentFillRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_currentFillRange.length;
  location = self->_currentFillRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCurrentFillRange:(_NSRange)a3
{
  self->_currentFillRange = a3;
}

- (CGRect)currentFillRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentFillRect.origin.x;
  y = self->_currentFillRect.origin.y;
  width = self->_currentFillRect.size.width;
  height = self->_currentFillRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentFillRect:(CGRect)a3
{
  self->_currentFillRect = a3;
}

- (TSUSparseArray)currentFillPaths
{
  return self->_currentFillPaths;
}

- (void)setCurrentFillPaths:(id)a3
{
  objc_storeStrong((id *)&self->_currentFillPaths, a3);
}

- (TSUSparseArray)currentRubyFillPaths
{
  return self->_currentRubyFillPaths;
}

- (void)setCurrentRubyFillPaths:(id)a3
{
  objc_storeStrong((id *)&self->_currentRubyFillPaths, a3);
}

- (CRLShadow)currentFillShadow
{
  return self->_currentFillShadow;
}

- (void)setCurrentFillShadow:(id)a3
{
  objc_storeStrong((id *)&self->_currentFillShadow, a3);
}

- (BOOL)fillsCurrentTextContainer
{
  return self->_fillsCurrentTextContainer;
}

- (void)setFillsCurrentTextContainer:(BOOL)a3
{
  self->_fillsCurrentTextContainer = a3;
}

- (NSMutableSet)currentDropCapAdornments
{
  return self->_currentDropCapAdornments;
}

- (void)setCurrentDropCapAdornments:(id)a3
{
  objc_storeStrong((id *)&self->_currentDropCapAdornments, a3);
}

- (BOOL)hasValidStrokeState
{
  return self->_hasValidStrokeState;
}

- (void)setHasValidStrokeState:(BOOL)a3
{
  self->_hasValidStrokeState = a3;
}

- (CRLStroke)currentAdornmentStroke
{
  return self->_currentAdornmentStroke;
}

- (void)setCurrentAdornmentStroke:(id)a3
{
  objc_storeStrong((id *)&self->_currentAdornmentStroke, a3);
}

- (_NSRange)currentStrokeRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_currentStrokeRange.length;
  location = self->_currentStrokeRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCurrentStrokeRange:(_NSRange)a3
{
  self->_currentStrokeRange = a3;
}

- (CGRect)currentStrokeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentStrokeRect.origin.x;
  y = self->_currentStrokeRect.origin.y;
  width = self->_currentStrokeRect.size.width;
  height = self->_currentStrokeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentStrokeRect:(CGRect)a3
{
  self->_currentStrokeRect = a3;
}

- (TSUSparseArray)currentStrokePaths
{
  return self->_currentStrokePaths;
}

- (void)setCurrentStrokePaths:(id)a3
{
  objc_storeStrong((id *)&self->_currentStrokePaths, a3);
}

- (TSUSparseArray)currentRubyStrokePaths
{
  return self->_currentRubyStrokePaths;
}

- (void)setCurrentRubyStrokePaths:(id)a3
{
  objc_storeStrong((id *)&self->_currentRubyStrokePaths, a3);
}

- (CRLShadow)currentStrokeShadow
{
  return self->_currentStrokeShadow;
}

- (void)setCurrentStrokeShadow:(id)a3
{
  objc_storeStrong((id *)&self->_currentStrokeShadow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStrokeShadow, 0);
  objc_storeStrong((id *)&self->_currentRubyStrokePaths, 0);
  objc_storeStrong((id *)&self->_currentStrokePaths, 0);
  objc_storeStrong((id *)&self->_currentAdornmentStroke, 0);
  objc_storeStrong((id *)&self->_currentDropCapAdornments, 0);
  objc_storeStrong((id *)&self->_currentFillShadow, 0);
  objc_storeStrong((id *)&self->_currentRubyFillPaths, 0);
  objc_storeStrong((id *)&self->_currentFillPaths, 0);
  objc_storeStrong((id *)&self->_currentAdornmentFill, 0);
}

@end
