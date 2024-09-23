@implementation UIDictationScoredToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationScoredToken)initWithText:(id)a3 removeSpaceBefore:(BOOL)a4 removeSpaceAfter:(BOOL)a5 confidenceScore:(double)a6
{
  UIDictationScoredToken *v7;
  UIDictationScoredToken *v8;
  UIDictationScoredToken *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIDictationScoredToken;
  v7 = -[UIDictationToken initWithText:removeSpaceBefore:removeSpaceAfter:](&v11, sel_initWithText_removeSpaceBefore_removeSpaceAfter_, a3, a4, a5);
  v8 = v7;
  if (v7)
  {
    v7->_confidenceScore = a6;
    v9 = v7;
  }

  return v8;
}

- (UIDictationScoredToken)initWithCoder:(id)a3
{
  id v4;
  UIDictationScoredToken *v5;
  double v6;
  UIDictationScoredToken *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIDictationScoredToken;
  v5 = -[UIDictationToken initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidenceScore"));
    v5->_confidenceScore = v6;
    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIDictationScoredToken;
  v4 = a3;
  -[UIDictationToken encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("confidenceScore"), self->_confidenceScore, v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double confidenceScore;
  double v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIDictationScoredToken;
  if (-[UIDictationToken isEqual:](&v9, sel_isEqual_, v4))
  {
    confidenceScore = self->_confidenceScore;
    objc_msgSend(v4, "confidenceScore");
    v7 = vabdd_f64(confidenceScore, v6) < 0.000000001;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_descriptionExtra
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", score=%.2f"), *(_QWORD *)&self->_confidenceScore);
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

@end
